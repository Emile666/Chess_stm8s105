/*==================================================================
  File Name    : uart.c
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the uart routines. Original source
            at: https://lujji.github.io/blog/bare-metal-programming-stm8/
  ------------------------------------------------------------------
  CHESS_STM8S105 is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.
 
  CHESS_STM8S105 is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
 
  You should have received a copy of the GNU General Public License
  along with CHESS_STM8S105. If not, see <http://www.gnu.org/licenses/>.
  ==================================================================
*/ 
#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>
#include "uart.h"
#include "i2c.h"
#include "scheduler.h"
#include "ring_buffer.h"
#include "delay.h"
#include "lcd_i2c.h"
#include "max7219.h"

extern clock_struct clk1;
extern clock_struct clk2;

uint8_t rs232_inbuf[UART_BUFLEN]; // buffer for RS232 commands
uint8_t rs232_ptr = 0;            // index in RS232 buffer

// buffers for use with the ring buffer (belong to the USART)
bool     ovf_buf_in; // true = input buffer overflow
uint16_t isr_cnt = 0;

struct ring_buffer ring_buffer_out;
struct ring_buffer ring_buffer_in;
uint8_t            out_buffer[TX_BUF_SIZE];
uint8_t            in_buffer[RX_BUF_SIZE];

//-----------------------------------------------------------------------------
// UART Transmit complete Interrupt.
//
// This interrupt will be executed when the TXE (Transmit Data Register Empty)
// bit in UART2_SR is set. The TXE bit is set by hardware when the contents of 
// the TDR register has been transferred into the shift register. An interrupt 
// is generated if the TIEN bit =1 in the UART_CR2 register. It is cleared by a
// write to the UART_DR register.
//-----------------------------------------------------------------------------
@interrupt void UART_TX_IRQHandler(void)
{
	if (!ring_buffer_is_empty(&ring_buffer_out))
	{   // if there is data in the ring buffer, fetch it and send it
		UART2_DR = ring_buffer_get(&ring_buffer_out);
	} // if
    else
    {   // no more data to send, turn off interrupt
        UART2_CR2 &= ~UART2_CR2_TIEN;
    } // else
} /* UART_TX_IRQHandler() */

//-----------------------------------------------------------------------------
// UART Receive Complete Interrupt.

// This interrupt will be executed when the RXNE (Read Data-Register Not Empty)
// bit in UART2_SR is set. This bit is set by hardware when the contents of the 
// RDR shift register has been transferred to the UART2_DR register. An interrupt 
// is generated if RIEN=1 in the UART_CR2 register. It is cleared by a read to 
// the UART2_DR register. It can also be cleared by writing 0.
//-----------------------------------------------------------------------------
@interrupt void UART_RX_IRQHandler(void)
{
	volatile uint8_t ch;
	
	if (!ring_buffer_is_full(&ring_buffer_in))
	{
		ring_buffer_put(&ring_buffer_in, UART2_DR);
		ovf_buf_in = false;
	} // if
	else
	{
		ch = UART2_DR; // clear RXNE flag
		ovf_buf_in = true;
	} // else
	isr_cnt++;
} /* UART_RX_IRQHandler() */

/*------------------------------------------------------------------
  Purpose  : This function initializes the UART to 115200,N,8,1
             Master clock is 16 MHz, baud-rate is 115200 Baud.
  Variables: -
  Returns  : -
  ------------------------------------------------------------------*/
void uart_init(void)
{
    uint16_t div = (F_CPU + BAUDRATE / 2) / BAUDRATE;

    // initialize the in and out buffer for the UART
    ring_buffer_out = ring_buffer_init(out_buffer, TX_BUF_SIZE);
    ring_buffer_in  = ring_buffer_init(in_buffer , RX_BUF_SIZE);

    UART2_BRR2 = ((div >> 8) & 0xF0) + (div & 0x0F);
    UART2_BRR1 = div >> 4;
    UART2_CR2 |= (UART2_CR2_RIEN | UART2_CR2_TIEN); // Enable interrupts
    UART2_CR2 |= (UART2_CR2_TEN  | UART2_CR2_REN);  // Enable receiver and transmitter
    //UART2_CR3 |= UART2_CR3_CLKEN; // enable uart clock 
} // uart_init()

