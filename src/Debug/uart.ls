   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2524                     	bsct
2525  0000               _rs232_ptr:
2526  0000 00            	dc.b	0
2527  0001               _isr_cnt:
2528  0001 0000          	dc.w	0
2672                     ; 57 @interrupt void UART_TX_IRQHandler(void)
2672                     ; 58 {
2674                     	switch	.text
2675  0000               _UART_TX_IRQHandler:
2677       00000008      OFST:	set	8
2678  0000 be00          	ldw	x,c_y
2679  0002 89            	pushw	x
2680  0003 5208          	subw	sp,#8
2683                     ; 59 	if (!ring_buffer_is_empty(&ring_buffer_out))
2686                     ; 75     return (ring->read_offset == ring->write_offset);
2688  0005 b62e          	ld	a,_ring_buffer_out+1
2689  0007 b12d          	cp	a,_ring_buffer_out
2690  0009 2604          	jrne	L6
2691  000b a601          	ld	a,#1
2692  000d 2001          	jra	L01
2693  000f               L6:
2694  000f 4f            	clr	a
2695  0010               L01:
2696  0010 6b08          	ld	(OFST+0,sp),a
2700  0012 0d08          	tnz	(OFST+0,sp)
2701  0014 2639          	jrne	L3571
2702                     ; 61 		UART2_DR = ring_buffer_get(&ring_buffer_out);
2705                     ; 104     uint8_t data = ring->buffer[ring->read_offset];
2707  0016 b62e          	ld	a,_ring_buffer_out+1
2708  0018 5f            	clrw	x
2709  0019 97            	ld	xl,a
2710  001a 92d630        	ld	a,([_ring_buffer_out+3.w],x)
2711  001d 6b05          	ld	(OFST-3,sp),a
2713                     ; 61 		UART2_DR = ring_buffer_get(&ring_buffer_out);
2719  001f b62e          	ld	a,_ring_buffer_out+1
2720  0021 6b02          	ld	(OFST-6,sp),a
2724  0023 b62f          	ld	a,_ring_buffer_out+2
2725  0025 6b01          	ld	(OFST-7,sp),a
2727                     ; 35    return ((cur_offset == max_offset-1) ? 0 : cur_offset + 1);
2729  0027 7b01          	ld	a,(OFST-7,sp)
2730  0029 5f            	clrw	x
2731  002a 97            	ld	xl,a
2732  002b 5a            	decw	x
2733  002c 7b02          	ld	a,(OFST-6,sp)
2734  002e 905f          	clrw	y
2735  0030 9097          	ld	yl,a
2736  0032 90bf00        	ldw	c_y,y
2737  0035 b300          	cpw	x,c_y
2738  0037 2603          	jrne	L21
2739  0039 4f            	clr	a
2740  003a 2003          	jra	L41
2741  003c               L21:
2742  003c 7b02          	ld	a,(OFST-6,sp)
2743  003e 4c            	inc	a
2744  003f               L41:
2745  003f b72e          	ld	_ring_buffer_out+1,a
2748  0041 b62e          	ld	a,_ring_buffer_out+1
2751  0043 b62e          	ld	a,_ring_buffer_out+1
2752                     ; 106     return data;
2754  0045 7b05          	ld	a,(OFST-3,sp)
2755  0047 c75241        	ld	_UART2_DR,a
2758  004a c65241        	ld	a,_UART2_DR
2760  004d 2004          	jra	L5571
2761  004f               L3571:
2762                     ; 65         UART2_CR2 &= ~UART2_CR2_TIEN;
2764  004f 721f5245      	bres	_UART2_CR2,#7
2765  0053               L5571:
2766                     ; 67 } /* UART_TX_IRQHandler() */
2769  0053 5b08          	addw	sp,#8
2770  0055 85            	popw	x
2771  0056 bf00          	ldw	c_y,x
2772  0058 80            	iret
2898                     ; 78 @interrupt void UART_RX_IRQHandler(void)
2898                     ; 79 {
2899                     	switch	.text
2900  0059               _UART_RX_IRQHandler:
2902       00000009      OFST:	set	9
2903  0059 be00          	ldw	x,c_y
2904  005b 89            	pushw	x
2905  005c 5209          	subw	sp,#9
2908                     ; 82 	if (!ring_buffer_is_full(&ring_buffer_in))
2917  005e b628          	ld	a,_ring_buffer_in
2918  0060 6b02          	ld	(OFST-7,sp),a
2922  0062 b62a          	ld	a,_ring_buffer_in+2
2923  0064 6b01          	ld	(OFST-8,sp),a
2925                     ; 35    return ((cur_offset == max_offset-1) ? 0 : cur_offset + 1);
2927  0066 7b01          	ld	a,(OFST-8,sp)
2928  0068 5f            	clrw	x
2929  0069 97            	ld	xl,a
2930  006a 5a            	decw	x
2931  006b 7b02          	ld	a,(OFST-7,sp)
2932  006d 905f          	clrw	y
2933  006f 9097          	ld	yl,a
2934  0071 90bf00        	ldw	c_y,y
2935  0074 b300          	cpw	x,c_y
2936  0076 2603          	jrne	L02
2937  0078 4f            	clr	a
2938  0079 2003          	jra	L22
2939  007b               L02:
2940  007b 7b02          	ld	a,(OFST-7,sp)
2941  007d 4c            	inc	a
2942  007e               L22:
2943  007e 6b05          	ld	(OFST-4,sp),a
2949  0080 b629          	ld	a,_ring_buffer_in+1
2950  0082 1105          	cp	a,(OFST-4,sp)
2951  0084 2604          	jrne	L42
2952  0086 a601          	ld	a,#1
2953  0088 2001          	jra	L62
2954  008a               L42:
2955  008a 4f            	clr	a
2956  008b               L62:
2957  008b 6b09          	ld	(OFST+0,sp),a
2961  008d 0d09          	tnz	(OFST+0,sp)
2962  008f 2636          	jrne	L1602
2963                     ; 84 		ring_buffer_put(&ring_buffer_in, UART2_DR);
2966                     ; 120     ring->buffer[ring->write_offset] = data;
2968  0091 b628          	ld	a,_ring_buffer_in
2969  0093 5f            	clrw	x
2970  0094 97            	ld	xl,a
2971  0095 c65241        	ld	a,_UART2_DR
2972  0098 92d72b        	ld	([_ring_buffer_in+3.w],x),a
2973                     ; 84 		ring_buffer_put(&ring_buffer_in, UART2_DR);
2979  009b b628          	ld	a,_ring_buffer_in
2980  009d 6b03          	ld	(OFST-6,sp),a
2984  009f b62a          	ld	a,_ring_buffer_in+2
2985  00a1 6b02          	ld	(OFST-7,sp),a
2987                     ; 35    return ((cur_offset == max_offset-1) ? 0 : cur_offset + 1);
2989  00a3 7b02          	ld	a,(OFST-7,sp)
2990  00a5 5f            	clrw	x
2991  00a6 97            	ld	xl,a
2992  00a7 5a            	decw	x
2993  00a8 7b03          	ld	a,(OFST-6,sp)
2994  00aa 905f          	clrw	y
2995  00ac 9097          	ld	yl,a
2996  00ae 90bf00        	ldw	c_y,y
2997  00b1 b300          	cpw	x,c_y
2998  00b3 2603          	jrne	L03
2999  00b5 4f            	clr	a
3000  00b6 2003          	jra	L23
3001  00b8               L03:
3002  00b8 7b03          	ld	a,(OFST-6,sp)
3003  00ba 4c            	inc	a
3004  00bb               L23:
3005  00bb b728          	ld	_ring_buffer_in,a
3008  00bd b628          	ld	a,_ring_buffer_in
3011  00bf b628          	ld	a,_ring_buffer_in
3012                     ; 85 		ovf_buf_in = false;
3014  00c1 72110001      	bres	_ovf_buf_in
3016  00c5 2009          	jra	L3602
3017  00c7               L1602:
3018                     ; 89 		ch = UART2_DR; // clear RXNE flag
3020  00c7 c65241        	ld	a,_UART2_DR
3021  00ca 6b08          	ld	(OFST-1,sp),a
3023                     ; 90 		ovf_buf_in = true;
3025  00cc 72100001      	bset	_ovf_buf_in
3026  00d0               L3602:
3027                     ; 92 	isr_cnt++;
3029  00d0 be01          	ldw	x,_isr_cnt
3030  00d2 1c0001        	addw	x,#1
3031  00d5 bf01          	ldw	_isr_cnt,x
3032                     ; 93 } /* UART_RX_IRQHandler() */
3035  00d7 5b09          	addw	sp,#9
3036  00d9 85            	popw	x
3037  00da bf00          	ldw	c_y,x
3038  00dc 80            	iret
3100                     ; 101 void uart_init(void)
3100                     ; 102 {
3101                     	switch	.text
3102  00dd               _uart_init:
3104  00dd 5208          	subw	sp,#8
3105       00000008      OFST:	set	8
3108                     ; 103     uint16_t div = (F_CPU + BAUDRATE / 2) / BAUDRATE;
3110  00df ae008b        	ldw	x,#139
3111  00e2 1f07          	ldw	(OFST-1,sp),x
3113                     ; 87     ring.write_offset = 0;
3116  00e4 0f02          	clr	(OFST-6,sp)
3118                     ; 88     ring.read_offset  = 0;
3120  00e6 0f03          	clr	(OFST-5,sp)
3122                     ; 89     ring.size         = size;
3124  00e8 a61e          	ld	a,#30
3125  00ea 6b04          	ld	(OFST-4,sp),a
3127                     ; 90     ring.buffer       = buffer;
3129  00ec ae000a        	ldw	x,#_out_buffer
3130  00ef 1f05          	ldw	(OFST-3,sp),x
3132                     ; 91     return ring;
3134  00f1 ae002d        	ldw	x,#_ring_buffer_out
3135  00f4 9096          	ldw	y,sp
3136  00f6 72a90002      	addw	y,#OFST-6
3137  00fa a605          	ld	a,#5
3138  00fc cd0000        	call	c_xymvx
3142                     ; 87     ring.write_offset = 0;
3145  00ff 0f02          	clr	(OFST-6,sp)
3147                     ; 88     ring.read_offset  = 0;
3149  0101 0f03          	clr	(OFST-5,sp)
3151                     ; 89     ring.size         = size;
3153  0103 a60a          	ld	a,#10
3154  0105 6b04          	ld	(OFST-4,sp),a
3156                     ; 90     ring.buffer       = buffer;
3158  0107 ae0000        	ldw	x,#_in_buffer
3159  010a 1f05          	ldw	(OFST-3,sp),x
3161                     ; 91     return ring;
3163  010c ae0028        	ldw	x,#_ring_buffer_in
3164  010f 9096          	ldw	y,sp
3165  0111 72a90002      	addw	y,#OFST-6
3166  0115 a605          	ld	a,#5
3167  0117 cd0000        	call	c_xymvx
3171                     ; 109     UART2_BRR2 = ((div >> 8) & 0xF0) + (div & 0x0F);
3173  011a 7b08          	ld	a,(OFST+0,sp)
3174  011c a40f          	and	a,#15
3175  011e 6b01          	ld	(OFST-7,sp),a
3177  0120 7b07          	ld	a,(OFST-1,sp)
3178  0122 a4f0          	and	a,#240
3179  0124 1b01          	add	a,(OFST-7,sp)
3180  0126 c75243        	ld	_UART2_BRR2,a
3181                     ; 110     UART2_BRR1 = div >> 4;
3183  0129 1e07          	ldw	x,(OFST-1,sp)
3184  012b 54            	srlw	x
3185  012c 54            	srlw	x
3186  012d 54            	srlw	x
3187  012e 54            	srlw	x
3188  012f 01            	rrwa	x,a
3189  0130 c75242        	ld	_UART2_BRR1,a
3190  0133 02            	rlwa	x,a
3191                     ; 111     UART2_CR2 |= (UART2_CR2_RIEN | UART2_CR2_TIEN); // Enable interrupts
3193  0134 c65245        	ld	a,_UART2_CR2
3194  0137 aaa0          	or	a,#160
3195  0139 c75245        	ld	_UART2_CR2,a
3196                     ; 112     UART2_CR2 |= (UART2_CR2_TEN  | UART2_CR2_REN);  // Enable receiver and transmitter
3198  013c c65245        	ld	a,_UART2_CR2
3199  013f aa0c          	or	a,#12
3200  0141 c75245        	ld	_UART2_CR2,a
3201                     ; 114 } // uart_init()
3204  0144 5b08          	addw	sp,#8
3205  0146 81            	ret
3345                     ; 121 void uart_write(uint8_t data)
3345                     ; 122 {
3346                     	switch	.text
3347  0147               _uart_write:
3349  0147 88            	push	a
3350  0148 5208          	subw	sp,#8
3351       00000008      OFST:	set	8
3354  014a 2006          	jra	L3322
3355  014c               L1322:
3356                     ; 129 	while (ring_buffer_is_full(&ring_buffer_out)) delay_msec(1);
3358  014c ae0001        	ldw	x,#1
3359  014f cd0000        	call	_delay_msec
3361  0152               L3322:
3371  0152 b62d          	ld	a,_ring_buffer_out
3372  0154 6b02          	ld	(OFST-6,sp),a
3376  0156 b62f          	ld	a,_ring_buffer_out+2
3377  0158 6b01          	ld	(OFST-7,sp),a
3379                     ; 35    return ((cur_offset == max_offset-1) ? 0 : cur_offset + 1);
3381  015a 7b01          	ld	a,(OFST-7,sp)
3382  015c 5f            	clrw	x
3383  015d 97            	ld	xl,a
3384  015e 5a            	decw	x
3385  015f 7b02          	ld	a,(OFST-6,sp)
3386  0161 905f          	clrw	y
3387  0163 9097          	ld	yl,a
3388  0165 90bf00        	ldw	c_y,y
3389  0168 b300          	cpw	x,c_y
3390  016a 2603          	jrne	L04
3391  016c 4f            	clr	a
3392  016d 2003          	jra	L24
3393  016f               L04:
3394  016f 7b02          	ld	a,(OFST-6,sp)
3395  0171 4c            	inc	a
3396  0172               L24:
3397  0172 6b05          	ld	(OFST-3,sp),a
3403  0174 b62e          	ld	a,_ring_buffer_out+1
3404  0176 1105          	cp	a,(OFST-3,sp)
3405  0178 2604          	jrne	L44
3406  017a a601          	ld	a,#1
3407  017c 2001          	jra	L64
3408  017e               L44:
3409  017e 4f            	clr	a
3410  017f               L64:
3411  017f 6b08          	ld	(OFST+0,sp),a
3415  0181 0d08          	tnz	(OFST+0,sp)
3416  0183 26c7          	jrne	L1322
3417                     ; 130 	disable_interrupts(); // Disable interrupts to get exclusive access to ring_buffer_out
3420  0185 9b            sim
3422                     ; 131 	if (ring_buffer_is_empty(&ring_buffer_out))
3426                     ; 75     return (ring->read_offset == ring->write_offset);
3428  0186 b62e          	ld	a,_ring_buffer_out+1
3429  0188 b12d          	cp	a,_ring_buffer_out
3430  018a 2604          	jrne	L05
3431  018c a601          	ld	a,#1
3432  018e 2001          	jra	L25
3433  0190               L05:
3434  0190 4f            	clr	a
3435  0191               L25:
3436  0191 6b08          	ld	(OFST+0,sp),a
3440  0193 0d08          	tnz	(OFST+0,sp)
3441  0195 2704          	jreq	L7322
3442                     ; 133         UART2_CR2 |= UART2_CR2_TIEN; // First data in buffer, enable data ready interrupt
3444  0197 721e5245      	bset	_UART2_CR2,#7
3445  019b               L7322:
3446                     ; 135     ring_buffer_put(&ring_buffer_out, data); // Put data in buffer
3449                     ; 120     ring->buffer[ring->write_offset] = data;
3451  019b b62d          	ld	a,_ring_buffer_out
3452  019d 5f            	clrw	x
3453  019e 97            	ld	xl,a
3454  019f 7b09          	ld	a,(OFST+1,sp)
3455  01a1 92d730        	ld	([_ring_buffer_out+3.w],x),a
3456                     ; 135     ring_buffer_put(&ring_buffer_out, data); // Put data in buffer
3462  01a4 b62d          	ld	a,_ring_buffer_out
3463  01a6 6b03          	ld	(OFST-5,sp),a
3467  01a8 b62f          	ld	a,_ring_buffer_out+2
3468  01aa 6b02          	ld	(OFST-6,sp),a
3470                     ; 35    return ((cur_offset == max_offset-1) ? 0 : cur_offset + 1);
3472  01ac 7b02          	ld	a,(OFST-6,sp)
3473  01ae 5f            	clrw	x
3474  01af 97            	ld	xl,a
3475  01b0 5a            	decw	x
3476  01b1 7b03          	ld	a,(OFST-5,sp)
3477  01b3 905f          	clrw	y
3478  01b5 9097          	ld	yl,a
3479  01b7 90bf00        	ldw	c_y,y
3480  01ba b300          	cpw	x,c_y
3481  01bc 2603          	jrne	L45
3482  01be 4f            	clr	a
3483  01bf 2003          	jra	L65
3484  01c1               L45:
3485  01c1 7b03          	ld	a,(OFST-5,sp)
3486  01c3 4c            	inc	a
3487  01c4               L65:
3488  01c4 b72d          	ld	_ring_buffer_out,a
3491  01c6 b62d          	ld	a,_ring_buffer_out
3494  01c8 b62d          	ld	a,_ring_buffer_out
3495                     ; 136 	enable_interrupts();                     // Re-enable interrupts
3498  01ca 9a            rim
3500                     ; 137 } // uart_write()
3504  01cb 5b09          	addw	sp,#9
3505  01cd 81            	ret
3583                     ; 144 uint8_t uart_read(void)
3583                     ; 145 {
3584                     	switch	.text
3585  01ce               _uart_read:
3587  01ce 5207          	subw	sp,#7
3588       00000007      OFST:	set	7
3591                     ; 151     return ring_buffer_get(&ring_buffer_in);
3594                     ; 104     uint8_t data = ring->buffer[ring->read_offset];
3596  01d0 b629          	ld	a,_ring_buffer_in+1
3597  01d2 5f            	clrw	x
3598  01d3 97            	ld	xl,a
3599  01d4 92d62b        	ld	a,([_ring_buffer_in+3.w],x)
3600  01d7 6b04          	ld	(OFST-3,sp),a
3602                     ; 151     return ring_buffer_get(&ring_buffer_in);
3608  01d9 b629          	ld	a,_ring_buffer_in+1
3609  01db 6b07          	ld	(OFST+0,sp),a
3613  01dd b62a          	ld	a,_ring_buffer_in+2
3614  01df 6b01          	ld	(OFST-6,sp),a
3616                     ; 35    return ((cur_offset == max_offset-1) ? 0 : cur_offset + 1);
3618  01e1 7b01          	ld	a,(OFST-6,sp)
3619  01e3 5f            	clrw	x
3620  01e4 97            	ld	xl,a
3621  01e5 5a            	decw	x
3622  01e6 7b07          	ld	a,(OFST+0,sp)
3623  01e8 905f          	clrw	y
3624  01ea 9097          	ld	yl,a
3625  01ec 90bf00        	ldw	c_y,y
3626  01ef b300          	cpw	x,c_y
3627  01f1 2603          	jrne	L26
3628  01f3 4f            	clr	a
3629  01f4 2003          	jra	L46
3630  01f6               L26:
3631  01f6 7b07          	ld	a,(OFST+0,sp)
3632  01f8 4c            	inc	a
3633  01f9               L46:
3634  01f9 b729          	ld	_ring_buffer_in+1,a
3637  01fb b629          	ld	a,_ring_buffer_in+1
3640  01fd b629          	ld	a,_ring_buffer_in+1
3641                     ; 106     return data;
3643  01ff 7b04          	ld	a,(OFST-3,sp)
3644  0201 6b07          	ld	(OFST+0,sp),a
3648  0203 7b07          	ld	a,(OFST+0,sp)
3651  0205 5b07          	addw	sp,#7
3652  0207 81            	ret
3692                     ; 160 bool uart_kbhit(void) /* returns true if character in receive buffer */
3692                     ; 161 {
3693                     	switch	.text
3694  0208               _uart_kbhit:
3696  0208 5203          	subw	sp,#3
3697       00000003      OFST:	set	3
3703                     ; 75     return (ring->read_offset == ring->write_offset);
3705  020a b629          	ld	a,_ring_buffer_in+1
3706  020c b128          	cp	a,_ring_buffer_in
3707  020e 2604          	jrne	L07
3708  0210 a601          	ld	a,#1
3709  0212 2001          	jra	L27
3710  0214               L07:
3711  0214 4f            	clr	a
3712  0215               L27:
3713  0215 6b03          	ld	(OFST+0,sp),a
3717  0217 0d03          	tnz	(OFST+0,sp)
3718  0219 2604          	jrne	L47
3719  021b a601          	ld	a,#1
3720  021d 2001          	jra	L67
3721  021f               L47:
3722  021f 4f            	clr	a
3723  0220               L67:
3726  0220 5b03          	addw	sp,#3
3727  0222 81            	ret
3764                     	switch	.text
3765  0223               _xputs:
3767  0223 89            	pushw	x
3768       00000000      OFST:	set	0
3771  0224 200e          	jra	L1532
3772  0226               L7432:
3775  0226 1e01          	ldw	x,(OFST+1,sp)
3776  0228 1c0001        	addw	x,#1
3777  022b 1f01          	ldw	(OFST+1,sp),x
3778  022d 1d0001        	subw	x,#1
3779  0230 f6            	ld	a,(x)
3780  0231 cd0147        	call	_uart_write
3782  0234               L1532:
3785  0234 1e01          	ldw	x,(OFST+1,sp)
3786  0236 7d            	tnz	(x)
3787  0237 26ed          	jrne	L7432
3791  0239 85            	popw	x
3792  023a 81            	ret
3850                     	switch	.text
3851  023b               _i2c_scan:
3853  023b 5235          	subw	sp,#53
3854       00000035      OFST:	set	53
3859  023d 0f01          	clr	(OFST-52,sp)
3863  023f ae0022        	ldw	x,#L3042
3864  0242 addf          	call	_xputs
3868  0244 5f            	clrw	x
3869  0245 1f34          	ldw	(OFST-1,sp),x
3871  0247               L5042:
3874  0247 7b35          	ld	a,(OFST+0,sp)
3875  0249 cd0000        	call	_i2c_start
3877  024c 4d            	tnz	a
3878  024d 2618          	jrne	L3142
3881  024f 1e34          	ldw	x,(OFST-1,sp)
3882  0251 89            	pushw	x
3883  0252 ae001b        	ldw	x,#L5142
3884  0255 89            	pushw	x
3885  0256 96            	ldw	x,sp
3886  0257 1c0006        	addw	x,#OFST-47
3887  025a cd0000        	call	_sprintf
3889  025d 5b04          	addw	sp,#4
3892  025f 96            	ldw	x,sp
3893  0260 1c0002        	addw	x,#OFST-51
3894  0263 adbe          	call	_xputs
3898  0265 0c01          	inc	(OFST-52,sp)
3900  0267               L3142:
3903  0267 cd0000        	call	_i2c_stop
3907  026a 1e34          	ldw	x,(OFST-1,sp)
3908  026c 1c0002        	addw	x,#2
3909  026f 1f34          	ldw	(OFST-1,sp),x
3913  0271 9c            	rvf
3914  0272 1e34          	ldw	x,(OFST-1,sp)
3915  0274 a300ff        	cpw	x,#255
3916  0277 2fce          	jrslt	L5042
3919  0279 0d01          	tnz	(OFST-52,sp)
3920  027b 2605          	jrne	L7142
3923  027d ae0019        	ldw	x,#L1242
3924  0280 ada1          	call	_xputs
3926  0282               L7142:
3929  0282 ae0017        	ldw	x,#L3242
3930  0285 ad9c          	call	_xputs
3935  0287 5b35          	addw	sp,#53
3936  0289 81            	ret
3939                     .bit:	section	.data,bit
3940  0000               L5242_cmd_rcvd:
3941  0000 00            	dc.b	0
3992                     	switch	.text
3993  028a               _rs232_command_handler:
3995  028a 88            	push	a
3996       00000001      OFST:	set	1
4001                     	btst	L5242_cmd_rcvd
4002  0290 2537          	jrult	L7542
4004  0292 cd0208        	call	_uart_kbhit
4006  0295 4d            	tnz	a
4007  0296 2731          	jreq	L7542
4010  0298 cd01ce        	call	_uart_read
4012  029b cd0000        	call	_tolower
4014  029e 6b01          	ld	(OFST+0,sp),a
4018  02a0 7b01          	ld	a,(OFST+0,sp)
4019  02a2 cd0147        	call	_uart_write
4023  02a5 7b01          	ld	a,(OFST+0,sp)
4026  02a7 a00a          	sub	a,#10
4027  02a9 2712          	jreq	L1342
4028  02ab a003          	sub	a,#3
4029  02ad 271a          	jreq	L7542
4030  02af               L3342:
4033  02af b600          	ld	a,_rs232_ptr
4034  02b1 97            	ld	xl,a
4035  02b2 3c00          	inc	_rs232_ptr
4036  02b4 9f            	ld	a,xl
4037  02b5 5f            	clrw	x
4038  02b6 97            	ld	xl,a
4039  02b7 7b01          	ld	a,(OFST+0,sp)
4040  02b9 e732          	ld	(_rs232_inbuf,x),a
4043  02bb 200c          	jra	L7542
4044  02bd               L1342:
4047  02bd 72100000      	bset	L5242_cmd_rcvd
4050  02c1 b600          	ld	a,_rs232_ptr
4051  02c3 5f            	clrw	x
4052  02c4 97            	ld	xl,a
4053  02c5 6f32          	clr	(_rs232_inbuf,x)
4056  02c7 3f00          	clr	_rs232_ptr
4059  02c9               L3642:
4060  02c9               L7542:
4063                     	btst	L5242_cmd_rcvd
4064  02ce 240c          	jruge	L5642
4067  02d0 72110000      	bres	L5242_cmd_rcvd
4070  02d4 ae0032        	ldw	x,#_rs232_inbuf
4071  02d7 ad48          	call	_execute_single_command
4075  02d9 5b01          	addw	sp,#1
4076  02db 81            	ret
4077  02dc               L5642:
4080  02dc 4f            	clr	a
4083  02dd 5b01          	addw	sp,#1
4084  02df 81            	ret
4138                     	switch	.text
4139  02e0               _chex:
4141  02e0 88            	push	a
4142  02e1 88            	push	a
4143       00000001      OFST:	set	1
4148  02e2 4e            	swap	a
4149  02e3 a40f          	and	a,#15
4150  02e5 6b01          	ld	(OFST+0,sp),a
4154  02e7 7b01          	ld	a,(OFST+0,sp)
4155  02e9 a10a          	cp	a,#10
4156  02eb 2509          	jrult	L7152
4159  02ed 7b01          	ld	a,(OFST+0,sp)
4160  02ef ab37          	add	a,#55
4161  02f1 1e05          	ldw	x,(OFST+4,sp)
4162  02f3 f7            	ld	(x),a
4164  02f4 2007          	jra	L1252
4165  02f6               L7152:
4168  02f6 7b01          	ld	a,(OFST+0,sp)
4169  02f8 ab30          	add	a,#48
4170  02fa 1e05          	ldw	x,(OFST+4,sp)
4171  02fc f7            	ld	(x),a
4172  02fd               L1252:
4175  02fd 7b02          	ld	a,(OFST+1,sp)
4176  02ff a40f          	and	a,#15
4177  0301 6b01          	ld	(OFST+0,sp),a
4181  0303 7b01          	ld	a,(OFST+0,sp)
4182  0305 a10a          	cp	a,#10
4183  0307 250a          	jrult	L3252
4186  0309 7b01          	ld	a,(OFST+0,sp)
4187  030b ab37          	add	a,#55
4188  030d 1e05          	ldw	x,(OFST+4,sp)
4189  030f e701          	ld	(1,x),a
4191  0311 2008          	jra	L5252
4192  0313               L3252:
4195  0313 7b01          	ld	a,(OFST+0,sp)
4196  0315 ab30          	add	a,#48
4197  0317 1e05          	ldw	x,(OFST+4,sp)
4198  0319 e701          	ld	(1,x),a
4199  031b               L5252:
4202  031b 1e05          	ldw	x,(OFST+4,sp)
4203  031d 6f02          	clr	(2,x)
4207  031f 85            	popw	x
4208  0320 81            	ret
4301                     	switch	.text
4302  0321               _execute_single_command:
4304  0321 89            	pushw	x
4305  0322 522b          	subw	sp,#43
4306       0000002b      OFST:	set	43
4311  0324 5c            	incw	x
4312  0325 cd0000        	call	_atoi
4314  0328 01            	rrwa	x,a
4315  0329 6b2b          	ld	(OFST+0,sp),a
4316  032b 02            	rlwa	x,a
4320  032c 0f29          	clr	(OFST-2,sp)
4324  032e 1e2c          	ldw	x,(OFST+1,sp)
4325  0330 f6            	ld	a,(x)
4328  0331 a062          	sub	a,#98
4329  0333 273f          	jreq	L7252
4330  0335 4a            	dec	a
4331  0336 274e          	jreq	L1352
4332  0338 4a            	dec	a
4333  0339 275d          	jreq	L3352
4334  033b a008          	sub	a,#8
4335  033d 276b          	jreq	L5352
4336  033f 4a            	dec	a
4337  0340 2603          	jrne	L211
4338  0342 cc03f8        	jp	L1452
4339  0345               L211:
4340  0345 4a            	dec	a
4341  0346 2603          	jrne	L411
4342  0348 cc0420        	jp	L3452
4343  034b               L411:
4344  034b a005          	sub	a,#5
4345  034d 2603          	jrne	L611
4346  034f cc0469        	jp	L5452
4347  0352               L611:
4348  0352 4a            	dec	a
4349  0353 2767          	jreq	L7352
4350  0355               L7552:
4353  0355 a601          	ld	a,#1
4354  0357 6b29          	ld	(OFST-2,sp),a
4358  0359 1e2c          	ldw	x,(OFST+1,sp)
4359  035b 89            	pushw	x
4360  035c ae0000        	ldw	x,#L7762
4361  035f 89            	pushw	x
4362  0360 96            	ldw	x,sp
4363  0361 1c0005        	addw	x,#OFST-38
4364  0364 cd0000        	call	_sprintf
4366  0367 5b04          	addw	sp,#4
4369  0369 96            	ldw	x,sp
4370  036a 1c0001        	addw	x,#OFST-42
4371  036d cd0223        	call	_xputs
4375  0370 ac870487      	jpf	L1262
4376  0374               L7252:
4379  0374 0d2b          	tnz	(OFST+0,sp)
4380  0376 2707          	jreq	L3262
4383  0378 cd0000        	call	_lcd_i2c_blink_on
4386  037b ac870487      	jpf	L1262
4387  037f               L3262:
4390  037f cd0000        	call	_lcd_i2c_blink_off
4392  0382 ac870487      	jpf	L1262
4393  0386               L1352:
4396  0386 0d2b          	tnz	(OFST+0,sp)
4397  0388 2707          	jreq	L7262
4400  038a cd0000        	call	_lcd_i2c_cursor_on
4403  038d ac870487      	jpf	L1262
4404  0391               L7262:
4407  0391 cd0000        	call	_lcd_i2c_cursor_off
4409  0394 ac870487      	jpf	L1262
4410  0398               L3352:
4413  0398 0d2b          	tnz	(OFST+0,sp)
4414  039a 2707          	jreq	L3362
4417  039c cd0000        	call	_lcd_i2c_display_on
4420  039f ac870487      	jpf	L1262
4421  03a3               L3362:
4424  03a3 cd0000        	call	_lcd_i2c_display_off
4426  03a6 ac870487      	jpf	L1262
4427  03aa               L5352:
4430  03aa 0d2b          	tnz	(OFST+0,sp)
4431  03ac 2707          	jreq	L7362
4434  03ae cd0000        	call	_lcd_i2c_backlight_on
4437  03b1 ac870487      	jpf	L1262
4438  03b5               L7362:
4441  03b5 cd0000        	call	_lcd_i2c_backlight_off
4443  03b8 ac870487      	jpf	L1262
4444  03bc               L7352:
4447  03bc 0d2b          	tnz	(OFST+0,sp)
4448  03be 260c          	jrne	L3462
4451  03c0 72110002      	bres	_clk1+2,#0
4454  03c4 72110002      	bres	_clk2+2,#0
4456  03c8 ac870487      	jpf	L1262
4457  03cc               L3462:
4460  03cc 7b2b          	ld	a,(OFST+0,sp)
4461  03ce a101          	cp	a,#1
4462  03d0 260c          	jrne	L7462
4465  03d2 72100002      	bset	_clk1+2,#0
4468  03d6 72110002      	bres	_clk2+2,#0
4470  03da ac870487      	jpf	L1262
4471  03de               L7462:
4474  03de 7b2b          	ld	a,(OFST+0,sp)
4475  03e0 a102          	cp	a,#2
4476  03e2 260c          	jrne	L3562
4479  03e4 72110002      	bres	_clk1+2,#0
4482  03e8 72100002      	bset	_clk2+2,#0
4484  03ec ac870487      	jpf	L1262
4485  03f0               L3562:
4488  03f0 a602          	ld	a,#2
4489  03f2 6b29          	ld	(OFST-2,sp),a
4491  03f4 ac870487      	jpf	L1262
4492  03f8               L1452:
4495  03f8 7b2b          	ld	a,(OFST+0,sp)
4496  03fa a108          	cp	a,#8
4497  03fc 2504          	jrult	L7562
4500  03fe a602          	ld	a,#2
4501  0400 6b29          	ld	(OFST-2,sp),a
4503  0402               L7562:
4506  0402 1e2c          	ldw	x,(OFST+1,sp)
4507  0404 1c0003        	addw	x,#3
4508  0407 cd0000        	call	_atoi
4510  040a 01            	rrwa	x,a
4511  040b 6b2a          	ld	(OFST-1,sp),a
4512  040d 02            	rlwa	x,a
4516  040e 7b2b          	ld	a,(OFST+0,sp)
4517  0410 5f            	clrw	x
4518  0411 97            	ld	xl,a
4519  0412 4f            	clr	a
4520  0413 02            	rlwa	x,a
4521  0414 1c0100        	addw	x,#256
4522  0417 01            	rrwa	x,a
4523  0418 1a2a          	or	a,(OFST-1,sp)
4524  041a 02            	rlwa	x,a
4525  041b cd0000        	call	_max7219_write
4529  041e 2067          	jra	L1262
4530  0420               L3452:
4533  0420 7b2b          	ld	a,(OFST+0,sp)
4534  0422 a102          	cp	a,#2
4535  0424 2506          	jrult	L1662
4538  0426 a602          	ld	a,#2
4539  0428 6b29          	ld	(OFST-2,sp),a
4542  042a 205b          	jra	L1262
4543  042c               L1662:
4546  042c 0d2b          	tnz	(OFST+0,sp)
4547  042e 2617          	jrne	L5662
4550  0430 1e2c          	ldw	x,(OFST+1,sp)
4551  0432 1c0003        	addw	x,#3
4552  0435 cd0000        	call	_atoi
4554  0438 01            	rrwa	x,a
4555  0439 6b2a          	ld	(OFST-1,sp),a
4556  043b 02            	rlwa	x,a
4560  043c 7b2a          	ld	a,(OFST-1,sp)
4561  043e ae1300        	ldw	x,#4864
4562  0441 97            	ld	xl,a
4563  0442 cd0000        	call	_mcp23017_write
4566  0445 2040          	jra	L1262
4567  0447               L5662:
4570  0447 a612          	ld	a,#18
4571  0449 cd0000        	call	_mcp23017_read
4573  044c 6b2a          	ld	(OFST-1,sp),a
4577  044e 7b2a          	ld	a,(OFST-1,sp)
4578  0450 5f            	clrw	x
4579  0451 97            	ld	xl,a
4580  0452 89            	pushw	x
4581  0453 ae000d        	ldw	x,#L1762
4582  0456 89            	pushw	x
4583  0457 96            	ldw	x,sp
4584  0458 1c0005        	addw	x,#OFST-38
4585  045b cd0000        	call	_sprintf
4587  045e 5b04          	addw	sp,#4
4590  0460 96            	ldw	x,sp
4591  0461 1c0001        	addw	x,#OFST-42
4592  0464 cd0223        	call	_xputs
4594  0467 201e          	jra	L1262
4595  0469               L5452:
4598  0469 7b2b          	ld	a,(OFST+0,sp)
4601  046b 4d            	tnz	a
4602  046c 270c          	jreq	L7452
4603  046e 4a            	dec	a
4604  046f 270e          	jreq	L1552
4605  0471 4a            	dec	a
4606  0472 2710          	jreq	L3552
4607  0474               L5552:
4610  0474 a602          	ld	a,#2
4611  0476 6b29          	ld	(OFST-2,sp),a
4615  0478 200d          	jra	L1262
4616  047a               L7452:
4619  047a cd0000        	call	_print_version_number
4623  047d 2008          	jra	L1262
4624  047f               L1552:
4627  047f cd023b        	call	_i2c_scan
4631  0482 2003          	jra	L1262
4632  0484               L3552:
4635  0484 cd0000        	call	_list_all_tasks
4639  0487               L5762:
4642  0487               L1262:
4645  0487 7b29          	ld	a,(OFST-2,sp)
4648  0489 5b2d          	addw	sp,#45
4649  048b 81            	ret
4742                     	xdef	_chex
4743                     	xdef	_i2c_scan
4744                     	xdef	_UART_RX_IRQHandler
4745                     	xdef	_UART_TX_IRQHandler
4746                     	switch	.ubsct
4747  0000               _in_buffer:
4748  0000 000000000000  	ds.b	10
4749                     	xdef	_in_buffer
4750  000a               _out_buffer:
4751  000a 000000000000  	ds.b	30
4752                     	xdef	_out_buffer
4753  0028               _ring_buffer_in:
4754  0028 0000000000    	ds.b	5
4755                     	xdef	_ring_buffer_in
4756  002d               _ring_buffer_out:
4757  002d 0000000000    	ds.b	5
4758                     	xdef	_ring_buffer_out
4759                     	xdef	_isr_cnt
4760                     	switch	.bit
4761  0001               _ovf_buf_in:
4762  0001 00            	ds.b	1
4763                     	xdef	_ovf_buf_in
4764                     	xdef	_rs232_ptr
4765                     	switch	.ubsct
4766  0032               _rs232_inbuf:
4767  0032 000000000000  	ds.b	10
4768                     	xdef	_rs232_inbuf
4769                     	xref.b	_clk2
4770                     	xref.b	_clk1
4771                     	xref	_max7219_write
4772                     	xref	_lcd_i2c_backlight_on
4773                     	xref	_lcd_i2c_backlight_off
4774                     	xref	_lcd_i2c_blink_on
4775                     	xref	_lcd_i2c_blink_off
4776                     	xref	_lcd_i2c_cursor_on
4777                     	xref	_lcd_i2c_cursor_off
4778                     	xref	_lcd_i2c_display_on
4779                     	xref	_lcd_i2c_display_off
4780                     	xref	_delay_msec
4781                     	xref	_list_all_tasks
4782                     	xref	_mcp23017_write
4783                     	xref	_mcp23017_read
4784                     	xref	_i2c_stop
4785                     	xref	_i2c_start
4786                     	xdef	_execute_single_command
4787                     	xdef	_rs232_command_handler
4788                     	xdef	_uart_kbhit
4789                     	xdef	_xputs
4790                     	xdef	_uart_read
4791                     	xdef	_uart_write
4792                     	xdef	_uart_init
4793                     	xref	_print_version_number
4794                     	xref	_sprintf
4795                     	xref	_atoi
4796                     	xref	_tolower
4797                     .const:	section	.text
4798  0000               L7762:
4799  0000 4552522e434d  	dc.b	"ERR.CMD[%s]",10,0
4800  000d               L1762:
4801  000d 4750494f413d  	dc.b	"GPIOA=%d",10,0
4802  0017               L3242:
4803  0017 0a00          	dc.b	10,0
4804  0019               L1242:
4805  0019 2d00          	dc.b	"-",0
4806  001b               L5142:
4807  001b 307825307820  	dc.b	"0x%0x ",0
4808  0022               L3042:
4809  0022 4932433a2000  	dc.b	"I2C: ",0
4810                     	xref.b	c_x
4811                     	xref.b	c_y
4831                     	xref	c_xymvx
4832                     	end
