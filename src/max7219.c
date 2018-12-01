/*==================================================================
  File Name    : max7219.c
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the routines for the MAX7219
            8 x 7-segment display driver
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
#include "max7219.h"

/*------------------------------------------------------------------
  Purpose  : This function initialises the MAX7219 7-segment display
             driver to the following:
			 - No decode for digits 7-0
			 - Set intensity to 15/32
			 - Display digit 7-0
			 - Set normal operation
  Variables: -
  Returns  : -
  ------------------------------------------------------------------*/
void max7219_init(void)
{
    uint8_t i;
    
	max7219_write(MAX7219_REG_DECD);         // No decode for digits 7-0
	max7219_write(MAX7219_REG_INTNS | 0x02); // Set intensity to 15/32
	max7219_write(MAX7219_REG_SCANL | 0x07); // Display all digits
	max7219_write(MAX7219_REG_SHUTD | 0x01); // Normal operation
    for (i = 0; i < 8; i++)
    {
        max7219_write((MAX7219_REG_DIG0 + (i << 8))); // all digits 0
    } // for i
} // max7219()

/*------------------------------------------------------------------
  Purpose  : This function writes 1 16-bit data-byte to the MAX7219.
  Variables: dat: the data-byte to write to the MAX7219
  Returns  : -
  ------------------------------------------------------------------*/
void max7219_write(uint16_t dat)
{
	uint8_t i;
    uint16_t pwr = 0x8000; // start with bit 15
	
	for (i = 0; i < 16; i++)
	{
		MAX7219_CLK_0;
		if (dat & pwr)
			 MAX7219_DIN_1;
		else MAX7219_DIN_0;
		MAX7219_CLK_1; // give clock-pulse
		pwr >>= 1; // SHR 1
	} // for i
	MAX7219_LOAD_1; // clock data into outputs
	MAX7219_CLK_0;  // reset clock-line
	MAX7219_LOAD_0; // reset load
	MAX7219_DIN_0;  // reset data-line
} // max7219_write()