/*------------------------------------------------------------------
  Purpose  : This function writes one data-byte to the uart.	
  Variables: data: the byte to send to the uart.
  Returns  : -
  ------------------------------------------------------------------*/
void uart_write(uint8_t data)
{
   	//----------------------------------------------
    // This is a working non-interrupt version.
    //UART2_DR = data;
    //while (!(UART2_SR & UART2_SR_TC));
   	//----------------------------------------------
    // At 19200 Baud, sending 1 byte takes a max. of 0.52 msec.
	while (ring_buffer_is_full(&ring_buffer_out)) delay_msec(1);
	disable_interrupts(); // Disable interrupts to get exclusive access to ring_buffer_out
	if (ring_buffer_is_empty(&ring_buffer_out))
    {
        UART2_CR2 |= UART2_CR2_TIEN; // First data in buffer, enable data ready interrupt
    } // if
    ring_buffer_put(&ring_buffer_out, data); // Put data in buffer
	enable_interrupts();                     // Re-enable interrupts
} // uart_write()

/*------------------------------------------------------------------
  Purpose  : This function reads one data-byte from the uart.	
  Variables: -
  Returns  : the data-byte read from the uart
  ------------------------------------------------------------------*/
uint8_t uart_read(void)
{
   	//----------------------------------------------
    // This is a working non-interrupt version.
    //while (!(UART2_SR & UART2_SR_RXNE));
    //return UART2_DR;
   	//----------------------------------------------
    return ring_buffer_get(&ring_buffer_in);
} // uart_read()

/*------------------------------------------------------------------
  Purpose  : This function checks if a character is present in the
             receive buffer.
  Variables: -
  Returns  : 1 if a character is received, 0 otherwise
  ------------------------------------------------------------------*/
bool uart_kbhit(void) /* returns true if character in receive buffer */
{
	//return ((UART2_SR & UART2_SR_RXNE) == UART2_SR_RXNE);
    return !ring_buffer_is_empty(&ring_buffer_in);
} // uart_kbhit()

/*------------------------------------------------------------------
  Purpose  : This function writes a string to serial port 0, using
             the xputc() routine.
  Variables:
         s : The string to write to serial port 0
  Returns  : the number of characters written
  ------------------------------------------------------------------*/
void xputs(uint8_t *s)
{
	while (*s) uart_write(*s++);
} // xputs()

/*-----------------------------------------------------------------------------
  Purpose  : Scan all devices on the I2C bus
  Variables: -
 Returns  : -
  ---------------------------------------------------------------------------*/
void i2c_scan(void)
{
	char    s[50]; // needed for printing to serial terminal
	uint8_t x = 0;
	int     i;     // Leave this as an int!
	
	xputs("I2C: ");
    for (i = 0x00; i < 0xff; i+=2)
	{
		if (i2c_start(i) == I2C_ACK)
		{
			sprintf(s,"0x%0x ",i);
		    xputs(s);
			x++;
		} // if
		i2c_stop();
	} // for
	if (!x) xputs("-");
	xputs("\n");
} // i2c_scan()

/*-----------------------------------------------------------------------------
  Purpose  : Non-blocking RS232 command-handler via the UART
  Variables: -
  Returns  : [NO_ERR, ERR_CMD, ERR_NUM, ERR_I2C]
  ---------------------------------------------------------------------------*/
