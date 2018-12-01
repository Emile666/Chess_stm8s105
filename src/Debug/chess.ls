   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2524                     .bit:	section	.data,bit
2525  0000               _move_black_received:
2526  0000 00            	dc.b	0
2527                     	bsct
2528  0000               _chess_std:
2529  0000 00            	dc.b	0
2530                     	switch	.bit
2531  0001               _new_game:
2532  0001 00            	dc.b	0
2533  0002               _pause_game:
2534  0002 00            	dc.b	0
2577                     ; 41 uint8_t position_to_board_nr(char *s)
2577                     ; 42 {
2579                     	switch	.text
2580  0000               _position_to_board_nr:
2582  0000 88            	push	a
2583       00000001      OFST:	set	1
2586                     ; 43 	return tolower(s[0]) - 'a' + ((s[1] - '1') << 3);
2588  0001 e601          	ld	a,(1,x)
2589  0003 48            	sll	a
2590  0004 48            	sll	a
2591  0005 48            	sll	a
2592  0006 a088          	sub	a,#136
2593  0008 6b01          	ld	(OFST+0,sp),a
2595  000a f6            	ld	a,(x)
2596  000b cd0000        	call	_tolower
2598  000e a061          	sub	a,#97
2599  0010 1b01          	add	a,(OFST+0,sp)
2602  0012 5b01          	addw	sp,#1
2603  0014 81            	ret
2648                     ; 46 void board_nr_to_position(char *s, uint8_t nr)
2648                     ; 47 {
2649                     	switch	.text
2650  0015               _board_nr_to_position:
2652  0015 89            	pushw	x
2653       00000000      OFST:	set	0
2656                     ; 48 	s[0] = 'a' + (nr % 8);
2658  0016 7b05          	ld	a,(OFST+5,sp)
2659  0018 a407          	and	a,#7
2660  001a ab61          	add	a,#97
2661  001c 1e01          	ldw	x,(OFST+1,sp)
2662  001e f7            	ld	(x),a
2663                     ; 49 	s[1] = '1' + (nr >> 3);
2665  001f 7b05          	ld	a,(OFST+5,sp)
2666  0021 44            	srl	a
2667  0022 44            	srl	a
2668  0023 44            	srl	a
2669  0024 ab31          	add	a,#49
2670  0026 1e01          	ldw	x,(OFST+1,sp)
2671  0028 e701          	ld	(1,x),a
2672                     ; 50 	s[2] = '\0';
2674  002a 1e01          	ldw	x,(OFST+1,sp)
2675  002c 6f02          	clr	(2,x)
2676                     ; 51 } // board_nr_to_position()
2679  002e 85            	popw	x
2680  002f 81            	ret
2744                     ; 55 uint8_t piece_detect_move(uint8_t *lifted)
2744                     ; 56 {
2745                     	switch	.text
2746  0030               _piece_detect_move:
2748  0030 89            	pushw	x
2749  0031 5203          	subw	sp,#3
2750       00000003      OFST:	set	3
2753                     ; 57     uint8_t i      = 0;
2755  0033 0f02          	clr	(OFST-1,sp)
2757                     ; 58 	uint8_t row    = 0; 
2759                     ; 59 	uint8_t square = 0;
2761  0035 0f01          	clr	(OFST-2,sp)
2763  0037               L3271:
2764                     ; 63 		row = (reed_relays[i] ^ reed_relays_old[i]);
2766  0037 7b02          	ld	a,(OFST-1,sp)
2767  0039 5f            	clrw	x
2768  003a 97            	ld	xl,a
2769  003b 7b02          	ld	a,(OFST-1,sp)
2770  003d 905f          	clrw	y
2771  003f 9097          	ld	yl,a
2772  0041 90e604        	ld	a,(_reed_relays_old,y)
2773  0044 e800          	xor	a,(_reed_relays,x)
2774  0046 6b03          	ld	(OFST+0,sp),a
2776                     ; 64 		i++;
2778  0048 0c02          	inc	(OFST-1,sp)
2780                     ; 65 	} while (!row && (i < 8));
2782  004a 0d03          	tnz	(OFST+0,sp)
2783  004c 2606          	jrne	L1371
2785  004e 7b02          	ld	a,(OFST-1,sp)
2786  0050 a108          	cp	a,#8
2787  0052 25e3          	jrult	L3271
2788  0054               L1371:
2789                     ; 66 	if (row)
2791  0054 0d03          	tnz	(OFST+0,sp)
2792  0056 272c          	jreq	L3371
2793                     ; 68 		*lifted = ((reed_relays_old[--i] & row) > 0); // piece is lifted
2795  0058 0a02          	dec	(OFST-1,sp)
2797  005a 7b02          	ld	a,(OFST-1,sp)
2798  005c 5f            	clrw	x
2799  005d 97            	ld	xl,a
2800  005e e604          	ld	a,(_reed_relays_old,x)
2801  0060 1503          	bcp	a,(OFST+0,sp)
2802  0062 2704          	jreq	L21
2803  0064 a601          	ld	a,#1
2804  0066 2001          	jra	L41
2805  0068               L21:
2806  0068 4f            	clr	a
2807  0069               L41:
2808  0069 1e04          	ldw	x,(OFST+1,sp)
2809  006b f7            	ld	(x),a
2810                     ; 69 		row >>= 1;
2812  006c 0403          	srl	(OFST+0,sp)
2815  006e 2008          	jra	L7371
2816  0070               L5371:
2817                     ; 72 			row >>= 1;
2819  0070 0403          	srl	(OFST+0,sp)
2821                     ; 73 			square += 8;
2823  0072 7b01          	ld	a,(OFST-2,sp)
2824  0074 ab08          	add	a,#8
2825  0076 6b01          	ld	(OFST-2,sp),a
2827  0078               L7371:
2828                     ; 70 		while (row)
2830  0078 0d03          	tnz	(OFST+0,sp)
2831  007a 26f4          	jrne	L5371
2832                     ; 75 		square += i;
2834  007c 7b01          	ld	a,(OFST-2,sp)
2835  007e 1b02          	add	a,(OFST-1,sp)
2836  0080 6b01          	ld	(OFST-2,sp),a
2839  0082 2004          	jra	L3471
2840  0084               L3371:
2841                     ; 77 	else square = NO_SQUARE;
2843  0084 a640          	ld	a,#64
2844  0086 6b01          	ld	(OFST-2,sp),a
2846  0088               L3471:
2847                     ; 78 	return square;
2849  0088 7b01          	ld	a,(OFST-2,sp)
2852  008a 5b05          	addw	sp,#5
2853  008c 81            	ret
2898                     ; 81 bool is_black_piece(uint8_t sq_nr)
2898                     ; 82 {
2899                     	switch	.text
2900  008d               _is_black_piece:
2902  008d 88            	push	a
2903       00000001      OFST:	set	1
2906                     ; 83 	uint8_t p = table[sq_nr];
2908  008e 5f            	clrw	x
2909  008f 97            	ld	xl,a
2910  0090 d60000        	ld	a,(_table,x)
2911  0093 6b01          	ld	(OFST+0,sp),a
2913                     ; 85 	if ((p != EMPTY) && ((p & 0x01) == 0x00))
2915  0095 0d01          	tnz	(OFST+0,sp)
2916  0097 270b          	jreq	L7671
2918  0099 7b01          	ld	a,(OFST+0,sp)
2919  009b a501          	bcp	a,#1
2920  009d 2605          	jrne	L7671
2921                     ; 86 		 return true;
2923  009f a601          	ld	a,#1
2926  00a1 5b01          	addw	sp,#1
2927  00a3 81            	ret
2928  00a4               L7671:
2929                     ; 87 	else return false;
2931  00a4 4f            	clr	a
2934  00a5 5b01          	addw	sp,#1
2935  00a7 81            	ret
2980                     ; 90 bool is_white_piece(uint8_t sq_nr)
2980                     ; 91 {
2981                     	switch	.text
2982  00a8               _is_white_piece:
2984  00a8 88            	push	a
2985       00000001      OFST:	set	1
2988                     ; 92 	uint8_t p = table[sq_nr];
2990  00a9 5f            	clrw	x
2991  00aa 97            	ld	xl,a
2992  00ab d60000        	ld	a,(_table,x)
2993  00ae 6b01          	ld	(OFST+0,sp),a
2995                     ; 94 	if ((p != EMPTY) && ((p & 0x01) == 0x01))
2997  00b0 0d01          	tnz	(OFST+0,sp)
2998  00b2 270d          	jreq	L5102
3000  00b4 7b01          	ld	a,(OFST+0,sp)
3001  00b6 a401          	and	a,#1
3002  00b8 a101          	cp	a,#1
3003  00ba 2605          	jrne	L5102
3004                     ; 95 		 return true;
3006  00bc a601          	ld	a,#1
3009  00be 5b01          	addw	sp,#1
3010  00c0 81            	ret
3011  00c1               L5102:
3012                     ; 96 	else return false;
3014  00c1 4f            	clr	a
3017  00c2 5b01          	addw	sp,#1
3018  00c4 81            	ret
3073                     ; 100 bool is_en_passant_white(uint8_t sq1, uint8_t sq2)
3073                     ; 101 {
3074                     	switch	.text
3075  00c5               _is_en_passant_white:
3077  00c5 89            	pushw	x
3078  00c6 88            	push	a
3079       00000001      OFST:	set	1
3082                     ; 102     uint8_t sq3 = 0;
3084                     ; 104 	if (sq1 + 7 == sq2)      sq3 = sq1 - 1;
3086  00c7 9f            	ld	a,xl
3087  00c8 5f            	clrw	x
3088  00c9 97            	ld	xl,a
3089  00ca 7b02          	ld	a,(OFST+1,sp)
3090  00cc 905f          	clrw	y
3091  00ce 9097          	ld	yl,a
3092  00d0 72a90007      	addw	y,#7
3093  00d4 bf00          	ldw	c_x,x
3094  00d6 90b300        	cpw	y,c_x
3095  00d9 2607          	jrne	L7402
3098  00db 7b02          	ld	a,(OFST+1,sp)
3099  00dd 4a            	dec	a
3100  00de 6b01          	ld	(OFST+0,sp),a
3103  00e0 201a          	jra	L1502
3104  00e2               L7402:
3105                     ; 105 	else if (sq1 + 9 == sq2) sq3 = sq1 + 1;
3107  00e2 7b03          	ld	a,(OFST+2,sp)
3108  00e4 5f            	clrw	x
3109  00e5 97            	ld	xl,a
3110  00e6 7b02          	ld	a,(OFST+1,sp)
3111  00e8 905f          	clrw	y
3112  00ea 9097          	ld	yl,a
3113  00ec 72a90009      	addw	y,#9
3114  00f0 bf00          	ldw	c_x,x
3115  00f2 90b300        	cpw	y,c_x
3116  00f5 2629          	jrne	L3502
3119  00f7 7b02          	ld	a,(OFST+1,sp)
3120  00f9 4c            	inc	a
3121  00fa 6b01          	ld	(OFST+0,sp),a
3124  00fc               L1502:
3125                     ; 108 	if ((table[sq1] == PAWN_WHITE) && (table[sq2] == EMPTY) &&
3125                     ; 109 	    (table[sq3] == PAWN_BLACK))
3127  00fc 7b02          	ld	a,(OFST+1,sp)
3128  00fe 5f            	clrw	x
3129  00ff 97            	ld	xl,a
3130  0100 d60000        	ld	a,(_table,x)
3131  0103 a101          	cp	a,#1
3132  0105 261d          	jrne	L7502
3134  0107 7b03          	ld	a,(OFST+2,sp)
3135  0109 5f            	clrw	x
3136  010a 97            	ld	xl,a
3137  010b 724d0000      	tnz	(_table,x)
3138  010f 2613          	jrne	L7502
3140  0111 7b01          	ld	a,(OFST+0,sp)
3141  0113 5f            	clrw	x
3142  0114 97            	ld	xl,a
3143  0115 d60000        	ld	a,(_table,x)
3144  0118 a102          	cp	a,#2
3145  011a 2608          	jrne	L7502
3146                     ; 110          return true;
3148  011c a601          	ld	a,#1
3150  011e 2001          	jra	L42
3151  0120               L3502:
3152                     ; 106 	else return false;
3154  0120 4f            	clr	a
3156  0121               L42:
3158  0121 5b03          	addw	sp,#3
3159  0123 81            	ret
3160  0124               L7502:
3161                     ; 111     else return false;
3163  0124 4f            	clr	a
3165  0125 20fa          	jra	L42
3220                     ; 115 bool is_en_passant_black(uint8_t sq1, uint8_t sq2)
3220                     ; 116 {
3221                     	switch	.text
3222  0127               _is_en_passant_black:
3224  0127 89            	pushw	x
3225  0128 88            	push	a
3226       00000001      OFST:	set	1
3229                     ; 117 	uint8_t sq3 = 0;
3231                     ; 119 	if (sq1 - 7 == sq2)      sq3 = sq1 + 1;
3233  0129 9e            	ld	a,xh
3234  012a 5f            	clrw	x
3235  012b 97            	ld	xl,a
3236  012c 1d0007        	subw	x,#7
3237  012f 7b03          	ld	a,(OFST+2,sp)
3238  0131 905f          	clrw	y
3239  0133 9097          	ld	yl,a
3240  0135 90bf00        	ldw	c_y,y
3241  0138 b300          	cpw	x,c_y
3242  013a 2607          	jrne	L1112
3245  013c 7b02          	ld	a,(OFST+1,sp)
3246  013e 4c            	inc	a
3247  013f 6b01          	ld	(OFST+0,sp),a
3250  0141 2019          	jra	L3112
3251  0143               L1112:
3252                     ; 120 	else if (sq1 - 9 == sq2) sq3 = sq1 - 1;
3254  0143 7b02          	ld	a,(OFST+1,sp)
3255  0145 5f            	clrw	x
3256  0146 97            	ld	xl,a
3257  0147 1d0009        	subw	x,#9
3258  014a 7b03          	ld	a,(OFST+2,sp)
3259  014c 905f          	clrw	y
3260  014e 9097          	ld	yl,a
3261  0150 90bf00        	ldw	c_y,y
3262  0153 b300          	cpw	x,c_y
3263  0155 2629          	jrne	L5112
3266  0157 7b02          	ld	a,(OFST+1,sp)
3267  0159 4a            	dec	a
3268  015a 6b01          	ld	(OFST+0,sp),a
3271  015c               L3112:
3272                     ; 123 	if ((table[sq1] == PAWN_BLACK) && (table[sq2] == EMPTY) && 
3272                     ; 124 	    (table[sq3] == PAWN_WHITE))
3274  015c 7b02          	ld	a,(OFST+1,sp)
3275  015e 5f            	clrw	x
3276  015f 97            	ld	xl,a
3277  0160 d60000        	ld	a,(_table,x)
3278  0163 a102          	cp	a,#2
3279  0165 261d          	jrne	L1212
3281  0167 7b03          	ld	a,(OFST+2,sp)
3282  0169 5f            	clrw	x
3283  016a 97            	ld	xl,a
3284  016b 724d0000      	tnz	(_table,x)
3285  016f 2613          	jrne	L1212
3287  0171 7b01          	ld	a,(OFST+0,sp)
3288  0173 5f            	clrw	x
3289  0174 97            	ld	xl,a
3290  0175 d60000        	ld	a,(_table,x)
3291  0178 a101          	cp	a,#1
3292  017a 2608          	jrne	L1212
3293                     ; 125 	     return true;
3295  017c a601          	ld	a,#1
3297  017e 2001          	jra	L03
3298  0180               L5112:
3299                     ; 121 	else return false;
3301  0180 4f            	clr	a
3303  0181               L03:
3305  0181 5b03          	addw	sp,#3
3306  0183 81            	ret
3307  0184               L1212:
3308                     ; 126 	else return false;
3310  0184 4f            	clr	a
3312  0185 20fa          	jra	L03
3367                     ; 129 bool is_castling_white(uint8_t sq1, uint8_t sq2)
3367                     ; 130 {
3368                     	switch	.text
3369  0187               _is_castling_white:
3371  0187 89            	pushw	x
3372  0188 88            	push	a
3373       00000001      OFST:	set	1
3376                     ; 131 	bool ret = false;
3378  0189 0f01          	clr	(OFST+0,sp)
3380                     ; 133 	ret = (table[sq1] == KING_WHITE) && (table[sq2] == EMPTY) && 
3380                     ; 134 	      ((sq1 == 4) && ((sq2 == 2) || (sq2 == 6))); 
3382  018b 9e            	ld	a,xh
3383  018c 5f            	clrw	x
3384  018d 97            	ld	xl,a
3385  018e d60000        	ld	a,(_table,x)
3386  0191 a10b          	cp	a,#11
3387  0193 2621          	jrne	L43
3388  0195 7b03          	ld	a,(OFST+2,sp)
3389  0197 5f            	clrw	x
3390  0198 97            	ld	xl,a
3391  0199 724d0000      	tnz	(_table,x)
3392  019d 2617          	jrne	L43
3393  019f 7b02          	ld	a,(OFST+1,sp)
3394  01a1 a104          	cp	a,#4
3395  01a3 2611          	jrne	L43
3396  01a5 7b03          	ld	a,(OFST+2,sp)
3397  01a7 a102          	cp	a,#2
3398  01a9 2706          	jreq	L63
3399  01ab 7b03          	ld	a,(OFST+2,sp)
3400  01ad a106          	cp	a,#6
3401  01af 2605          	jrne	L43
3402  01b1               L63:
3403  01b1 ae0001        	ldw	x,#1
3404  01b4 2001          	jra	L04
3405  01b6               L43:
3406  01b6 5f            	clrw	x
3407  01b7               L04:
3408  01b7 01            	rrwa	x,a
3409  01b8 6b01          	ld	(OFST+0,sp),a
3410  01ba 02            	rlwa	x,a
3412                     ; 135 	return ret;
3414  01bb 0d01          	tnz	(OFST+0,sp)
3415  01bd 2704          	jreq	L24
3416  01bf a601          	ld	a,#1
3417  01c1 2001          	jra	L44
3418  01c3               L24:
3419  01c3 4f            	clr	a
3420  01c4               L44:
3423  01c4 5b03          	addw	sp,#3
3424  01c6 81            	ret
3493                     ; 139 uint8_t eval_black_move(uint8_t *sqb, uint8_t *sqe)
3493                     ; 140 {
3494                     	switch	.text
3495  01c7               _eval_black_move:
3497  01c7 89            	pushw	x
3498  01c8 520b          	subw	sp,#11
3499       0000000b      OFST:	set	11
3502                     ; 144     if (!strncmp(move_black_str,"0-0-0",5) ||
3502                     ; 145         !strncmp(move_black_str,"O-O-O",5) ||
3502                     ; 146         !strncmp(move_black_str,"o-o-o",5))
3504  01ca ae0005        	ldw	x,#5
3505  01cd 89            	pushw	x
3506  01ce ae003e        	ldw	x,#L1122
3507  01d1 89            	pushw	x
3508  01d2 ae000c        	ldw	x,#_move_black_str
3509  01d5 cd0000        	call	_strncmp
3511  01d8 5b04          	addw	sp,#4
3512  01da a30000        	cpw	x,#0
3513  01dd 272a          	jreq	L7022
3515  01df ae0005        	ldw	x,#5
3516  01e2 89            	pushw	x
3517  01e3 ae0038        	ldw	x,#L5122
3518  01e6 89            	pushw	x
3519  01e7 ae000c        	ldw	x,#_move_black_str
3520  01ea cd0000        	call	_strncmp
3522  01ed 5b04          	addw	sp,#4
3523  01ef a30000        	cpw	x,#0
3524  01f2 2715          	jreq	L7022
3526  01f4 ae0005        	ldw	x,#5
3527  01f7 89            	pushw	x
3528  01f8 ae0032        	ldw	x,#L7122
3529  01fb 89            	pushw	x
3530  01fc ae000c        	ldw	x,#_move_black_str
3531  01ff cd0000        	call	_strncmp
3533  0202 5b04          	addw	sp,#4
3534  0204 a30000        	cpw	x,#0
3535  0207 2613          	jrne	L5022
3536  0209               L7022:
3537                     ; 148         *sqb = 60;
3539  0209 1e0c          	ldw	x,(OFST+1,sp)
3540  020b a63c          	ld	a,#60
3541  020d f7            	ld	(x),a
3542                     ; 149         *sqe = 58;
3544  020e 1e10          	ldw	x,(OFST+5,sp)
3545  0210 a63a          	ld	a,#58
3546  0212 f7            	ld	(x),a
3547                     ; 150         retv = CHESS_BLACK_CASTLING;
3549  0213 a60f          	ld	a,#15
3550  0215 6b01          	ld	(OFST-10,sp),a
3553  0217               L1222:
3554                     ; 179     return retv;
3556  0217 7b01          	ld	a,(OFST-10,sp)
3559  0219 5b0d          	addw	sp,#13
3560  021b 81            	ret
3561  021c               L5022:
3562                     ; 152     else if (!strncmp(move_black_str,"0-0",3) ||
3562                     ; 153              !strncmp(move_black_str,"O-O",3) ||
3562                     ; 154              !strncmp(move_black_str,"o-o",3))
3564  021c ae0003        	ldw	x,#3
3565  021f 89            	pushw	x
3566  0220 ae002e        	ldw	x,#L7222
3567  0223 89            	pushw	x
3568  0224 ae000c        	ldw	x,#_move_black_str
3569  0227 cd0000        	call	_strncmp
3571  022a 5b04          	addw	sp,#4
3572  022c a30000        	cpw	x,#0
3573  022f 272a          	jreq	L5222
3575  0231 ae0003        	ldw	x,#3
3576  0234 89            	pushw	x
3577  0235 ae002a        	ldw	x,#L3322
3578  0238 89            	pushw	x
3579  0239 ae000c        	ldw	x,#_move_black_str
3580  023c cd0000        	call	_strncmp
3582  023f 5b04          	addw	sp,#4
3583  0241 a30000        	cpw	x,#0
3584  0244 2715          	jreq	L5222
3586  0246 ae0003        	ldw	x,#3
3587  0249 89            	pushw	x
3588  024a ae0026        	ldw	x,#L5322
3589  024d 89            	pushw	x
3590  024e ae000c        	ldw	x,#_move_black_str
3591  0251 cd0000        	call	_strncmp
3593  0254 5b04          	addw	sp,#4
3594  0256 a30000        	cpw	x,#0
3595  0259 2610          	jrne	L3222
3596  025b               L5222:
3597                     ; 156         *sqb = 60;
3599  025b 1e0c          	ldw	x,(OFST+1,sp)
3600  025d a63c          	ld	a,#60
3601  025f f7            	ld	(x),a
3602                     ; 157         *sqe = 62;
3604  0260 1e10          	ldw	x,(OFST+5,sp)
3605  0262 a63e          	ld	a,#62
3606  0264 f7            	ld	(x),a
3607                     ; 158 	    retv = CHESS_BLACK_CASTLING;
3609  0265 a60f          	ld	a,#15
3610  0267 6b01          	ld	(OFST-10,sp),a
3613  0269 20ac          	jra	L1222
3614  026b               L3222:
3615                     ; 162 		s[0] = move_black_str[0];
3617  026b b60c          	ld	a,_move_black_str
3618  026d 6b02          	ld	(OFST-9,sp),a
3620                     ; 163 		s[1] = move_black_str[1];
3622  026f b60d          	ld	a,_move_black_str+1
3623  0271 6b03          	ld	(OFST-8,sp),a
3625                     ; 164 		s[2] = '\0';
3627  0273 0f04          	clr	(OFST-7,sp)
3629                     ; 165 		*sqb = position_to_board_nr(s);
3631  0275 96            	ldw	x,sp
3632  0276 1c0002        	addw	x,#OFST-9
3633  0279 cd0000        	call	_position_to_board_nr
3635  027c 1e0c          	ldw	x,(OFST+1,sp)
3636  027e f7            	ld	(x),a
3637                     ; 166 		s[0] = move_black_str[2];
3639  027f b60e          	ld	a,_move_black_str+2
3640  0281 6b02          	ld	(OFST-9,sp),a
3642                     ; 167 		s[1] = move_black_str[3];
3644  0283 b60f          	ld	a,_move_black_str+3
3645  0285 6b03          	ld	(OFST-8,sp),a
3647                     ; 168 		s[2] = '\0';
3649  0287 0f04          	clr	(OFST-7,sp)
3651                     ; 169 		*sqe = position_to_board_nr(s);
3653  0289 96            	ldw	x,sp
3654  028a 1c0002        	addw	x,#OFST-9
3655  028d cd0000        	call	_position_to_board_nr
3657  0290 1e10          	ldw	x,(OFST+5,sp)
3658  0292 f7            	ld	(x),a
3659                     ; 170 		if ((*sqb == 60) && (table[60] == KING_BLACK))
3661  0293 1e0c          	ldw	x,(OFST+1,sp)
3662  0295 f6            	ld	a,(x)
3663  0296 a13c          	cp	a,#60
3664  0298 2625          	jrne	L1422
3666  029a c6003c        	ld	a,_table+60
3667  029d a10c          	cp	a,#12
3668  029f 261e          	jrne	L1422
3669                     ; 172 			if ((*sqe == 62) || (*sqe == 58))
3671  02a1 1e10          	ldw	x,(OFST+5,sp)
3672  02a3 f6            	ld	a,(x)
3673  02a4 a13e          	cp	a,#62
3674  02a6 2707          	jreq	L5422
3676  02a8 1e10          	ldw	x,(OFST+5,sp)
3677  02aa f6            	ld	a,(x)
3678  02ab a13a          	cp	a,#58
3679  02ad 2608          	jrne	L3422
3680  02af               L5422:
3681                     ; 173                  retv = CHESS_BLACK_CASTLING;
3683  02af a60f          	ld	a,#15
3684  02b1 6b01          	ld	(OFST-10,sp),a
3687  02b3 ac170217      	jpf	L1222
3688  02b7               L3422:
3689                     ; 174 			else retv = CHESS_BLACK2; // normal move
3691  02b7 a60a          	ld	a,#10
3692  02b9 6b01          	ld	(OFST-10,sp),a
3694  02bb ac170217      	jpf	L1222
3695  02bf               L1422:
3696                     ; 176 		else if (is_en_passant_black(*sqb,*sqe)) retv = CHESS_BLACK_EP;
3698  02bf 1e10          	ldw	x,(OFST+5,sp)
3699  02c1 f6            	ld	a,(x)
3700  02c2 97            	ld	xl,a
3701  02c3 160c          	ldw	y,(OFST+1,sp)
3702  02c5 90f6          	ld	a,(y)
3703  02c7 95            	ld	xh,a
3704  02c8 cd0127        	call	_is_en_passant_black
3706  02cb 4d            	tnz	a
3707  02cc 2708          	jreq	L3522
3710  02ce a60c          	ld	a,#12
3711  02d0 6b01          	ld	(OFST-10,sp),a
3714  02d2 ac170217      	jpf	L1222
3715  02d6               L3522:
3716                     ; 177 		else retv = CHESS_BLACK2; // normal move
3718  02d6 a60a          	ld	a,#10
3719  02d8 6b01          	ld	(OFST-10,sp),a
3721  02da ac170217      	jpf	L1222
3811                     .const:	section	.text
3812  0000               L06:
3813  0000 02f1          	dc.w	L7522
3814  0002 03a1          	dc.w	L1622
3815  0004 040c          	dc.w	L3622
3816  0006 0446          	dc.w	L5622
3817  0008 04c4          	dc.w	L7622
3818  000a 0500          	dc.w	L1722
3819  000c 0524          	dc.w	L3722
3820  000e 056b          	dc.w	L5722
3821  0010 05a6          	dc.w	L7722
3822  0012 05bc          	dc.w	L1032
3823  0014 05f2          	dc.w	L3032
3824  0016 0615          	dc.w	L5032
3825  0018 06d8          	dc.w	L3132
3826  001a 06fb          	dc.w	L5132
3827  001c 0733          	dc.w	L7132
3828  001e 065a          	dc.w	L7032
3829  0020 067d          	dc.w	L1132
3830  0022 079b          	dc.w	L3632
3831  0024 078c          	dc.w	L1232
3832                     ; 183 void chess_main(void)
3832                     ; 184 {
3833                     	switch	.text
3834  02de               _chess_main:
3836  02de 5205          	subw	sp,#5
3837       00000005      OFST:	set	5
3840                     ; 189 	switch (chess_std)
3842  02e0 b600          	ld	a,_chess_std
3844                     ; 408 			break;
3845  02e2 a113          	cp	a,#19
3846  02e4 2407          	jruge	L65
3847  02e6 5f            	clrw	x
3848  02e7 97            	ld	xl,a
3849  02e8 58            	sllw	x
3850  02e9 de0000        	ldw	x,(L06,x)
3851  02ec fc            	jp	(x)
3852  02ed               L65:
3853  02ed ac9b079b      	jpf	L3632
3854  02f1               L7522:
3855                     ; 191 		case CHESS_INIT:
3855                     ; 192 			// All lights off
3855                     ; 193 			// PL1 and PL2 LEDs off
3855                     ; 194 			if (new_game)
3857                     	btst	_new_game
3858  02f6 2503          	jrult	L26
3859  02f8 cc079b        	jp	L3632
3860  02fb               L26:
3861                     ; 196 				table[0] = table[7] = ROOK_WHITE;
3863  02fb 35030007      	mov	_table+7,#3
3864  02ff 5500070000    	mov	_table,_table+7
3865                     ; 197                 table[1] = table[6] = KNIGHT_WHITE;
3867  0304 35070006      	mov	_table+6,#7
3868  0308 5500060001    	mov	_table+1,_table+6
3869                     ; 198                 table[2] = table[5] = BISHOP_WHITE;
3871  030d 35050005      	mov	_table+5,#5
3872  0311 5500050002    	mov	_table+2,_table+5
3873                     ; 199                 table[3] = QUEEN_WHITE; table[4] = KING_WHITE;
3875  0316 35090003      	mov	_table+3,#9
3878  031a 350b0004      	mov	_table+4,#11
3879                     ; 200 				for (i = 8 ; i < 16; i++) table[i] = PAWN_WHITE;
3881  031e a608          	ld	a,#8
3882  0320 6b05          	ld	(OFST+0,sp),a
3884  0322               L7632:
3887  0322 7b05          	ld	a,(OFST+0,sp)
3888  0324 5f            	clrw	x
3889  0325 97            	ld	xl,a
3890  0326 a601          	ld	a,#1
3891  0328 d70000        	ld	(_table,x),a
3894  032b 0c05          	inc	(OFST+0,sp)
3898  032d 7b05          	ld	a,(OFST+0,sp)
3899  032f a110          	cp	a,#16
3900  0331 25ef          	jrult	L7632
3901                     ; 201 				for (i = 16; i < 48; i++) table[i] = EMPTY;
3903  0333 a610          	ld	a,#16
3904  0335 6b05          	ld	(OFST+0,sp),a
3906  0337               L5732:
3909  0337 7b05          	ld	a,(OFST+0,sp)
3910  0339 5f            	clrw	x
3911  033a 97            	ld	xl,a
3912  033b 724f0000      	clr	(_table,x)
3915  033f 0c05          	inc	(OFST+0,sp)
3919  0341 7b05          	ld	a,(OFST+0,sp)
3920  0343 a130          	cp	a,#48
3921  0345 25f0          	jrult	L5732
3922                     ; 202 				for (i = 48; i < 56; i++) table[i] = PAWN_BLACK;
3924  0347 a630          	ld	a,#48
3925  0349 6b05          	ld	(OFST+0,sp),a
3927  034b               L3042:
3930  034b 7b05          	ld	a,(OFST+0,sp)
3931  034d 5f            	clrw	x
3932  034e 97            	ld	xl,a
3933  034f a602          	ld	a,#2
3934  0351 d70000        	ld	(_table,x),a
3937  0354 0c05          	inc	(OFST+0,sp)
3941  0356 7b05          	ld	a,(OFST+0,sp)
3942  0358 a138          	cp	a,#56
3943  035a 25ef          	jrult	L3042
3944                     ; 203 				table[56] = table[63] = ROOK_BLACK;
3946  035c 3504003f      	mov	_table+63,#4
3947  0360 55003f0038    	mov	_table+56,_table+63
3948                     ; 204                 table[57] = table[62] = KNIGHT_BLACK;
3950  0365 3508003e      	mov	_table+62,#8
3951  0369 55003e0039    	mov	_table+57,_table+62
3952                     ; 205                 table[58] = table[61] = BISHOP_BLACK;
3954  036e 3506003d      	mov	_table+61,#6
3955  0372 55003d003a    	mov	_table+58,_table+61
3956                     ; 206                 table[59] = QUEEN_BLACK; table[60] = KING_BLACK;
3958  0377 350a003b      	mov	_table+59,#10
3961  037b 350c003c      	mov	_table+60,#12
3962                     ; 207 				for (i = 0; i < 8; i++)
3964  037f 0f05          	clr	(OFST+0,sp)
3966  0381               L1142:
3967                     ; 209 					max7219_write((MAX7219_REG_DIG0 + (i << 8)) | 0xC3);
3969  0381 7b05          	ld	a,(OFST+0,sp)
3970  0383 5f            	clrw	x
3971  0384 97            	ld	xl,a
3972  0385 4f            	clr	a
3973  0386 02            	rlwa	x,a
3974  0387 1c0100        	addw	x,#256
3975  038a 01            	rrwa	x,a
3976  038b aac3          	or	a,#195
3977  038d 02            	rlwa	x,a
3978  038e cd0000        	call	_max7219_write
3980                     ; 207 				for (i = 0; i < 8; i++)
3982  0391 0c05          	inc	(OFST+0,sp)
3986  0393 7b05          	ld	a,(OFST+0,sp)
3987  0395 a108          	cp	a,#8
3988  0397 25e8          	jrult	L1142
3989                     ; 211         			chess_std = CHESS_NEW_GAME;
3991  0399 35010000      	mov	_chess_std,#1
3992  039d ac9b079b      	jpf	L3632
3993  03a1               L1622:
3994                     ; 214 		case CHESS_NEW_GAME:
3994                     ; 215 			clk1.active     = false; 
3996  03a1 72110002      	bres	_clk1+2,#0
3997                     ; 216 			clk2.active     = false; 
3999  03a5 72110002      	bres	_clk2+2,#0
4000                     ; 217 			all_set         = false;
4002  03a9 0f03          	clr	(OFST-2,sp)
4004                     ; 218             moves_half_cntr = 0; // move counter
4006  03ab 3f00          	clr	_moves_half_cntr
4007                     ; 219 			i = 0;
4009  03ad 0f05          	clr	(OFST+0,sp)
4012  03af 2018          	jra	L3242
4013  03b1               L7142:
4014                     ; 222 				all_set = (reed_relays[i++] == 0xC3);
4016  03b1 7b05          	ld	a,(OFST+0,sp)
4017  03b3 97            	ld	xl,a
4018  03b4 0c05          	inc	(OFST+0,sp)
4020  03b6 9f            	ld	a,xl
4021  03b7 5f            	clrw	x
4022  03b8 97            	ld	xl,a
4023  03b9 e600          	ld	a,(_reed_relays,x)
4024  03bb a1c3          	cp	a,#195
4025  03bd 2605          	jrne	L25
4026  03bf ae0001        	ldw	x,#1
4027  03c2 2001          	jra	L45
4028  03c4               L25:
4029  03c4 5f            	clrw	x
4030  03c5               L45:
4031  03c5 01            	rrwa	x,a
4032  03c6 6b03          	ld	(OFST-2,sp),a
4033  03c8 02            	rlwa	x,a
4035  03c9               L3242:
4036                     ; 220 			while ((i < 8) && !all_set)
4038  03c9 7b05          	ld	a,(OFST+0,sp)
4039  03cb a108          	cp	a,#8
4040  03cd 2404          	jruge	L7242
4042  03cf 0d03          	tnz	(OFST-2,sp)
4043  03d1 27de          	jreq	L7142
4044  03d3               L7242:
4045                     ; 224 			for (i = 0; i < 8; i++) 
4047  03d3 0f05          	clr	(OFST+0,sp)
4049  03d5               L1342:
4050                     ; 226 				max7219_write((MAX7219_REG_DIG0 + (i << 8)) | (reed_relays[i] ^ 0xC3));
4052  03d5 7b05          	ld	a,(OFST+0,sp)
4053  03d7 5f            	clrw	x
4054  03d8 97            	ld	xl,a
4055  03d9 e600          	ld	a,(_reed_relays,x)
4056  03db 5f            	clrw	x
4057  03dc a8c3          	xor	a,#195
4058  03de 02            	rlwa	x,a
4059  03df 1f01          	ldw	(OFST-4,sp),x
4060  03e1 01            	rrwa	x,a
4062  03e2 7b05          	ld	a,(OFST+0,sp)
4063  03e4 5f            	clrw	x
4064  03e5 97            	ld	xl,a
4065  03e6 4f            	clr	a
4066  03e7 02            	rlwa	x,a
4067  03e8 1c0100        	addw	x,#256
4068  03eb 01            	rrwa	x,a
4069  03ec 1a02          	or	a,(OFST-3,sp)
4070  03ee 01            	rrwa	x,a
4071  03ef 1a01          	or	a,(OFST-4,sp)
4072  03f1 01            	rrwa	x,a
4073  03f2 cd0000        	call	_max7219_write
4075                     ; 224 			for (i = 0; i < 8; i++) 
4077  03f5 0c05          	inc	(OFST+0,sp)
4081  03f7 7b05          	ld	a,(OFST+0,sp)
4082  03f9 a108          	cp	a,#8
4083  03fb 25d8          	jrult	L1342
4084                     ; 228 			if (all_set) chess_std = CHESS_WHITE;
4086  03fd 0d03          	tnz	(OFST-2,sp)
4087  03ff 2603          	jrne	L46
4088  0401 cc079b        	jp	L3632
4089  0404               L46:
4092  0404 35020000      	mov	_chess_std,#2
4093  0408 ac9b079b      	jpf	L3632
4094  040c               L3622:
4095                     ; 231 		case CHESS_WHITE:
4095                     ; 232 			clk1.active = true;
4097  040c 72100002      	bset	_clk1+2,#0
4098                     ; 233 			clk2.active = false; 
4100  0410 72110002      	bres	_clk2+2,#0
4101                     ; 234 			if (pause_game) chess_std = CHESS_PAUSE_WHITE;
4103                     	btst	_pause_game
4104  0419 2408          	jruge	L1442
4107  041b 35080000      	mov	_chess_std,#8
4109  041f ac9b079b      	jpf	L3632
4110  0423               L1442:
4111                     ; 235 			else if ((sq_begin = piece_detect_move(&lifted)) != NO_SQUARE) 
4113  0423 96            	ldw	x,sp
4114  0424 1c0004        	addw	x,#OFST-1
4115  0427 cd0030        	call	_piece_detect_move
4117  042a b702          	ld	_sq_begin,a
4118  042c b602          	ld	a,_sq_begin
4119  042e a140          	cp	a,#64
4120  0430 2603          	jrne	L66
4121  0432 cc079b        	jp	L3632
4122  0435               L66:
4123                     ; 237                 piece_picked = table[sq_begin]; // which piece is picked up?
4125  0435 b602          	ld	a,_sq_begin
4126  0437 5f            	clrw	x
4127  0438 97            	ld	xl,a
4128  0439 d60000        	ld	a,(_table,x)
4129  043c b703          	ld	_piece_picked,a
4130                     ; 238 				chess_std = CHESS_WHITE2;
4132  043e 35030000      	mov	_chess_std,#3
4133  0442 ac9b079b      	jpf	L3632
4134  0446               L5622:
4135                     ; 241 		case CHESS_WHITE2: // A piece was lifted, now check for another piece lifted or a piece returned
4135                     ; 242 			if ((sq_end = piece_detect_move(&lifted)) != NO_SQUARE) 
4137  0446 96            	ldw	x,sp
4138  0447 1c0004        	addw	x,#OFST-1
4139  044a cd0030        	call	_piece_detect_move
4141  044d b701          	ld	_sq_end,a
4142  044f b601          	ld	a,_sq_end
4143  0451 a140          	cp	a,#64
4144  0453 2603          	jrne	L07
4145  0455 cc079b        	jp	L3632
4146  0458               L07:
4147                     ; 244 				if (!lifted)
4149  0458 0d04          	tnz	(OFST-1,sp)
4150  045a 2655          	jrne	L1542
4151                     ; 246 					if (sq_end == sq_begin)
4153  045c b601          	ld	a,_sq_end
4154  045e b102          	cp	a,_sq_begin
4155  0460 2608          	jrne	L3542
4156                     ; 248 					    chess_std = CHESS_WHITE; // start again with white move
4158  0462 35020000      	mov	_chess_std,#2
4160  0466 ac9b079b      	jpf	L3632
4161  046a               L3542:
4162                     ; 252                         if (is_en_passant_white(sq_begin,sq_end))
4164  046a b601          	ld	a,_sq_end
4165  046c 97            	ld	xl,a
4166  046d b602          	ld	a,_sq_begin
4167  046f 95            	ld	xh,a
4168  0470 cd00c5        	call	_is_en_passant_white
4170  0473 4d            	tnz	a
4171  0474 2706          	jreq	L7542
4172                     ; 253 						     chess_std  = CHESS_WHITE_EP;
4174  0476 35050000      	mov	_chess_std,#5
4176  047a 2018          	jra	L1642
4177  047c               L7542:
4178                     ; 254 					    else if (is_castling_white(sq_begin,sq_end))
4180  047c b601          	ld	a,_sq_end
4181  047e 97            	ld	xl,a
4182  047f b602          	ld	a,_sq_begin
4183  0481 95            	ld	xh,a
4184  0482 cd0187        	call	_is_castling_white
4186  0485 4d            	tnz	a
4187  0486 2706          	jreq	L3642
4188                     ; 255 						     chess_std  = CHESS_WHITE_CASTLING;
4190  0488 35060000      	mov	_chess_std,#6
4192  048c 2006          	jra	L1642
4193  048e               L3642:
4194                     ; 258 							chess_std  = CHESS_BLACK; // Black to move
4196  048e 35090000      	mov	_chess_std,#9
4197                     ; 259                             moves_half_cntr++;
4199  0492 3c00          	inc	_moves_half_cntr
4200  0494               L1642:
4201                     ; 261                         table[sq_end]   = table[sq_begin];
4203  0494 b601          	ld	a,_sq_end
4204  0496 5f            	clrw	x
4205  0497 97            	ld	xl,a
4206  0498 b602          	ld	a,_sq_begin
4207  049a 905f          	clrw	y
4208  049c 9097          	ld	yl,a
4209  049e 90d60000      	ld	a,(_table,y)
4210  04a2 d70000        	ld	(_table,x),a
4211                     ; 262 					    table[sq_begin] = EMPTY;
4213  04a5 b602          	ld	a,_sq_begin
4214  04a7 5f            	clrw	x
4215  04a8 97            	ld	xl,a
4216  04a9 724f0000      	clr	(_table,x)
4217  04ad ac9b079b      	jpf	L3632
4218  04b1               L1542:
4219                     ; 265 				else if (is_black_piece(sq_end))
4221  04b1 b601          	ld	a,_sq_end
4222  04b3 cd008d        	call	_is_black_piece
4224  04b6 4d            	tnz	a
4225  04b7 2603          	jrne	L27
4226  04b9 cc079b        	jp	L3632
4227  04bc               L27:
4228                     ; 267 					sq_black  = sq_end;
4230                     ; 268 					chess_std = CHESS_WHITE3;
4232  04bc 35040000      	mov	_chess_std,#4
4233  04c0 ac9b079b      	jpf	L3632
4234  04c4               L7622:
4235                     ; 273 		case CHESS_WHITE3: // A 2nd piece (black) was lifted, now check for a piece returned
4235                     ; 274 			if ((sq_end = piece_detect_move(&lifted)) != NO_SQUARE) 
4237  04c4 96            	ldw	x,sp
4238  04c5 1c0004        	addw	x,#OFST-1
4239  04c8 cd0030        	call	_piece_detect_move
4241  04cb b701          	ld	_sq_end,a
4242  04cd b601          	ld	a,_sq_end
4243  04cf a140          	cp	a,#64
4244  04d1 2603          	jrne	L47
4245  04d3 cc079b        	jp	L3632
4246  04d6               L47:
4247                     ; 276 				if (!lifted)
4249  04d6 0d04          	tnz	(OFST-1,sp)
4250  04d8 2703          	jreq	L67
4251  04da cc079b        	jp	L3632
4252  04dd               L67:
4253                     ; 278 					table[sq_end]   = table[sq_begin]; // from state CHESS_WHITE
4255  04dd b601          	ld	a,_sq_end
4256  04df 5f            	clrw	x
4257  04e0 97            	ld	xl,a
4258  04e1 b602          	ld	a,_sq_begin
4259  04e3 905f          	clrw	y
4260  04e5 9097          	ld	yl,a
4261  04e7 90d60000      	ld	a,(_table,y)
4262  04eb d70000        	ld	(_table,x),a
4263                     ; 279 					table[sq_begin] = EMPTY;
4265  04ee b602          	ld	a,_sq_begin
4266  04f0 5f            	clrw	x
4267  04f1 97            	ld	xl,a
4268  04f2 724f0000      	clr	(_table,x)
4269                     ; 280 					moves_half_cntr++;
4271  04f6 3c00          	inc	_moves_half_cntr
4272                     ; 281 					chess_std       = CHESS_BLACK;
4274  04f8 35090000      	mov	_chess_std,#9
4275  04fc ac9b079b      	jpf	L3632
4276  0500               L1722:
4277                     ; 286 		case CHESS_WHITE_EP: // En-passant move
4277                     ; 287 			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE)
4279  0500 96            	ldw	x,sp
4280  0501 1c0004        	addw	x,#OFST-1
4281  0504 cd0030        	call	_piece_detect_move
4283  0507 6b05          	ld	(OFST+0,sp),a
4285  0509 7b05          	ld	a,(OFST+0,sp)
4286  050b a140          	cp	a,#64
4287  050d 2603          	jrne	L001
4288  050f cc079b        	jp	L3632
4289  0512               L001:
4290                     ; 289 				table[sq_black] = EMPTY;
4292  0512 7b05          	ld	a,(OFST+0,sp)
4293  0514 5f            	clrw	x
4294  0515 97            	ld	xl,a
4295  0516 724f0000      	clr	(_table,x)
4296                     ; 290 				moves_half_cntr++;
4298  051a 3c00          	inc	_moves_half_cntr
4299                     ; 291 				chess_std       = CHESS_BLACK;
4301  051c 35090000      	mov	_chess_std,#9
4302  0520 ac9b079b      	jpf	L3632
4303  0524               L3722:
4304                     ; 294 		case CHESS_WHITE_CASTLING: // Castling move
4304                     ; 295 			if ((sq_white = piece_detect_move(&lifted)) != NO_SQUARE)
4306  0524 96            	ldw	x,sp
4307  0525 1c0004        	addw	x,#OFST-1
4308  0528 cd0030        	call	_piece_detect_move
4310  052b 6b05          	ld	(OFST+0,sp),a
4312  052d 7b05          	ld	a,(OFST+0,sp)
4313  052f a140          	cp	a,#64
4314  0531 2603          	jrne	L201
4315  0533 cc079b        	jp	L3632
4316  0536               L201:
4317                     ; 297 				if (lifted && (((sq_white == 0) && (table[0] == ROOK_WHITE)) || 
4317                     ; 298 				               ((sq_white == 7) && (table[7] == ROOK_WHITE))))
4319  0536 0d04          	tnz	(OFST-1,sp)
4320  0538 2603          	jrne	L401
4321  053a cc079b        	jp	L3632
4322  053d               L401:
4324  053d 0d05          	tnz	(OFST+0,sp)
4325  053f 2607          	jrne	L7052
4327  0541 c60000        	ld	a,_table
4328  0544 a103          	cp	a,#3
4329  0546 2713          	jreq	L5052
4330  0548               L7052:
4332  0548 7b05          	ld	a,(OFST+0,sp)
4333  054a a107          	cp	a,#7
4334  054c 2703          	jreq	L601
4335  054e cc079b        	jp	L3632
4336  0551               L601:
4338  0551 c60007        	ld	a,_table+7
4339  0554 a103          	cp	a,#3
4340  0556 2703          	jreq	L011
4341  0558 cc079b        	jp	L3632
4342  055b               L011:
4343  055b               L5052:
4344                     ; 300 					table[sq_white] = EMPTY;
4346  055b 7b05          	ld	a,(OFST+0,sp)
4347  055d 5f            	clrw	x
4348  055e 97            	ld	xl,a
4349  055f 724f0000      	clr	(_table,x)
4350                     ; 301 					chess_std       = CHESS_WHITE_CASTLING2;
4352  0563 35070000      	mov	_chess_std,#7
4353  0567 ac9b079b      	jpf	L3632
4354  056b               L5722:
4355                     ; 306 		case CHESS_WHITE_CASTLING2: // Castling move
4355                     ; 307 			if ((sq_white = piece_detect_move(&lifted)) != NO_SQUARE)
4357  056b 96            	ldw	x,sp
4358  056c 1c0004        	addw	x,#OFST-1
4359  056f cd0030        	call	_piece_detect_move
4361  0572 6b05          	ld	(OFST+0,sp),a
4363  0574 7b05          	ld	a,(OFST+0,sp)
4364  0576 a140          	cp	a,#64
4365  0578 2603          	jrne	L211
4366  057a cc079b        	jp	L3632
4367  057d               L211:
4368                     ; 309 				if (!lifted && ((sq_white == 3) || (sq_white == 5)))
4370  057d 0d04          	tnz	(OFST-1,sp)
4371  057f 2703          	jreq	L411
4372  0581 cc079b        	jp	L3632
4373  0584               L411:
4375  0584 7b05          	ld	a,(OFST+0,sp)
4376  0586 a103          	cp	a,#3
4377  0588 2709          	jreq	L5152
4379  058a 7b05          	ld	a,(OFST+0,sp)
4380  058c a105          	cp	a,#5
4381  058e 2703          	jreq	L611
4382  0590 cc079b        	jp	L3632
4383  0593               L611:
4384  0593               L5152:
4385                     ; 311 					table[sq_white] = ROOK_WHITE;
4387  0593 7b05          	ld	a,(OFST+0,sp)
4388  0595 5f            	clrw	x
4389  0596 97            	ld	xl,a
4390  0597 a603          	ld	a,#3
4391  0599 d70000        	ld	(_table,x),a
4392                     ; 312 					moves_half_cntr++;
4394  059c 3c00          	inc	_moves_half_cntr
4395                     ; 313 					chess_std       = CHESS_BLACK;
4397  059e 35090000      	mov	_chess_std,#9
4398  05a2 ac9b079b      	jpf	L3632
4399  05a6               L7722:
4400                     ; 318 		case CHESS_PAUSE_WHITE:
4400                     ; 319 			clk1.active = false; 
4402  05a6 72110002      	bres	_clk1+2,#0
4403                     ; 320 			if (!pause_game) chess_std = CHESS_WHITE;
4405                     	btst	_pause_game
4406  05af 2403          	jruge	L021
4407  05b1 cc079b        	jp	L3632
4408  05b4               L021:
4411  05b4 35020000      	mov	_chess_std,#2
4412  05b8 ac9b079b      	jpf	L3632
4413  05bc               L1032:
4414                     ; 322 		case CHESS_BLACK:
4414                     ; 323 			clk1.active = false;
4416  05bc 72110002      	bres	_clk1+2,#0
4417                     ; 324 			clk2.active = true; 
4419  05c0 72100002      	bset	_clk2+2,#0
4420                     ; 325 			if (pause_game)               chess_std = CHESS_PAUSE_BLACK;
4422                     	btst	_pause_game
4423  05c9 2408          	jruge	L1252
4426  05cb 35120000      	mov	_chess_std,#18
4428  05cf ac9b079b      	jpf	L3632
4429  05d3               L1252:
4430                     ; 326             else if (move_black_received) 
4432                     	btst	_move_black_received
4433  05d8 2503          	jrult	L221
4434  05da cc079b        	jp	L3632
4435  05dd               L221:
4436                     ; 328 				move_black_received = false;
4438  05dd 72110000      	bres	_move_black_received
4439                     ; 329 				chess_std = eval_black_move(&sq_begin,&sq_end);
4441  05e1 ae0001        	ldw	x,#_sq_end
4442  05e4 89            	pushw	x
4443  05e5 ae0002        	ldw	x,#_sq_begin
4444  05e8 cd01c7        	call	_eval_black_move
4446  05eb 85            	popw	x
4447  05ec b700          	ld	_chess_std,a
4448  05ee ac9b079b      	jpf	L3632
4449  05f2               L3032:
4450                     ; 332 		case CHESS_BLACK2:
4450                     ; 333 			if (((sq_black = piece_detect_move(&lifted)) != NO_SQUARE) && (sq_black == sq_begin)) 
4452  05f2 96            	ldw	x,sp
4453  05f3 1c0004        	addw	x,#OFST-1
4454  05f6 cd0030        	call	_piece_detect_move
4456  05f9 6b05          	ld	(OFST+0,sp),a
4458  05fb 7b05          	ld	a,(OFST+0,sp)
4459  05fd a140          	cp	a,#64
4460  05ff 2603          	jrne	L421
4461  0601 cc079b        	jp	L3632
4462  0604               L421:
4464  0604 7b05          	ld	a,(OFST+0,sp)
4465  0606 b102          	cp	a,_sq_begin
4466  0608 2703          	jreq	L621
4467  060a cc079b        	jp	L3632
4468  060d               L621:
4469                     ; 335 				chess_std = CHESS_BLACK3; // the correct piece was picked up
4471  060d 350b0000      	mov	_chess_std,#11
4472  0611 ac9b079b      	jpf	L3632
4473  0615               L5032:
4474                     ; 338 		case CHESS_BLACK3: // the correct piece was picked up, now check for proper return
4474                     ; 339 			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE) 
4476  0615 96            	ldw	x,sp
4477  0616 1c0004        	addw	x,#OFST-1
4478  0619 cd0030        	call	_piece_detect_move
4480  061c 6b05          	ld	(OFST+0,sp),a
4482  061e 7b05          	ld	a,(OFST+0,sp)
4483  0620 a140          	cp	a,#64
4484  0622 2603          	jrne	L031
4485  0624 cc079b        	jp	L3632
4486  0627               L031:
4487                     ; 341 				if (!lifted && (sq_black == sq_end))
4489  0627 0d04          	tnz	(OFST-1,sp)
4490  0629 2703          	jreq	L231
4491  062b cc079b        	jp	L3632
4492  062e               L231:
4494  062e 7b05          	ld	a,(OFST+0,sp)
4495  0630 b101          	cp	a,_sq_end
4496  0632 2703          	jreq	L431
4497  0634 cc079b        	jp	L3632
4498  0637               L431:
4499                     ; 343                     table[sq_end]   = table[sq_begin]; // from eval_black_move() in CHESS_BLACK
4501  0637 b601          	ld	a,_sq_end
4502  0639 5f            	clrw	x
4503  063a 97            	ld	xl,a
4504  063b b602          	ld	a,_sq_begin
4505  063d 905f          	clrw	y
4506  063f 9097          	ld	yl,a
4507  0641 90d60000      	ld	a,(_table,y)
4508  0645 d70000        	ld	(_table,x),a
4509                     ; 344 					table[sq_begin] = EMPTY;
4511  0648 b602          	ld	a,_sq_begin
4512  064a 5f            	clrw	x
4513  064b 97            	ld	xl,a
4514  064c 724f0000      	clr	(_table,x)
4515                     ; 345                     chess_std       = CHESS_WHITE; // the correct piece was picked up
4517  0650 35020000      	mov	_chess_std,#2
4518                     ; 346                     moves_half_cntr++;
4520  0654 3c00          	inc	_moves_half_cntr
4521  0656 ac9b079b      	jpf	L3632
4522  065a               L7032:
4523                     ; 350         case CHESS_BLACK_CASTLING:
4523                     ; 351 			if (((sq_black = piece_detect_move(&lifted)) != NO_SQUARE) && (sq_black == sq_begin))
4525  065a 96            	ldw	x,sp
4526  065b 1c0004        	addw	x,#OFST-1
4527  065e cd0030        	call	_piece_detect_move
4529  0661 6b05          	ld	(OFST+0,sp),a
4531  0663 7b05          	ld	a,(OFST+0,sp)
4532  0665 a140          	cp	a,#64
4533  0667 2603          	jrne	L631
4534  0669 cc079b        	jp	L3632
4535  066c               L631:
4537  066c 7b05          	ld	a,(OFST+0,sp)
4538  066e b102          	cp	a,_sq_begin
4539  0670 2703          	jreq	L041
4540  0672 cc079b        	jp	L3632
4541  0675               L041:
4542                     ; 353 				chess_std = CHESS_BLACK_CASTLING2; // the correct piece (king) was picked up
4544  0675 35100000      	mov	_chess_std,#16
4545  0679 ac9b079b      	jpf	L3632
4546  067d               L1132:
4547                     ; 356         case CHESS_BLACK_CASTLING2:
4547                     ; 357 			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE)
4549  067d 96            	ldw	x,sp
4550  067e 1c0004        	addw	x,#OFST-1
4551  0681 cd0030        	call	_piece_detect_move
4553  0684 6b05          	ld	(OFST+0,sp),a
4555  0686 7b05          	ld	a,(OFST+0,sp)
4556  0688 a140          	cp	a,#64
4557  068a 2603          	jrne	L241
4558  068c cc079b        	jp	L3632
4559  068f               L241:
4560                     ; 359 				if (!lifted && (sq_black == sq_end))
4562  068f 0d04          	tnz	(OFST-1,sp)
4563  0691 2703          	jreq	L441
4564  0693 cc079b        	jp	L3632
4565  0696               L441:
4567  0696 7b05          	ld	a,(OFST+0,sp)
4568  0698 b101          	cp	a,_sq_end
4569  069a 2703          	jreq	L641
4570  069c cc079b        	jp	L3632
4571  069f               L641:
4572                     ; 361                     table[sq_end]   = table[sq_begin]; // from eval_black_move() in CHESS_BLACK
4574  069f b601          	ld	a,_sq_end
4575  06a1 5f            	clrw	x
4576  06a2 97            	ld	xl,a
4577  06a3 b602          	ld	a,_sq_begin
4578  06a5 905f          	clrw	y
4579  06a7 9097          	ld	yl,a
4580  06a9 90d60000      	ld	a,(_table,y)
4581  06ad d70000        	ld	(_table,x),a
4582                     ; 362 					table[sq_begin] = EMPTY;
4584  06b0 b602          	ld	a,_sq_begin
4585  06b2 5f            	clrw	x
4586  06b3 97            	ld	xl,a
4587  06b4 724f0000      	clr	(_table,x)
4588                     ; 363 					if (sq_end == 62)
4590  06b8 b601          	ld	a,_sq_end
4591  06ba a13e          	cp	a,#62
4592  06bc 260a          	jrne	L3452
4593                     ; 365                         sq_begin = 63;
4595  06be 353f0002      	mov	_sq_begin,#63
4596                     ; 366                         sq_end   = 61;
4598  06c2 353d0001      	mov	_sq_end,#61
4600  06c6 2008          	jra	L5452
4601  06c8               L3452:
4602                     ; 370                         sq_begin = 56;
4604  06c8 35380002      	mov	_sq_begin,#56
4605                     ; 371                         sq_end   = 59;
4607  06cc 353b0001      	mov	_sq_end,#59
4608  06d0               L5452:
4609                     ; 373                     chess_std    = CHESS_BLACK2;    // now handle pick and place of Rook
4611  06d0 350a0000      	mov	_chess_std,#10
4612  06d4 ac9b079b      	jpf	L3632
4613  06d8               L3132:
4614                     ; 377         case CHESS_BLACK_EP:
4614                     ; 378 			if (((sq_black = piece_detect_move(&lifted)) != NO_SQUARE) && (sq_black == sq_begin))
4616  06d8 96            	ldw	x,sp
4617  06d9 1c0004        	addw	x,#OFST-1
4618  06dc cd0030        	call	_piece_detect_move
4620  06df 6b05          	ld	(OFST+0,sp),a
4622  06e1 7b05          	ld	a,(OFST+0,sp)
4623  06e3 a140          	cp	a,#64
4624  06e5 2603          	jrne	L051
4625  06e7 cc079b        	jp	L3632
4626  06ea               L051:
4628  06ea 7b05          	ld	a,(OFST+0,sp)
4629  06ec b102          	cp	a,_sq_begin
4630  06ee 2703          	jreq	L251
4631  06f0 cc079b        	jp	L3632
4632  06f3               L251:
4633                     ; 380 				chess_std = CHESS_BLACK_EP2; // the correct pawn was picked up
4635  06f3 350d0000      	mov	_chess_std,#13
4636  06f7 ac9b079b      	jpf	L3632
4637  06fb               L5132:
4638                     ; 383         case CHESS_BLACK_EP2:
4638                     ; 384 			if ((sq_black = piece_detect_move(&lifted)) != NO_SQUARE)
4640  06fb 96            	ldw	x,sp
4641  06fc 1c0004        	addw	x,#OFST-1
4642  06ff cd0030        	call	_piece_detect_move
4644  0702 6b05          	ld	(OFST+0,sp),a
4646  0704 7b05          	ld	a,(OFST+0,sp)
4647  0706 a140          	cp	a,#64
4648  0708 27e6          	jreq	L3632
4649                     ; 386 				if (!lifted && (sq_black == sq_end))
4651  070a 0d04          	tnz	(OFST-1,sp)
4652  070c 26e2          	jrne	L3632
4654  070e 7b05          	ld	a,(OFST+0,sp)
4655  0710 b101          	cp	a,_sq_end
4656  0712 26dc          	jrne	L3632
4657                     ; 388                     table[sq_end]   = table[sq_begin]; // from eval_black_move() in CHESS_BLACK
4659  0714 b601          	ld	a,_sq_end
4660  0716 5f            	clrw	x
4661  0717 97            	ld	xl,a
4662  0718 b602          	ld	a,_sq_begin
4663  071a 905f          	clrw	y
4664  071c 9097          	ld	yl,a
4665  071e 90d60000      	ld	a,(_table,y)
4666  0722 d70000        	ld	(_table,x),a
4667                     ; 389 					table[sq_begin] = EMPTY;
4669  0725 b602          	ld	a,_sq_begin
4670  0727 5f            	clrw	x
4671  0728 97            	ld	xl,a
4672  0729 724f0000      	clr	(_table,x)
4673                     ; 390                     chess_std       = CHESS_BLACK_EP3;    // now handle pick-up of white pawn
4675  072d 350e0000      	mov	_chess_std,#14
4676  0731 2068          	jra	L3632
4677  0733               L7132:
4678                     ; 394         case CHESS_BLACK_EP3:
4678                     ; 395             if (sq_begin - 7 == sq_end)      sq_white = sq_begin + 1;
4680  0733 b602          	ld	a,_sq_begin
4681  0735 5f            	clrw	x
4682  0736 97            	ld	xl,a
4683  0737 1d0007        	subw	x,#7
4684  073a b601          	ld	a,_sq_end
4685  073c 905f          	clrw	y
4686  073e 9097          	ld	yl,a
4687  0740 90bf00        	ldw	c_y,y
4688  0743 b300          	cpw	x,c_y
4689  0745 2607          	jrne	L5552
4692  0747 b602          	ld	a,_sq_begin
4693  0749 4c            	inc	a
4694  074a 6b05          	ld	(OFST+0,sp),a
4697  074c 2019          	jra	L7552
4698  074e               L5552:
4699                     ; 396             else if (sq_begin - 9 == sq_end) sq_white = sq_begin - 1;
4701  074e b602          	ld	a,_sq_begin
4702  0750 5f            	clrw	x
4703  0751 97            	ld	xl,a
4704  0752 1d0009        	subw	x,#9
4705  0755 b601          	ld	a,_sq_end
4706  0757 905f          	clrw	y
4707  0759 9097          	ld	yl,a
4708  075b 90bf00        	ldw	c_y,y
4709  075e b300          	cpw	x,c_y
4710  0760 2605          	jrne	L7552
4713  0762 b602          	ld	a,_sq_begin
4714  0764 4a            	dec	a
4715  0765 6b05          	ld	(OFST+0,sp),a
4717  0767               L7552:
4718                     ; 398 			if (((sq_begin = piece_detect_move(&lifted)) != NO_SQUARE) && (sq_begin == sq_white))
4720  0767 96            	ldw	x,sp
4721  0768 1c0004        	addw	x,#OFST-1
4722  076b cd0030        	call	_piece_detect_move
4724  076e b702          	ld	_sq_begin,a
4725  0770 b602          	ld	a,_sq_begin
4726  0772 a140          	cp	a,#64
4727  0774 2725          	jreq	L3632
4729  0776 b602          	ld	a,_sq_begin
4730  0778 1105          	cp	a,(OFST+0,sp)
4731  077a 261f          	jrne	L3632
4732                     ; 400 				table[sq_begin] = EMPTY; // remove white en-passant pawn
4734  077c b602          	ld	a,_sq_begin
4735  077e 5f            	clrw	x
4736  077f 97            	ld	xl,a
4737  0780 724f0000      	clr	(_table,x)
4738                     ; 401 				chess_std = CHESS_WHITE; //
4740  0784 35020000      	mov	_chess_std,#2
4741                     ; 402                 moves_half_cntr++;
4743  0788 3c00          	inc	_moves_half_cntr
4744  078a 200f          	jra	L3632
4745  078c               L1232:
4746                     ; 405 		case CHESS_PAUSE_BLACK:
4746                     ; 406 			clk2.active = false; 
4748  078c 72110002      	bres	_clk2+2,#0
4749                     ; 407 			if (!pause_game) chess_std = CHESS_BLACK;
4751                     	btst	_pause_game
4752  0795 2504          	jrult	L3632
4755  0797 35090000      	mov	_chess_std,#9
4756  079b               L3632:
4757                     ; 410 	for (i = 0; i < 8; i++) reed_relays_old[i] = reed_relays[i];
4759  079b 0f05          	clr	(OFST+0,sp)
4761  079d               L7652:
4764  079d 7b05          	ld	a,(OFST+0,sp)
4765  079f 5f            	clrw	x
4766  07a0 97            	ld	xl,a
4767  07a1 e600          	ld	a,(_reed_relays,x)
4768  07a3 e704          	ld	(_reed_relays_old,x),a
4771  07a5 0c05          	inc	(OFST+0,sp)
4775  07a7 7b05          	ld	a,(OFST+0,sp)
4776  07a9 a108          	cp	a,#8
4777  07ab 25f0          	jrult	L7652
4778                     ; 411 } // chess_main()
4781  07ad 5b05          	addw	sp,#5
4782  07af 81            	ret
4903                     	xdef	_eval_black_move
4904                     	xdef	_is_castling_white
4905                     	xdef	_is_en_passant_black
4906                     	xdef	_is_en_passant_white
4907                     	xdef	_is_white_piece
4908                     	xdef	_is_black_piece
4909                     	xdef	_piece_detect_move
4910                     	xdef	_board_nr_to_position
4911                     	xdef	_position_to_board_nr
4912                     	xdef	_pause_game
4913                     	xdef	_new_game
4914                     	switch	.ubsct
4915  0000               _moves_half_cntr:
4916  0000 00            	ds.b	1
4917                     	xdef	_moves_half_cntr
4918  0001               _sq_end:
4919  0001 00            	ds.b	1
4920                     	xdef	_sq_end
4921  0002               _sq_begin:
4922  0002 00            	ds.b	1
4923                     	xdef	_sq_begin
4924  0003               _piece_picked:
4925  0003 00            	ds.b	1
4926                     	xdef	_piece_picked
4927                     	xdef	_chess_std
4928  0004               _reed_relays_old:
4929  0004 000000000000  	ds.b	8
4930                     	xdef	_reed_relays_old
4931                     	xref.b	_clk2
4932                     	xref.b	_clk1
4933                     	xref.b	_reed_relays
4934                     	xdef	_move_black_received
4935  000c               _move_black_str:
4936  000c 000000000000  	ds.b	6
4937                     	xdef	_move_black_str
4938                     	switch	.bss
4939  0000               _table:
4940  0000 000000000000  	ds.b	64
4941                     	xdef	_table
4942                     	xref	_max7219_write
4943                     	xref	_strncmp
4944                     	xref	_tolower
4945                     	xdef	_chess_main
4946                     	switch	.const
4947  0026               L5322:
4948  0026 6f2d6f00      	dc.b	"o-o",0
4949  002a               L3322:
4950  002a 4f2d4f00      	dc.b	"O-O",0
4951  002e               L7222:
4952  002e 302d3000      	dc.b	"0-0",0
4953  0032               L7122:
4954  0032 6f2d6f2d6f00  	dc.b	"o-o-o",0
4955  0038               L5122:
4956  0038 4f2d4f2d4f00  	dc.b	"O-O-O",0
4957  003e               L1122:
4958  003e 302d302d3000  	dc.b	"0-0-0",0
4959                     	xref.b	c_x
4960                     	xref.b	c_y
4980                     	end
