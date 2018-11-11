/*==================================================================
  File Name    : tm1637.c
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the routines for the TM1637 clock ICs.
            It is converted from the original C++ Arduino library to
			a C version for the STM8.
            Original author: avishorp@gmail.com (Arduino library)
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
#include "tm1637.h"
#include "delay.h"

uint8_t active_clock = CLOCK1; // CLOCK1 or CLOCK2
uint8_t clk_pin;               // current clk_pin, set by tm1637_enable_clock_nr
uint8_t dio_pin;               // current dio_pin, set by tm1637_enable_clock_nr

//-----------------------------------
//      A
//     ---
//  F |   | B
//     -G-
//  E |   | C
//     ---
//      D
//-----------------------------------
const uint8_t digit_to_segment[16] = 
{
        //   XGFEDCBA
  0x3F, // 0b00111111,    // 0
  0x06, // 0b00000110,    // 1
  0x5B, // 0b01011011,    // 2
  0x4F, // 0b01001111,    // 3
  0x66, // 0b01100110,    // 4
  0x6D, // 0b01101101,    // 5
  0x7D, // 0b01111101,    // 6
  0x07, // 0b00000111,    // 7
  0x7F, // 0b01111111,    // 8
  0x6F, // 0b01101111,    // 9
  0x77, // 0b01110111,    // A
  0x7C, // 0b01111100,    // b
  0x39, // 0b00111001,    // C
  0x5E, // 0b01011110,    // d
  0x79, // 0b01111001,    // E
  0x71  // 0b01110001     // F
};

const uint16_t divisors[] = { 1, 10, 100, 1000 };

/*-----------------------------------------------------------------------------
  Purpose  : This function selects which TM1637 clock IC is used.
             - Clock 1: CLK1->PD7, DIO1->PD4
             - Clock 2: CLK2->PD3, DIO2->PD2
  Variables: clock_nr: [CLOCK1, CLOCK2]
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_enable_clock_nr(uint8_t clock_nr)
{
	if (clock_nr == CLOCK2)
	{   // CLOCK2
		clk_pin = 0x08; // CLK2->PD3
		dio_pin = 0x04; // DIO2->PD2
	}
	else
	{   // CLOCK1
		clk_pin = 0x80; // CLK1->PD7
		dio_pin = 0x10; // DIO1->PD4
	} // else
} // tm1637_enable_clock_nr()

/*-----------------------------------------------------------------------------
  Purpose  : This function sets the data-pin of the selected TM1637 to input.
             This is used to read the ACK-bit of the IC.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_dio_pin_input(void)
{
	PD_DDR &= ~dio_pin; // Set as input
    PD_CR1 |=  dio_pin; // Enable Pull-up resistor	
} // tm1637_dio_pin_input()

/*-----------------------------------------------------------------------------
  Purpose  : This function sets the data-pin of the selected TM1637 to output.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_dio_pin_output(void)
{
	PD_DDR |=  dio_pin; // Set as output
    PD_ODR &= ~dio_pin; // Set dio_pin low	
} // tm1637_dio_pin_output()

/*-----------------------------------------------------------------------------
  Purpose  : This function writes a start sequence to the TM1637
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_start(void)
{
    PD_ODR |= (clk_pin | dio_pin); // just to make sure
    delay_usec(TM1637_DELAY_USEC);
    PD_ODR &= ~dio_pin;            // Generate start condition
    delay_usec(TM1637_DELAY_USEC);
} // tm1637_start()

/*-----------------------------------------------------------------------------
  Purpose  : This function writes a stop sequence to the TM1637
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_stop(void)
{
	PD_ODR &= ~dio_pin;         // Make sure that dio_pin is low
	delay_usec(TM1637_DELAY_USEC);
	PD_ODR |= clk_pin;          // Reset clk_pin
	delay_usec(TM1637_DELAY_USEC);
	PD_ODR |= dio_pin;          // Generate stop-condition
	delay_usec(TM1637_DELAY_USEC);
} // tm1637_stop()

/*-----------------------------------------------------------------------------
  Purpose  : This function controls the brightness of the selected TM1637.
  Variables: brightness: [0..7], brightness from 1/16 to 14/16
             on        : [false,true] display is OFF (false) or ON (true)
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_set_brightness(uint8_t brightness, bool on)
{
	uint8_t m_brightness = 0;
	
	m_brightness = (brightness & 0x07) | (on? 0x08 : 0x00);
	// Write COMM3 + brightness
	tm1637_start();
	tm1637_write_byte(TM1637_I2C_COMM3 + (m_brightness & 0x0f));
	tm1637_stop();
} // tm1637_set_brightness()

/*-----------------------------------------------------------------------------
  Purpose  : This function sets the various segments of the TM1637.
  Variables: segments: pointer to buffer with segment values
             length  : number of segment to write to
			 pos     : [0..7] address of 1st segment to write to [C0H..C5H]
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_set_segments(uint8_t *segments, uint8_t length, uint8_t pos)
{
	uint8_t k;
	
    // Write COMM1
	tm1637_start();
	tm1637_write_byte(TM1637_I2C_COMM1); // data write mode setting
	tm1637_stop();

	// Write COMM2 + first digit address
	tm1637_start();
	tm1637_write_byte(TM1637_I2C_COMM2 + (pos & 0x03));

	// Write the data bytes
	for (k = 0; k < length; k++) 
		tm1637_write_byte(segments[k]);
	tm1637_stop();
} // tm1637_set_segments()

/*-----------------------------------------------------------------------------
  Purpose  : This function writes a number into a BCD value for the clock.
             It writes just a number, dots are not lighted.
  Variables: num   : the number to write to the TM1637
			 lzero : true = add leading-zeros to number on display
			 length: [0..3], the number of numbers to write to the display
			 pos   : [0..3], the first segment to write to
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_show_nr_dec(int num, bool leading_zero, uint8_t length, uint8_t pos)
{
    tm1637_show_nr_dec_ex(num, 0, leading_zero, length, pos);
} // tm1637_show_nr_dec()

/*-----------------------------------------------------------------------------
  Purpose  : This function converts a number into a BCD value for the clock.
             It also displays one or more dots on the display.
  Variables: num   : the number to write to the TM1637
             dots  : bits 7..4 control the dots, bit 7 is the center-colon (:)
			 lzero : true = add leading-zeros to number on display
			 length: [0..3], the number of digits to write to the display
			 pos   : [0..3], the position of the least significant digit
  Returns  : -
  ---------------------------------------------------------------------------*/
