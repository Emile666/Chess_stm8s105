/*==================================================================
  File Name    : stm8_interrupt_vector.c
  Author       : Emile
  ------------------------------------------------------------------
  Purpose : This files contains the basic interrupt table for STM8
            devices. Copyright (c) 2007 STMicroelectronics
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

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	unsigned char interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

@far @interrupt void NonHandledInterrupt (void)
{
	/* in order to detect unexpected events during development, 
	   it is recommended to set a breakpoint on the following instruction
	*/
	return;
}

extern void _stext();     /* startup routine */
extern void TIM2_UPD_OVF_IRQHandler();
extern void UART_TX_IRQHandler();
extern void UART_RX_IRQHandler();
extern void PORTA_IRQHandler();

struct interrupt_vector const _vectab[] = {
	{0x82, (interrupt_handler_t)_stext}, /* reset */
	{0x82, NonHandledInterrupt}, /* trap  */
	{0x82, NonHandledInterrupt}, /* irq00: TLI  */
	{0x82, NonHandledInterrupt}, /* irq01: AWU  */
	{0x82, NonHandledInterrupt}, /* irq02: CLK  */
	{0x82, (interrupt_handler_t)PORTA_IRQHandler}, /* irq03: EXTI0, PORTA  */
	{0x82, NonHandledInterrupt}, /* irq04: EXTI1, PORTB  */
	{0x82, NonHandledInterrupt}, /* irq05: EXTI2, PORTC  */
	{0x82, NonHandledInterrupt}, /* irq06: EXTI3, PORTD  */
	{0x82, NonHandledInterrupt}, /* irq07: EXTI4, PORTE  */
	{0x82, NonHandledInterrupt}, /* irq08: reserved  */
	{0x82, NonHandledInterrupt}, /* irq09: reserved  */
	{0x82, NonHandledInterrupt}, /* irq10: SPI, end of xfer */
	{0x82, NonHandledInterrupt}, /* irq11: TIM1 update/overflow*/
	{0x82, NonHandledInterrupt}, /* irq12: TIM1 capture/compare */
	{0x82, (interrupt_handler_t)TIM2_UPD_OVF_IRQHandler}, /* irq13: TIM2 update/overflow */
	{0x82, NonHandledInterrupt}, /* irq14: TIM2 capture/compare */
	{0x82, NonHandledInterrupt}, /* irq15: TIM3 update/overflow */
	{0x82, NonHandledInterrupt}, /* irq16: TIM3 capture/compare */
	{0x82, NonHandledInterrupt}, /* irq17: reserved */
	{0x82, NonHandledInterrupt}, /* irq18: reserved */
	{0x82, NonHandledInterrupt}, /* irq19: I2C */
	{0x82, (interrupt_handler_t)UART_TX_IRQHandler}, /* irq20: UART TX-complete */
	{0x82, (interrupt_handler_t)UART_RX_IRQHandler}, /* irq21: UART RX-full */
	{0x82, NonHandledInterrupt}, /* irq22: ADC EOC */
	{0x82, NonHandledInterrupt}, /* irq23: TIM4 update/overflow */
	{0x82, NonHandledInterrupt}, /* irq24: Flash */
	{0x82, NonHandledInterrupt}, /* irq25: reserved */
	{0x82, NonHandledInterrupt}, /* irq26: reserved */
	{0x82, NonHandledInterrupt}, /* irq27: reserved */
	{0x82, NonHandledInterrupt}, /* irq28: reserved */
	{0x82, NonHandledInterrupt}, /* irq29: reserved */
};
