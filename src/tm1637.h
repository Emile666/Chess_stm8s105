/*==================================================================
  File Name    : tm1637.h
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the header file for tm1637.c.
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
#ifndef _TM1637_H_
#define _TM1637_H_

#include "chess_stm8s105_main.h"
#include <stdbool.h>

#define TM1637_DELAY_USEC    (2)
#define TM1637_I2C_COMM1  (0x40) /* Data Write Mode Setting */
#define TM1637_I2C_COMM2  (0xC0) /* Address Command Setting */
#define TM1637_I2C_COMM3  (0x80) /* Display Control */

#define CLOCK1 (0)
#define CLOCK2 (1)

void tm1637_enable_clock_nr(uint8_t clock_nr);
void tm1637_dio_pin_input(void);
void tm1637_dio_pin_output(void);
void tm1637_start(void);
void tm1637_stop(void);
void tm1637_set_brightness(uint8_t brightness, bool on);
void tm1637_set_segments(uint8_t *segments, uint8_t length, uint8_t pos);
void tm1637_show_nr_dec(int num, bool leading_zero, uint8_t length, uint8_t pos);
void tm1637_show_nr_dec_ex(int num, uint8_t dots, bool lzero, uint8_t length, uint8_t pos);
bool tm1637_write_byte(uint8_t b);

#endif