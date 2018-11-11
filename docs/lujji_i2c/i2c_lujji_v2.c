#include "i2c.h"

void i2c_init(void) 
{
    I2C_FREQR = (1 << I2C_FREQR_FREQ1); // 0x02 ?
    I2C_CCRL = 0x0A; // 100kHz
    I2C_OARH = (1 << I2C_OARH_ADDMODE); // 7-bit addressing
    I2C_CR1 = (1 << I2C_CR1_PE);
} // i2c_init()

void i2c_start(void) 
{
    I2C_CR2 |= (1 << I2C_CR2_START);
    while (!(I2C_SR1 & (1 << I2C_SR1_SB)));
} // i2c_start()

void i2c_stop(void) 
{
    I2C_CR2 |= (1 << I2C_CR2_STOP);
    while (I2C_SR3 & (1 << I2C_SR3_MSL));
} // i2c_stop()

void i2c_write(uint8_t data) 
{
    I2C_DR = data;
    while (!(I2C_SR1 & (1 << I2C_SR1_TXE)));
} // i2c_write()

void i2c_write_addr(uint8_t addr) 
{
    I2C_DR = addr;
    while (!(I2C_SR1 & (1 << I2C_SR1_ADDR)));
    (void) I2C_SR3; // check BUS_BUSY
    I2C_CR2 |= (1 << I2C_CR2_ACK);
} // i2c_write_addr()

uint8_t i2c_read(void) 
{
    I2C_CR2 &= ~(1 << I2C_CR2_ACK);
    i2c_stop();
    while (!(I2C_SR1 & (1 << I2C_SR1_RXNE)));
    return I2C_DR;
} // i2c_read()

void i2c_read_arr(uint8_t *buf, int len) 
{
    while (len-- > 1) 
    {
        I2C_CR2 |= (1 << I2C_CR2_ACK);
        while (!(I2C_SR1 & (1 << I2C_SR1_RXNE)));
        *(buf++) = I2C_DR;
    } // while
    *buf = i2c_read();
} // i2c_read_arr()

uint8_t mcp23017_init(void)
/*------------------------------------------------------------------
  Purpose  : This function inits the MCP23017 16-bit IO-expander
             PORTA is input from all reed-relays
             PORTB is output for all reed-relays
  Variables: -
  Returns  : 0: no error, 1: error
  ------------------------------------------------------------------*/
{
	uint8_t err;
	err = mcp23017_write(IOCON, MCP23017_INIT);
	if (!err)
	{
		err = mcp23017_write(IODIRB, 0x00); // all PORTB bits are output
		err = mcp23017_write(IODIRA, 0xFF); // all PORTA bits are input
		err = mcp23017_write(GPPUA,  0xFF); // Enable pull-ups (100k) on PORTA
		err = mcp23017_write(OLATB,  0x80); // HW-bug? Have to write this first
		err = mcp23017_write(OLATB,  0x00); // All IO is OFF at power-up
	} // if
	return err;	
} // mcp23017_init()

uint8_t mcp23017_read(uint8_t reg)
/*------------------------------------------------------------------
  Purpose  : This function reads one register from the MCP23017 IO-expander.
  Variables:
       reg : The register to read from
  Returns  : the value returned from the register
  ------------------------------------------------------------------*/
{
	uint8_t err, ret = 0;
	
	// generate I2C start + output address to I2C bus
	err = (i2c_start(MCP23017_ADDR | I2C_WRITE) == I2C_NACK); 
	if (err) i2c_stop();
    else 
	{
		i2c_write(reg); // write register address
		i2c_rep_start(MCP23017_ADDR | I2C_READ);
		i2c_readN(1,&ret); // Read byte, generate I2C stop condition
	} // if
	return ret;
} // mcp23017_read()

uint8_t mcp23017_write(uint8_t reg, uint8_t data)
/*------------------------------------------------------------------
  Purpose  : This function write one data byte to a specific register 
	     of the MCP23017 IO-expander.
  Variables:
       reg : The register to write to
	   data: The data byte to write into the register
  Returns  : 0: no error, 1: error
  ------------------------------------------------------------------*/
{
	uint8_t err;
		
	// generate I2C start + output address to I2C bus
	err = (i2c_start(MCP23017_ADDR | I2C_WRITE) == I2C_NACK);
	if (err) i2c_stop();
    else
	{
		i2c_write(reg);  // write register address
		i2c_write(data); // write register value
		i2c_stop();
	} // if
	return err;
} // mcp23017_write()
