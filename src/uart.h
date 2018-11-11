/*==================================================================
  File Name    : uart.h
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the header file for uart.c.
	    Original source at: 
            https://lujji.github.io/blog/bare-metal-programming-stm8/
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
#ifndef _UART_H_
#define _UART_H_

#include "chess_stm8s105_main.h"
#include <stdbool.h>

#define F_CPU       (16000000L)
#define BAUDRATE      (115200L)
#define UART_BUFLEN        (10)

#define NO_ERR  (0x00)
#define ERR_CMD	(0x01)
#define ERR_NUM	(0x02)

#define TX_BUF_SIZE (30)
#define RX_BUF_SIZE (10)

void    uart_init(void);
void    uart_write(uint8_t data);
uint8_t uart_read(void);
void    xputs(uint8_t *s);
bool    uart_kbhit(void); /* returns true if character in receive buffer */
uint8_t rs232_command_handler(void);
uint8_t execute_single_command(char *s);

#endif