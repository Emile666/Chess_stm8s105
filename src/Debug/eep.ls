   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2524                     .eeprom:	section	.data
2525  0000               _eedata:
2526  0000 0000          	dc.w	0
2527  0002 0000          	dc.w	0
2586                     ; 36 uint16_t eeprom_read_config(uint8_t eeprom_address)
2586                     ; 37 {
2588                     	switch	.text
2589  0000               _eeprom_read_config:
2591  0000 5204          	subw	sp,#4
2592       00000004      OFST:	set	4
2595                     ; 39   char    *address = (char *)EEP_BASE_ADDR; //  EEPROM base address.
2597  0002 ae4000        	ldw	x,#16384
2598  0005 1f01          	ldw	(OFST-3,sp),x
2600                     ; 41 	address += (eeprom_address << 1); // convert to byte-address in EEPROM
2602  0007 5f            	clrw	x
2603  0008 97            	ld	xl,a
2604  0009 58            	sllw	x
2605  000a 72fb01        	addw	x,(OFST-3,sp)
2606  000d 1f01          	ldw	(OFST-3,sp),x
2608                     ; 42   data      = *address++;           // read MSB first
2610  000f 1e01          	ldw	x,(OFST-3,sp)
2611  0011 1c0001        	addw	x,#1
2612  0014 1f01          	ldw	(OFST-3,sp),x
2613  0016 1d0001        	subw	x,#1
2615  0019 f6            	ld	a,(x)
2616  001a 5f            	clrw	x
2617  001b 97            	ld	xl,a
2618  001c 1f03          	ldw	(OFST-1,sp),x
2620                     ; 43   data    <<= 8;                    // SHL 8
2622  001e 7b04          	ld	a,(OFST+0,sp)
2623  0020 6b03          	ld	(OFST-1,sp),a
2624  0022 0f04          	clr	(OFST+0,sp)
2626                     ; 44 	data     |= *address;             // read LSB
2628  0024 1e01          	ldw	x,(OFST-3,sp)
2629  0026 f6            	ld	a,(x)
2630  0027 5f            	clrw	x
2631  0028 97            	ld	xl,a
2632  0029 01            	rrwa	x,a
2633  002a 1a04          	or	a,(OFST+0,sp)
2634  002c 01            	rrwa	x,a
2635  002d 1a03          	or	a,(OFST-1,sp)
2636  002f 01            	rrwa	x,a
2637  0030 1f03          	ldw	(OFST-1,sp),x
2639                     ; 45 	return data;                      // Return result
2641  0032 1e03          	ldw	x,(OFST-1,sp)
2644  0034 5b04          	addw	sp,#4
2645  0036 81            	ret
2702                     ; 55 void eeprom_write_config(uint8_t eeprom_address,uint16_t data)
2702                     ; 56 {
2703                     	switch	.text
2704  0037               _eeprom_write_config:
2706  0037 88            	push	a
2707  0038 89            	pushw	x
2708       00000002      OFST:	set	2
2711                     ; 57     char *address = (char *)EEP_BASE_ADDR; //  EEPROM base address.
2713  0039 ae4000        	ldw	x,#16384
2714  003c 1f01          	ldw	(OFST-1,sp),x
2716                     ; 60     if (data == eeprom_read_config(eeprom_address)) return;
2718  003e adc0          	call	_eeprom_read_config
2720  0040 1306          	cpw	x,(OFST+4,sp)
2721  0042 272a          	jreq	L01
2724                     ; 62     address += (eeprom_address << 1); // convert to byte-address in EEPROM
2726  0044 7b03          	ld	a,(OFST+1,sp)
2727  0046 5f            	clrw	x
2728  0047 97            	ld	xl,a
2729  0048 58            	sllw	x
2730  0049 72fb01        	addw	x,(OFST-1,sp)
2731  004c 1f01          	ldw	(OFST-1,sp),x
2733                     ; 66         FLASH_DUKR = 0xae;
2735  004e 35ae5064      	mov	_FLASH_DUKR,#174
2736                     ; 67         FLASH_DUKR = 0x56;
2738  0052 35565064      	mov	_FLASH_DUKR,#86
2739                     ; 70     *address++ = (char)((data >> 8) & 0xff); // write MSB
2741  0056 7b06          	ld	a,(OFST+4,sp)
2742  0058 1e01          	ldw	x,(OFST-1,sp)
2743  005a 1c0001        	addw	x,#1
2744  005d 1f01          	ldw	(OFST-1,sp),x
2745  005f 1d0001        	subw	x,#1
2747  0062 f7            	ld	(x),a
2748                     ; 71     *address   = (char)(data & 0xff);        // write LSB
2750  0063 7b07          	ld	a,(OFST+5,sp)
2751  0065 a4ff          	and	a,#255
2752  0067 1e01          	ldw	x,(OFST-1,sp)
2753  0069 f7            	ld	(x),a
2754                     ; 72     FLASH_IAPSR &= ~DUL;                     // write-protect EEPROM again
2756  006a 7217505f      	bres	_FLASH_IAPSR,#3
2757                     ; 73 } // eeprom_write_config()
2758  006e               L01:
2761  006e 5b03          	addw	sp,#3
2762  0070 81            	ret
2787                     	xdef	_eedata
2788                     	xdef	_eeprom_write_config
2789                     	xdef	_eeprom_read_config
2808                     	end
