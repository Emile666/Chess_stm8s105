/*==================================================================
  File Name    : chess_stm8s105_main.c
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the main() function and all the 
            hardware related functions for the STM8S105C6T6 uC.
            It is meant for the Chess Board PCB.
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
#include <stdio.h>
#include "chess_stm8s105_main.h"
#include "scheduler.h"
#include "eep.h"
#include "i2c.h"
#include "max7219.h"
#include "uart.h"
#include "tm1637.h"
#include "lcd_i2c.h"
#include "max7219.h"
#include "delay.h"

extern int16_t  @eeprom eedata[]; // Link to .eeprom section
extern uint32_t t2_millis;        // needed for delay_msec()
extern uint8_t  rs232_inbuf[];

uint8_t col_nr = 0;
uint8_t reed_relays[PLAYFIELD_SIZE]; // status of all reed-relays

clock_struct clk1,clk2;
bool         rotenc_sw = false;
bool         this_side_white = true;
int8_t       clk_idx   = 0;  // index in clock-settings
uint8_t      clk_mode;       // TIME, FISCHER, US_DLY, DELAY 
uint8_t      game_mode = 0;  // ENDED, WHITE_PLAYING, BLACK_PLAYING, PAUSED
const uint8_t times1[]  = {5,10,25,60,120,120,120,3,25,90,90,25,115,120,5,25,115};
const uint8_t times2[] = {0, 0, 0, 0,  0, 30, 60,0, 0, 0,30, 0,  0, 15,0, 0, 60};
const uint8_t bonus[]  = {0, 0, 0, 0,  0,  0,  0,2,10,30,30,10,  2, 30,2, 5,  5};
const char clear_lcd[]    =  "                    ";
const char menu[3][20]    = {"1 New game          ",
                             "2 Setup Clock       ",
                             "3 Choose Colour     "};
const char clocks[17][21] = {"TIME(1) 5m          ",
                             "TIME(1) 10m         ",
                             "TIME(1) 25m         ",
                             "TIME(1) 1h          ",
                             "TIME(1) 2h          ",
                             "TIME(2) 2h+30m      ",
                             "TIME(2) 2h+1h       ",
                             "FSCH(1) 3m+2s/move  ",
                             "FSCH(1) 25m+10s/move",
                             "FSCH(1) 90m+30s/move",
                             "FSCH(2)90m+30m+30s/m",
                             "DLY(1)  25m+10s/m   ",
                             "DLY(1)  115m+5s/m   ",
                             "DLY(2)  2h+15m+30s/m",
                             "USDL(1) 5m+2s/move  ",
                             "USDL(1) 25m+5s/move ",
                             "USDL(2) 115m+60+5s/m"};

/*-----------------------------------------------------------------------------
  Purpose  : This is the interrupt routine for the Timer 2 Overflow handler.
             It runs at 1 kHz and drives the scheduler and the multiplexer.
             Measured timing: ?.? usec and ?? usec duration (?.? %).
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
@interrupt void TIM2_UPD_OVF_IRQHandler(void)
{
	uint8_t  reeds=0;
	
    PD_ODR |= ISR_TIME; // Time-measurement interrupt routine
    t2_millis++;        // update millisecond counter
    scheduler_isr();    // Run scheduler interrupt function
    PD_ODR   &= ~ISR_TIME;      // Time-measurement interrupt routine
    TIM2_SR1 &= ~TIM2_SR1_UIF;  // Reset interrupt (UIF bit) so it will not fire again straight away.
} // TIM2_UPD_OVF_IRQHandler()

@interrupt void PORTA_IRQHandler(void)
{
    rotenc_sw = true;
} // PORTA_IRQHandler()

/*-----------------------------------------------------------------------------
  Purpose  : This routine returns the value to Timer 1, which corresponds
             directly to the Rotary Encoder value.
  Variables: -
  Returns  : the Rotary Encoder value
  ---------------------------------------------------------------------------*/