uint8_t rs232_command_handler(void)
{
  uint8_t ch;
  static bool cmd_rcvd = 0;
  
  if (!cmd_rcvd && uart_kbhit())
  { // A new character has been received
    ch = tolower(uart_read()); // get character as lowercase
    uart_write(ch);
	switch (ch)
	{
		case '\r': break;
		case '\n': cmd_rcvd  = true;
		           rs232_inbuf[rs232_ptr] = '\0';
		           rs232_ptr = false;
				   break;
		default  : rs232_inbuf[rs232_ptr++] = ch;
				   break;
	} // switch
  } // if
  if (cmd_rcvd)
  {
	  cmd_rcvd = false;
	  return execute_single_command(rs232_inbuf);
  } // if
  else return NO_ERR;
} // rs232_command_handler()

void chex(uint8_t x, char *s)
{
    uint8_t y;
    
    y = (x >> 4);
    if (y > 9) s[0] = 'A' + y - 10;
    else       s[0] = '0' + y;
    y = (x & 0x0F);
    if (y > 9) s[1] = 'A' + y - 10;
    else       s[1] = '0' + y;
    s[2] = '\0';
} // chex()

/*-----------------------------------------------------------------------------
  Purpose: interpret commands which are received via the UART:
   - S0           : Chess version number
	 S1           : List all connected I2C devices  
	 S2           : List all tasks
 
  Variables: 
          s: the string that contains the command from UART
  Returns  : [NO_ERR, ERR_CMD, ERR_NUM, ERR_I2C] or ack. value for command
  ---------------------------------------------------------------------------*/
uint8_t execute_single_command(char *s)
{
   uint8_t  num  = atoi(&s[1]); // convert number in command (until space is found)
   uint8_t  rval = NO_ERR, err, i, num2;
   uint16_t temp;
   char     s2[40]; // Used for printing to RS232 port
   char     *s1;
   
   switch (s[0])
   {
	   case 'b': // i2c_lcd display: blinking
                 if (num) lcd_i2c_blink_on();
                 else     lcd_i2c_blink_off();
                 break;
	   case 'c': // i2c_lcd display: cursor
                 if (num) lcd_i2c_cursor_on();
                 else     lcd_i2c_cursor_off();
                 break;
	   case 'd': // i2c_lcd display: cursor
                 if (num) lcd_i2c_display_on();
                 else     lcd_i2c_display_off();
                 break;
	   case 'l': // i2c_lcd display: backlight
                 if (num) lcd_i2c_backlight_on();
                 else     lcd_i2c_backlight_off();
                 break;
	   case 't': // time-control
                 if      (num == 0) { clk1.active = false; clk2.active = false; }
                 else if (num == 1) { clk1.active = true;  clk2.active = false; }
                 else if (num == 2) { clk1.active = false; clk2.active = true;  }
                 else rval = ERR_NUM;
                 break;
       case 'm': // max7219 test routine
                 if (num > 7) rval = ERR_NUM;
                 num2 = atoi(&s[3]);
                 max7219_write((MAX7219_REG_DIG0 + (num << 8)) | num2);
                 break;
       case 'n': // mcp23017 test routine
                 if (num > 1) rval = ERR_NUM;
                 else if (num == 0)
                 {
                    num2 = atoi(&s[3]);
                    mcp23017_write(GPIOB,num2);
                 }
                 else
                 {
                     num2 = mcp23017_read(GPIOA);
                     sprintf(s2,"GPIOA=%d\n",(uint16_t)num2);
                     xputs(s2);
                 } // else
                 break;
       case 's': // System commands
				 switch (num)
				 {
					 case 0: // Chess revision number
							 print_version_number();
							 break;
					 case 1: // List all I2C devices
					         i2c_scan();
							 break;
					 case 2: // List all tasks
							 list_all_tasks(); 
							 break;	
					 default: rval = ERR_NUM;
							  break;
				 } // switch
				 break;

	   default: rval = ERR_CMD;
				sprintf(s2,"ERR.CMD[%s]\n",s);
				xputs(s2);
	            break;
   } // switch
   return rval;	
} // execute_single_command()
