   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2563                     ; 34 void max7219_init(void)
2563                     ; 35 {
2565                     	switch	.text
2566  0000               _max7219_init:
2568  0000 88            	push	a
2569       00000001      OFST:	set	1
2572                     ; 38 	max7219_write(MAX7219_REG_DECD);         // No decode for digits 7-0
2574  0001 ae0900        	ldw	x,#2304
2575  0004 ad26          	call	_max7219_write
2577                     ; 39 	max7219_write(MAX7219_REG_INTNS | 0x0A); // Set intensity to 15/32
2579  0006 ae0a0a        	ldw	x,#2570
2580  0009 ad21          	call	_max7219_write
2582                     ; 40 	max7219_write(MAX7219_REG_SCANL | 0x07); // Display all digits
2584  000b ae0b07        	ldw	x,#2823
2585  000e ad1c          	call	_max7219_write
2587                     ; 41 	max7219_write(MAX7219_REG_SHUTD | 0x01); // Normal operation
2589  0010 ae0c01        	ldw	x,#3073
2590  0013 ad17          	call	_max7219_write
2592                     ; 42     for (i = 0; i < 8; i++)
2594  0015 0f01          	clr	(OFST+0,sp)
2596  0017               L7461:
2597                     ; 44         max7219_write((MAX7219_REG_DIG0 + (i << 8))); // all digits 0
2599  0017 7b01          	ld	a,(OFST+0,sp)
2600  0019 5f            	clrw	x
2601  001a 97            	ld	xl,a
2602  001b 4f            	clr	a
2603  001c 02            	rlwa	x,a
2604  001d 1c0100        	addw	x,#256
2605  0020 ad0a          	call	_max7219_write
2607                     ; 42     for (i = 0; i < 8; i++)
2609  0022 0c01          	inc	(OFST+0,sp)
2613  0024 7b01          	ld	a,(OFST+0,sp)
2614  0026 a108          	cp	a,#8
2615  0028 25ed          	jrult	L7461
2616                     ; 46 } // max7219()
2619  002a 84            	pop	a
2620  002b 81            	ret
2673                     ; 53 void max7219_write(uint16_t dat)
2673                     ; 54 {
2674                     	switch	.text
2675  002c               _max7219_write:
2677  002c 89            	pushw	x
2678  002d 5203          	subw	sp,#3
2679       00000003      OFST:	set	3
2682                     ; 56     uint16_t pwr = 0x8000; // start with bit 15
2684  002f ae8000        	ldw	x,#32768
2685  0032 1f01          	ldw	(OFST-2,sp),x
2687                     ; 58 	for (i = 0; i < 16; i++)
2689  0034 0f03          	clr	(OFST+0,sp)
2691  0036               L3071:
2692                     ; 60 		MAX7219_CLK_0;
2694  0036 72195000      	bres	_PA_ODR,#4
2695                     ; 61 		if (dat & pwr)
2697  003a 1e04          	ldw	x,(OFST+1,sp)
2698  003c 01            	rrwa	x,a
2699  003d 1402          	and	a,(OFST-1,sp)
2700  003f 01            	rrwa	x,a
2701  0040 1401          	and	a,(OFST-2,sp)
2702  0042 01            	rrwa	x,a
2703  0043 a30000        	cpw	x,#0
2704  0046 2706          	jreq	L1171
2705                     ; 62 			 MAX7219_DIN_1;
2707  0048 721c5000      	bset	_PA_ODR,#6
2709  004c 2004          	jra	L3171
2710  004e               L1171:
2711                     ; 63 		else MAX7219_DIN_0;
2713  004e 721d5000      	bres	_PA_ODR,#6
2714  0052               L3171:
2715                     ; 64 		MAX7219_CLK_1; // give clock-pulse
2717  0052 72185000      	bset	_PA_ODR,#4
2718                     ; 65 		pwr >>= 1; // SHR 1
2720  0056 0401          	srl	(OFST-2,sp)
2721  0058 0602          	rrc	(OFST-1,sp)
2723                     ; 58 	for (i = 0; i < 16; i++)
2725  005a 0c03          	inc	(OFST+0,sp)
2729  005c 7b03          	ld	a,(OFST+0,sp)
2730  005e a110          	cp	a,#16
2731  0060 25d4          	jrult	L3071
2732                     ; 67 	MAX7219_LOAD_1; // clock data into outputs
2734  0062 721a5000      	bset	_PA_ODR,#5
2735                     ; 68 	MAX7219_CLK_0;  // reset clock-line
2737  0066 72195000      	bres	_PA_ODR,#4
2738                     ; 69 	MAX7219_LOAD_0; // reset load
2740  006a 721b5000      	bres	_PA_ODR,#5
2741                     ; 70 	MAX7219_DIN_0;  // reset data-line
2743  006e 721d5000      	bres	_PA_ODR,#6
2744                     ; 71 } // max7219_write()
2747  0072 5b05          	addw	sp,#5
2748  0074 81            	ret
2761                     	xdef	_max7219_write
2762                     	xdef	_max7219_init
2781                     	end