uint16_t get_timer1_value(void)
{
    uint16_t tmpcntr = 0;
    
    tmpcntr = ((uint16_t)TIM1_CNTRH << 8);
    return (uint16_t)(tmpcntr | (uint16_t)(TIM1_CNTRL));
} // get_timer1_value()

/*-----------------------------------------------------------------------------
  Purpose  : This routine initialises the system clock to run at 16 MHz.
             It uses the internal HSI oscillator.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void initialise_system_clock(void)
{
    CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
    CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
    while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
    CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
 
    // The datasheet lists that the max. ADC clock is equal to 6 MHz (4 MHz when on 3.3V).
    // Because fMASTER is now at 16 MHz, we need to set the ADC-prescaler to 4.
    ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
    ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
    CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
    CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
    CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
    CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
    while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
} // initialise_system_clock()

/*-----------------------------------------------------------------------------
  Purpose  : This routine initialises Timer 2 to generate a 1 kHz interrupt.
             16 MHz / (  16 *  1000) = 1000 Hz (1000 = 0x03E8)
             It also initialises Timer 1 to read the status of a Rotary
             Encoder.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void setup_timers(void)
{
    // Set Timer 2 for an Interrupt frequency of 1 kHz
    TIM2_PSCR = 0x04;         //  Prescaler = 16
    TIM2_ARRH = 0x03;         //  High byte of 1000
    TIM2_ARRL = 0xE8;         //  Low  byte of 1000
    TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
    TIM2_CR1  = TIM2_CR1_CEN; //  Finally, enable the timer
    
    // Set Timer 1 for a Rotary Encoder
    TIM1_ARRH   = 0x03; // Autoreload value: High byte of 1000
    TIM1_ARRL   = 0xE8; // Autoreload value: Low  byte of 1000
    TIM1_CNTRH  = 0x01; // TEST: does it work?
    TIM1_CNTRL  = 0xF4; // TEST:	    
    TIM1_PSCRH  = 0x00; // Prescaler high byte
    TIM1_PSCRL  = 0x10; // Prescaler is 16, clock is 1 MHz
    TIM1_CR1    = 0x00; // Edge-aligned mode, up-counter
    TIM1_RCR    = 0x01; // Repetition-rate
    TIM1_CCER1  = 0x22; // Set CC1P and CC2P: falling-edge
    TIM1_SMCR   = 0x03; // Encode mode 3, counts up/down on TI1FP1/TI2FP1 edges
    TIM1_CCMR1  = 0x01; // CC1 is input, IC1 is mapped to TI1FP1
    TIM1_CCMR2  = 0x01; // CC2 is input, IC2 is mapped to TI2FP2
    TIM1_CR1   |= 0x01; // Finally, enable the timer
} // setup_timers()

/*-----------------------------------------------------------------------------
  Purpose  : This routine initialises all the GPIO pins of the STM8 uC.
             See stc1000p.h for a detailed description of all pin-functions.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void setup_gpio_ports(void)
{
    PA_DDR     |=  (LED_CLK | LED_LOAD | LED_DIN);            // Set as outputs
    // NOTE: PCB v01 has ROTENC_SW connected to PA3 instead of PC3!
    PA_DDR     &= ~ROTENC_SW;                       // Set unused pins as input
    PA_CR1     |=  ROTENC_SW;                       // Enable pull-up
    PA_CR1     |=  (LED_CLK | LED_LOAD | LED_DIN);            // Set to Push-Pull
    PA_CR2     |=  ROTENC_SW;                                 // Enable interrupt
    PA_ODR     &= ~(LED_CLK | LED_DIN | LED_LOAD);            // Disable PORTA outputs
	EXTI_CR1   |=  0x02;  // PAIS bits to Falling edge (0x20 for PORTC)
    
    PB_DDR     &= ~PB_NC;            						  // Set as input
    PB_CR1     |=  PB_NC;                                     // Enable pull-up
		
    PC_DDR     |=  (SPI_MOSI | SPI_CLK); 					     // Set as outputs
    PC_CR1     |=  (SPI_MOSI | SPI_CLK); 					     // Set to Push-Pull
    PC_CR2     |=  (SPI_MOSI | SPI_CLK);          		         // Set to 10 MHz
    PC_ODR     &= ~(SPI_MOSI | SPI_CLK);          		         // Disable PORTC outputs
    PC_DDR     &= ~(SPI_MISO | ROTENC_A | ROTENC_B | ROTENC_SW); // set as Input
	PC_DDR     &= ~PC_NC;										 // set as Input
    PC_CR1     &= ~SPI_MISO;                      			     // set to Floating
    PC_CR1     |=  ROTENC_A | ROTENC_B | ROTENC_SW | PC_NC;      // Enable pull-up

	PD_DDR     |=  (CLK1 | DIO1 | CLK2 | DIO2 | ISR_TIME);       // Set as output
    PD_CR1     |=  (CLK1 | DIO1 | CLK2 | DIO2 | ISR_TIME);       // Set to Push-Pull
    PD_DDR     &= ~RX;                                           // Set as input
    PD_CR1     |=  RX;                                           // Enable Pull-up
    PD_ODR     |= (CLK1 | DIO1 | CLK2 | DIO2);                   // Clock and Data from TM1367 all high
	PD_ODR     &= ~ISR_TIME;
    
    PE_ODR     |=  (I2C_SCL | I2C_SDA); // Must be set here, or I2C will not work
    PE_DDR     |=  (I2C_SCL | I2C_SDA); // Set as outputs
    PE_DDR     &= ~PE_NC;               // Set unused ports as input
    PE_CR1     |=  PE_NC;               // Enable pull-ups
} // setup_output_ports()

void update_clock(clock_struct *p)
{
    uint16_t x;
    
    if (p->active) 
    {   
        // TODO: add US-DELAY and DELAY methods
        // decrease clock only if active
        if (p->sec == 0)
        {
            if (p->min > 0)
            {
                p->sec = 59;
                p->min--;
            } // if
        } // if
        else p->sec--;
        p->blink = !p->blink;
    } // if
    else 
    {
        if (p->active_prev)
        {   // player just pressed his time-button
            if (clk_mode == FISCHER)
            {
                p->sec += bonus[clk_idx];
                if (p->sec > 59)
                {
                    p->sec -= 60;
                    ++p->min;
                } // if
            } // if
        } // if
        // TODO: DELAY method
        p->blink = true;
    } // else
    if (p->min > 59)
    {
        x = (uint16_t)p->min / 60;   // #hours
        p->digits = 40 * x + p->min; // hh:mm to display
    } // if
    else
    {   // p->min < 60
        p->digits = 100 * p->min + p->sec; // mm:ss to display
    } // else
    p->active_prev = p->active;
} // update_clock()

void update_clock_settings(void)
{
    clk1.min = clk2.min = times1[clk_idx];
    clk1.sec = clk2.sec = 0;
    if (clk_idx < 7)       clk_mode = TIME;
    else if (clk_idx < 11) clk_mode = FISCHER;
    else if (clk_idx < 14) clk_mode = DELAY;
    else                   clk_mode = US_DLY;
    
    if ((clk_mode == FISCHER) || (clk_mode == US_DLY))
    {   // FISCHER and DELAY
        clk1.sec += bonus[clk_idx];
        clk2.sec += bonus[clk_idx];
    } // if
} // update_clock_settings()

void menu_handler(void)
{
                                 
    static uint8_t  menu_std = 0;
    static int8_t   menu_idx = 0;
    static uint8_t  tmr;
    static uint16_t old_rotenc;
    uint16_t        rotenc;
    
    rotenc = get_timer1_value();
    switch (menu_std)
    {
        case 0: // Clear menu-line
                lcd_i2c_setCursor(0,1);
                lcd_i2c_print(clear_lcd);
                if (rotenc_sw) 
                {
                    menu_std = 1;      // rotate through menu-items
                    rotenc_sw = false; // reset switch
                    menu_idx = 0;      // start with 1st menu-item
                    tmr = 0;           // reset timer
                } // if
                break;
        case 1: // Rotate through menu-items
                lcd_i2c_setCursor(0,1);
                lcd_i2c_print(menu[menu_idx]); // display menu-item
                if (rotenc_sw)
                {
                    rotenc_sw = false; // reset switch
                    tmr = 0;           // reset timer
                    menu_std = 2 + menu_idx; // goto corresponding state
                } // if
                else if (rotenc > old_rotenc)
                {
                    if (++menu_idx > 2) menu_idx = 2;
                    tmr = 0;           // reset timer
                }
                else if (rotenc < old_rotenc)
                {
                    if (--menu_idx < 0) menu_idx = 0;
                    tmr = 0;           // reset timer
                }
                else if (++tmr > 10) menu_std = 0;
                break;
        case 2: // New game
                lcd_i2c_setCursor(0,1);
                lcd_i2c_print("New game Selected"); // display menu-item
                if (++tmr > 10) menu_std = 0;
                break;
        case 3: // Setup clocks
                lcd_i2c_setCursor(0,1);
                lcd_i2c_print(clocks[clk_idx]); // display clock-item
                if (rotenc_sw)
                {
                    update_clock_settings(); // Update clock with new settings
                    rotenc_sw = false; // reset switch
                    tmr = 0;           // reset timer
                    menu_std = 1;      // goto state 1
                } // if
                else if (rotenc > old_rotenc)
                {
                    if (++clk_idx > 16) clk_idx = 16;
                    tmr = 0;           // reset timer
                }
                else if (rotenc < old_rotenc)
                {
                    if (--clk_idx < 0) clk_idx = 0;
                    tmr = 0;           // reset timer
                }
                else if (++tmr > 10) { menu_std = 1; tmr = 0; }
                break;
        case 4: // Choose White
                lcd_i2c_setCursor(0,1);
                lcd_i2c_print("This side: "); // display menu-item
                if (rotenc_sw)
                {
                    rotenc_sw = false;
                    this_side_white = !this_side_white;
                    tmr = 0;
                } // if
                else if (++tmr > 10) { menu_std = 1; tmr = 0; }
                lcd_i2c_setCursor(11,1);
                if (this_side_white)
                     lcd_i2c_print("White");
                else lcd_i2c_print("Black");
                break;
    } // switch
    old_rotenc = rotenc;
} // menu_handler()

/*-----------------------------------------------------------------------------
  Purpose  : This task is called every 25 msec. and scans the entire chess
             board. After 200 msec. the entire board is scanned.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void scan_task(void)
{
    static uint8_t col_nr = 0, i, num2, max_bit;
    uint8_t reeds;
    
	reeds = mcp23017_read(GPIOA);    // Read status of reed-relays
    //TEST for PCB v0.1
    if (col_nr < 7) max_bit = 6-col_nr;
    else            max_bit = 7;
    max_bit = (1<<max_bit);
    for (i = 0; i < 8; i++)
    {
        if (reeds & (1<<i)) reed_relays[i] |=  max_bit;
        else                reed_relays[i] &= ~max_bit;
    } // for
    max7219_write((MAX7219_REG_DIG0 + (col_nr << 8)) | reed_relays[col_nr]);
    if (++col_nr > 7) col_nr = 0;    // start again
	mcp23017_write(GPIOB,1<<col_nr); // Scan next reed-relay column
} // scan_task()

/*-----------------------------------------------------------------------------
  Purpose  : This task is called every second and processes all tasks that 
             needs to be called once a second.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
void adc_task(void)
{
    uint16_t tmr1,h,m;
    char     s[30];
    
    uart_write('.');
    tm1637_enable_clock_nr(CLOCK1);
    update_clock(&clk1);
    tm1637_set_brightness(7,true);
    tm1637_show_nr_dec_ex(clk1.digits, clk1.blink?0x40:0x00, true, 4, 0);

    sprintf(s,"CLK ",h);
    lcd_i2c_setCursor(0,2);
    lcd_i2c_print(s);
    h = clk1.min / 60;
    m = clk1.min - 60*h;
    sprintf(s,"%d:%02d:%02d ",h,m,(uint16_t)clk1.sec);
    lcd_i2c_setCursor(4,2);
    lcd_i2c_print(s);
    
    h = clk2.min / 60;
    m = clk2.min - 60*h;
    sprintf(s,"%d:%02d:%02d",h,m,(uint16_t)clk2.sec);
    lcd_i2c_setCursor(12,2);
    lcd_i2c_print(s);
    
    tm1637_enable_clock_nr(CLOCK2);
    update_clock(&clk2);
    tm1637_set_brightness(7,true);
    tm1637_show_nr_dec_ex(clk2.digits, clk2.blink?0x40:0x00, true, 4, 0);

    tmr1 = get_timer1_value();
    sprintf(s,"Timer1:%04d",tmr1);
    lcd_i2c_setCursor(0,3);
    lcd_i2c_print(s);
} // adc_task()

void print_version_number(void)
{
    const char s[] = "Chess stm8s105 v0.1";
    xputs(s);
    uart_write('\n');
    lcd_i2c_clear();
    lcd_i2c_setCursor(0,0);
    lcd_i2c_backlight_on();
    lcd_i2c_print(s);
} // print_version_number()

/*-----------------------------------------------------------------------------
  Purpose  : This is the main entry-point for the entire program.
             It initialises everything, starts the scheduler and dispatches
             all tasks.
  Variables: -
  Returns  : -
  ---------------------------------------------------------------------------*/
