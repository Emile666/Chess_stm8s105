   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2524                     	bsct
2525  0000               _init_white:
2526  0000 03            	dc.b	3
2527  0001 07            	dc.b	7
2528  0002 05            	dc.b	5
2529  0003 09            	dc.b	9
2530  0004 0b            	dc.b	11
2531  0005 05            	dc.b	5
2532  0006 07            	dc.b	7
2533  0007 03            	dc.b	3
2534  0008               _init_black:
2535  0008 04            	dc.b	4
2536  0009 08            	dc.b	8
2537  000a 06            	dc.b	6
2538  000b 0a            	dc.b	10
2539  000c 0c            	dc.b	12
2540  000d 06            	dc.b	6
2541  000e 08            	dc.b	8
2542  000f 04            	dc.b	4
2543  0010               _chess_std:
2544  0010 00            	dc.b	0
2545                     .bit:	section	.data,bit
2546  0000               _new_game:
2547  0000 00            	dc.b	0
2548  0001               _pause_game:
2549  0001 00            	dc.b	0
2619                     ; 45 uint8_t piece_detect_move(uint8_t *lifted)
2619                     ; 46 {
2621                     	switch	.text
2622  0000               _piece_detect_move:
2624  0000 89            	pushw	x
2625  0001 5203          	subw	sp,#3
2626       00000003      OFST:	set	3
2629                     ; 47     uint8_t i      = 0;
2631  0003 0f02          	clr	(OFST-1,sp)
2633                     ; 48 	uint8_t row    = 0; 
2635                     ; 49 	uint8_t square = NO_SQUARE;
2637  0005 a640          	ld	a,#64
2638  0007 6b01          	ld	(OFST-2,sp),a
2640  0009               L3661:
2641                     ; 53 		row = (reed_relays[i] ^ reed_relays_old[i]);
2643  0009 7b02          	ld	a,(OFST-1,sp)
2644  000b 5f            	clrw	x
2645  000c 97            	ld	xl,a
2646  000d 7b02          	ld	a,(OFST-1,sp)
2647  000f 905f          	clrw	y
2648  0011 9097          	ld	yl,a
2649  0013 90e604        	ld	a,(_reed_relays_old,y)
2650  0016 e800          	xor	a,(_reed_relays,x)
2651  0018 6b03          	ld	(OFST+0,sp),a
2653                     ; 54 		i++;
2655  001a 0c02          	inc	(OFST-1,sp)
2657                     ; 55 	} while (!row && (i < 8));
2659  001c 0d03          	tnz	(OFST+0,sp)
2660  001e 2606          	jrne	L1761
2662  0020 7b02          	ld	a,(OFST-1,sp)
2663  0022 a108          	cp	a,#8
2664  0024 25e3          	jrult	L3661
2665  0026               L1761:
2666                     ; 56 	if (row)
2668  0026 0d03          	tnz	(OFST+0,sp)
2669  0028 2728          	jreq	L3761
2670                     ; 58 		*lifted = (reed_relays_old[--i] > 0); // piece is lifted
2672  002a 0a02          	dec	(OFST-1,sp)
2674  002c 7b02          	ld	a,(OFST-1,sp)
2675  002e 5f            	clrw	x
2676  002f 97            	ld	xl,a
2677  0030 6d04          	tnz	(_reed_relays_old,x)
2678  0032 2704          	jreq	L6
2679  0034 a601          	ld	a,#1
2680  0036 2001          	jra	L01
2681  0038               L6:
2682  0038 4f            	clr	a
2683  0039               L01:
2684  0039 1e04          	ldw	x,(OFST+1,sp)
2685  003b f7            	ld	(x),a
2686                     ; 59 		row >>= 1;
2688  003c 0403          	srl	(OFST+0,sp)
2691  003e 2008          	jra	L7761
2692  0040               L5761:
2693                     ; 62 			row >>= 1;
2695  0040 0403          	srl	(OFST+0,sp)
2697                     ; 63 			square += 8;
2699  0042 7b01          	ld	a,(OFST-2,sp)
2700  0044 ab08          	add	a,#8
2701  0046 6b01          	ld	(OFST-2,sp),a
2703  0048               L7761:
2704                     ; 60 		while (row)
2706  0048 0d03          	tnz	(OFST+0,sp)
2707  004a 26f4          	jrne	L5761
2708                     ; 65 		square += i;
2710  004c 7b01          	ld	a,(OFST-2,sp)
2711  004e 1b02          	add	a,(OFST-1,sp)
2712  0050 6b01          	ld	(OFST-2,sp),a
2714  0052               L3761:
2715                     ; 67 	return square;
2717  0052 7b01          	ld	a,(OFST-2,sp)
2720  0054 5b05          	addw	sp,#5
2721  0056 81            	ret
2766                     ; 70 bool is_black_piece(uint8_t sq_nr)
2766                     ; 71 {
2767                     	switch	.text
2768  0057               _is_black_piece:
2770  0057 88            	push	a
2771       00000001      OFST:	set	1
2774                     ; 72 	uint8_t p = table[sq_nr];
2776  0058 5f            	clrw	x
2777  0059 97            	ld	xl,a
2778  005a e60c          	ld	a,(_table,x)
2779  005c 6b01          	ld	(OFST+0,sp),a
2781                     ; 74 	if ((p != EMPTY) && ((p & 0x01) == 0x00))
2783  005e 0d01          	tnz	(OFST+0,sp)
2784  0060 270b          	jreq	L5271
2786  0062 7b01          	ld	a,(OFST+0,sp)
2787  0064 a501          	bcp	a,#1
2788  0066 2605          	jrne	L5271
2789                     ; 75 		 return true;
2791  0068 a601          	ld	a,#1
2794  006a 5b01          	addw	sp,#1
2795  006c 81            	ret
2796  006d               L5271:
2797                     ; 76 	else return false;
2799  006d 4f            	clr	a
2802  006e 5b01          	addw	sp,#1
2803  0070 81            	ret
2848                     ; 79 bool is_white_piece(uint8_t sq_nr)
2848                     ; 80 {
2849                     	switch	.text
2850  0071               _is_white_piece:
2852  0071 88            	push	a
2853       00000001      OFST:	set	1
2856                     ; 81 	uint8_t p = table[sq_nr];
2858  0072 5f            	clrw	x
2859  0073 97            	ld	xl,a
2860  0074 e60c          	ld	a,(_table,x)
2861  0076 6b01          	ld	(OFST+0,sp),a
2863                     ; 83 	if ((p != EMPTY) && ((p & 0x01) == 0x01))
2865  0078 0d01          	tnz	(OFST+0,sp)
2866  007a 270d          	jreq	L3571
2868  007c 7b01          	ld	a,(OFST+0,sp)
2869  007e a401          	and	a,#1
2870  0080 a101          	cp	a,#1
2871  0082 2605          	jrne	L3571
2872                     ; 84 		 return true;
2874  0084 a601          	ld	a,#1
2877  0086 5b01          	addw	sp,#1
2878  0088 81            	ret
2879  0089               L3571:
2880                     ; 85 	else return false;
2882  0089 4f            	clr	a
2885  008a 5b01          	addw	sp,#1
2886  008c 81            	ret
2951                     ; 89 bool is_en_passant_white(uint8_t sq1, uint8_t sq2, uint8_t sq3)
2951                     ; 90 {
2952                     	switch	.text
2953  008d               _is_en_passant_white:
2955  008d 89            	pushw	x
2956  008e 88            	push	a
2957       00000001      OFST:	set	1
2960                     ; 91 	bool ret = false;
2962  008f 0f01          	clr	(OFST+0,sp)
2964                     ; 93 	if ((table[sq1] == PAWN_WHITE) && (table[sq2] == EMPTY) && 
2964                     ; 94 	    (table[sq3] == PAWN_BLACK) && (sq2 == sq3+8))
2966  0091 9e            	ld	a,xh
2967  0092 5f            	clrw	x
2968  0093 97            	ld	xl,a
2969  0094 e60c          	ld	a,(_table,x)
2970  0096 a101          	cp	a,#1
2971  0098 2703          	jreq	L24
2972  009a cc012f        	jp	L1102
2973  009d               L24:
2975  009d 7b03          	ld	a,(OFST+2,sp)
2976  009f 5f            	clrw	x
2977  00a0 97            	ld	xl,a
2978  00a1 6d0c          	tnz	(_table,x)
2979  00a3 26f5          	jrne	L1102
2981  00a5 7b06          	ld	a,(OFST+5,sp)
2982  00a7 5f            	clrw	x
2983  00a8 97            	ld	xl,a
2984  00a9 e60c          	ld	a,(_table,x)
2985  00ab a102          	cp	a,#2
2986  00ad 26eb          	jrne	L1102
2988  00af 7b03          	ld	a,(OFST+2,sp)
2989  00b1 5f            	clrw	x
2990  00b2 97            	ld	xl,a
2991  00b3 7b06          	ld	a,(OFST+5,sp)
2992  00b5 905f          	clrw	y
2993  00b7 9097          	ld	yl,a
2994  00b9 72a90008      	addw	y,#8
2995  00bd bf00          	ldw	c_x,x
2996  00bf 90b300        	cpw	y,c_x
2997  00c2 266b          	jrne	L1102
2998                     ; 96 		if (sq3 == 32)   		           ret = (sq1 == 33);
3000  00c4 7b06          	ld	a,(OFST+5,sp)
3001  00c6 a120          	cp	a,#32
3002  00c8 2612          	jrne	L3102
3005  00ca 7b02          	ld	a,(OFST+1,sp)
3006  00cc a121          	cp	a,#33
3007  00ce 2605          	jrne	L02
3008  00d0 ae0001        	ldw	x,#1
3009  00d3 2001          	jra	L22
3010  00d5               L02:
3011  00d5 5f            	clrw	x
3012  00d6               L22:
3013  00d6 01            	rrwa	x,a
3014  00d7 6b01          	ld	(OFST+0,sp),a
3015  00d9 02            	rlwa	x,a
3018  00da 2053          	jra	L1102
3019  00dc               L3102:
3020                     ; 97 		else if ((sq3 > 32) && (sq3 < 39)) ret = ((sq1 == sq3-1) || (sq1 == sq3+1));
3022  00dc 7b06          	ld	a,(OFST+5,sp)
3023  00de a121          	cp	a,#33
3024  00e0 2537          	jrult	L7102
3026  00e2 7b06          	ld	a,(OFST+5,sp)
3027  00e4 a127          	cp	a,#39
3028  00e6 2431          	jruge	L7102
3031  00e8 7b06          	ld	a,(OFST+5,sp)
3032  00ea 5f            	clrw	x
3033  00eb 97            	ld	xl,a
3034  00ec 5a            	decw	x
3035  00ed 7b02          	ld	a,(OFST+1,sp)
3036  00ef 905f          	clrw	y
3037  00f1 9097          	ld	yl,a
3038  00f3 90bf00        	ldw	c_y,y
3039  00f6 b300          	cpw	x,c_y
3040  00f8 2713          	jreq	L62
3041  00fa 7b02          	ld	a,(OFST+1,sp)
3042  00fc 5f            	clrw	x
3043  00fd 97            	ld	xl,a
3044  00fe 7b06          	ld	a,(OFST+5,sp)
3045  0100 905f          	clrw	y
3046  0102 9097          	ld	yl,a
3047  0104 905c          	incw	y
3048  0106 bf00          	ldw	c_x,x
3049  0108 90b300        	cpw	y,c_x
3050  010b 2605          	jrne	L42
3051  010d               L62:
3052  010d ae0001        	ldw	x,#1
3053  0110 2001          	jra	L03
3054  0112               L42:
3055  0112 5f            	clrw	x
3056  0113               L03:
3057  0113 01            	rrwa	x,a
3058  0114 6b01          	ld	(OFST+0,sp),a
3059  0116 02            	rlwa	x,a
3062  0117 2016          	jra	L1102
3063  0119               L7102:
3064                     ; 98 		else if (sq3 == 39) 	           ret = (sq1 == 38);
3066  0119 7b06          	ld	a,(OFST+5,sp)
3067  011b a127          	cp	a,#39
3068  011d 2610          	jrne	L1102
3071  011f 7b02          	ld	a,(OFST+1,sp)
3072  0121 a126          	cp	a,#38
3073  0123 2605          	jrne	L23
3074  0125 ae0001        	ldw	x,#1
3075  0128 2001          	jra	L43
3076  012a               L23:
3077  012a 5f            	clrw	x
3078  012b               L43:
3079  012b 01            	rrwa	x,a
3080  012c 6b01          	ld	(OFST+0,sp),a
3081  012e 02            	rlwa	x,a
3083  012f               L1102:
3084                     ; 100 	return ret;
3086  012f 0d01          	tnz	(OFST+0,sp)
3087  0131 2704          	jreq	L63
3088  0133 a601          	ld	a,#1
3089  0135 2001          	jra	L04
3090  0137               L63:
3091  0137 4f            	clr	a
3092  0138               L04:
3095  0138 5b03          	addw	sp,#3
3096  013a 81            	ret
3151                     ; 103 bool is_castling_white(uint8_t sq1, uint8_t sq2)
3151                     ; 104 {
3152                     	switch	.text
3153  013b               _is_castling_white:
3155  013b 89            	pushw	x
3156  013c 88            	push	a
3157       00000001      OFST:	set	1
3160                     ; 105 	bool ret = false;
3162  013d 0f01          	clr	(OFST+0,sp)
3164                     ; 107 	ret = (table[sq1] == KING_WHITE) && (table[sq2] == EMPTY) && 
3164                     ; 108 	      ((sq1 == 4) && ((sq2 == 2) || (sq2 == 6))); 
3166  013f 9e            	ld	a,xh
3167  0140 5f            	clrw	x
3168  0141 97            	ld	xl,a
3169  0142 e60c          	ld	a,(_table,x)
3170  0144 a10b          	cp	a,#11
3171  0146 261f          	jrne	L64
3172  0148 7b03          	ld	a,(OFST+2,sp)
3173  014a 5f            	clrw	x
3174  014b 97            	ld	xl,a
3175  014c 6d0c          	tnz	(_table,x)
3176  014e 2617          	jrne	L64
3177  0150 7b02          	ld	a,(OFST+1,sp)
3178  0152 a104          	cp	a,#4
3179  0154 2611          	jrne	L64
3180  0156 7b03          	ld	a,(OFST+2,sp)
3181  0158 a102          	cp	a,#2
3182  015a 2706          	jreq	L05
3183  015c 7b03          	ld	a,(OFST+2,sp)
3184  015e a106          	cp	a,#6
3185  0160 2605          	jrne	L64
3186  0162               L05:
3187  0162 ae0001        	ldw	x,#1
3188  0165 2001          	jra	L25
3189  0167               L64:
3190  0167 5f            	clrw	x
3191  0168               L25:
3192  0168 01            	rrwa	x,a
3193  0169 6b01          	ld	(OFST+0,sp),a
3194  016b 02            	rlwa	x,a
3196                     ; 111 	return ret;
3198  016c 0d01          	tnz	(OFST+0,sp)
3199  016e 2704          	jreq	L45
3200  0170 a601          	ld	a,#1
3201  0172 2001          	jra	L65
3202  0174               L45:
3203  0174 4f            	clr	a
3204  0175               L65:
3207  0175 5b03          	addw	sp,#3
3208  0177 81            	ret
3263                     ; 114 bool is_castling_black(uint8_t sq1, uint8_t sq2)
3263                     ; 115 {
3264                     	switch	.text
3265  0178               _is_castling_black:
3267  0178 89            	pushw	x
3268  0179 88            	push	a
3269       00000001      OFST:	set	1
3272                     ; 116 	bool ret = false;
3274  017a 0f01          	clr	(OFST+0,sp)
3276                     ; 118 	ret = (table[sq1] == KING_BLACK) && (table[sq2] == EMPTY) && 
3276                     ; 119 	      ((sq1 == 60) && ((sq2 == 58) || (sq2 == 62))); 
3278  017c 9e            	ld	a,xh
3279  017d 5f            	clrw	x
3280  017e 97            	ld	xl,a
3281  017f e60c          	ld	a,(_table,x)
3282  0181 a10c          	cp	a,#12
3283  0183 261f          	jrne	L26
3284  0185 7b03          	ld	a,(OFST+2,sp)
3285  0187 5f            	clrw	x
3286  0188 97            	ld	xl,a
3287  0189 6d0c          	tnz	(_table,x)
3288  018b 2617          	jrne	L26
3289  018d 7b02          	ld	a,(OFST+1,sp)
3290  018f a13c          	cp	a,#60
3291  0191 2611          	jrne	L26
3292  0193 7b03          	ld	a,(OFST+2,sp)
3293  0195 a13a          	cp	a,#58
3294  0197 2706          	jreq	L46
3295  0199 7b03          	ld	a,(OFST+2,sp)
3296  019b a13e          	cp	a,#62
3297  019d 2605          	jrne	L26
3298  019f               L46:
3299  019f ae0001        	ldw	x,#1
3300  01a2 2001          	jra	L66
3301  01a4               L26:
3302  01a4 5f            	clrw	x
3303  01a5               L66:
3304  01a5 01            	rrwa	x,a
3305  01a6 6b01          	ld	(OFST+0,sp),a
3306  01a8 02            	rlwa	x,a
3308                     ; 120 	return ret;
3310  01a9 0d01          	tnz	(OFST+0,sp)
3311  01ab 2704          	jreq	L07
3312  01ad a601          	ld	a,#1
3313  01af 2001          	jra	L27
3314  01b1               L07:
3315  01b1 4f            	clr	a
3316  01b2               L27:
3319  01b2 5b03          	addw	sp,#3
3320  01b4 81            	ret
3410                     .const:	section	.text
3411  0000               L401:
3412  0000 01c8          	dc.w	L1012
3413  0002 0254          	dc.w	L3012
3414  0004 02b7          	dc.w	L5012
3415  0006 02e4          	dc.w	L7012
3416  0008 035b          	dc.w	L1112
3417  000a 0395          	dc.w	L3112
3418  000c 03b9          	dc.w	L5112
3419  000e 03f2          	dc.w	L7112
3420  0010 0423          	dc.w	L1212
3421  0012 0434          	dc.w	L3212
3422  0014 0454          	dc.w	L7612
3423  0016 0454          	dc.w	L7612
3424  0018 0454          	dc.w	L7612
3425  001a 0454          	dc.w	L7612
3426  001c 0454          	dc.w	L7612
3427  001e 0454          	dc.w	L7612
3428  0020 0445          	dc.w	L5212
3429                     ; 123 void chess_main(void)
3429                     ; 124 {
3430                     	switch	.text
3431  01b5               _chess_main:
3433  01b5 5204          	subw	sp,#4
3434       00000004      OFST:	set	4
3437                     ; 129 	switch (chess_std)
3439  01b7 b610          	ld	a,_chess_std
3441                     ; 251 			break;
3442  01b9 a111          	cp	a,#17
3443  01bb 2407          	jruge	L201
3444  01bd 5f            	clrw	x
3445  01be 97            	ld	xl,a
3446  01bf 58            	sllw	x
3447  01c0 de0000        	ldw	x,(L401,x)
3448  01c3 fc            	jp	(x)
3449  01c4               L201:
3450  01c4 ac540454      	jpf	L7612
3451  01c8               L1012:
3452                     ; 131 		case CHESS_INIT:
3452                     ; 132 			// All lights off
3452                     ; 133 			// PL1 and PL2 LEDs off
3452                     ; 134 			if (new_game)
3454                     	btst	_new_game
3455  01cd 2503          	jrult	L601
3456  01cf cc0454        	jp	L7612
3457  01d2               L601:
3458                     ; 136 				for (i = 0 ; i <  8; i++) table[i] = init_white[i];
3460  01d2 0f04          	clr	(OFST+0,sp)
3462  01d4               L3712:
3465  01d4 7b04          	ld	a,(OFST+0,sp)
3466  01d6 5f            	clrw	x
3467  01d7 97            	ld	xl,a
3468  01d8 e600          	ld	a,(_init_white,x)
3469  01da e70c          	ld	(_table,x),a
3472  01dc 0c04          	inc	(OFST+0,sp)
3476  01de 7b04          	ld	a,(OFST+0,sp)
3477  01e0 a108          	cp	a,#8
3478  01e2 25f0          	jrult	L3712
3479                     ; 137 				for (i = 8 ; i < 16; i++) table[i] = PAWN_WHITE;
3481  01e4 a608          	ld	a,#8
3482  01e6 6b04          	ld	(OFST+0,sp),a
3484  01e8               L1022:
3487  01e8 7b04          	ld	a,(OFST+0,sp)
3488  01ea 5f            	clrw	x
3489  01eb 97            	ld	xl,a
3490  01ec a601          	ld	a,#1
3491  01ee e70c          	ld	(_table,x),a
3494  01f0 0c04          	inc	(OFST+0,sp)
3498  01f2 7b04          	ld	a,(OFST+0,sp)
3499  01f4 a110          	cp	a,#16
3500  01f6 25f0          	jrult	L1022
3501                     ; 138 				for (i = 16; i < 48; i++) table[i] = EMPTY;
3503  01f8 a610          	ld	a,#16
3504  01fa 6b04          	ld	(OFST+0,sp),a
3506  01fc               L7022:
3509  01fc 7b04          	ld	a,(OFST+0,sp)
3510  01fe 5f            	clrw	x
3511  01ff 97            	ld	xl,a
3512  0200 6f0c          	clr	(_table,x)
3515  0202 0c04          	inc	(OFST+0,sp)
3519  0204 7b04          	ld	a,(OFST+0,sp)
3520  0206 a130          	cp	a,#48
3521  0208 25f2          	jrult	L7022
3522                     ; 139 				for (i = 48; i < 56; i++) table[i] = PAWN_BLACK;
3524  020a a630          	ld	a,#48
3525  020c 6b04          	ld	(OFST+0,sp),a
3527  020e               L5122:
3530  020e 7b04          	ld	a,(OFST+0,sp)
3531  0210 5f            	clrw	x
3532  0211 97            	ld	xl,a
3533  0212 a602          	ld	a,#2
3534  0214 e70c          	ld	(_table,x),a
3537  0216 0c04          	inc	(OFST+0,sp)
3541  0218 7b04          	ld	a,(OFST+0,sp)
3542  021a a138          	cp	a,#56
3543  021c 25f0          	jrult	L5122
3544                     ; 140 				for (i = 56; i < 64; i++) table[i] = init_black[i];
3546  021e a638          	ld	a,#56
3547  0220 6b04          	ld	(OFST+0,sp),a
3549  0222               L3222:
3552  0222 7b04          	ld	a,(OFST+0,sp)
3553  0224 5f            	clrw	x
3554  0225 97            	ld	xl,a
3555  0226 e608          	ld	a,(_init_black,x)
3556  0228 e70c          	ld	(_table,x),a
3559  022a 0c04          	inc	(OFST+0,sp)
3563  022c 7b04          	ld	a,(OFST+0,sp)
3564  022e a140          	cp	a,#64
3565  0230 25f0          	jrult	L3222
3566                     ; 141 				for (i = 0; i < 8; i++)
3568  0232 0f04          	clr	(OFST+0,sp)
3570  0234               L1322:
3571                     ; 143 					max7219_write((MAX7219_REG_DIG0 + (i << 8)) | 0xC3);
3573  0234 7b04          	ld	a,(OFST+0,sp)
3574  0236 5f            	clrw	x
3575  0237 97            	ld	xl,a
3576  0238 4f            	clr	a
3577  0239 02            	rlwa	x,a
3578  023a 1c0100        	addw	x,#256
3579  023d 01            	rrwa	x,a
3580  023e aac3          	or	a,#195
3581  0240 02            	rlwa	x,a
3582  0241 cd0000        	call	_max7219_write
3584                     ; 141 				for (i = 0; i < 8; i++)
3586  0244 0c04          	inc	(OFST+0,sp)
3590  0246 7b04          	ld	a,(OFST+0,sp)
3591  0248 a108          	cp	a,#8
3592  024a 25e8          	jrult	L1322
3593                     ; 145 				chess_std = CHESS_NEW_GAME;
3595  024c 35010010      	mov	_chess_std,#1
3596  0250 ac540454      	jpf	L7612
3597  0254               L3012:
3598                     ; 148 		case CHESS_NEW_GAME:
3598                     ; 149 			clk1.active = false; 
3600  0254 72110002      	bres	_clk1+2,#0
3601                     ; 150 			clk2.active = false; 
3603  0258 72110002      	bres	_clk2+2,#0
3604                     ; 151 			all_set = true;
3606  025c a601          	ld	a,#1
3607  025e 6b02          	ld	(OFST-2,sp),a
3609                     ; 152 			i = 0;
3611  0260 0f04          	clr	(OFST+0,sp)
3614  0262 2018          	jra	L3422
3615  0264               L7322:
3616                     ; 155 				all_set = (reed_relays[i++] == 0xC3);
3618  0264 7b04          	ld	a,(OFST+0,sp)
3619  0266 97            	ld	xl,a
3620  0267 0c04          	inc	(OFST+0,sp)
3622  0269 9f            	ld	a,xl
3623  026a 5f            	clrw	x
3624  026b 97            	ld	xl,a
3625  026c e600          	ld	a,(_reed_relays,x)
3626  026e a1c3          	cp	a,#195
3627  0270 2605          	jrne	L67
3628  0272 ae0001        	ldw	x,#1
3629  0275 2001          	jra	L001
3630  0277               L67:
3631  0277 5f            	clrw	x
3632  0278               L001:
3633  0278 01            	rrwa	x,a
3634  0279 6b02          	ld	(OFST-2,sp),a
3635  027b 02            	rlwa	x,a
3637  027c               L3422:
3638                     ; 153 			while ((i < 8) && !all_set)
3640  027c 7b04          	ld	a,(OFST+0,sp)
3641  027e a108          	cp	a,#8
3642  0280 2404          	jruge	L7422
3644  0282 0d02          	tnz	(OFST-2,sp)
3645  0284 27de          	jreq	L7322
3646  0286               L7422:
3647                     ; 157 			for (i = 0; i < 8; i++) 
3649  0286 0f04          	clr	(OFST+0,sp)
3651  0288               L1522:
3652                     ; 159 				max7219_write((MAX7219_REG_DIG0 + (i << 8)) | reed_relays[i]);
3654  0288 7b04          	ld	a,(OFST+0,sp)
3655  028a 5f            	clrw	x
3656  028b 97            	ld	xl,a
3657  028c e600          	ld	a,(_reed_relays,x)
3658  028e 6b01          	ld	(OFST-3,sp),a
3660  0290 7b04          	ld	a,(OFST+0,sp)
3661  0292 5f            	clrw	x
3662  0293 97            	ld	xl,a
3663  0294 4f            	clr	a
3664  0295 02            	rlwa	x,a
3665  0296 1c0100        	addw	x,#256
3666  0299 01            	rrwa	x,a
3667  029a 1a01          	or	a,(OFST-3,sp)
3668  029c 02            	rlwa	x,a
3669  029d cd0000        	call	_max7219_write
3671                     ; 157 			for (i = 0; i < 8; i++) 
3673  02a0 0c04          	inc	(OFST+0,sp)
3677  02a2 7b04          	ld	a,(OFST+0,sp)
3678  02a4 a108          	cp	a,#8
3679  02a6 25e0          	jrult	L1522
3680                     ; 161 			if (all_set) chess_std = CHESS_WHITE;
3682  02a8 0d02          	tnz	(OFST-2,sp)
3683  02aa 2603          	jrne	L011
3684  02ac cc0454        	jp	L7612
3685  02af               L011:
3688  02af 35020010      	mov	_chess_std,#2
3689  02b3 ac540454      	jpf	L7612
3690  02b7               L5012:
3691                     ; 164 		case CHESS_WHITE:
3691                     ; 165 			clk1.active = true;
3693  02b7 72100002      	bset	_clk1+2,#0
3694                     ; 166 			if (pause_game) chess_std = CHESS_PAUSE_WHITE;
3696                     	btst	_pause_game
3697  02c0 2408          	jruge	L1622
3700  02c2 35080010      	mov	_chess_std,#8
3702  02c6 ac540454      	jpf	L7612
3703  02ca               L1622:
3704                     ; 167 			else if ((sq_begin = piece_detect_move(&lifted)) != NO_SQUARE) 
3706  02ca 96            	ldw	x,sp
3707  02cb 1c0003        	addw	x,#OFST-1
3708  02ce cd0000        	call	_piece_detect_move
3710  02d1 b703          	ld	_sq_begin,a
3711  02d3 b603          	ld	a,_sq_begin
3712  02d5 a140          	cp	a,#64
3713  02d7 2603          	jrne	L211
3714  02d9 cc0454        	jp	L7612
3715  02dc               L211:
3716                     ; 169 				chess_std = CHESS_WHITE2;
3718  02dc 35030010      	mov	_chess_std,#3
3719  02e0 ac540454      	jpf	L7612
3720  02e4               L7012:
3721                     ; 172 		case CHESS_WHITE2: // A piece was lifted, now check for another piece lifted or a piece returned
3721                     ; 173 			clk1.active = true;
3723  02e4 72100002      	bset	_clk1+2,#0
3724                     ; 174 			if ((sq_end = piece_detect_move(&lifted)) != NO_SQUARE) 
3726  02e8 96            	ldw	x,sp
3727  02e9 1c0003        	addw	x,#OFST-1
3728  02ec cd0000        	call	_piece_detect_move
3730  02ef b702          	ld	_sq_end,a
3731  02f1 b602          	ld	a,_sq_end
3732  02f3 a140          	cp	a,#64
3733  02f5 2603          	jrne	L411
3734  02f7 cc0454        	jp	L7612
3735  02fa               L411:
3736                     ; 176 				if (!lifted)
3738  02fa 0d03          	tnz	(OFST-1,sp)
3739  02fc 264a          	jrne	L1722
3740                     ; 178 					table[sq_end]   = table[sq_begin];
3742  02fe b602          	ld	a,_sq_end
3743  0300 5f            	clrw	x
3744  0301 97            	ld	xl,a
3745  0302 b603          	ld	a,_sq_begin
3746  0304 905f          	clrw	y
3747  0306 9097          	ld	yl,a
3748  0308 90e60c        	ld	a,(_table,y)
3749  030b e70c          	ld	(_table,x),a
3750                     ; 179 					table[sq_begin] = EMPTY;
3752  030d b603          	ld	a,_sq_begin
3753  030f 5f            	clrw	x
3754  0310 97            	ld	xl,a
3755  0311 6f0c          	clr	(_table,x)
3756                     ; 180 					if (is_en_passant_white(sq_begin,sq_end,sq_end_old))
3758  0313 3b0000        	push	_sq_end_old
3759  0316 b602          	ld	a,_sq_end
3760  0318 97            	ld	xl,a
3761  0319 b603          	ld	a,_sq_begin
3762  031b 95            	ld	xh,a
3763  031c cd008d        	call	_is_en_passant_white
3765  031f 5b01          	addw	sp,#1
3766  0321 4d            	tnz	a
3767  0322 2708          	jreq	L3722
3768                     ; 181 						 chess_std  = CHESS_WHITE_EP;
3770  0324 35050010      	mov	_chess_std,#5
3772  0328 ac540454      	jpf	L7612
3773  032c               L3722:
3774                     ; 182 					else if (is_castling_white(sq_begin,sq_end))
3776  032c b602          	ld	a,_sq_end
3777  032e 97            	ld	xl,a
3778  032f b603          	ld	a,_sq_begin
3779  0331 95            	ld	xh,a
3780  0332 cd013b        	call	_is_castling_white
3782  0335 4d            	tnz	a
3783  0336 2708          	jreq	L7722
3784                     ; 183 						 chess_std  = CHESS_WHITE_CASTLING;
3786  0338 35060010      	mov	_chess_std,#6
3788  033c ac540454      	jpf	L7612
3789  0340               L7722:
3790                     ; 184 					else chess_std  = CHESS_BLACK; // Black to move
3792  0340 35090010      	mov	_chess_std,#9
3793  0344 ac540454      	jpf	L7612
3794  0348               L1722:
3795                     ; 186 				else if (is_black_piece(sq_end))
3797  0348 b602          	ld	a,_sq_end
3798  034a cd0057        	call	_is_black_piece
3800  034d 4d            	tnz	a
3801  034e 2603          	jrne	L611
3802  0350 cc0454        	jp	L7612
3803  0353               L611:
3804                     ; 188 					sq_black  = sq_end;
3806                     ; 189 					chess_std = CHESS_WHITE3;
3808  0353 35040010      	mov	_chess_std,#4
3809  0357 ac540454      	jpf	L7612
3810  035b               L1112:
3811                     ; 194 		case CHESS_WHITE3: // A 2nd piece (black) was lifted, now check for a piece returned
3811                     ; 195 			clk1.active = true;
3813  035b 72100002      	bset	_clk1+2,#0
3814                     ; 196 			if ((sq_end = piece_detect_move(&lifted)) != NO_SQUARE) 
3816  035f 96            	ldw	x,sp
3817  0360 1c0003        	addw	x,#OFST-1
3818  0363 cd0000        	call	_piece_detect_move
3820  0366 b702          	ld	_sq_end,a
3821  0368 b602          	ld	a,_sq_end
3822  036a a140          	cp	a,#64
3823  036c 2603          	jrne	L021
3824  036e cc0454        	jp	L7612
3825  0371               L021:
3826                     ; 198 				if (!lifted)
3828  0371 0d03          	tnz	(OFST-1,sp)
3829  0373 2703          	jreq	L221
3830  0375 cc0454        	jp	L7612
3831  0378               L221:
3832                     ; 200 					table[sq_end]   = table[sq_begin]; // from state CHESS_SHITE
3834  0378 b602          	ld	a,_sq_end
3835  037a 5f            	clrw	x
3836  037b 97            	ld	xl,a
3837  037c b603          	ld	a,_sq_begin
3838  037e 905f          	clrw	y
3839  0380 9097          	ld	yl,a
3840  0382 90e60c        	ld	a,(_table,y)
3841  0385 e70c          	ld	(_table,x),a
3842                     ; 201 					table[sq_begin] = EMPTY;
3844  0387 b603          	ld	a,_sq_begin
3845  0389 5f            	clrw	x
3846  038a 97            	ld	xl,a
3847  038b 6f0c          	clr	(_table,x)
3848                     ; 202 					chess_std       = CHESS_BLACK;
3850  038d 35090010      	mov	_chess_std,#9
3851  0391 ac540454      	jpf	L7612
3852  0395               L3112:
3853                     ; 207 		case CHESS_WHITE_EP: // En-passant move
3853                     ; 208 			clk1.active = true; 
3855  0395 72100002      	bset	_clk1+2,#0
3856                     ; 209 			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE)
3858  0399 96            	ldw	x,sp
3859  039a 1c0003        	addw	x,#OFST-1
3860  039d cd0000        	call	_piece_detect_move
3862  03a0 6b04          	ld	(OFST+0,sp),a
3864  03a2 7b04          	ld	a,(OFST+0,sp)
3865  03a4 a140          	cp	a,#64
3866  03a6 2603          	jrne	L421
3867  03a8 cc0454        	jp	L7612
3868  03ab               L421:
3869                     ; 211 				table[sq_black] = EMPTY;
3871  03ab 7b04          	ld	a,(OFST+0,sp)
3872  03ad 5f            	clrw	x
3873  03ae 97            	ld	xl,a
3874  03af 6f0c          	clr	(_table,x)
3875                     ; 212 				chess_std       = CHESS_BLACK;
3877  03b1 35090010      	mov	_chess_std,#9
3878  03b5 ac540454      	jpf	L7612
3879  03b9               L5112:
3880                     ; 215 		case CHESS_WHITE_CASTLING: // Castling move
3880                     ; 216 			clk1.active = true; 
3882  03b9 72100002      	bset	_clk1+2,#0
3883                     ; 217 			if ((sq_white = piece_detect_move(&lifted)) != NO_SQUARE)
3885  03bd 96            	ldw	x,sp
3886  03be 1c0003        	addw	x,#OFST-1
3887  03c1 cd0000        	call	_piece_detect_move
3889  03c4 6b04          	ld	(OFST+0,sp),a
3891  03c6 7b04          	ld	a,(OFST+0,sp)
3892  03c8 a140          	cp	a,#64
3893  03ca 27dc          	jreq	L7612
3894                     ; 219 				if (lifted && ((sq_white == 0) && (table[0] == ROOK_WHITE) || 
3894                     ; 220 				               (sq_white == 7) && (table[7] == ROOK_WHITE)))
3896  03cc 0d03          	tnz	(OFST-1,sp)
3897  03ce 27d8          	jreq	L7612
3899  03d0 0d04          	tnz	(OFST+0,sp)
3900  03d2 2606          	jrne	L3232
3902  03d4 b60c          	ld	a,_table
3903  03d6 a103          	cp	a,#3
3904  03d8 270c          	jreq	L1232
3905  03da               L3232:
3907  03da 7b04          	ld	a,(OFST+0,sp)
3908  03dc a107          	cp	a,#7
3909  03de 2674          	jrne	L7612
3911  03e0 b613          	ld	a,_table+7
3912  03e2 a103          	cp	a,#3
3913  03e4 266e          	jrne	L7612
3914  03e6               L1232:
3915                     ; 222 					table[sq_white] = EMPTY;
3917  03e6 7b04          	ld	a,(OFST+0,sp)
3918  03e8 5f            	clrw	x
3919  03e9 97            	ld	xl,a
3920  03ea 6f0c          	clr	(_table,x)
3921                     ; 223 					chess_std       = CHESS_WHITE_CASTLING2;
3923  03ec 35070010      	mov	_chess_std,#7
3924  03f0 2062          	jra	L7612
3925  03f2               L7112:
3926                     ; 228 		case CHESS_WHITE_CASTLING2: // Castling move
3926                     ; 229 			clk1.active = true; 
3928  03f2 72100002      	bset	_clk1+2,#0
3929                     ; 230 			if ((sq_white = piece_detect_move(&lifted)) != NO_SQUARE)
3931  03f6 96            	ldw	x,sp
3932  03f7 1c0003        	addw	x,#OFST-1
3933  03fa cd0000        	call	_piece_detect_move
3935  03fd 6b04          	ld	(OFST+0,sp),a
3937  03ff 7b04          	ld	a,(OFST+0,sp)
3938  0401 a140          	cp	a,#64
3939  0403 274f          	jreq	L7612
3940                     ; 232 				if (!lifted && ((sq_white == 3) || (sq_white == 5)))
3942  0405 0d03          	tnz	(OFST-1,sp)
3943  0407 264b          	jrne	L7612
3945  0409 7b04          	ld	a,(OFST+0,sp)
3946  040b a103          	cp	a,#3
3947  040d 2706          	jreq	L1332
3949  040f 7b04          	ld	a,(OFST+0,sp)
3950  0411 a105          	cp	a,#5
3951  0413 263f          	jrne	L7612
3952  0415               L1332:
3953                     ; 234 					table[sq_white] = ROOK_WHITE;
3955  0415 7b04          	ld	a,(OFST+0,sp)
3956  0417 5f            	clrw	x
3957  0418 97            	ld	xl,a
3958  0419 a603          	ld	a,#3
3959  041b e70c          	ld	(_table,x),a
3960                     ; 235 					chess_std       = CHESS_BLACK;
3962  041d 35090010      	mov	_chess_std,#9
3963  0421 2031          	jra	L7612
3964  0423               L1212:
3965                     ; 240 		case CHESS_PAUSE_WHITE:
3965                     ; 241 			clk1.active = false; 
3967  0423 72110002      	bres	_clk1+2,#0
3968                     ; 242 			if (!pause_game) chess_std = CHESS_WHITE;
3970                     	btst	_pause_game
3971  042c 2526          	jrult	L7612
3974  042e 35020010      	mov	_chess_std,#2
3975  0432 2020          	jra	L7612
3976  0434               L3212:
3977                     ; 244 		case CHESS_BLACK:
3977                     ; 245 			clk2.active = true; 
3979  0434 72100002      	bset	_clk2+2,#0
3980                     ; 246 			if (pause_game) chess_std = CHESS_PAUSE_BLACK;
3982                     	btst	_pause_game
3983  043d 2415          	jruge	L7612
3986  043f 35100010      	mov	_chess_std,#16
3987  0443 200f          	jra	L7612
3988  0445               L5212:
3989                     ; 248 		case CHESS_PAUSE_BLACK:
3989                     ; 249 			clk2.active = false; 
3991  0445 72110002      	bres	_clk2+2,#0
3992                     ; 250 			if (!pause_game) chess_std = CHESS_BLACK;
3994                     	btst	_pause_game
3995  044e 2504          	jrult	L7612
3998  0450 35090010      	mov	_chess_std,#9
3999  0454               L7612:
4000                     ; 253 	for (i = 0; i < 8; i++) reed_relays_old[i] = reed_relays[i];
4002  0454 0f04          	clr	(OFST+0,sp)
4004  0456               L1432:
4007  0456 7b04          	ld	a,(OFST+0,sp)
4008  0458 5f            	clrw	x
4009  0459 97            	ld	xl,a
4010  045a e600          	ld	a,(_reed_relays,x)
4011  045c e704          	ld	(_reed_relays_old,x),a
4014  045e 0c04          	inc	(OFST+0,sp)
4018  0460 7b04          	ld	a,(OFST+0,sp)
4019  0462 a108          	cp	a,#8
4020  0464 25f0          	jrult	L1432
4021                     ; 254 	sq_begin_old = sq_begin;
4023  0466 450301        	mov	_sq_begin_old,_sq_begin
4024                     ; 255 	sq_end_old   = sq_end;
4026  0469 450200        	mov	_sq_end_old,_sq_end
4027                     ; 256 } // chess_main()
4030  046c 5b04          	addw	sp,#4
4031  046e 81            	ret
4151                     	xdef	_is_castling_black
4152                     	xdef	_is_castling_white
4153                     	xdef	_is_en_passant_white
4154                     	xdef	_is_white_piece
4155                     	xdef	_is_black_piece
4156                     	xdef	_piece_detect_move
4157                     	xdef	_pause_game
4158                     	xdef	_new_game
4159                     	switch	.ubsct
4160  0000               _sq_end_old:
4161  0000 00            	ds.b	1
4162                     	xdef	_sq_end_old
4163  0001               _sq_begin_old:
4164  0001 00            	ds.b	1
4165                     	xdef	_sq_begin_old
4166  0002               _sq_end:
4167  0002 00            	ds.b	1
4168                     	xdef	_sq_end
4169  0003               _sq_begin:
4170  0003 00            	ds.b	1
4171                     	xdef	_sq_begin
4172                     	xdef	_chess_std
4173  0004               _reed_relays_old:
4174  0004 000000000000  	ds.b	8
4175                     	xdef	_reed_relays_old
4176                     	xref.b	_clk2
4177                     	xref.b	_clk1
4178                     	xref.b	_reed_relays
4179                     	xdef	_init_black
4180                     	xdef	_init_white
4181  000c               _table:
4182  000c 000000000000  	ds.b	64
4183                     	xdef	_table
4184                     	xref	_max7219_write
4185                     	xdef	_chess_main
4186                     	xref.b	c_x
4187                     	xref.b	c_y
4207                     	end