void tm1637_show_nr_dec_ex(int num, uint8_t dots, bool lzero,
                                    uint8_t length, uint8_t pos)
{
    uint8_t          digit, k, digits[4];
    int              d, divisor;
    bool             leading = true;

	for (k = 0; k < 4; k++) 
	{
	    divisor = divisors[3-k];
		d       = num / divisor;
        digit   = 0;

		if (d == 0) 
		{
		  if (lzero || !leading || (k == 3))
		       digit = digit_to_segment[d & 0x0F];
	      else digit = 0;
		} // if
		else 
		{
			digit   = digit_to_segment[d & 0x0F];
			num    -= d * divisor;
			leading = false;
		} // else
    
		// Add the decimal point/colon to the digit
		digit     |= (dots & 0x80); 
		dots     <<= 1;
		digits[k]  = digit;
	} // for
	tm1637_set_segments(digits + (4 - length), length, pos);
} // tm1637_show_nr_dec_ex()

/*-----------------------------------------------------------------------------
  Purpose  : This function writes a byte to the TM1637
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
bool tm1637_write_byte(uint8_t b)
{
    bool    ack;
	uint8_t i;
    uint8_t data = b;

    PD_ODR &= ~clk_pin;  // Make sure that clk_pin is low
    delay_usec(TM1637_DELAY_USEC);
    
    for (i = 0; i < 8; i++) 
    {   // 8 Data Bits
	    // Set data bit (start with LSB)
		if (data & 0x01)
		     PD_ODR |=  dio_pin;
		else PD_ODR &= ~dio_pin;
		delay_usec(TM1637_DELAY_USEC);

		PD_ODR |= clk_pin;   // Now set clock high
		delay_usec(TM1637_DELAY_USEC);
		PD_ODR &= ~clk_pin;  // Make sure that clk_pin is low
		delay_usec(TM1637_DELAY_USEC);
		data = data >> 1;    // next data-bit
	} // for

	// Wait for ack-bit from TM1637
    tm1637_dio_pin_input();  // clk_pin now input with pull-up resistor
    delay_usec(TM1637_DELAY_USEC);
    PD_ODR |= clk_pin;       // Now set clock high
	delay_usec(TM1637_DELAY_USEC);
	ack = ((PD_IDR & dio_pin) == dio_pin);
	delay_usec(TM1637_DELAY_USEC);
    PD_ODR &= ~clk_pin;      // Now set clock low again
	delay_usec(TM1637_DELAY_USEC);
	tm1637_dio_pin_output(); // dio_pin is set to output and low
	return ack;
} // tm1637_write_byte()
