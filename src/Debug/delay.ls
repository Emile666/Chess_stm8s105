   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2524                     	bsct
2525  0000               _t2_millis:
2526  0000 00000000      	dc.l	0
2569                     ; 31 uint32_t millis(void)
2569                     ; 32 {
2571                     	switch	.text
2572  0000               _millis:
2574  0000 5204          	subw	sp,#4
2575       00000004      OFST:	set	4
2578                     ; 36 	disable_interrupts();
2581  0002 9b            sim
2583                     ; 37 	m = t2_millis;
2586  0003 be02          	ldw	x,_t2_millis+2
2587  0005 1f03          	ldw	(OFST-1,sp),x
2588  0007 be00          	ldw	x,_t2_millis
2589  0009 1f01          	ldw	(OFST-3,sp),x
2591                     ; 38 	enable_interrupts();
2594  000b 9a            rim
2596                     ; 39 	return m;
2599  000c 96            	ldw	x,sp
2600  000d 1c0001        	addw	x,#OFST-3
2601  0010 cd0000        	call	c_ltor
2605  0013 5b04          	addw	sp,#4
2606  0015 81            	ret
2668                     ; 50 void delay_msec(uint16_t ms)
2668                     ; 51 {
2669                     	switch	.text
2670  0016               _delay_msec:
2672  0016 89            	pushw	x
2673  0017 520d          	subw	sp,#13
2674       0000000d      OFST:	set	13
2677                     ; 54 	uint32_t start = millis();
2679  0019 ade5          	call	_millis
2681  001b 96            	ldw	x,sp
2682  001c 1c000a        	addw	x,#OFST-3
2683  001f cd0000        	call	c_rtol
2686  0022               L1071:
2687                     ; 58         for (i = 0; i < 100; i++) ;
2689  0022 0f09          	clr	(OFST-4,sp)
2691  0024               L7071:
2695  0024 0c09          	inc	(OFST-4,sp)
2699  0026 7b09          	ld	a,(OFST-4,sp)
2700  0028 a164          	cp	a,#100
2701  002a 25f8          	jrult	L7071
2702                     ; 59         tmr = millis();
2704  002c add2          	call	_millis
2706  002e 96            	ldw	x,sp
2707  002f 1c0005        	addw	x,#OFST-8
2708  0032 cd0000        	call	c_rtol
2711                     ; 60 		if (tmr < start)
2713  0035 96            	ldw	x,sp
2714  0036 1c0005        	addw	x,#OFST-8
2715  0039 cd0000        	call	c_ltor
2717  003c 96            	ldw	x,sp
2718  003d 1c000a        	addw	x,#OFST-3
2719  0040 cd0000        	call	c_lcmp
2721  0043 2421          	jruge	L3071
2722                     ; 62            start = 0xffffffff - start;
2724  0045 aeffff        	ldw	x,#65535
2725  0048 bf02          	ldw	c_lreg+2,x
2726  004a aeffff        	ldw	x,#-1
2727  004d bf00          	ldw	c_lreg,x
2728  004f 96            	ldw	x,sp
2729  0050 1c000a        	addw	x,#OFST-3
2730  0053 cd0000        	call	c_lsub
2732  0056 96            	ldw	x,sp
2733  0057 1c000a        	addw	x,#OFST-3
2734  005a cd0000        	call	c_rtol
2737                     ; 63            start++;
2739  005d 96            	ldw	x,sp
2740  005e 1c000a        	addw	x,#OFST-3
2741  0061 a601          	ld	a,#1
2742  0063 cd0000        	call	c_lgadc
2745  0066               L3071:
2746                     ; 65 	} while ((tmr - start) < ms);
2748  0066 96            	ldw	x,sp
2749  0067 1c0005        	addw	x,#OFST-8
2750  006a cd0000        	call	c_ltor
2752  006d 96            	ldw	x,sp
2753  006e 1c000a        	addw	x,#OFST-3
2754  0071 cd0000        	call	c_lsub
2756  0074 96            	ldw	x,sp
2757  0075 1c0001        	addw	x,#OFST-12
2758  0078 cd0000        	call	c_rtol
2761  007b 1e0e          	ldw	x,(OFST+1,sp)
2762  007d cd0000        	call	c_uitolx
2764  0080 96            	ldw	x,sp
2765  0081 1c0001        	addw	x,#OFST-12
2766  0084 cd0000        	call	c_lcmp
2768  0087 2299          	jrugt	L1071
2769                     ; 66 } // delay_msec()
2772  0089 5b0f          	addw	sp,#15
2773  008b 81            	ret
2829                     ; 73 uint16_t tmr2_val(void)
2829                     ; 74 {
2830                     	switch	.text
2831  008c               _tmr2_val:
2833  008c 5204          	subw	sp,#4
2834       00000004      OFST:	set	4
2837                     ; 78 	disable_interrupts();
2840  008e 9b            sim
2842                     ; 79 	h = TIM2_CNTRH;
2845  008f c6530a        	ld	a,_TIM2_CNTRH
2846  0092 6b01          	ld	(OFST-3,sp),a
2848                     ; 80 	l = TIM2_CNTRL;
2850  0094 c6530b        	ld	a,_TIM2_CNTRL
2851  0097 6b02          	ld	(OFST-2,sp),a
2853                     ; 81 	enable_interrupts();
2856  0099 9a            rim
2858                     ; 82 	tmr   = h;
2861  009a 7b01          	ld	a,(OFST-3,sp)
2862  009c 5f            	clrw	x
2863  009d 97            	ld	xl,a
2864  009e 1f03          	ldw	(OFST-1,sp),x
2866                     ; 83 	tmr <<= 8;
2868  00a0 7b04          	ld	a,(OFST+0,sp)
2869  00a2 6b03          	ld	(OFST-1,sp),a
2870  00a4 0f04          	clr	(OFST+0,sp)
2872                     ; 84 	tmr  |= l;	
2874  00a6 7b02          	ld	a,(OFST-2,sp)
2875  00a8 5f            	clrw	x
2876  00a9 97            	ld	xl,a
2877  00aa 01            	rrwa	x,a
2878  00ab 1a04          	or	a,(OFST+0,sp)
2879  00ad 01            	rrwa	x,a
2880  00ae 1a03          	or	a,(OFST-1,sp)
2881  00b0 01            	rrwa	x,a
2882  00b1 1f03          	ldw	(OFST-1,sp),x
2884                     ; 85 	return tmr;
2886  00b3 1e03          	ldw	x,(OFST-1,sp)
2889  00b5 5b04          	addw	sp,#4
2890  00b7 81            	ret
2943                     ; 95 void delay_usec(uint16_t us)
2943                     ; 96 {
2944                     	switch	.text
2945  00b8               _delay_usec:
2947  00b8 89            	pushw	x
2948  00b9 5204          	subw	sp,#4
2949       00000004      OFST:	set	4
2952                     ; 98 	uint16_t start = tmr2_val();
2954  00bb adcf          	call	_tmr2_val
2956  00bd 1f03          	ldw	(OFST-1,sp),x
2958  00bf               L3771:
2959                     ; 101 		tmr = tmr2_val();
2961  00bf adcb          	call	_tmr2_val
2963  00c1 1f01          	ldw	(OFST-3,sp),x
2965                     ; 102 		if (tmr < start) start = 1001 - start;
2967  00c3 1e01          	ldw	x,(OFST-3,sp)
2968  00c5 1303          	cpw	x,(OFST-1,sp)
2969  00c7 2408          	jruge	L5771
2972  00c9 ae03e9        	ldw	x,#1001
2973  00cc 72f003        	subw	x,(OFST-1,sp)
2974  00cf 1f03          	ldw	(OFST-1,sp),x
2976  00d1               L5771:
2977                     ; 103     } while ((tmr - start) < us);
2979  00d1 1e01          	ldw	x,(OFST-3,sp)
2980  00d3 72f003        	subw	x,(OFST-1,sp)
2981  00d6 1305          	cpw	x,(OFST+1,sp)
2982  00d8 25e5          	jrult	L3771
2983                     ; 104 } // delay_usec()
2986  00da 5b06          	addw	sp,#6
2987  00dc 81            	ret
3011                     	xdef	_tmr2_val
3012                     	xdef	_t2_millis
3013                     	xdef	_delay_usec
3014                     	xdef	_delay_msec
3015                     	xdef	_millis
3016                     	xref.b	c_lreg
3035                     	xref	c_uitolx
3036                     	xref	c_lgadc
3037                     	xref	c_lsub
3038                     	xref	c_lcmp
3039                     	xref	c_rtol
3040                     	xref	c_ltor
3041                     	end
