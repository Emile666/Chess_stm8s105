/*==================================================================
  File Name    : i2c.h
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the I2C related functions for the STM8 uC.
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
#ifndef _MAX7219_H_
#define _MAX7219_H_

#include "chess_stm8s105_main.h"

// Defines for the MAX7219 registers (D15-D8)
#define MAX7219_REG_NO_OP (0x0000)
#define MAX7219_REG_DIG0  (0x0100)
#define MAX7219_REG_DIG1  (0x0200)
#define MAX7219_REG_DIG2  (0x0300)
#define MAX7219_REG_DIG3  (0x0400)
#define MAX7219_REG_DIG4  (0x0500)
#define MAX7219_REG_DIG5  (0x0600)
#define MAX7219_REG_DIG6  (0x0700)
#define MAX7219_REG_DIG7  (0x0800)
#define MAX7219_REG_DECD  (0x0900)
#define MAX7219_REG_INTNS (0x0A00)
#define MAX7219_REG_SCANL (0x0B00)
#define MAX7219_REG_SHUTD (0x0C00)
#define MAX7219_REG_TEST  (0x0F00)

void max7219_init(void);
void max7219_write(uint16_t dat);

#endif
