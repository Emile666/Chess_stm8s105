   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2524                     	bsct
2525  0000               _max_tasks:
2526  0000 00            	dc.b	0
2557                     ; 38 void scheduler_init(void)
2557                     ; 39 {
2559                     	switch	.text
2560  0000               _scheduler_init:
2564                     ; 40 	  memset(task_list,0x00,sizeof(task_list)); // clear task_list array
2566  0000 ae0064        	ldw	x,#100
2567  0003               L6:
2568  0003 6fff          	clr	(_task_list-1,x)
2569  0005 5a            	decw	x
2570  0006 26fb          	jrne	L6
2571                     ; 41 } // scheduler_init()
2574  0008 81            	ret
2610                     ; 50 void scheduler_isr(void)
2610                     ; 51 {
2611                     	switch	.text
2612  0009               _scheduler_isr:
2614  0009 88            	push	a
2615       00000001      OFST:	set	1
2618                     ; 52 	uint8_t index = 0; // index in task_list struct
2620  000a 0f01          	clr	(OFST+0,sp)
2623  000c 2048          	jra	L3661
2624  000e               L7561:
2625                     ; 57 		if(task_list[index].Delay > 0)
2627  000e 7b01          	ld	a,(OFST+0,sp)
2628  0010 97            	ld	xl,a
2629  0011 a619          	ld	a,#25
2630  0013 42            	mul	x,a
2631  0014 e611          	ld	a,(_task_list+17,x)
2632  0016 ea10          	or	a,(_task_list+16,x)
2633  0018 2712          	jreq	L7661
2634                     ; 59 			task_list[index].Delay--;
2636  001a 7b01          	ld	a,(OFST+0,sp)
2637  001c 97            	ld	xl,a
2638  001d a619          	ld	a,#25
2639  001f 42            	mul	x,a
2640  0020 9093          	ldw	y,x
2641  0022 ee10          	ldw	x,(_task_list+16,x)
2642  0024 1d0001        	subw	x,#1
2643  0027 90ef10        	ldw	(_task_list+16,y),x
2645  002a 2028          	jra	L1761
2646  002c               L7661:
2647                     ; 63 			task_list[index].Counter--;
2649  002c 7b01          	ld	a,(OFST+0,sp)
2650  002e 97            	ld	xl,a
2651  002f a619          	ld	a,#25
2652  0031 42            	mul	x,a
2653  0032 9093          	ldw	y,x
2654  0034 ee12          	ldw	x,(_task_list+18,x)
2655  0036 1d0001        	subw	x,#1
2656  0039 90ef12        	ldw	(_task_list+18,y),x
2657                     ; 64 			if(task_list[index].Counter == 0)
2659  003c 7b01          	ld	a,(OFST+0,sp)
2660  003e 97            	ld	xl,a
2661  003f a619          	ld	a,#25
2662  0041 42            	mul	x,a
2663  0042 e613          	ld	a,(_task_list+19,x)
2664  0044 ea12          	or	a,(_task_list+18,x)
2665  0046 260c          	jrne	L1761
2666                     ; 67 				task_list[index].Status |= TASK_READY;
2668  0048 7b01          	ld	a,(OFST+0,sp)
2669  004a 97            	ld	xl,a
2670  004b a619          	ld	a,#25
2671  004d 42            	mul	x,a
2672  004e e614          	ld	a,(_task_list+20,x)
2673  0050 aa01          	or	a,#1
2674  0052 e714          	ld	(_task_list+20,x),a
2675  0054               L1761:
2676                     ; 70 		index++;
2678  0054 0c01          	inc	(OFST+0,sp)
2680  0056               L3661:
2681                     ; 54 	while ((index < MAX_TASKS) && task_list[index].pFunction)
2683  0056 7b01          	ld	a,(OFST+0,sp)
2684  0058 a104          	cp	a,#4
2685  005a 240c          	jruge	L5761
2687  005c 7b01          	ld	a,(OFST+0,sp)
2688  005e 97            	ld	xl,a
2689  005f a619          	ld	a,#25
2690  0061 42            	mul	x,a
2691  0062 e601          	ld	a,(_task_list+1,x)
2692  0064 ea00          	or	a,(_task_list,x)
2693  0066 26a6          	jrne	L7561
2694  0068               L5761:
2695                     ; 72 } // scheduler_isr()
2698  0068 84            	pop	a
2699  0069 81            	ret
2754                     ; 80 void dispatch_tasks(void)
2754                     ; 81 {
2755                     	switch	.text
2756  006a               _dispatch_tasks:
2758  006a 5209          	subw	sp,#9
2759       00000009      OFST:	set	9
2762                     ; 82 	uint8_t index = 0;
2764  006c 0f09          	clr	(OFST+0,sp)
2767  006e ac1b011b      	jpf	L1371
2768  0072               L5271:
2769                     ; 89 		if((task_list[index].Status & (TASK_READY | TASK_ENABLED)) == (TASK_READY | TASK_ENABLED))
2771  0072 7b09          	ld	a,(OFST+0,sp)
2772  0074 97            	ld	xl,a
2773  0075 a619          	ld	a,#25
2774  0077 42            	mul	x,a
2775  0078 e614          	ld	a,(_task_list+20,x)
2776  007a a403          	and	a,#3
2777  007c a103          	cp	a,#3
2778  007e 2703          	jreq	L41
2779  0080 cc0119        	jp	L5371
2780  0083               L41:
2781                     ; 91 			time1 = millis(); // Read msec. timer
2783  0083 cd0000        	call	_millis
2785  0086 96            	ldw	x,sp
2786  0087 1c0001        	addw	x,#OFST-8
2787  008a cd0000        	call	c_rtol
2790                     ; 92 			task_list[index].pFunction(); // run the task
2792  008d 7b09          	ld	a,(OFST+0,sp)
2793  008f 97            	ld	xl,a
2794  0090 a619          	ld	a,#25
2795  0092 42            	mul	x,a
2796  0093 ee00          	ldw	x,(_task_list,x)
2797  0095 fd            	call	(x)
2799                     ; 93 			task_list[index].Status  &= ~TASK_READY; // reset the task when finished
2801  0096 7b09          	ld	a,(OFST+0,sp)
2802  0098 97            	ld	xl,a
2803  0099 a619          	ld	a,#25
2804  009b 42            	mul	x,a
2805  009c e614          	ld	a,(_task_list+20,x)
2806  009e a4fe          	and	a,#254
2807  00a0 e714          	ld	(_task_list+20,x),a
2808                     ; 94 			task_list[index].Counter  = task_list[index].Period; // reset counter
2810  00a2 7b09          	ld	a,(OFST+0,sp)
2811  00a4 97            	ld	xl,a
2812  00a5 a619          	ld	a,#25
2813  00a7 42            	mul	x,a
2814  00a8 9093          	ldw	y,x
2815  00aa 90ee0e        	ldw	y,(_task_list+14,y)
2816  00ad ef12          	ldw	(_task_list+18,x),y
2817                     ; 95 			time2 = millis(); // read msec. timer
2819  00af cd0000        	call	_millis
2821  00b2 96            	ldw	x,sp
2822  00b3 1c0005        	addw	x,#OFST-4
2823  00b6 cd0000        	call	c_rtol
2826                     ; 96 			if (time2 < time1) time2 += UINT32_MAX - time1; // overflows every 49.7 days, unlikely
2828  00b9 96            	ldw	x,sp
2829  00ba 1c0005        	addw	x,#OFST-4
2830  00bd cd0000        	call	c_ltor
2832  00c0 96            	ldw	x,sp
2833  00c1 1c0001        	addw	x,#OFST-8
2834  00c4 cd0000        	call	c_lcmp
2836  00c7 241a          	jruge	L7371
2839  00c9 aeffff        	ldw	x,#65535
2840  00cc bf02          	ldw	c_lreg+2,x
2841  00ce aeffff        	ldw	x,#-1
2842  00d1 bf00          	ldw	c_lreg,x
2843  00d3 96            	ldw	x,sp
2844  00d4 1c0001        	addw	x,#OFST-8
2845  00d7 cd0000        	call	c_lsub
2847  00da 96            	ldw	x,sp
2848  00db 1c0005        	addw	x,#OFST-4
2849  00de cd0000        	call	c_lgadd
2853  00e1 200e          	jra	L1471
2854  00e3               L7371:
2855                     ; 97 			else               time2 -= time1; 
2857  00e3 96            	ldw	x,sp
2858  00e4 1c0001        	addw	x,#OFST-8
2859  00e7 cd0000        	call	c_ltor
2861  00ea 96            	ldw	x,sp
2862  00eb 1c0005        	addw	x,#OFST-4
2863  00ee cd0000        	call	c_lgsub
2866  00f1               L1471:
2867                     ; 98 			task_list[index].Duration  = (uint16_t)time2; // time difference in milliseconds
2869  00f1 7b09          	ld	a,(OFST+0,sp)
2870  00f3 97            	ld	xl,a
2871  00f4 a619          	ld	a,#25
2872  00f6 42            	mul	x,a
2873  00f7 1607          	ldw	y,(OFST-2,sp)
2874  00f9 ef15          	ldw	(_task_list+21,x),y
2875                     ; 99 			if (time2 > task_list[index].Duration_Max)
2877  00fb 7b09          	ld	a,(OFST+0,sp)
2878  00fd 97            	ld	xl,a
2879  00fe a619          	ld	a,#25
2880  0100 42            	mul	x,a
2881  0101 ee17          	ldw	x,(_task_list+23,x)
2882  0103 cd0000        	call	c_uitolx
2884  0106 96            	ldw	x,sp
2885  0107 1c0005        	addw	x,#OFST-4
2886  010a cd0000        	call	c_lcmp
2888  010d 240a          	jruge	L5371
2889                     ; 101 				task_list[index].Duration_Max = time2;
2891  010f 7b09          	ld	a,(OFST+0,sp)
2892  0111 97            	ld	xl,a
2893  0112 a619          	ld	a,#25
2894  0114 42            	mul	x,a
2895  0115 1607          	ldw	y,(OFST-2,sp)
2896  0117 ef17          	ldw	(_task_list+23,x),y
2897  0119               L5371:
2898                     ; 104 		index++;
2900  0119 0c09          	inc	(OFST+0,sp)
2902  011b               L1371:
2903                     ; 87 	while ((index < MAX_TASKS) && task_list[index].pFunction)
2905  011b 7b09          	ld	a,(OFST+0,sp)
2906  011d a104          	cp	a,#4
2907  011f 240f          	jruge	L5471
2909  0121 7b09          	ld	a,(OFST+0,sp)
2910  0123 97            	ld	xl,a
2911  0124 a619          	ld	a,#25
2912  0126 42            	mul	x,a
2913  0127 e601          	ld	a,(_task_list+1,x)
2914  0129 ea00          	or	a,(_task_list,x)
2915  012b 2703          	jreq	L61
2916  012d cc0072        	jp	L5271
2917  0130               L61:
2918  0130               L5471:
2919                     ; 107 } // dispatch_tasks()
2922  0130 5b09          	addw	sp,#9
2923  0132 81            	ret
3019                     ; 117 uint8_t add_task(void (*task_ptr)(), char *Name, uint16_t delay, uint16_t period)
3019                     ; 118 {
3020                     	switch	.text
3021  0133               _add_task:
3023  0133 89            	pushw	x
3024  0134 5205          	subw	sp,#5
3025       00000005      OFST:	set	5
3028                     ; 119 	uint8_t  index = 0;
3030  0136 0f05          	clr	(OFST+0,sp)
3032                     ; 120 	uint16_t temp1 = (uint16_t)(delay  * TICKS_PER_SEC / 1000);
3034  0138 1e0c          	ldw	x,(OFST+7,sp)
3035  013a 1f01          	ldw	(OFST-4,sp),x
3037                     ; 121 	uint16_t temp2 = (uint16_t)(period * TICKS_PER_SEC / 1000);
3039  013c 1e0e          	ldw	x,(OFST+9,sp)
3040  013e 1f03          	ldw	(OFST-2,sp),x
3042                     ; 123 	if (max_tasks >= MAX_TASKS) return ERR_MAX_TASKS;
3044  0140 b600          	ld	a,_max_tasks
3045  0142 a104          	cp	a,#4
3046  0144 2506          	jrult	L1202
3049  0146 a605          	ld	a,#5
3051  0148 201c          	jra	L42
3052  014a               L7102:
3053                     ; 125 	while ((index < MAX_TASKS) && task_list[index].Period) index++;
3055  014a 0c05          	inc	(OFST+0,sp)
3057  014c               L1202:
3060  014c 7b05          	ld	a,(OFST+0,sp)
3061  014e a104          	cp	a,#4
3062  0150 240c          	jruge	L5202
3064  0152 7b05          	ld	a,(OFST+0,sp)
3065  0154 97            	ld	xl,a
3066  0155 a619          	ld	a,#25
3067  0157 42            	mul	x,a
3068  0158 e60f          	ld	a,(_task_list+15,x)
3069  015a ea0e          	or	a,(_task_list+14,x)
3070  015c 26ec          	jrne	L7102
3071  015e               L5202:
3072                     ; 126     if (index >= MAX_TASKS)     return ERR_MAX_TASKS;
3074  015e 7b05          	ld	a,(OFST+0,sp)
3075  0160 a104          	cp	a,#4
3076  0162 2505          	jrult	L7202
3079  0164 a605          	ld	a,#5
3081  0166               L42:
3083  0166 5b07          	addw	sp,#7
3084  0168 81            	ret
3085  0169               L7202:
3086                     ; 128 	if (task_list[index].Period == 0)
3088  0169 7b05          	ld	a,(OFST+0,sp)
3089  016b 97            	ld	xl,a
3090  016c a619          	ld	a,#25
3091  016e 42            	mul	x,a
3092  016f e60f          	ld	a,(_task_list+15,x)
3093  0171 ea0e          	or	a,(_task_list+14,x)
3094  0173 2670          	jrne	L1302
3095                     ; 130 		task_list[index].pFunction    = task_ptr;       // Pointer to Function
3097  0175 7b05          	ld	a,(OFST+0,sp)
3098  0177 97            	ld	xl,a
3099  0178 a619          	ld	a,#25
3100  017a 42            	mul	x,a
3101  017b 1606          	ldw	y,(OFST+1,sp)
3102  017d ef00          	ldw	(_task_list,x),y
3103                     ; 131 		task_list[index].Period       = temp2;          // Period in msec.
3105  017f 7b05          	ld	a,(OFST+0,sp)
3106  0181 97            	ld	xl,a
3107  0182 a619          	ld	a,#25
3108  0184 42            	mul	x,a
3109  0185 1603          	ldw	y,(OFST-2,sp)
3110  0187 ef0e          	ldw	(_task_list+14,x),y
3111                     ; 132 		task_list[index].Counter      = temp2;	        // Countdown timer
3113  0189 7b05          	ld	a,(OFST+0,sp)
3114  018b 97            	ld	xl,a
3115  018c a619          	ld	a,#25
3116  018e 42            	mul	x,a
3117  018f 1603          	ldw	y,(OFST-2,sp)
3118  0191 ef12          	ldw	(_task_list+18,x),y
3119                     ; 133 		task_list[index].Delay        = temp1;          // Initial delay before start
3121  0193 7b05          	ld	a,(OFST+0,sp)
3122  0195 97            	ld	xl,a
3123  0196 a619          	ld	a,#25
3124  0198 42            	mul	x,a
3125  0199 1601          	ldw	y,(OFST-4,sp)
3126  019b ef10          	ldw	(_task_list+16,x),y
3127                     ; 134 		task_list[index].Status      |= TASK_ENABLED;   // Enable task by default
3129  019d 7b05          	ld	a,(OFST+0,sp)
3130  019f 97            	ld	xl,a
3131  01a0 a619          	ld	a,#25
3132  01a2 42            	mul	x,a
3133  01a3 e614          	ld	a,(_task_list+20,x)
3134  01a5 aa02          	or	a,#2
3135  01a7 e714          	ld	(_task_list+20,x),a
3136                     ; 135 		task_list[index].Status      &= ~TASK_READY;    // Task not ready to run
3138  01a9 7b05          	ld	a,(OFST+0,sp)
3139  01ab 97            	ld	xl,a
3140  01ac a619          	ld	a,#25
3141  01ae 42            	mul	x,a
3142  01af e614          	ld	a,(_task_list+20,x)
3143  01b1 a4fe          	and	a,#254
3144  01b3 e714          	ld	(_task_list+20,x),a
3145                     ; 136 		task_list[index].Duration     = 0;              // Actual Task Duration
3147  01b5 7b05          	ld	a,(OFST+0,sp)
3148  01b7 97            	ld	xl,a
3149  01b8 a619          	ld	a,#25
3150  01ba 42            	mul	x,a
3151  01bb 905f          	clrw	y
3152  01bd ef15          	ldw	(_task_list+21,x),y
3153                     ; 137 		task_list[index].Duration_Max = 0;              // Max. Task Duration
3155  01bf 7b05          	ld	a,(OFST+0,sp)
3156  01c1 97            	ld	xl,a
3157  01c2 a619          	ld	a,#25
3158  01c4 42            	mul	x,a
3159  01c5 905f          	clrw	y
3160  01c7 ef17          	ldw	(_task_list+23,x),y
3161                     ; 138 		strncpy(task_list[index].Name, Name, NAME_LEN); // Name of Task
3163  01c9 ae000c        	ldw	x,#12
3164  01cc 89            	pushw	x
3165  01cd 1e0c          	ldw	x,(OFST+7,sp)
3166  01cf 89            	pushw	x
3167  01d0 7b09          	ld	a,(OFST+4,sp)
3168  01d2 97            	ld	xl,a
3169  01d3 a619          	ld	a,#25
3170  01d5 42            	mul	x,a
3171  01d6 01            	rrwa	x,a
3172  01d7 ab02          	add	a,#_task_list+2
3173  01d9 2401          	jrnc	L22
3174  01db 5c            	incw	x
3175  01dc               L22:
3176  01dc 5f            	clrw	x
3177  01dd 97            	ld	xl,a
3178  01de cd0000        	call	_strncpy
3180  01e1 5b04          	addw	sp,#4
3181                     ; 139 		max_tasks++; // increase number of tasks
3183  01e3 3c00          	inc	_max_tasks
3184  01e5               L1302:
3185                     ; 141 	return NO_ERR;
3187  01e5 4f            	clr	a
3189  01e6 ac660166      	jpf	L42
3245                     ; 149 uint8_t enable_task(char *Name)
3245                     ; 150 {
3246                     	switch	.text
3247  01ea               _enable_task:
3249  01ea 89            	pushw	x
3250  01eb 89            	pushw	x
3251       00000002      OFST:	set	2
3254                     ; 151 	uint8_t index = 0;
3256  01ec 0f02          	clr	(OFST+0,sp)
3258                     ; 152 	bool    found = false;
3260  01ee 0f01          	clr	(OFST-1,sp)
3262                     ; 155 	if(task_list[index].Period != 0)
3264  01f0 be0e          	ldw	x,_task_list+14
3265  01f2 2741          	jreq	L1602
3267  01f4 202d          	jra	L5602
3268  01f6               L3602:
3269                     ; 159 			if (!strcmp(task_list[index].Name,Name))
3271  01f6 1e03          	ldw	x,(OFST+1,sp)
3272  01f8 89            	pushw	x
3273  01f9 7b04          	ld	a,(OFST+2,sp)
3274  01fb 97            	ld	xl,a
3275  01fc a619          	ld	a,#25
3276  01fe 42            	mul	x,a
3277  01ff 01            	rrwa	x,a
3278  0200 ab02          	add	a,#_task_list+2
3279  0202 2401          	jrnc	L03
3280  0204 5c            	incw	x
3281  0205               L03:
3282  0205 5f            	clrw	x
3283  0206 97            	ld	xl,a
3284  0207 cd0000        	call	_strcmp
3286  020a 5b02          	addw	sp,#2
3287  020c a30000        	cpw	x,#0
3288  020f 2610          	jrne	L1702
3289                     ; 161 				task_list[index].Status |= TASK_ENABLED;
3291  0211 7b02          	ld	a,(OFST+0,sp)
3292  0213 97            	ld	xl,a
3293  0214 a619          	ld	a,#25
3294  0216 42            	mul	x,a
3295  0217 e614          	ld	a,(_task_list+20,x)
3296  0219 aa02          	or	a,#2
3297  021b e714          	ld	(_task_list+20,x),a
3298                     ; 162 				found = true;
3300  021d a601          	ld	a,#1
3301  021f 6b01          	ld	(OFST-1,sp),a
3303  0221               L1702:
3304                     ; 164 			index++;
3306  0221 0c02          	inc	(OFST+0,sp)
3308  0223               L5602:
3309                     ; 157 		while ((task_list[index].Period != 0) && !found)
3311  0223 7b02          	ld	a,(OFST+0,sp)
3312  0225 97            	ld	xl,a
3313  0226 a619          	ld	a,#25
3314  0228 42            	mul	x,a
3315  0229 e60f          	ld	a,(_task_list+15,x)
3316  022b ea0e          	or	a,(_task_list+14,x)
3317  022d 270a          	jreq	L5702
3319  022f 0d01          	tnz	(OFST-1,sp)
3320  0231 27c3          	jreq	L3602
3321  0233 2004          	jra	L5702
3322  0235               L1602:
3323                     ; 167 	else return ERR_EMPTY;
3325  0235 a605          	ld	a,#5
3327  0237 2006          	jra	L23
3328  0239               L5702:
3329                     ; 168 	if (!found)
3331  0239 0d01          	tnz	(OFST-1,sp)
3332  023b 2605          	jrne	L7702
3333                     ; 169 	     return ERR_NAME;
3335  023d a604          	ld	a,#4
3337  023f               L23:
3339  023f 5b04          	addw	sp,#4
3340  0241 81            	ret
3341  0242               L7702:
3342                     ; 170 	else return NO_ERR;	
3344  0242 4f            	clr	a
3346  0243 20fa          	jra	L23
3402                     ; 178 uint8_t disable_task(char *Name)
3402                     ; 179 {
3403                     	switch	.text
3404  0245               _disable_task:
3406  0245 89            	pushw	x
3407  0246 89            	pushw	x
3408       00000002      OFST:	set	2
3411                     ; 180 	uint8_t index = 0;
3413  0247 0f02          	clr	(OFST+0,sp)
3415                     ; 181 	bool    found = false;
3417  0249 0f01          	clr	(OFST-1,sp)
3419                     ; 184 	if(task_list[index].Period != 0)
3421  024b be0e          	ldw	x,_task_list+14
3422  024d 2741          	jreq	L1312
3424  024f 202d          	jra	L5312
3425  0251               L3312:
3426                     ; 188 			if (!strcmp(task_list[index].Name,Name))
3428  0251 1e03          	ldw	x,(OFST+1,sp)
3429  0253 89            	pushw	x
3430  0254 7b04          	ld	a,(OFST+2,sp)
3431  0256 97            	ld	xl,a
3432  0257 a619          	ld	a,#25
3433  0259 42            	mul	x,a
3434  025a 01            	rrwa	x,a
3435  025b ab02          	add	a,#_task_list+2
3436  025d 2401          	jrnc	L63
3437  025f 5c            	incw	x
3438  0260               L63:
3439  0260 5f            	clrw	x
3440  0261 97            	ld	xl,a
3441  0262 cd0000        	call	_strcmp
3443  0265 5b02          	addw	sp,#2
3444  0267 a30000        	cpw	x,#0
3445  026a 2610          	jrne	L1412
3446                     ; 190 				task_list[index].Status &= ~TASK_ENABLED;
3448  026c 7b02          	ld	a,(OFST+0,sp)
3449  026e 97            	ld	xl,a
3450  026f a619          	ld	a,#25
3451  0271 42            	mul	x,a
3452  0272 e614          	ld	a,(_task_list+20,x)
3453  0274 a4fd          	and	a,#253
3454  0276 e714          	ld	(_task_list+20,x),a
3455                     ; 191 				found = true;
3457  0278 a601          	ld	a,#1
3458  027a 6b01          	ld	(OFST-1,sp),a
3460  027c               L1412:
3461                     ; 193 			index++;
3463  027c 0c02          	inc	(OFST+0,sp)
3465  027e               L5312:
3466                     ; 186 		while ((task_list[index].Period != 0) && !found)
3468  027e 7b02          	ld	a,(OFST+0,sp)
3469  0280 97            	ld	xl,a
3470  0281 a619          	ld	a,#25
3471  0283 42            	mul	x,a
3472  0284 e60f          	ld	a,(_task_list+15,x)
3473  0286 ea0e          	or	a,(_task_list+14,x)
3474  0288 270a          	jreq	L5412
3476  028a 0d01          	tnz	(OFST-1,sp)
3477  028c 27c3          	jreq	L3312
3478  028e 2004          	jra	L5412
3479  0290               L1312:
3480                     ; 196 	else return ERR_EMPTY;
3482  0290 a605          	ld	a,#5
3484  0292 2006          	jra	L04
3485  0294               L5412:
3486                     ; 197 	if (!found)
3488  0294 0d01          	tnz	(OFST-1,sp)
3489  0296 2605          	jrne	L7412
3490                     ; 198 	     return ERR_NAME;
3492  0298 a604          	ld	a,#4
3494  029a               L04:
3496  029a 5b04          	addw	sp,#4
3497  029c 81            	ret
3498  029d               L7412:
3499                     ; 199 	else return NO_ERR;	
3501  029d 4f            	clr	a
3503  029e 20fa          	jra	L04
3569                     ; 208 uint8_t set_task_time_period(uint16_t Period, char *Name)
3569                     ; 209 {
3570                     	switch	.text
3571  02a0               _set_task_time_period:
3573  02a0 89            	pushw	x
3574  02a1 89            	pushw	x
3575       00000002      OFST:	set	2
3578                     ; 210 	uint8_t index = 0;
3580  02a2 0f02          	clr	(OFST+0,sp)
3582                     ; 211 	bool    found = false;
3584  02a4 0f01          	clr	(OFST-1,sp)
3586                     ; 214 	if(task_list[index].Period != 0)
3588  02a6 be0e          	ldw	x,_task_list+14
3589  02a8 273f          	jreq	L5022
3591  02aa 202b          	jra	L1122
3592  02ac               L7022:
3593                     ; 218 			if (!strcmp(task_list[index].Name,Name))
3595  02ac 1e07          	ldw	x,(OFST+5,sp)
3596  02ae 89            	pushw	x
3597  02af 7b04          	ld	a,(OFST+2,sp)
3598  02b1 97            	ld	xl,a
3599  02b2 a619          	ld	a,#25
3600  02b4 42            	mul	x,a
3601  02b5 01            	rrwa	x,a
3602  02b6 ab02          	add	a,#_task_list+2
3603  02b8 2401          	jrnc	L44
3604  02ba 5c            	incw	x
3605  02bb               L44:
3606  02bb 5f            	clrw	x
3607  02bc 97            	ld	xl,a
3608  02bd cd0000        	call	_strcmp
3610  02c0 5b02          	addw	sp,#2
3611  02c2 a30000        	cpw	x,#0
3612  02c5 260e          	jrne	L5122
3613                     ; 220 				task_list[index].Period = (uint16_t)(Period * TICKS_PER_SEC / 1000);
3615  02c7 7b02          	ld	a,(OFST+0,sp)
3616  02c9 97            	ld	xl,a
3617  02ca a619          	ld	a,#25
3618  02cc 42            	mul	x,a
3619  02cd 1603          	ldw	y,(OFST+1,sp)
3620  02cf ef0e          	ldw	(_task_list+14,x),y
3621                     ; 221 				found = true;
3623  02d1 a601          	ld	a,#1
3624  02d3 6b01          	ld	(OFST-1,sp),a
3626  02d5               L5122:
3627                     ; 223 			index++;
3629  02d5 0c02          	inc	(OFST+0,sp)
3631  02d7               L1122:
3632                     ; 216 		while ((task_list[index].Period != 0) && !found)
3634  02d7 7b02          	ld	a,(OFST+0,sp)
3635  02d9 97            	ld	xl,a
3636  02da a619          	ld	a,#25
3637  02dc 42            	mul	x,a
3638  02dd e60f          	ld	a,(_task_list+15,x)
3639  02df ea0e          	or	a,(_task_list+14,x)
3640  02e1 270a          	jreq	L1222
3642  02e3 0d01          	tnz	(OFST-1,sp)
3643  02e5 27c5          	jreq	L7022
3644  02e7 2004          	jra	L1222
3645  02e9               L5022:
3646                     ; 226 	else return ERR_EMPTY;
3648  02e9 a605          	ld	a,#5
3650  02eb 2006          	jra	L64
3651  02ed               L1222:
3652                     ; 227 	if (!found)
3654  02ed 0d01          	tnz	(OFST-1,sp)
3655  02ef 2605          	jrne	L3222
3656                     ; 228 	     return ERR_NAME;
3658  02f1 a604          	ld	a,#4
3660  02f3               L64:
3662  02f3 5b04          	addw	sp,#4
3663  02f5 81            	ret
3664  02f6               L3222:
3665                     ; 229 	else return NO_ERR;	
3667  02f6 4f            	clr	a
3669  02f7 20fa          	jra	L64
3716                     ; 238 void list_all_tasks(void)
3716                     ; 239 {
3717                     	switch	.text
3718  02f9               _list_all_tasks:
3720  02f9 5233          	subw	sp,#51
3721       00000033      OFST:	set	51
3724                     ; 240 	uint8_t index = 0;
3726  02fb 0f33          	clr	(OFST+0,sp)
3728                     ; 243 	xputs("Task-Name   T(ms) Stat T(ms) M(ms)\n");
3730  02fd ae0010        	ldw	x,#L1522
3731  0300 cd0000        	call	_xputs
3733                     ; 245 	if(task_list[index].Period != 0)
3735  0303 7b33          	ld	a,(OFST+0,sp)
3736  0305 97            	ld	xl,a
3737  0306 a619          	ld	a,#25
3738  0308 42            	mul	x,a
3739  0309 e60f          	ld	a,(_task_list+15,x)
3740  030b ea0e          	or	a,(_task_list+14,x)
3741  030d 275b          	jreq	L3522
3743  030f 204d          	jra	L7522
3744  0311               L5522:
3745                     ; 249             xputs(task_list[index].Name);
3747  0311 7b33          	ld	a,(OFST+0,sp)
3748  0313 97            	ld	xl,a
3749  0314 a619          	ld	a,#25
3750  0316 42            	mul	x,a
3751  0317 01            	rrwa	x,a
3752  0318 ab02          	add	a,#_task_list+2
3753  031a 2401          	jrnc	L25
3754  031c 5c            	incw	x
3755  031d               L25:
3756  031d 5f            	clrw	x
3757  031e 97            	ld	xl,a
3758  031f cd0000        	call	_xputs
3760                     ; 251 			sprintf(s,",%d,0x%x,%d,%d\n", 
3760                     ; 252                       task_list[index].Period  , (uint16_t)task_list[index].Status, 
3760                     ; 253 					  task_list[index].Duration, task_list[index].Duration_Max);
3762  0322 7b33          	ld	a,(OFST+0,sp)
3763  0324 97            	ld	xl,a
3764  0325 a619          	ld	a,#25
3765  0327 42            	mul	x,a
3766  0328 ee17          	ldw	x,(_task_list+23,x)
3767  032a 89            	pushw	x
3768  032b 7b35          	ld	a,(OFST+2,sp)
3769  032d 97            	ld	xl,a
3770  032e a619          	ld	a,#25
3771  0330 42            	mul	x,a
3772  0331 ee15          	ldw	x,(_task_list+21,x)
3773  0333 89            	pushw	x
3774  0334 7b37          	ld	a,(OFST+4,sp)
3775  0336 97            	ld	xl,a
3776  0337 a619          	ld	a,#25
3777  0339 42            	mul	x,a
3778  033a e614          	ld	a,(_task_list+20,x)
3779  033c 5f            	clrw	x
3780  033d 97            	ld	xl,a
3781  033e 89            	pushw	x
3782  033f 7b39          	ld	a,(OFST+6,sp)
3783  0341 97            	ld	xl,a
3784  0342 a619          	ld	a,#25
3785  0344 42            	mul	x,a
3786  0345 ee0e          	ldw	x,(_task_list+14,x)
3787  0347 89            	pushw	x
3788  0348 ae0000        	ldw	x,#L3622
3789  034b 89            	pushw	x
3790  034c 96            	ldw	x,sp
3791  034d 1c000b        	addw	x,#OFST-40
3792  0350 cd0000        	call	_sprintf
3794  0353 5b0a          	addw	sp,#10
3795                     ; 254 			xputs(s);
3797  0355 96            	ldw	x,sp
3798  0356 1c0001        	addw	x,#OFST-50
3799  0359 cd0000        	call	_xputs
3801                     ; 255 			index++;
3803  035c 0c33          	inc	(OFST+0,sp)
3805  035e               L7522:
3806                     ; 247 		while (task_list[index].Period != 0)
3808  035e 7b33          	ld	a,(OFST+0,sp)
3809  0360 97            	ld	xl,a
3810  0361 a619          	ld	a,#25
3811  0363 42            	mul	x,a
3812  0364 e60f          	ld	a,(_task_list+15,x)
3813  0366 ea0e          	or	a,(_task_list+14,x)
3814  0368 26a7          	jrne	L5522
3815  036a               L3522:
3816                     ; 258 } // list_all_tasks()
3819  036a 5b33          	addw	sp,#51
3820  036c 81            	ret
3926                     	xdef	_max_tasks
3927                     	switch	.ubsct
3928  0000               _task_list:
3929  0000 000000000000  	ds.b	100
3930                     	xdef	_task_list
3931                     	xref	_xputs
3932                     	xref	_millis
3933                     	xref	_sprintf
3934                     	xdef	_list_all_tasks
3935                     	xdef	_disable_task
3936                     	xdef	_enable_task
3937                     	xdef	_set_task_time_period
3938                     	xdef	_add_task
3939                     	xdef	_dispatch_tasks
3940                     	xdef	_scheduler_isr
3941                     	xdef	_scheduler_init
3942                     	xref	_strcmp
3943                     	xref	_strncpy
3944                     .const:	section	.text
3945  0000               L3622:
3946  0000 2c25642c3078  	dc.b	",%d,0x%x,%d,%d",10,0
3947  0010               L1522:
3948  0010 5461736b2d4e  	dc.b	"Task-Name   T(ms) "
3949  0022 537461742054  	dc.b	"Stat T(ms) M(ms)",10,0
3950                     	xref.b	c_lreg
3970                     	xref	c_uitolx
3971                     	xref	c_lgsub
3972                     	xref	c_lgadd
3973                     	xref	c_lsub
3974                     	xref	c_lcmp
3975                     	xref	c_ltor
3976                     	xref	c_rtol
3977                     	end
