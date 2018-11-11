#ifndef _I2C_H_
#define _I2C_H_

#include <iostm8s105.h>
#include <stdbool.h>
#include "stdint.h"

// Defines for the I2C_CR2 register
#define I2C_CR2_SWRST (0x80)
#define I2C_CR2_POS   (0x08)
#define I2C_CR2_ACK   (0x04)
#define I2C_CR2_STOP  (0x02)
#define I2C_CR2_START (0x01)

// Defines for the I2C_SR1 register when in Master Mode
#define I2C_SR1_TXE  (0x80)
#define I2C_SR1_RXNE (0x40)
#define I2C_SR1_BTF  (0x04)
#define I2C_SR1_ADDR (0x02)
#define I2C_SR1_SB   (0x01)

#define I2C_SR2_AF   (0x04)

#define I2C_SR3_BUSY (0x02)

/* defines the data direction (reading from I2C device) in i2c_start(), i2c_rep_start() */
#define I2C_ACK     (0)
#define I2C_NACK    (1)
#define I2C_WRITE   (0)
#define I2C_READ    (1)
#define I2C_RETRIES (3)

//-------------------------------------------------------------------------
// MCP23017 16-BIT IO Expander: Register names when BANK == 1
//-------------------------------------------------------------------------
// Bank addressing, seq. operation disabled, slew rate enabled
// HW addressing enabled
#define MCP230XX_ADDR (0x40)
#define MCP23017_INIT (0xAA)

// Defines for the MCP23017
#define IODIRA   (0x00)
#define IPOLA    (0x01)
#define GPINTENA (0x02)
#define DEFVALA  (0x03)
#define INTCONA  (0x04)
#define GPPUA    (0x06)
#define INTFA    (0x07)
#define INTCAPA  (0x08)
#define GPIOA    (0x09)
#define OLATA    (0x0A)

#define IODIRB   (IODIRA   + 0x10)
#define IPOLB    (IPOLA    + 0x10)
#define GPINTENB (GPINTENA + 0x10)
#define DEFVALB  (DEFVALA  + 0x10)
#define INTCONB  (INTCONA  + 0x10)
#define GPPUB    (GPPUA    + 0x10)
#define INTFB    (INTFA    + 0x10)
#define INTCAPB  (INTCAPA  + 0x10)
#define GPIOB    (GPIOA    + 0x10)
#define OLATB    (OLATA    + 0x10)

void    i2c_init();  // Initialize I2C at 100kHz, 7-bit addressing mode, SDA->PB5, SCL->PB4
void    i2c_start();                         // Generate START condition
void    i2c_stop();                          // Generate STOP condition
void    i2c_write(uint8_t data);             // Write one data-byte
void    i2c_write_addr(uint8_t addr);        // Write slave-address
void    i2c_read_arr(uint8_t *buf, int len); // Read >= 2 bytes. STOP is generated automatically
uint8_t i2c_read();                          // Read one byte. STOP is generated automatically
uint8_t mcp23017_init(void);
uint8_t mcp23017_read(uint8_t reg);
uint8_t mcp23017_write(uint8_t reg, uint8_t data);

#endif /* _I2C_H_ */
