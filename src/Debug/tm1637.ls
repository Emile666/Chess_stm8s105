   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2524                     	bsct
2525  0000               _active_clock:
2526  0000 00            	dc.b	0
2527                     .const:	section	.text
2528  0000               _digit_to_segment:
2529  0000 3f            	dc.b	63
2530  0001 06            	dc.b	6
2531  0002 5b            	dc.b	91
2532  0003 4f            	dc.b	79
2533  0004 66            	dc.b	102
2534  0005 6d            	dc.b	109
2535  0006 7d            	dc.b	125
2536  0007 07            	dc.b	7
2537  0008 7f            	dc.b	127
2538  0009 6f            	dc.b	111
2539  000a 77            	dc.b	119
2540  000b 7c            	dc.b	124
2541  000c 39            	dc.b	57
2542  000d 5e            	dc.b	94
2543  000e 79            	dc.b	121
2544  000f 71            	dc.b	113
2545  0010               _divisors:
2546  0010 0001          	dc.w	1
2547  0012 000a          	dc.w	10
2548  0014 0064          	dc.w	100
2549  0016 03e8          	dc.w	1000
2592                     ; 70 void tm1637_enable_clock_nr(uint8_t clock_nr)
2592                     ; 71 {
2594                     	switch	.text
2595  0000               _tm1637_enable_clock_nr:
2599                     ; 72 	if (clock_nr == CLOCK2)
2601  0000 a101          	cp	a,#1
2602  0002 260a          	jrne	L7461
2603                     ; 74 		clk_pin = 0x08; // CLK2->PD3
2605  0004 35080001      	mov	_clk_pin,#8
2606                     ; 75 		dio_pin = 0x04; // DIO2->PD2
2608  0008 35040000      	mov	_dio_pin,#4
2610  000c 2008          	jra	L1561
2611  000e               L7461:
2612                     ; 79 		clk_pin = 0x80; // CLK1->PD7
2614  000e 35800001      	mov	_clk_pin,#128
2615                     ; 80 		dio_pin = 0x10; // DIO1->PD4
2617  0012 35100000      	mov	_dio_pin,#16
2618  0016               L1561:
2619                     ; 82 } // tm1637_enable_clock_nr()
2622  0016 81            	ret
2649                     ; 90 void tm1637_dio_pin_input(void)
2649                     ; 91 {
2650                     	switch	.text
2651  0017               _tm1637_dio_pin_input:
2655                     ; 92 	PD_DDR &= ~dio_pin; // Set as input
2657  0017 b600          	ld	a,_dio_pin
2658  0019 43            	cpl	a
2659  001a c45011        	and	a,_PD_DDR
2660  001d c75011        	ld	_PD_DDR,a
2661                     ; 93     PD_CR1 |=  dio_pin; // Enable Pull-up resistor	
2663  0020 c65012        	ld	a,_PD_CR1
2664  0023 ba00          	or	a,_dio_pin
2665  0025 c75012        	ld	_PD_CR1,a
2666                     ; 94 } // tm1637_dio_pin_input()
2669  0028 81            	ret
2696                     ; 101 void tm1637_dio_pin_output(void)
2696                     ; 102 {
2697                     	switch	.text
2698  0029               _tm1637_dio_pin_output:
2702                     ; 103 	PD_DDR |=  dio_pin; // Set as output
2704  0029 c65011        	ld	a,_PD_DDR
2705  002c ba00          	or	a,_dio_pin
2706  002e c75011        	ld	_PD_DDR,a
2707                     ; 104     PD_ODR &= ~dio_pin; // Set dio_pin low	
2709  0031 b600          	ld	a,_dio_pin
2710  0033 43            	cpl	a
2711  0034 c4500f        	and	a,_PD_ODR
2712  0037 c7500f        	ld	_PD_ODR,a
2713                     ; 105 } // tm1637_dio_pin_output()
2716  003a 81            	ret
2743                     ; 112 void tm1637_start(void)
2743                     ; 113 {
2744                     	switch	.text
2745  003b               _tm1637_start:
2749                     ; 114     PD_ODR |= (clk_pin | dio_pin); // just to make sure
2751  003b b601          	ld	a,_clk_pin
2752  003d ba00          	or	a,_dio_pin
2753  003f ca500f        	or	a,_PD_ODR
2754  0042 c7500f        	ld	_PD_ODR,a
2755                     ; 115     delay_usec(TM1637_DELAY_USEC);
2757  0045 ae0002        	ldw	x,#2
2758  0048 cd0000        	call	_delay_usec
2760                     ; 116     PD_ODR &= ~dio_pin;            // Generate start condition
2762  004b b600          	ld	a,_dio_pin
2763  004d 43            	cpl	a
2764  004e c4500f        	and	a,_PD_ODR
2765  0051 c7500f        	ld	_PD_ODR,a
2766                     ; 117     delay_usec(TM1637_DELAY_USEC);
2768  0054 ae0002        	ldw	x,#2
2769  0057 cd0000        	call	_delay_usec
2771                     ; 118 } // tm1637_start()
2774  005a 81            	ret
2801                     ; 125 void tm1637_stop(void)
2801                     ; 126 {
2802                     	switch	.text
2803  005b               _tm1637_stop:
2807                     ; 127 	PD_ODR &= ~dio_pin;         // Make sure that dio_pin is low
2809  005b b600          	ld	a,_dio_pin
2810  005d 43            	cpl	a
2811  005e c4500f        	and	a,_PD_ODR
2812  0061 c7500f        	ld	_PD_ODR,a
2813                     ; 128 	delay_usec(TM1637_DELAY_USEC);
2815  0064 ae0002        	ldw	x,#2
2816  0067 cd0000        	call	_delay_usec
2818                     ; 129 	PD_ODR |= clk_pin;          // Reset clk_pin
2820  006a c6500f        	ld	a,_PD_ODR
2821  006d ba01          	or	a,_clk_pin
2822  006f c7500f        	ld	_PD_ODR,a
2823                     ; 130 	delay_usec(TM1637_DELAY_USEC);
2825  0072 ae0002        	ldw	x,#2
2826  0075 cd0000        	call	_delay_usec
2828                     ; 131 	PD_ODR |= dio_pin;          // Generate stop-condition
2830  0078 c6500f        	ld	a,_PD_ODR
2831  007b ba00          	or	a,_dio_pin
2832  007d c7500f        	ld	_PD_ODR,a
2833                     ; 132 	delay_usec(TM1637_DELAY_USEC);
2835  0080 ae0002        	ldw	x,#2
2836  0083 cd0000        	call	_delay_usec
2838                     ; 133 } // tm1637_stop()
2841  0086 81            	ret
2898                     ; 141 void tm1637_set_brightness(uint8_t brightness, bool on)
2898                     ; 142 {
2899                     	switch	.text
2900  0087               _tm1637_set_brightness:
2902  0087 89            	pushw	x
2903  0088 89            	pushw	x
2904       00000002      OFST:	set	2
2907                     ; 143 	uint8_t m_brightness = 0;
2909                     ; 145 	m_brightness = (brightness & 0x07) | (on? 0x08 : 0x00);
2911  0089 7b04          	ld	a,(OFST+2,sp)
2912  008b a501          	bcp	a,#1
2913  008d 2704          	jreq	L02
2914  008f a608          	ld	a,#8
2915  0091 2001          	jra	L22
2916  0093               L02:
2917  0093 4f            	clr	a
2918  0094               L22:
2919  0094 6b01          	ld	(OFST-1,sp),a
2921  0096 9e            	ld	a,xh
2922  0097 a407          	and	a,#7
2923  0099 1a01          	or	a,(OFST-1,sp)
2924  009b 6b02          	ld	(OFST+0,sp),a
2926                     ; 147 	tm1637_start();
2928  009d ad9c          	call	_tm1637_start
2930                     ; 148 	tm1637_write_byte(TM1637_I2C_COMM3 + (m_brightness & 0x0f));
2932  009f 7b02          	ld	a,(OFST+0,sp)
2933  00a1 a40f          	and	a,#15
2934  00a3 ab80          	add	a,#128
2935  00a5 cd019c        	call	_tm1637_write_byte
2937                     ; 149 	tm1637_stop();
2939  00a8 adb1          	call	_tm1637_stop
2941                     ; 150 } // tm1637_set_brightness()
2944  00aa 5b04          	addw	sp,#4
2945  00ac 81            	ret
3011                     ; 159 void tm1637_set_segments(uint8_t *segments, uint8_t length, uint8_t pos)
3011                     ; 160 {
3012                     	switch	.text
3013  00ad               _tm1637_set_segments:
3015  00ad 89            	pushw	x
3016  00ae 88            	push	a
3017       00000001      OFST:	set	1
3020                     ; 164 	tm1637_start();
3022  00af ad8a          	call	_tm1637_start
3024                     ; 165 	tm1637_write_byte(TM1637_I2C_COMM1); // data write mode setting
3026  00b1 a640          	ld	a,#64
3027  00b3 cd019c        	call	_tm1637_write_byte
3029                     ; 166 	tm1637_stop();
3031  00b6 ada3          	call	_tm1637_stop
3033                     ; 169 	tm1637_start();
3035  00b8 ad81          	call	_tm1637_start
3037                     ; 170 	tm1637_write_byte(TM1637_I2C_COMM2 + (pos & 0x03));
3039  00ba 7b07          	ld	a,(OFST+6,sp)
3040  00bc a403          	and	a,#3
3041  00be abc0          	add	a,#192
3042  00c0 cd019c        	call	_tm1637_write_byte
3044                     ; 173 	for (k = 0; k < length; k++) 
3046  00c3 0f01          	clr	(OFST+0,sp)
3049  00c5 2011          	jra	L7771
3050  00c7               L3771:
3051                     ; 174 		tm1637_write_byte(segments[k]);
3053  00c7 7b02          	ld	a,(OFST+1,sp)
3054  00c9 97            	ld	xl,a
3055  00ca 7b03          	ld	a,(OFST+2,sp)
3056  00cc 1b01          	add	a,(OFST+0,sp)
3057  00ce 2401          	jrnc	L62
3058  00d0 5c            	incw	x
3059  00d1               L62:
3060  00d1 02            	rlwa	x,a
3061  00d2 f6            	ld	a,(x)
3062  00d3 cd019c        	call	_tm1637_write_byte
3064                     ; 173 	for (k = 0; k < length; k++) 
3066  00d6 0c01          	inc	(OFST+0,sp)
3068  00d8               L7771:
3071  00d8 7b01          	ld	a,(OFST+0,sp)
3072  00da 1106          	cp	a,(OFST+5,sp)
3073  00dc 25e9          	jrult	L3771
3074                     ; 175 	tm1637_stop();
3076  00de cd005b        	call	_tm1637_stop
3078                     ; 176 } // tm1637_set_segments()
3081  00e1 5b03          	addw	sp,#3
3082  00e3 81            	ret
3145                     ; 187 void tm1637_show_nr_dec(int num, bool leading_zero, uint8_t length, uint8_t pos)
3145                     ; 188 {
3146                     	switch	.text
3147  00e4               _tm1637_show_nr_dec:
3149  00e4 89            	pushw	x
3150       00000000      OFST:	set	0
3153                     ; 189     tm1637_show_nr_dec_ex(num, 0, leading_zero, length, pos);
3155  00e5 7b07          	ld	a,(OFST+7,sp)
3156  00e7 88            	push	a
3157  00e8 7b07          	ld	a,(OFST+7,sp)
3158  00ea 88            	push	a
3159  00eb 7b07          	ld	a,(OFST+7,sp)
3160  00ed a401          	and	a,#1
3161  00ef 88            	push	a
3162  00f0 4b00          	push	#0
3163  00f2 ad04          	call	_tm1637_show_nr_dec_ex
3165  00f4 5b04          	addw	sp,#4
3166                     ; 190 } // tm1637_show_nr_dec()
3169  00f6 85            	popw	x
3170  00f7 81            	ret
3301                     ; 202 void tm1637_show_nr_dec_ex(int num, uint8_t dots, bool lzero,
3301                     ; 203                                     uint8_t length, uint8_t pos)
3301                     ; 204 {
3302                     	switch	.text
3303  00f8               _tm1637_show_nr_dec_ex:
3305  00f8 89            	pushw	x
3306  00f9 520d          	subw	sp,#13
3307       0000000d      OFST:	set	13
3310                     ; 207     bool             leading = true;
3312  00fb a601          	ld	a,#1
3313  00fd 6b07          	ld	(OFST-6,sp),a
3315                     ; 209 	for (k = 0; k < 4; k++) 
3317  00ff 0f0c          	clr	(OFST-1,sp)
3319  0101               L3212:
3320                     ; 211 	    divisor = divisors[3-k];
3322  0101 a600          	ld	a,#0
3323  0103 97            	ld	xl,a
3324  0104 a603          	ld	a,#3
3325  0106 100c          	sub	a,(OFST-1,sp)
3326  0108 2401          	jrnc	L43
3327  010a 5a            	decw	x
3328  010b               L43:
3329  010b 02            	rlwa	x,a
3330  010c 58            	sllw	x
3331  010d de0010        	ldw	x,(_divisors,x)
3332  0110 1f08          	ldw	(OFST-5,sp),x
3334                     ; 212 		d       = num / divisor;
3336  0112 1e0e          	ldw	x,(OFST+1,sp)
3337  0114 1608          	ldw	y,(OFST-5,sp)
3338  0116 cd0000        	call	c_idiv
3340  0119 1f0a          	ldw	(OFST-3,sp),x
3342                     ; 213         digit   = 0;
3344                     ; 215 		if (d == 0) 
3346  011b 1e0a          	ldw	x,(OFST-3,sp)
3347  011d 2621          	jrne	L1312
3348                     ; 217 		  if (lzero || !leading || (k == 3))
3350  011f 7b13          	ld	a,(OFST+6,sp)
3351  0121 a501          	bcp	a,#1
3352  0123 260a          	jrne	L5312
3354  0125 0d07          	tnz	(OFST-6,sp)
3355  0127 2706          	jreq	L5312
3357  0129 7b0c          	ld	a,(OFST-1,sp)
3358  012b a103          	cp	a,#3
3359  012d 260d          	jrne	L3312
3360  012f               L5312:
3361                     ; 218 		       digit = digit_to_segment[d & 0x0F];
3363  012f 7b0b          	ld	a,(OFST-2,sp)
3364  0131 a40f          	and	a,#15
3365  0133 5f            	clrw	x
3366  0134 97            	ld	xl,a
3367  0135 d60000        	ld	a,(_digit_to_segment,x)
3368  0138 6b0d          	ld	(OFST+0,sp),a
3371  013a 201e          	jra	L3412
3372  013c               L3312:
3373                     ; 219 	      else digit = 0;
3375  013c 0f0d          	clr	(OFST+0,sp)
3377  013e 201a          	jra	L3412
3378  0140               L1312:
3379                     ; 223 			digit   = digit_to_segment[d & 0x0F];
3381  0140 7b0b          	ld	a,(OFST-2,sp)
3382  0142 a40f          	and	a,#15
3383  0144 5f            	clrw	x
3384  0145 97            	ld	xl,a
3385  0146 d60000        	ld	a,(_digit_to_segment,x)
3386  0149 6b0d          	ld	(OFST+0,sp),a
3388                     ; 224 			num    -= d * divisor;
3390  014b 1e0a          	ldw	x,(OFST-3,sp)
3391  014d 1608          	ldw	y,(OFST-5,sp)
3392  014f cd0000        	call	c_imul
3394  0152 72f00e        	subw	x,(OFST+1,sp)
3395  0155 50            	negw	x
3396  0156 1f0e          	ldw	(OFST+1,sp),x
3397                     ; 225 			leading = false;
3399  0158 0f07          	clr	(OFST-6,sp)
3401  015a               L3412:
3402                     ; 229 		digit     |= (dots & 0x80); 
3404  015a 7b12          	ld	a,(OFST+5,sp)
3405  015c a480          	and	a,#128
3406  015e 1a0d          	or	a,(OFST+0,sp)
3407  0160 6b0d          	ld	(OFST+0,sp),a
3409                     ; 230 		dots     <<= 1;
3411  0162 0812          	sll	(OFST+5,sp)
3412                     ; 231 		digits[k]  = digit;
3414  0164 96            	ldw	x,sp
3415  0165 1c0003        	addw	x,#OFST-10
3416  0168 9f            	ld	a,xl
3417  0169 5e            	swapw	x
3418  016a 1b0c          	add	a,(OFST-1,sp)
3419  016c 2401          	jrnc	L63
3420  016e 5c            	incw	x
3421  016f               L63:
3422  016f 02            	rlwa	x,a
3423  0170 7b0d          	ld	a,(OFST+0,sp)
3424  0172 f7            	ld	(x),a
3425                     ; 209 	for (k = 0; k < 4; k++) 
3427  0173 0c0c          	inc	(OFST-1,sp)
3431  0175 7b0c          	ld	a,(OFST-1,sp)
3432  0177 a104          	cp	a,#4
3433  0179 2586          	jrult	L3212
3434                     ; 233 	tm1637_set_segments(digits + (4 - length), length, pos);
3436  017b 7b15          	ld	a,(OFST+8,sp)
3437  017d 88            	push	a
3438  017e 7b15          	ld	a,(OFST+8,sp)
3439  0180 88            	push	a
3440  0181 96            	ldw	x,sp
3441  0182 1c0005        	addw	x,#OFST-8
3442  0185 1f03          	ldw	(OFST-10,sp),x
3444  0187 a600          	ld	a,#0
3445  0189 97            	ld	xl,a
3446  018a a604          	ld	a,#4
3447  018c 1016          	sub	a,(OFST+9,sp)
3448  018e 2401          	jrnc	L04
3449  0190 5a            	decw	x
3450  0191               L04:
3451  0191 02            	rlwa	x,a
3452  0192 72fb03        	addw	x,(OFST-10,sp)
3453  0195 cd00ad        	call	_tm1637_set_segments
3455  0198 85            	popw	x
3456                     ; 234 } // tm1637_show_nr_dec_ex()
3459  0199 5b0f          	addw	sp,#15
3460  019b 81            	ret
3530                     ; 241 bool tm1637_write_byte(uint8_t b)
3530                     ; 242 {
3531                     	switch	.text
3532  019c               _tm1637_write_byte:
3534  019c 5203          	subw	sp,#3
3535       00000003      OFST:	set	3
3538                     ; 245     uint8_t data = b;
3540  019e 6b03          	ld	(OFST+0,sp),a
3542                     ; 247     PD_ODR &= ~clk_pin;  // Make sure that clk_pin is low
3544  01a0 b601          	ld	a,_clk_pin
3545  01a2 43            	cpl	a
3546  01a3 c4500f        	and	a,_PD_ODR
3547  01a6 c7500f        	ld	_PD_ODR,a
3548                     ; 248     delay_usec(TM1637_DELAY_USEC);
3550  01a9 ae0002        	ldw	x,#2
3551  01ac cd0000        	call	_delay_usec
3553                     ; 250     for (i = 0; i < 8; i++) 
3555  01af 0f02          	clr	(OFST-1,sp)
3557  01b1               L7712:
3558                     ; 253 		if (data & 0x01)
3560  01b1 7b03          	ld	a,(OFST+0,sp)
3561  01b3 a501          	bcp	a,#1
3562  01b5 270a          	jreq	L5022
3563                     ; 254 		     PD_ODR |=  dio_pin;
3565  01b7 c6500f        	ld	a,_PD_ODR
3566  01ba ba00          	or	a,_dio_pin
3567  01bc c7500f        	ld	_PD_ODR,a
3569  01bf 2009          	jra	L7022
3570  01c1               L5022:
3571                     ; 255 		else PD_ODR &= ~dio_pin;
3573  01c1 b600          	ld	a,_dio_pin
3574  01c3 43            	cpl	a
3575  01c4 c4500f        	and	a,_PD_ODR
3576  01c7 c7500f        	ld	_PD_ODR,a
3577  01ca               L7022:
3578                     ; 256 		delay_usec(TM1637_DELAY_USEC);
3580  01ca ae0002        	ldw	x,#2
3581  01cd cd0000        	call	_delay_usec
3583                     ; 258 		PD_ODR |= clk_pin;   // Now set clock high
3585  01d0 c6500f        	ld	a,_PD_ODR
3586  01d3 ba01          	or	a,_clk_pin
3587  01d5 c7500f        	ld	_PD_ODR,a
3588                     ; 259 		delay_usec(TM1637_DELAY_USEC);
3590  01d8 ae0002        	ldw	x,#2
3591  01db cd0000        	call	_delay_usec
3593                     ; 260 		PD_ODR &= ~clk_pin;  // Make sure that clk_pin is low
3595  01de b601          	ld	a,_clk_pin
3596  01e0 43            	cpl	a
3597  01e1 c4500f        	and	a,_PD_ODR
3598  01e4 c7500f        	ld	_PD_ODR,a
3599                     ; 261 		delay_usec(TM1637_DELAY_USEC);
3601  01e7 ae0002        	ldw	x,#2
3602  01ea cd0000        	call	_delay_usec
3604                     ; 262 		data = data >> 1;    // next data-bit
3606  01ed 0403          	srl	(OFST+0,sp)
3608                     ; 250     for (i = 0; i < 8; i++) 
3610  01ef 0c02          	inc	(OFST-1,sp)
3614  01f1 7b02          	ld	a,(OFST-1,sp)
3615  01f3 a108          	cp	a,#8
3616  01f5 25ba          	jrult	L7712
3617                     ; 266     tm1637_dio_pin_input();  // clk_pin now input with pull-up resistor
3619  01f7 cd0017        	call	_tm1637_dio_pin_input
3621                     ; 267     delay_usec(TM1637_DELAY_USEC);
3623  01fa ae0002        	ldw	x,#2
3624  01fd cd0000        	call	_delay_usec
3626                     ; 268     PD_ODR |= clk_pin;       // Now set clock high
3628  0200 c6500f        	ld	a,_PD_ODR
3629  0203 ba01          	or	a,_clk_pin
3630  0205 c7500f        	ld	_PD_ODR,a
3631                     ; 269 	delay_usec(TM1637_DELAY_USEC);
3633  0208 ae0002        	ldw	x,#2
3634  020b cd0000        	call	_delay_usec
3636                     ; 270 	ack = ((PD_IDR & dio_pin) == dio_pin);
3638  020e c65010        	ld	a,_PD_IDR
3639  0211 b400          	and	a,_dio_pin
3640  0213 b100          	cp	a,_dio_pin
3641  0215 2605          	jrne	L44
3642  0217 ae0001        	ldw	x,#1
3643  021a 2001          	jra	L64
3644  021c               L44:
3645  021c 5f            	clrw	x
3646  021d               L64:
3647  021d 01            	rrwa	x,a
3648  021e 6b01          	ld	(OFST-2,sp),a
3649  0220 02            	rlwa	x,a
3651                     ; 271 	delay_usec(TM1637_DELAY_USEC);
3653  0221 ae0002        	ldw	x,#2
3654  0224 cd0000        	call	_delay_usec
3656                     ; 272     PD_ODR &= ~clk_pin;      // Now set clock low again
3658  0227 b601          	ld	a,_clk_pin
3659  0229 43            	cpl	a
3660  022a c4500f        	and	a,_PD_ODR
3661  022d c7500f        	ld	_PD_ODR,a
3662                     ; 273 	delay_usec(TM1637_DELAY_USEC);
3664  0230 ae0002        	ldw	x,#2
3665  0233 cd0000        	call	_delay_usec
3667                     ; 274 	tm1637_dio_pin_output(); // dio_pin is set to output and low
3669  0236 cd0029        	call	_tm1637_dio_pin_output
3671                     ; 275 	return ack;
3673  0239 0d01          	tnz	(OFST-2,sp)
3674  023b 2704          	jreq	L05
3675  023d a601          	ld	a,#1
3676  023f 2001          	jra	L25
3677  0241               L05:
3678  0241 4f            	clr	a
3679  0242               L25:
3682  0242 5b03          	addw	sp,#3
3683  0244 81            	ret
3745                     	xdef	_divisors
3746                     	xdef	_digit_to_segment
3747                     	switch	.ubsct
3748  0000               _dio_pin:
3749  0000 00            	ds.b	1
3750                     	xdef	_dio_pin
3751  0001               _clk_pin:
3752  0001 00            	ds.b	1
3753                     	xdef	_clk_pin
3754                     	xdef	_active_clock
3755                     	xref	_delay_usec
3756                     	xdef	_tm1637_write_byte
3757                     	xdef	_tm1637_show_nr_dec_ex
3758                     	xdef	_tm1637_show_nr_dec
3759                     	xdef	_tm1637_set_segments
3760                     	xdef	_tm1637_set_brightness
3761                     	xdef	_tm1637_stop
3762                     	xdef	_tm1637_start
3763                     	xdef	_tm1637_dio_pin_output
3764                     	xdef	_tm1637_dio_pin_input
3765                     	xdef	_tm1637_enable_clock_nr
3766                     	xref.b	c_x
3786                     	xref	c_imul
3787                     	xref	c_idiv
3788                     	end
