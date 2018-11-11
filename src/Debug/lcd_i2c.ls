   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2605                     ; 64 void lcd_i2c_init(uint8_t lcd_addr, uint8_t lcd_cols, uint8_t lcd_rows, uint8_t charsize)
2605                     ; 65 {
2607                     	switch	.text
2608  0000               _lcd_i2c_init:
2610  0000 89            	pushw	x
2611       00000000      OFST:	set	0
2614                     ; 66 	_addr         = lcd_addr;
2616  0001 9e            	ld	a,xh
2617  0002 b707          	ld	__addr,a
2618                     ; 67 	_cols         = lcd_cols;
2620  0004 9f            	ld	a,xl
2621  0005 b703          	ld	__cols,a
2622                     ; 68 	_rows         = lcd_rows;
2624  0007 7b05          	ld	a,(OFST+5,sp)
2625  0009 b702          	ld	__rows,a
2626                     ; 69 	_charsize     = charsize;
2628  000b 7b06          	ld	a,(OFST+6,sp)
2629  000d b701          	ld	__charsize,a
2630                     ; 70 	_backlightval = LCD_BACKLIGHT;
2632  000f 35080000      	mov	__backlightval,#8
2633                     ; 72 	_displayfunction = LCD_4BITMODE | LCD_1LINE | LCD_5x8DOTS;
2635  0013 3f06          	clr	__displayfunction
2636                     ; 73 	if (_rows > 1) _displayfunction |= LCD_2LINE;
2638  0015 b602          	ld	a,__rows
2639  0017 a102          	cp	a,#2
2640  0019 2504          	jrult	L3661
2643  001b 72160006      	bset	__displayfunction,#3
2644  001f               L3661:
2645                     ; 75 	if ((_charsize != 0) && (_rows == 1)) _displayfunction |= LCD_5x10DOTS;
2647  001f 3d01          	tnz	__charsize
2648  0021 270a          	jreq	L5661
2650  0023 b602          	ld	a,__rows
2651  0025 a101          	cp	a,#1
2652  0027 2604          	jrne	L5661
2655  0029 72140006      	bset	__displayfunction,#2
2656  002d               L5661:
2657                     ; 79 	delay_msec(50);
2659  002d ae0032        	ldw	x,#50
2660  0030 cd0000        	call	_delay_msec
2662                     ; 82 	lcd_i2c_expanderWrite(_backlightval); // reset expander and turn backlight off (Bit 8 =1)
2664  0033 b600          	ld	a,__backlightval
2665  0035 cd01de        	call	_lcd_i2c_expanderWrite
2667                     ; 83 	delay_msec(1000);
2669  0038 ae03e8        	ldw	x,#1000
2670  003b cd0000        	call	_delay_msec
2672                     ; 88 	lcd_i2c_write4bits(0x03 << 4);
2674  003e a630          	ld	a,#48
2675  0040 cd01d5        	call	_lcd_i2c_write4bits
2677                     ; 89 	delay_usec(4500);              // wait min 4.1ms
2679  0043 ae1194        	ldw	x,#4500
2680  0046 cd0000        	call	_delay_usec
2682                     ; 90 	lcd_i2c_write4bits(0x03 << 4); // second try
2684  0049 a630          	ld	a,#48
2685  004b cd01d5        	call	_lcd_i2c_write4bits
2687                     ; 91 	delay_usec(4500);              // wait min 4.1ms
2689  004e ae1194        	ldw	x,#4500
2690  0051 cd0000        	call	_delay_usec
2692                     ; 92 	lcd_i2c_write4bits(0x03 << 4); // third go!
2694  0054 a630          	ld	a,#48
2695  0056 cd01d5        	call	_lcd_i2c_write4bits
2697                     ; 93 	delay_usec(150);
2699  0059 ae0096        	ldw	x,#150
2700  005c cd0000        	call	_delay_usec
2702                     ; 94 	lcd_i2c_write4bits(0x02 << 4); // finally, set to 4-bit interface
2704  005f a620          	ld	a,#32
2705  0061 cd01d5        	call	_lcd_i2c_write4bits
2707                     ; 97 	lcd_i2c_send(LCD_FUNCTIONSET | _displayfunction,IR);
2709  0064 b606          	ld	a,__displayfunction
2710  0066 aa20          	or	a,#32
2711  0068 5f            	clrw	x
2712  0069 95            	ld	xh,a
2713  006a cd01b4        	call	_lcd_i2c_send
2715                     ; 99 	_displaycontrol = LCD_DISPLAYON | LCD_CURSOROFF | LCD_BLINKOFF;
2717  006d 35040005      	mov	__displaycontrol,#4
2718                     ; 100 	lcd_i2c_display_on();
2720  0071 ad6e          	call	_lcd_i2c_display_on
2722                     ; 101 	lcd_i2c_clear(); // clear it off
2724  0073 ad0e          	call	_lcd_i2c_clear
2726                     ; 103 	_displaymode = LCD_ENTRYLEFT | LCD_ENTRYSHIFTDECREMENT;
2728  0075 35020004      	mov	__displaymode,#2
2729                     ; 105 	lcd_i2c_send(LCD_ENTRYMODESET | _displaymode,IR);
2731  0079 ae0600        	ldw	x,#1536
2732  007c cd01b4        	call	_lcd_i2c_send
2734                     ; 106 	lcd_i2c_home();
2736  007f ad0f          	call	_lcd_i2c_home
2738                     ; 107 } // lcd_i2c_init()
2741  0081 85            	popw	x
2742  0082 81            	ret
2767                     ; 119 void lcd_i2c_clear(void)
2767                     ; 120 {
2768                     	switch	.text
2769  0083               _lcd_i2c_clear:
2773                     ; 121 	lcd_i2c_send(LCD_CLEARDISPLAY,IR); // clear display, set cursor position to zero
2775  0083 ae0100        	ldw	x,#256
2776  0086 cd01b4        	call	_lcd_i2c_send
2778                     ; 122 	delay_usec(2000);                  // this command takes a long time!
2780  0089 ae07d0        	ldw	x,#2000
2781  008c cd0000        	call	_delay_usec
2783                     ; 123 } // lcd_i2c_clear()
2786  008f 81            	ret
2811                     ; 131 void lcd_i2c_home(void)
2811                     ; 132 {
2812                     	switch	.text
2813  0090               _lcd_i2c_home:
2817                     ; 133 	lcd_i2c_send(LCD_RETURNHOME,IR);  // set cursor position to zero
2819  0090 ae0200        	ldw	x,#512
2820  0093 cd01b4        	call	_lcd_i2c_send
2822                     ; 134 	delay_usec(2000);                 // this command takes a long time!
2824  0096 ae07d0        	ldw	x,#2000
2825  0099 cd0000        	call	_delay_usec
2827                     ; 135 } // lcd_i2c_clear()
2830  009c 81            	ret
2833                     .const:	section	.text
2834  0000               L7071_row_offsets:
2835  0000 0000          	dc.w	0
2836  0002 0040          	dc.w	64
2837  0004 0014          	dc.w	20
2838  0006 0054          	dc.w	84
2891                     ; 143 void lcd_i2c_setCursor(uint8_t col, uint8_t row)
2891                     ; 144 {
2892                     	switch	.text
2893  009d               _lcd_i2c_setCursor:
2895  009d 89            	pushw	x
2896  009e 520a          	subw	sp,#10
2897       0000000a      OFST:	set	10
2900                     ; 145 	int row_offsets[] = { 0x00, 0x40, 0x14, 0x54 };
2902  00a0 96            	ldw	x,sp
2903  00a1 1c0003        	addw	x,#OFST-7
2904  00a4 90ae0000      	ldw	y,#L7071_row_offsets
2905  00a8 a608          	ld	a,#8
2906  00aa cd0000        	call	c_xymvx
2908                     ; 146 	if (row > _rows) 
2910  00ad 7b0c          	ld	a,(OFST+2,sp)
2911  00af b102          	cp	a,__rows
2912  00b1 2305          	jrule	L7371
2913                     ; 148 		row = _rows-1;    // we count rows starting w/0
2915  00b3 b602          	ld	a,__rows
2916  00b5 4a            	dec	a
2917  00b6 6b0c          	ld	(OFST+2,sp),a
2918  00b8               L7371:
2919                     ; 150 	lcd_i2c_send(LCD_SETDDRAMADDR | (col + row_offsets[row]),IR);
2921  00b8 96            	ldw	x,sp
2922  00b9 1c0004        	addw	x,#OFST-6
2923  00bc 1f01          	ldw	(OFST-9,sp),x
2925  00be 7b0c          	ld	a,(OFST+2,sp)
2926  00c0 5f            	clrw	x
2927  00c1 97            	ld	xl,a
2928  00c2 58            	sllw	x
2929  00c3 72fb01        	addw	x,(OFST-9,sp)
2930  00c6 f6            	ld	a,(x)
2931  00c7 1b0b          	add	a,(OFST+1,sp)
2932  00c9 aa80          	or	a,#128
2933  00cb 5f            	clrw	x
2934  00cc 95            	ld	xh,a
2935  00cd cd01b4        	call	_lcd_i2c_send
2937                     ; 151 } // lcd_i2c_setCursor()
2940  00d0 5b0c          	addw	sp,#12
2941  00d2 81            	ret
2967                     ; 162 void lcd_i2c_display_off(void) 
2967                     ; 163 {
2968                     	switch	.text
2969  00d3               _lcd_i2c_display_off:
2973                     ; 164 	_displaycontrol &= ~LCD_DISPLAYON;
2975  00d3 72150005      	bres	__displaycontrol,#2
2976                     ; 165 	lcd_i2c_send(LCD_DISPLAYCONTROL | _displaycontrol,IR);
2978  00d7 b605          	ld	a,__displaycontrol
2979  00d9 aa08          	or	a,#8
2980  00db 5f            	clrw	x
2981  00dc 95            	ld	xh,a
2982  00dd cd01b4        	call	_lcd_i2c_send
2984                     ; 166 } // lcd_i2c_display_off()
2987  00e0 81            	ret
3012                     ; 175 void lcd_i2c_display_on(void) 
3012                     ; 176 {
3013                     	switch	.text
3014  00e1               _lcd_i2c_display_on:
3018                     ; 177 	_displaycontrol |= LCD_DISPLAYON;
3020  00e1 72140005      	bset	__displaycontrol,#2
3021                     ; 178 	lcd_i2c_send(LCD_DISPLAYCONTROL | _displaycontrol,IR);
3023  00e5 b605          	ld	a,__displaycontrol
3024  00e7 aa08          	or	a,#8
3025  00e9 5f            	clrw	x
3026  00ea 95            	ld	xh,a
3027  00eb cd01b4        	call	_lcd_i2c_send
3029                     ; 179 } // lcd_i2c_display_on()
3032  00ee 81            	ret
3057                     ; 186 void lcd_i2c_cursor_off(void) 
3057                     ; 187 {
3058                     	switch	.text
3059  00ef               _lcd_i2c_cursor_off:
3063                     ; 188 	_displaycontrol &= ~LCD_CURSORON;
3065  00ef 72130005      	bres	__displaycontrol,#1
3066                     ; 189 	lcd_i2c_send(LCD_DISPLAYCONTROL | _displaycontrol,IR);
3068  00f3 b605          	ld	a,__displaycontrol
3069  00f5 aa08          	or	a,#8
3070  00f7 5f            	clrw	x
3071  00f8 95            	ld	xh,a
3072  00f9 cd01b4        	call	_lcd_i2c_send
3074                     ; 190 } // lcd_i2c_cursor_off()
3077  00fc 81            	ret
3102                     ; 198 void lcd_i2c_cursor_on(void) 
3102                     ; 199 {
3103                     	switch	.text
3104  00fd               _lcd_i2c_cursor_on:
3108                     ; 200 	_displaycontrol |= LCD_CURSORON;
3110  00fd 72120005      	bset	__displaycontrol,#1
3111                     ; 201 	lcd_i2c_send(LCD_DISPLAYCONTROL | _displaycontrol,IR);
3113  0101 b605          	ld	a,__displaycontrol
3114  0103 aa08          	or	a,#8
3115  0105 5f            	clrw	x
3116  0106 95            	ld	xh,a
3117  0107 cd01b4        	call	_lcd_i2c_send
3119                     ; 202 } // lcd_i2c_cursor_on()
3122  010a 81            	ret
3147                     ; 209 void lcd_i2c_blink_off(void) 
3147                     ; 210 {
3148                     	switch	.text
3149  010b               _lcd_i2c_blink_off:
3153                     ; 211 	_displaycontrol &= ~LCD_BLINKON;
3155  010b 72110005      	bres	__displaycontrol,#0
3156                     ; 212 	lcd_i2c_send(LCD_DISPLAYCONTROL | _displaycontrol,IR);
3158  010f b605          	ld	a,__displaycontrol
3159  0111 aa08          	or	a,#8
3160  0113 5f            	clrw	x
3161  0114 95            	ld	xh,a
3162  0115 cd01b4        	call	_lcd_i2c_send
3164                     ; 213 } // lcd_i2c_blink_off()
3167  0118 81            	ret
3192                     ; 220 void lcd_i2c_blink_on(void) 
3192                     ; 221 {
3193                     	switch	.text
3194  0119               _lcd_i2c_blink_on:
3198                     ; 222 	_displaycontrol |= LCD_BLINKON;
3200  0119 72100005      	bset	__displaycontrol,#0
3201                     ; 223 	lcd_i2c_send(LCD_DISPLAYCONTROL | _displaycontrol,IR);
3203  011d b605          	ld	a,__displaycontrol
3204  011f aa08          	or	a,#8
3205  0121 5f            	clrw	x
3206  0122 95            	ld	xh,a
3207  0123 cd01b4        	call	_lcd_i2c_send
3209                     ; 224 } // lcd_i2c_blink_on()
3212  0126 81            	ret
3237                     ; 232 void lcd_i2c_scrollDisplayLeft(void) 
3237                     ; 233 {
3238                     	switch	.text
3239  0127               _lcd_i2c_scrollDisplayLeft:
3243                     ; 234 	lcd_i2c_send(LCD_CURSORSHIFT | LCD_DISPLAYMOVE | LCD_MOVELEFT,IR);
3245  0127 ae1800        	ldw	x,#6144
3246  012a cd01b4        	call	_lcd_i2c_send
3248                     ; 235 } // lcd_i2c_scrollDisplayLeft()
3251  012d 81            	ret
3276                     ; 242 void lcd_i2c_scrollDisplayRight(void) 
3276                     ; 243 {
3277                     	switch	.text
3278  012e               _lcd_i2c_scrollDisplayRight:
3282                     ; 244 	lcd_i2c_send(LCD_CURSORSHIFT | LCD_DISPLAYMOVE | LCD_MOVERIGHT,IR);
3284  012e ae1c00        	ldw	x,#7168
3285  0131 cd01b4        	call	_lcd_i2c_send
3287                     ; 245 } // lcd_i2c_scrollDisplayRight()
3290  0134 81            	ret
3316                     ; 252 void lcd_i2c_leftToRight(void) 
3316                     ; 253 {
3317                     	switch	.text
3318  0135               _lcd_i2c_leftToRight:
3322                     ; 254 	_displaymode |= LCD_ENTRYLEFT;
3324  0135 72120004      	bset	__displaymode,#1
3325                     ; 255 	lcd_i2c_send(LCD_ENTRYMODESET | _displaymode,IR);
3327  0139 b604          	ld	a,__displaymode
3328  013b aa04          	or	a,#4
3329  013d 5f            	clrw	x
3330  013e 95            	ld	xh,a
3331  013f ad73          	call	_lcd_i2c_send
3333                     ; 256 } // lcd_i2c_leftToRight()
3336  0141 81            	ret
3362                     ; 263 void lcd_i2c_rightToLeft(void) 
3362                     ; 264 {
3363                     	switch	.text
3364  0142               _lcd_i2c_rightToLeft:
3368                     ; 265 	_displaymode &= ~LCD_ENTRYLEFT;
3370  0142 72130004      	bres	__displaymode,#1
3371                     ; 266 	lcd_i2c_send(LCD_ENTRYMODESET | _displaymode,IR);
3373  0146 b604          	ld	a,__displaymode
3374  0148 aa04          	or	a,#4
3375  014a 5f            	clrw	x
3376  014b 95            	ld	xh,a
3377  014c ad66          	call	_lcd_i2c_send
3379                     ; 267 } // lcd_i2c_rightToLeft()
3382  014e 81            	ret
3408                     ; 274 void lcd_i2c_autoscroll_on(void) 
3408                     ; 275 {
3409                     	switch	.text
3410  014f               _lcd_i2c_autoscroll_on:
3414                     ; 276 	_displaymode |= LCD_ENTRYSHIFTINCREMENT;
3416  014f 72100004      	bset	__displaymode,#0
3417                     ; 277 	lcd_i2c_send(LCD_ENTRYMODESET | _displaymode,IR);
3419  0153 b604          	ld	a,__displaymode
3420  0155 aa04          	or	a,#4
3421  0157 5f            	clrw	x
3422  0158 95            	ld	xh,a
3423  0159 ad59          	call	_lcd_i2c_send
3425                     ; 278 } // lcd_i2c_autoscroll_on()
3428  015b 81            	ret
3454                     ; 285 void lcd_i2c_autoscroll_off(void) 
3454                     ; 286 {
3455                     	switch	.text
3456  015c               _lcd_i2c_autoscroll_off:
3460                     ; 287 	_displaymode &= ~LCD_ENTRYSHIFTINCREMENT;
3462  015c 72110004      	bres	__displaymode,#0
3463                     ; 288 	lcd_i2c_send(LCD_ENTRYMODESET | _displaymode,IR);
3465  0160 b604          	ld	a,__displaymode
3466  0162 aa04          	or	a,#4
3467  0164 5f            	clrw	x
3468  0165 95            	ld	xh,a
3469  0166 ad4c          	call	_lcd_i2c_send
3471                     ; 289 } // lcd_i2c_autoscroll_off()
3474  0168 81            	ret
3528                     ; 297 void lcd_i2c_createChar(uint8_t location, uint8_t *charmap) 
3528                     ; 298 {
3529                     	switch	.text
3530  0169               _lcd_i2c_createChar:
3532  0169 88            	push	a
3533  016a 88            	push	a
3534       00000001      OFST:	set	1
3537                     ; 301 	location &= 0x7; // we only have 8 locations 0-7
3539  016b 7b02          	ld	a,(OFST+1,sp)
3540  016d a407          	and	a,#7
3541  016f 6b02          	ld	(OFST+1,sp),a
3542                     ; 302 	lcd_i2c_send(LCD_SETCGRAMADDR | (location << 3),IR);
3544  0171 7b02          	ld	a,(OFST+1,sp)
3545  0173 48            	sll	a
3546  0174 48            	sll	a
3547  0175 48            	sll	a
3548  0176 aa40          	or	a,#64
3549  0178 5f            	clrw	x
3550  0179 95            	ld	xh,a
3551  017a ad38          	call	_lcd_i2c_send
3553                     ; 303 	for (i = 0; i < 8; i++) 
3555  017c 0f01          	clr	(OFST+0,sp)
3557  017e               L7212:
3558                     ; 305 		lcd_i2c_send(charmap[i],DR); // Select Data-Register
3560  017e 7b05          	ld	a,(OFST+4,sp)
3561  0180 97            	ld	xl,a
3562  0181 7b06          	ld	a,(OFST+5,sp)
3563  0183 1b01          	add	a,(OFST+0,sp)
3564  0185 2401          	jrnc	L64
3565  0187 5c            	incw	x
3566  0188               L64:
3567  0188 02            	rlwa	x,a
3568  0189 f6            	ld	a,(x)
3569  018a ae0001        	ldw	x,#1
3570  018d 95            	ld	xh,a
3571  018e ad24          	call	_lcd_i2c_send
3573                     ; 303 	for (i = 0; i < 8; i++) 
3575  0190 0c01          	inc	(OFST+0,sp)
3579  0192 7b01          	ld	a,(OFST+0,sp)
3580  0194 a108          	cp	a,#8
3581  0196 25e6          	jrult	L7212
3582                     ; 307 } // i2c_lcd_createChar()
3585  0198 85            	popw	x
3586  0199 81            	ret
3612                     ; 314 void lcd_i2c_backlight_off(void) 
3612                     ; 315 {
3613                     	switch	.text
3614  019a               _lcd_i2c_backlight_off:
3618                     ; 316 	_backlightval = LCD_NOBACKLIGHT;
3620  019a 3f00          	clr	__backlightval
3621                     ; 317 	lcd_i2c_expanderWrite(0);
3623  019c 4f            	clr	a
3624  019d ad3f          	call	_lcd_i2c_expanderWrite
3626                     ; 318 } // lcd_i2c_backlight_off()
3629  019f 81            	ret
3655                     ; 325 void lcd_i2c_backlight_on(void) 
3655                     ; 326 {
3656                     	switch	.text
3657  01a0               _lcd_i2c_backlight_on:
3661                     ; 327 	_backlightval = LCD_BACKLIGHT;
3663  01a0 35080000      	mov	__backlightval,#8
3664                     ; 328 	lcd_i2c_expanderWrite(0);
3666  01a4 4f            	clr	a
3667  01a5 ad37          	call	_lcd_i2c_expanderWrite
3669                     ; 329 } // lcd_i2c_backlight_on()
3672  01a7 81            	ret
3698                     ; 336 bool lcd_i2c_getBacklight(void) 
3698                     ; 337 {
3699                     	switch	.text
3700  01a8               _lcd_i2c_getBacklight:
3704                     ; 338   return (_backlightval == LCD_BACKLIGHT);
3706  01a8 b600          	ld	a,__backlightval
3707  01aa a108          	cp	a,#8
3708  01ac 2604          	jrne	L65
3709  01ae a601          	ld	a,#1
3710  01b0 2001          	jra	L06
3711  01b2               L65:
3712  01b2 4f            	clr	a
3713  01b3               L06:
3716  01b3 81            	ret
3778                     ; 351 void lcd_i2c_send(uint8_t value, uint8_t mode) 
3778                     ; 352 {
3779                     	switch	.text
3780  01b4               _lcd_i2c_send:
3782  01b4 89            	pushw	x
3783  01b5 89            	pushw	x
3784       00000002      OFST:	set	2
3787                     ; 353 	uint8_t highnib = value & 0xF0;
3789  01b6 9e            	ld	a,xh
3790  01b7 a4f0          	and	a,#240
3791  01b9 6b01          	ld	(OFST-1,sp),a
3793                     ; 354 	uint8_t lownib  = (value << 4) & 0xF0;
3795  01bb 7b03          	ld	a,(OFST+1,sp)
3796  01bd 97            	ld	xl,a
3797  01be a610          	ld	a,#16
3798  01c0 42            	mul	x,a
3799  01c1 9f            	ld	a,xl
3800  01c2 a4f0          	and	a,#240
3801  01c4 6b02          	ld	(OFST+0,sp),a
3803                     ; 356 	lcd_i2c_write4bits((highnib) | mode);
3805  01c6 7b01          	ld	a,(OFST-1,sp)
3806  01c8 1a04          	or	a,(OFST+2,sp)
3807  01ca ad09          	call	_lcd_i2c_write4bits
3809                     ; 357 	lcd_i2c_write4bits((lownib) | mode);
3811  01cc 7b02          	ld	a,(OFST+0,sp)
3812  01ce 1a04          	or	a,(OFST+2,sp)
3813  01d0 ad03          	call	_lcd_i2c_write4bits
3815                     ; 358 } // lcd_i2c_send()
3818  01d2 5b04          	addw	sp,#4
3819  01d4 81            	ret
3855                     ; 365 void lcd_i2c_write4bits(uint8_t value) 
3855                     ; 366 {
3856                     	switch	.text
3857  01d5               _lcd_i2c_write4bits:
3859  01d5 88            	push	a
3860       00000000      OFST:	set	0
3863                     ; 367 	lcd_i2c_expanderWrite(value);
3865  01d6 ad06          	call	_lcd_i2c_expanderWrite
3867                     ; 368 	lcd_i2c_pulseEnable(value);
3869  01d8 7b01          	ld	a,(OFST+1,sp)
3870  01da ad14          	call	_lcd_i2c_pulseEnable
3872                     ; 369 } // lcd_i2c_write4bits()
3875  01dc 84            	pop	a
3876  01dd 81            	ret
3916                     ; 376 void lcd_i2c_expanderWrite(uint8_t _data)
3916                     ; 377 {
3917                     	switch	.text
3918  01de               _lcd_i2c_expanderWrite:
3920  01de 88            	push	a
3921       00000000      OFST:	set	0
3924                     ; 378 	i2c_start(_addr);
3926  01df b607          	ld	a,__addr
3927  01e1 cd0000        	call	_i2c_start
3929                     ; 379 	i2c_write(_data | _backlightval);
3931  01e4 7b01          	ld	a,(OFST+1,sp)
3932  01e6 ba00          	or	a,__backlightval
3933  01e8 cd0000        	call	_i2c_write
3935                     ; 380 	i2c_stop();
3937  01eb cd0000        	call	_i2c_stop
3939                     ; 381 } // lcd_i2c_expanderWrite()
3942  01ee 84            	pop	a
3943  01ef 81            	ret
3980                     ; 388 void lcd_i2c_pulseEnable(uint8_t _data)
3980                     ; 389 {
3981                     	switch	.text
3982  01f0               _lcd_i2c_pulseEnable:
3984  01f0 88            	push	a
3985       00000000      OFST:	set	0
3988                     ; 390 	lcd_i2c_expanderWrite(_data | En); // En high
3990  01f1 aa04          	or	a,#4
3991  01f3 ade9          	call	_lcd_i2c_expanderWrite
3993                     ; 391 	delay_usec(1);		               // enable pulse must be >450ns
3995  01f5 ae0001        	ldw	x,#1
3996  01f8 cd0000        	call	_delay_usec
3998                     ; 393 	lcd_i2c_expanderWrite(_data & ~En);	// En low
4000  01fb 7b01          	ld	a,(OFST+1,sp)
4001  01fd a4fb          	and	a,#251
4002  01ff addd          	call	_lcd_i2c_expanderWrite
4004                     ; 394 	delay_usec(50);					    // commands need > 37us to settle
4006  0201 ae0032        	ldw	x,#50
4007  0204 cd0000        	call	_delay_usec
4009                     ; 395 } // lcd_i2c_pulseEnable()
4012  0207 84            	pop	a
4013  0208 81            	ret
4049                     ; 402 void lcd_i2c_print(char *s)
4049                     ; 403 {
4050                     	switch	.text
4051  0209               _lcd_i2c_print:
4053  0209 89            	pushw	x
4054       00000000      OFST:	set	0
4057  020a 2011          	jra	L1132
4058  020c               L7032:
4059                     ; 404     while (*s) lcd_i2c_send(*s++,DR);
4061  020c 1e01          	ldw	x,(OFST+1,sp)
4062  020e 1c0001        	addw	x,#1
4063  0211 1f01          	ldw	(OFST+1,sp),x
4064  0213 1d0001        	subw	x,#1
4065  0216 f6            	ld	a,(x)
4066  0217 ae0001        	ldw	x,#1
4067  021a 95            	ld	xh,a
4068  021b ad97          	call	_lcd_i2c_send
4070  021d               L1132:
4073  021d 1e01          	ldw	x,(OFST+1,sp)
4074  021f 7d            	tnz	(x)
4075  0220 26ea          	jrne	L7032
4076                     ; 405 } // lcd_i2c_print()
4079  0222 85            	popw	x
4080  0223 81            	ret
4167                     	switch	.ubsct
4168  0000               __backlightval:
4169  0000 00            	ds.b	1
4170                     	xdef	__backlightval
4171  0001               __charsize:
4172  0001 00            	ds.b	1
4173                     	xdef	__charsize
4174  0002               __rows:
4175  0002 00            	ds.b	1
4176                     	xdef	__rows
4177  0003               __cols:
4178  0003 00            	ds.b	1
4179                     	xdef	__cols
4180  0004               __displaymode:
4181  0004 00            	ds.b	1
4182                     	xdef	__displaymode
4183  0005               __displaycontrol:
4184  0005 00            	ds.b	1
4185                     	xdef	__displaycontrol
4186  0006               __displayfunction:
4187  0006 00            	ds.b	1
4188                     	xdef	__displayfunction
4189  0007               __addr:
4190  0007 00            	ds.b	1
4191                     	xdef	__addr
4192                     	xref	_i2c_write
4193                     	xref	_i2c_stop
4194                     	xref	_i2c_start
4195                     	xref	_delay_usec
4196                     	xref	_delay_msec
4197                     	xdef	_lcd_i2c_pulseEnable
4198                     	xdef	_lcd_i2c_expanderWrite
4199                     	xdef	_lcd_i2c_write4bits
4200                     	xdef	_lcd_i2c_send
4201                     	xdef	_lcd_i2c_print
4202                     	xdef	_lcd_i2c_getBacklight
4203                     	xdef	_lcd_i2c_backlight_on
4204                     	xdef	_lcd_i2c_backlight_off
4205                     	xdef	_lcd_i2c_createChar
4206                     	xdef	_lcd_i2c_autoscroll_off
4207                     	xdef	_lcd_i2c_autoscroll_on
4208                     	xdef	_lcd_i2c_rightToLeft
4209                     	xdef	_lcd_i2c_leftToRight
4210                     	xdef	_lcd_i2c_scrollDisplayRight
4211                     	xdef	_lcd_i2c_scrollDisplayLeft
4212                     	xdef	_lcd_i2c_blink_on
4213                     	xdef	_lcd_i2c_blink_off
4214                     	xdef	_lcd_i2c_cursor_on
4215                     	xdef	_lcd_i2c_cursor_off
4216                     	xdef	_lcd_i2c_display_on
4217                     	xdef	_lcd_i2c_display_off
4218                     	xdef	_lcd_i2c_setCursor
4219                     	xdef	_lcd_i2c_home
4220                     	xdef	_lcd_i2c_clear
4221                     	xdef	_lcd_i2c_init
4222                     	xref.b	c_x
4242                     	xref	c_xymvx
4243                     	end