int main(void)
{
	char    s[30];     // Needed for xputs() and sprintf()
    int     ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
    uint8_t ok, buf[5], bb = false;
	
    disable_interrupts();
    initialise_system_clock(); // Set system-clock to 16 MHz
    uart_init();               // UART init. to 115200,8,N,1
    setup_gpio_ports();        // Init. needed output-ports for LED and keys
    i2c_init(bb);              // Init. I2C bus
    setup_timers();            // Set Timer 2 to 1 kHz and Timer 1 for a Rotary Encoder

    // Initialise all tasks for the scheduler
    scheduler_init();                        // clear task_list struct
    add_task(adc_task    ,"Sec1",  0, 1000); // every second
    add_task(scan_task   ,"Scan",  0,   25); // every 25 msec.
    add_task(menu_handler,"Menu",250,  500); // every 500 msec.
    enable_interrupts();
    lcd_i2c_init(0x48,20,4,LCD_5x8DOTS); // Needs working interrupts!
    print_version_number();
    if (mcp23017_init())       
    {   // Initialize IO-expander for valves (port A input, port B output)
		xputs("mcp23017_init() error\n");
    } // if
    // Init. both player clocks
    max7219_init(); // Init. driver IC for LEDs on chess-board
    max7219_write(MAX7219_REG_TEST  | 0x01); // Test mode: all leds on
    delay_msec(1000);
    max7219_write(MAX7219_REG_TEST  | 0x00); // Test mode off

    clk1.min    = clk2.min    = 40;
    clk1.sec    = clk2.sec    =  0;
    clk1.active = clk2.active = false;
    
    while (1)
    {   // background-processes
        dispatch_tasks();                // Run task-scheduler()
		switch (rs232_command_handler()) // run command handler continuously
		{
			case ERR_CMD: xputs("Command Error\n"); break;
			case ERR_NUM: sprintf(s,"Number Error (%s)\n",rs232_inbuf);
						  xputs(s);  
						  break;
			default     : break;
		} // switch
        wait_for_interrupt(); // do nothing
    } // while
} // main()
