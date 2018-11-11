#ifndef CHESS_STM8S105_MAIN_H
#define CHESS_STM8S105_MAIN_H
/*==================================================================
  File Name    : chess_stm8s105_main.h
  Author       : Emile
  ------------------------------------------------------------------
  This is the main header file for the chess project.
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
  ------------------------------------------------------------------
  Schematic of the connections to the MCU.
  
                                 STM8S105C6T6
      MCU pin-name            Function    |    MCU pin-name        Function
   ---------------------------------------|--------------------------------
   01 NRST                                | 13 VDDA
   02 PA1/OSC                 -           | 14 VSSA
   03 PA2/OSCOUT              -           | 15 PB7/AIN7            -
   04 VSSIO_1                             | 16 PB6/AIN6            -
   05 VSS                                 | 17 PB5/AIN5[I2C_SDA]   -
   06 VCAP                                | 18 PB4/AIN4[I2C_SCL]   -
   07 VDD                                 | 19 PB3/AIN3[TIM1_ETR]  -
   08 VDDIO_1                             | 20 PB2/AIN2[TIM1_CH3N] -
   09 PA3/TIM2_CH3[TIME3_CH1] ROTENC_SW   | 21 PB1/AIN1[TIM1_CH2N] -
   10 PA4                     LED_CLK     | 22 PB0/AIN0[TIM1_CH1N] -
   11 PA5                     LED_LOAD    | 23 PE7/AIN8            -
   12 PA6                     LED_DIN     | 24 PE6/AIN9            -
   ---------------------------------------|--------------------------------
   25 PE5/SPI_NSS             SPI_NSS     | 37 PE3/TIM1_BKIN       -
   26 PC1/TIM1_CH1/UART2_CK   ROTENC_A    | 38 PE2/I2C_SDA         I2C_SDA
   27 PC2/TIM1_CH2            ROTENC_B    | 39 PE1/I2C_SCL         I2C_SCL
   28 PC3/TIM1_CH3            ROTENC_SW   | 40 PE0/CLK_CC0         -
   29 PC4/TIM1_CH4            -           | 41 PD0/TIM3_CH2...     ISR_TIME
   30 PC5/SPI_SCK             SPI_SCK     | 42 PD1/SWIM            SWIM
   31 VSSIO_2                             | 43 PD2/TIM3_CH1...     DIO2 
   32 VDDIO_2                             | 44 PD3/TIM2_CH2...     CLK2
   33 PC6/SPI_MOSI            SPI_MOSI    | 45 PD4/TIM2_CH1[BEEP]  DIO1
   34 PC7/SPI_MISO            SPI_MISO    | 46 PD5/UART2_TX        TX
   35 PG0                     -           | 47 PD6/UART2_RX        RX
   36 PG1                     -           | 48 PD7/TLI[TIM1_CH4]   CLK1
   ---------------------------------------------------------------------
   
   NOTE  : PA1, PA2, PG0 and PG1 do NOT have interrupt capability!
   NOTE 2: PCB v01 has ROTENC_SW connected to PA3
*/
#include <iostm8s105.h>
#include <stdbool.h>
#include "stdint.h"

#define TIME    (0)
#define FISCHER (1)
#define US_DLY  (2)
#define DELAY   (3)

typedef struct _clock_struct
{
    uint8_t  min;
    uint8_t  sec;
    bool     active;
    bool     active_prev;
    bool     blink;
    uint16_t digits;
} clock_struct;
    
//-----------------------------------------------------------------------
// Hardware defines for register definitions
// These value were defined in IAR, but not in Cosmic STM8
//-----------------------------------------------------------------------
#define CLK_ICKCR_HSIEN   (0x01)
#define CLK_ICKCR_HSIRDY  (0x02)
#define CLK_SWCR_SWBSY    (0x01)
#define CLK_SWCR_SWEN     (0x02)
#define ADC_CR1_SPSEL_MSK (0x70)
#define TIM2_IER_UIE      (0x01)
#define TIM2_CR1_CEN      (0x01)
#define TIM2_SR1_UIF      (0x01)
#define UART2_CR2_TIEN    (0x80) /* Transmitter Interrupt Enable */
#define UART2_CR2_RIEN    (0x20) /* Receiver Interrupt Enable */
#define UART2_CR2_TEN     (0x08) /* Transmitter Enable */
#define UART2_CR2_REN     (0x04) /* Receiver Enable */
#define UART2_SR_TC       (0x40) /* Transmission Complete */
#define UART2_SR_RXNE     (0x20) /* Read data register not empty */
#define UART2_CR3_CLKEN   (0x08) /* Uart clock enable */

#define enable_interrupts()  {_asm("rim\n");} /* enable interrupts */
#define disable_interrupts() {_asm("sim\n");} /* disable interrupts */
#define wait_for_interrupt() {_asm("wfi\n");} /* Wait For Interrupt */

//-----------------------------------------------------------------------
// PORTA Inputs and Outputs
//-----------------------------------------------------------------------
#define LED_DIN     (0x40) /* MAX7219 DIN input */
#define LED_LOAD    (0x20) /* MAX7219 CS input */
#define LED_CLK     (0x10) /* MAX7219 CLK input */

#define MAX7219_CLK_1  (PA_ODR |=  LED_CLK)
#define MAX7219_CLK_0  (PA_ODR &= ~LED_CLK)
#define MAX7219_DIN_1  (PA_ODR |=  LED_DIN)
#define MAX7219_DIN_0  (PA_ODR &= ~LED_DIN)
#define MAX7219_LOAD_1 (PA_ODR |=  LED_LOAD)
#define MAX7219_LOAD_0 (PA_ODR &= ~LED_LOAD)

//-----------------------------------------------------------------------
// PORTA Inputs and Outputs
//-----------------------------------------------------------------------
#define PB_NC       (0xFF) /* Unused pins */

//-----------------------------------------------------------------------
// PORTC Inputs and Outputs
//-----------------------------------------------------------------------
#define SPI_MISO  (0x80) /* SPI MISO line */
#define SPI_MOSI  (0x40) /* SPI MOSI line */
#define SPI_CLK   (0x20) /* SPI Serial-clock */
#define ROTENC_SW (0x08) /* Rotary Encoder switch */
#define ROTENC_B  (0x04) /* Rotary Encoder B input */
#define ROTENC_A  (0x02) /* Rotary Encoder A */
#define PC_NC     (0x11) /* Unused pins */

//-----------------------------------------------------------------------
// PORTD Inputs and Outputs
//-----------------------------------------------------------------------
#define CLK1     (0x80) /* Clock Player 1 CLK input */
#define RX       (0x40) /* UART2 RXD input */
#define TX       (0x20) /* UART2 TXD output */
#define DIO1     (0x10) /* Clock Player 1 Data input */
#define CLK2     (0x08) /* Clock Player 2 CLK input */
#define DIO2     (0x04) /* Clock Player 2 Data input */
#define SWIM     (0x02) /* do NOT initialize or debugging will not work */
#define ISR_TIME (0x01) /* Time-measurement Interrupt */

//-----------------------------------------------------------------------
// PORTE Inputs and Outputs
//-----------------------------------------------------------------------
#define I2C_SDA   (0x04)
#define I2C_SCL   (0x02)
#define PE_NC     (0xF9)

#define PLAYFIELD_SIZE (8)

// Function prototypes
void setup_timer2(void);
void initialise_system_clock(void);
void setup_gpio_ports(void);
void print_version_number(void);

#endif // CHESS_STM8S105_MAIN_H