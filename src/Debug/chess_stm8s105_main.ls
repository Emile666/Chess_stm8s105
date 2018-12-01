   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2524                     	bsct
2525  0000               _col_nr:
2526  0000 00            	dc.b	0
2527                     .bit:	section	.data,bit
2528  0000               _rotenc_sw:
2529  0000 00            	dc.b	0
2530  0001               _this_side_white:
2531  0001 01            	dc.b	1
2532                     	bsct
2533  0001               _clk_idx:
2534  0001 00            	dc.b	0
2535  0002               _game_mode:
2536  0002 00            	dc.b	0
2537                     .const:	section	.text
2538  0000               _times1:
2539  0000 05            	dc.b	5
2540  0001 0a            	dc.b	10
2541  0002 19            	dc.b	25
2542  0003 3c            	dc.b	60
2543  0004 78            	dc.b	120
2544  0005 78            	dc.b	120
2545  0006 78            	dc.b	120
2546  0007 03            	dc.b	3
2547  0008 19            	dc.b	25
2548  0009 5a            	dc.b	90
2549  000a 5a            	dc.b	90
2550  000b 19            	dc.b	25
2551  000c 73            	dc.b	115
2552  000d 78            	dc.b	120
2553  000e 05            	dc.b	5
2554  000f 19            	dc.b	25
2555  0010 73            	dc.b	115
2556  0011               _times2:
2557  0011 00            	dc.b	0
2558  0012 00            	dc.b	0
2559  0013 00            	dc.b	0
2560  0014 00            	dc.b	0
2561  0015 00            	dc.b	0
2562  0016 1e            	dc.b	30
2563  0017 3c            	dc.b	60
2564  0018 00            	dc.b	0
2565  0019 00            	dc.b	0
2566  001a 00            	dc.b	0
2567  001b 1e            	dc.b	30
2568  001c 00            	dc.b	0
2569  001d 00            	dc.b	0
2570  001e 0f            	dc.b	15
2571  001f 00            	dc.b	0
2572  0020 00            	dc.b	0
2573  0021 3c            	dc.b	60
2574  0022               _bonus:
2575  0022 00            	dc.b	0
2576  0023 00            	dc.b	0
2577  0024 00            	dc.b	0
2578  0025 00            	dc.b	0
2579  0026 00            	dc.b	0
2580  0027 00            	dc.b	0
2581  0028 00            	dc.b	0
2582  0029 02            	dc.b	2
2583  002a 0a            	dc.b	10
2584  002b 1e            	dc.b	30
2585  002c 1e            	dc.b	30
2586  002d 0a            	dc.b	10
2587  002e 02            	dc.b	2
2588  002f 1e            	dc.b	30
2589  0030 02            	dc.b	2
2590  0031 05            	dc.b	5
2591  0032 05            	dc.b	5
2592  0033               _clear_lcd:
2593  0033 202020202020  	dc.b	"                  "
2594  0045 202000        	dc.b	"  ",0
2595  0048               _menu:
2596  0048 31            	dc.b	49
2597  0049 20            	dc.b	32
2598  004a 4e            	dc.b	78
2599  004b 65            	dc.b	101
2600  004c 77            	dc.b	119
2601  004d 20            	dc.b	32
2602  004e 67            	dc.b	103
2603  004f 61            	dc.b	97
2604  0050 6d            	dc.b	109
2605  0051 65            	dc.b	101
2606  0052 20            	dc.b	32
2607  0053 20            	dc.b	32
2608  0054 20            	dc.b	32
2609  0055 20            	dc.b	32
2610  0056 20            	dc.b	32
2611  0057 20            	dc.b	32
2612  0058 20            	dc.b	32
2613  0059 20            	dc.b	32
2614  005a 20            	dc.b	32
2615  005b 20            	dc.b	32
2616  005c 32            	dc.b	50
2617  005d 20            	dc.b	32
2618  005e 53            	dc.b	83
2619  005f 65            	dc.b	101
2620  0060 74            	dc.b	116
2621  0061 75            	dc.b	117
2622  0062 70            	dc.b	112
2623  0063 20            	dc.b	32
2624  0064 43            	dc.b	67
2625  0065 6c            	dc.b	108
2626  0066 6f            	dc.b	111
2627  0067 63            	dc.b	99
2628  0068 6b            	dc.b	107
2629  0069 20            	dc.b	32
2630  006a 20            	dc.b	32
2631  006b 20            	dc.b	32
2632  006c 20            	dc.b	32
2633  006d 20            	dc.b	32
2634  006e 20            	dc.b	32
2635  006f 20            	dc.b	32
2636  0070 33            	dc.b	51
2637  0071 20            	dc.b	32
2638  0072 43            	dc.b	67
2639  0073 68            	dc.b	104
2640  0074 6f            	dc.b	111
2641  0075 6f            	dc.b	111
2642  0076 73            	dc.b	115
2643  0077 65            	dc.b	101
2644  0078 20            	dc.b	32
2645  0079 43            	dc.b	67
2646  007a 6f            	dc.b	111
2647  007b 6c            	dc.b	108
2648  007c 6f            	dc.b	111
2649  007d 75            	dc.b	117
2650  007e 72            	dc.b	114
2651  007f 20            	dc.b	32
2652  0080 20            	dc.b	32
2653  0081 20            	dc.b	32
2654  0082 20            	dc.b	32
2655  0083 20            	dc.b	32
2656  0084               _clocks:
2657  0084 54494d452831  	dc.b	"TIME(1) 5m        "
2658  0096 202000        	dc.b	"  ",0
2659  0099 54494d452831  	dc.b	"TIME(1) 10m       "
2660  00ab 202000        	dc.b	"  ",0
2661  00ae 54494d452831  	dc.b	"TIME(1) 25m       "
2662  00c0 202000        	dc.b	"  ",0
2663  00c3 54494d452831  	dc.b	"TIME(1) 1h        "
2664  00d5 202000        	dc.b	"  ",0
2665  00d8 54494d452831  	dc.b	"TIME(1) 2h        "
2666  00ea 202000        	dc.b	"  ",0
2667  00ed 54494d452832  	dc.b	"TIME(2) 2h+30m    "
2668  00ff 202000        	dc.b	"  ",0
2669  0102 54494d452832  	dc.b	"TIME(2) 2h+1h     "
2670  0114 202000        	dc.b	"  ",0
2671  0117 465343482831  	dc.b	"FSCH(1) 3m+2s/move"
2672  0129 202000        	dc.b	"  ",0
2673  012c 465343482831  	dc.b	"FSCH(1) 25m+10s/mo"
2674  013e 766500        	dc.b	"ve",0
2675  0141 465343482831  	dc.b	"FSCH(1) 90m+30s/mo"
2676  0153 766500        	dc.b	"ve",0
2677  0156 465343482832  	dc.b	"FSCH(2)90m+30m+30s"
2678  0168 2f6d00        	dc.b	"/m",0
2679  016b 444c59283129  	dc.b	"DLY(1)  25m+10s/m "
2680  017d 202000        	dc.b	"  ",0
2681  0180 444c59283129  	dc.b	"DLY(1)  115m+5s/m "
2682  0192 202000        	dc.b	"  ",0
2683  0195 444c59283229  	dc.b	"DLY(2)  2h+15m+30s"
2684  01a7 2f6d00        	dc.b	"/m",0
2685  01aa 5553444c2831  	dc.b	"USDL(1) 5m+2s/move"
2686  01bc 202000        	dc.b	"  ",0
2687  01bf 5553444c2831  	dc.b	"USDL(1) 25m+5s/mov"
2688  01d1 652000        	dc.b	"e ",0
2689  01d4 5553444c2832  	dc.b	"USDL(2) 115m+60+5s"
2690  01e6 2f6d00        	dc.b	"/m",0
2736                     ; 81 @interrupt void TIM2_UPD_OVF_IRQHandler(void)
2736                     ; 82 {
2738                     	switch	.text
2739  0000               _TIM2_UPD_OVF_IRQHandler:
2741  0000 8a            	push	cc
2742  0001 84            	pop	a
2743  0002 a4bf          	and	a,#191
2744  0004 88            	push	a
2745  0005 86            	pop	cc
2746       00000001      OFST:	set	1
2747  0006 3b0002        	push	c_x+2
2748  0009 be00          	ldw	x,c_x
2749  000b 89            	pushw	x
2750  000c 3b0002        	push	c_y+2
2751  000f be00          	ldw	x,c_y
2752  0011 89            	pushw	x
2753  0012 88            	push	a
2756                     ; 83 	uint8_t  reeds=0;
2758  0013 0f01          	clr	(OFST+0,sp)
2760                     ; 85     PD_ODR |= ISR_TIME; // Time-measurement interrupt routine
2762  0015 7210500f      	bset	_PD_ODR,#0
2763                     ; 86     t2_millis++;        // update millisecond counter
2765  0019 ae0000        	ldw	x,#_t2_millis
2766  001c a601          	ld	a,#1
2767  001e cd0000        	call	c_lgadc
2769                     ; 87     scheduler_isr();    // Run scheduler interrupt function
2771  0021 cd0000        	call	_scheduler_isr
2773                     ; 88     PD_ODR   &= ~ISR_TIME;      // Time-measurement interrupt routine
2775  0024 7211500f      	bres	_PD_ODR,#0
2776                     ; 89     TIM2_SR1 &= ~TIM2_SR1_UIF;  // Reset interrupt (UIF bit) so it will not fire again straight away.
2778  0028 72115302      	bres	_TIM2_SR1,#0
2779                     ; 90 } // TIM2_UPD_OVF_IRQHandler()
2782  002c 84            	pop	a
2783  002d 85            	popw	x
2784  002e bf00          	ldw	c_y,x
2785  0030 320002        	pop	c_y+2
2786  0033 85            	popw	x
2787  0034 bf00          	ldw	c_x,x
2788  0036 320002        	pop	c_x+2
2789  0039 80            	iret
2813                     ; 92 @interrupt void PORTC_IRQHandler(void)
2813                     ; 93 {
2814                     	switch	.text
2815  003a               _PORTC_IRQHandler:
2819                     ; 94     rotenc_sw = true;
2821  003a 72100000      	bset	_rotenc_sw
2822                     ; 95 } // PORTC_IRQHandler()
2825  003e 80            	iret
2861                     ; 103 uint16_t get_timer1_value(void)
2861                     ; 104 {
2862                     	switch	.text
2863  003f               _get_timer1_value:
2865  003f 89            	pushw	x
2866       00000002      OFST:	set	2
2869                     ; 105     uint16_t tmpcntr = 0;
2871                     ; 107     tmpcntr = ((uint16_t)TIM1_CNTRH << 8);
2873  0040 c6525e        	ld	a,_TIM1_CNTRH
2874  0043 5f            	clrw	x
2875  0044 97            	ld	xl,a
2876  0045 4f            	clr	a
2877  0046 02            	rlwa	x,a
2878  0047 1f01          	ldw	(OFST-1,sp),x
2880                     ; 108     return (uint16_t)(tmpcntr | (uint16_t)(TIM1_CNTRL));
2882  0049 c6525f        	ld	a,_TIM1_CNTRL
2883  004c 5f            	clrw	x
2884  004d 97            	ld	xl,a
2885  004e 01            	rrwa	x,a
2886  004f 1a02          	or	a,(OFST+0,sp)
2887  0051 01            	rrwa	x,a
2888  0052 1a01          	or	a,(OFST-1,sp)
2889  0054 01            	rrwa	x,a
2892  0055 5b02          	addw	sp,#2
2893  0057 81            	ret
2923                     ; 117 void initialise_system_clock(void)
2923                     ; 118 {
2924                     	switch	.text
2925  0058               _initialise_system_clock:
2929                     ; 119     CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
2931  0058 725f50c0      	clr	_CLK_ICKCR
2932                     ; 120     CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
2934  005c 721050c0      	bset	_CLK_ICKCR,#0
2936  0060               L7071:
2937                     ; 121     while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
2939  0060 c650c0        	ld	a,_CLK_ICKCR
2940  0063 a502          	bcp	a,#2
2941  0065 27f9          	jreq	L7071
2942                     ; 122     CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
2944  0067 725f50c6      	clr	_CLK_CKDIVR
2945                     ; 126     ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
2947  006b c65401        	ld	a,_ADC_CR1
2948  006e a48f          	and	a,#143
2949  0070 c75401        	ld	_ADC_CR1,a
2950                     ; 127     ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
2952  0073 721a5401      	bset	_ADC_CR1,#5
2953                     ; 128     CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
2955  0077 725f50cd      	clr	_CLK_SWIMCCR
2956                     ; 129     CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
2958  007b 35e150c4      	mov	_CLK_SWR,#225
2959                     ; 130     CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
2961  007f 725f50c5      	clr	_CLK_SWCR
2962                     ; 131     CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
2964  0083 721250c5      	bset	_CLK_SWCR,#1
2966  0087               L5171:
2967                     ; 132     while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
2969  0087 c650c5        	ld	a,_CLK_SWCR
2970  008a a501          	bcp	a,#1
2971  008c 26f9          	jrne	L5171
2972                     ; 133 } // initialise_system_clock()
2975  008e 81            	ret
3015                     ; 143 void setup_timers(void)
3015                     ; 144 {
3016                     	switch	.text
3017  008f               _setup_timers:
3021                     ; 146     TIM2_PSCR = 0x04;         //  Prescaler = 16
3023  008f 3504530c      	mov	_TIM2_PSCR,#4
3024                     ; 147     TIM2_ARRH = 0x03;         //  High byte of 1000
3026  0093 3503530d      	mov	_TIM2_ARRH,#3
3027                     ; 148     TIM2_ARRL = 0xE8;         //  Low  byte of 1000
3029  0097 35e8530e      	mov	_TIM2_ARRL,#232
3030                     ; 149     TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
3032  009b 35015301      	mov	_TIM2_IER,#1
3033                     ; 150     TIM2_CR1  = TIM2_CR1_CEN; //  Finally, enable the timer
3035  009f 35015300      	mov	_TIM2_CR1,#1
3036                     ; 153     TIM1_ARRH   = 0x03; // Autoreload value: High byte of 1000
3038  00a3 35035262      	mov	_TIM1_ARRH,#3
3039                     ; 154     TIM1_ARRL   = 0xE8; // Autoreload value: Low  byte of 1000
3041  00a7 35e85263      	mov	_TIM1_ARRL,#232
3042                     ; 155     TIM1_CNTRH  = 0x01; // TEST: does it work?
3044  00ab 3501525e      	mov	_TIM1_CNTRH,#1
3045                     ; 156     TIM1_CNTRL  = 0xF4; // TEST:	    
3047  00af 35f4525f      	mov	_TIM1_CNTRL,#244
3048                     ; 157     TIM1_PSCRH  = 0x00; // Prescaler high byte
3050  00b3 725f5260      	clr	_TIM1_PSCRH
3051                     ; 158     TIM1_PSCRL  = 0x10; // Prescaler is 16, clock is 1 MHz
3053  00b7 35105261      	mov	_TIM1_PSCRL,#16
3054                     ; 159     TIM1_CR1    = 0x00; // Edge-aligned mode, up-counter
3056  00bb 725f5250      	clr	_TIM1_CR1
3057                     ; 160     TIM1_RCR    = 0x01; // Repetition-rate
3059  00bf 35015264      	mov	_TIM1_RCR,#1
3060                     ; 161     TIM1_CCER1  = 0x22; // Set CC1P and CC2P: falling-edge
3062  00c3 3522525c      	mov	_TIM1_CCER1,#34
3063                     ; 162     TIM1_SMCR   = 0x03; // Encode mode 3, counts up/down on TI1FP1/TI2FP1 edges
3065  00c7 35035252      	mov	_TIM1_SMCR,#3
3066                     ; 163     TIM1_CCMR1  = 0x01; // CC1 is input, IC1 is mapped to TI1FP1
3068  00cb 35015258      	mov	_TIM1_CCMR1,#1
3069                     ; 164     TIM1_CCMR2  = 0x01; // CC2 is input, IC2 is mapped to TI2FP2
3071  00cf 35015259      	mov	_TIM1_CCMR2,#1
3072                     ; 165     TIM1_CR1   |= 0x01; // Finally, enable the timer
3074  00d3 72105250      	bset	_TIM1_CR1,#0
3075                     ; 166 } // setup_timers()
3078  00d7 81            	ret
3117                     ; 174 void setup_gpio_ports(void)
3117                     ; 175 {
3118                     	switch	.text
3119  00d8               _setup_gpio_ports:
3123                     ; 176     PA_DDR     |=  (LED_CLK | LED_LOAD | LED_DIN);            // Set as outputs
3125  00d8 c65002        	ld	a,_PA_DDR
3126  00db aa70          	or	a,#112
3127  00dd c75002        	ld	_PA_DDR,a
3128                     ; 177     PA_CR1     |=  (LED_CLK | LED_LOAD | LED_DIN);            // Set to Push-Pull
3130  00e0 c65003        	ld	a,_PA_CR1
3131  00e3 aa70          	or	a,#112
3132  00e5 c75003        	ld	_PA_CR1,a
3133                     ; 178     PA_ODR     &= ~(LED_CLK | LED_DIN | LED_LOAD);            // Disable PORTA outputs
3135  00e8 c65000        	ld	a,_PA_ODR
3136  00eb a48f          	and	a,#143
3137  00ed c75000        	ld	_PA_ODR,a
3138                     ; 180     PB_DDR     &= ~PB_NC;            						  // Set as input
3140  00f0 c65007        	ld	a,_PB_DDR
3141  00f3 a400          	and	a,#0
3142  00f5 c75007        	ld	_PB_DDR,a
3143                     ; 181     PB_CR1     |=  PB_NC;                                     // Enable pull-up
3145  00f8 c65008        	ld	a,_PB_CR1
3146  00fb aaff          	or	a,#255
3147  00fd c75008        	ld	_PB_CR1,a
3148                     ; 183     PC_DDR     |=  (SPI_MOSI | SPI_CLK); 					     // Set as outputs
3150  0100 c6500c        	ld	a,_PC_DDR
3151  0103 aa60          	or	a,#96
3152  0105 c7500c        	ld	_PC_DDR,a
3153                     ; 184     PC_CR1     |=  (SPI_MOSI | SPI_CLK); 					     // Set to Push-Pull
3155  0108 c6500d        	ld	a,_PC_CR1
3156  010b aa60          	or	a,#96
3157  010d c7500d        	ld	_PC_CR1,a
3158                     ; 185     PC_CR2     |=  (SPI_MOSI | SPI_CLK);          		         // Set to 10 MHz
3160  0110 c6500e        	ld	a,_PC_CR2
3161  0113 aa60          	or	a,#96
3162  0115 c7500e        	ld	_PC_CR2,a
3163                     ; 186     PC_ODR     &= ~(SPI_MOSI | SPI_CLK);          		         // Disable PORTC outputs
3165  0118 c6500a        	ld	a,_PC_ODR
3166  011b a49f          	and	a,#159
3167  011d c7500a        	ld	_PC_ODR,a
3168                     ; 187     PC_DDR     &= ~(SPI_MISO | ROTENC_A | ROTENC_B | ROTENC_SW); // set as Input
3170  0120 c6500c        	ld	a,_PC_DDR
3171  0123 a471          	and	a,#113
3172  0125 c7500c        	ld	_PC_DDR,a
3173                     ; 188 	PC_DDR     &= ~PC_NC;										 // set as Input
3175  0128 c6500c        	ld	a,_PC_DDR
3176  012b a4ee          	and	a,#238
3177  012d c7500c        	ld	_PC_DDR,a
3178                     ; 189     PC_CR1     &= ~SPI_MISO;                      			     // set to Floating
3180  0130 721f500d      	bres	_PC_CR1,#7
3181                     ; 190     PC_CR1     |=  ROTENC_A | ROTENC_B | ROTENC_SW | PC_NC;      // Enable pull-up
3183  0134 c6500d        	ld	a,_PC_CR1
3184  0137 aa1f          	or	a,#31
3185  0139 c7500d        	ld	_PC_CR1,a
3186                     ; 191     PC_CR2     |=  ROTENC_SW;                                    // Enable interrupt
3188  013c 7216500e      	bset	_PC_CR2,#3
3189                     ; 192 	EXTI_CR1   |=  0x20;  // PAIS bits to Falling edge (0x20 for PORTC)
3191  0140 721a50a0      	bset	_EXTI_CR1,#5
3192                     ; 194 	PD_DDR     |=  (CLK1 | DIO1 | CLK2 | DIO2 | ISR_TIME);       // Set as output
3194  0144 c65011        	ld	a,_PD_DDR
3195  0147 aa9d          	or	a,#157
3196  0149 c75011        	ld	_PD_DDR,a
3197                     ; 195     PD_CR1     |=  (CLK1 | DIO1 | CLK2 | DIO2 | ISR_TIME);       // Set to Push-Pull
3199  014c c65012        	ld	a,_PD_CR1
3200  014f aa9d          	or	a,#157
3201  0151 c75012        	ld	_PD_CR1,a
3202                     ; 196     PD_DDR     &= ~RX;                                           // Set as input
3204  0154 721d5011      	bres	_PD_DDR,#6
3205                     ; 197     PD_CR1     |=  RX;                                           // Enable Pull-up
3207  0158 721c5012      	bset	_PD_CR1,#6
3208                     ; 198     PD_ODR     |= (CLK1 | DIO1 | CLK2 | DIO2);                   // Clock and Data from TM1367 all high
3210  015c c6500f        	ld	a,_PD_ODR
3211  015f aa9c          	or	a,#156
3212  0161 c7500f        	ld	_PD_ODR,a
3213                     ; 199 	PD_ODR     &= ~ISR_TIME;
3215  0164 7211500f      	bres	_PD_ODR,#0
3216                     ; 201     PE_ODR     |=  (I2C_SCL | I2C_SDA); // Must be set here, or I2C will not work
3218  0168 c65014        	ld	a,_PE_ODR
3219  016b aa06          	or	a,#6
3220  016d c75014        	ld	_PE_ODR,a
3221                     ; 202     PE_DDR     |=  (I2C_SCL | I2C_SDA); // Set as outputs
3223  0170 c65016        	ld	a,_PE_DDR
3224  0173 aa06          	or	a,#6
3225  0175 c75016        	ld	_PE_DDR,a
3226                     ; 203     PE_DDR     &= ~PE_NC;               // Set unused ports as input
3228  0178 c65016        	ld	a,_PE_DDR
3229  017b a406          	and	a,#6
3230  017d c75016        	ld	_PE_DDR,a
3231                     ; 204     PE_CR1     |=  PE_NC;               // Enable pull-ups
3233  0180 c65017        	ld	a,_PE_CR1
3234  0183 aaf9          	or	a,#249
3235  0185 c75017        	ld	_PE_CR1,a
3236                     ; 205 } // setup_output_ports()
3239  0188 81            	ret
3346                     ; 207 void update_clock(clock_struct *p)
3346                     ; 208 {
3347                     	switch	.text
3348  0189               _update_clock:
3350  0189 89            	pushw	x
3351  018a 89            	pushw	x
3352       00000002      OFST:	set	2
3355                     ; 211     if (p->active) 
3357  018b e602          	ld	a,(2,x)
3358  018d a501          	bcp	a,#1
3359  018f 271c          	jreq	L3102
3360                     ; 215         if (p->sec == 0)
3362  0191 6d01          	tnz	(1,x)
3363  0193 260a          	jrne	L5102
3364                     ; 217             if (p->min > 0)
3366  0195 7d            	tnz	(x)
3367  0196 270b          	jreq	L1202
3368                     ; 219                 p->sec = 59;
3370  0198 a63b          	ld	a,#59
3371  019a e701          	ld	(1,x),a
3372                     ; 220                 p->min--;
3374  019c 7a            	dec	(x)
3375  019d 2004          	jra	L1202
3376  019f               L5102:
3377                     ; 223         else p->sec--;
3379  019f 1e03          	ldw	x,(OFST+1,sp)
3380  01a1 6a01          	dec	(1,x)
3381  01a3               L1202:
3382                     ; 224         p->blink = !p->blink;
3384  01a3 1e03          	ldw	x,(OFST+1,sp)
3385  01a5 e602          	ld	a,(2,x)
3386  01a7 a804          	xor	a,#4
3387  01a9 e702          	ld	(2,x),a
3389  01ab 203d          	jra	L3202
3390  01ad               L3102:
3391                     ; 228         if (p->active_prev)
3393  01ad 1e03          	ldw	x,(OFST+1,sp)
3394  01af e602          	ld	a,(2,x)
3395  01b1 a502          	bcp	a,#2
3396  01b3 272d          	jreq	L5202
3397                     ; 230             if (clk_mode == FISCHER)
3399  01b5 b605          	ld	a,_clk_mode
3400  01b7 a101          	cp	a,#1
3401  01b9 2627          	jrne	L5202
3402                     ; 232                 p->sec += bonus[clk_idx];
3404  01bb 1e03          	ldw	x,(OFST+1,sp)
3405  01bd 905f          	clrw	y
3406  01bf b601          	ld	a,_clk_idx
3407  01c1 2a02          	jrpl	L22
3408  01c3 9053          	cplw	y
3409  01c5               L22:
3410  01c5 9097          	ld	yl,a
3411  01c7 e601          	ld	a,(1,x)
3412  01c9 90db0022      	add	a,(_bonus,y)
3413  01cd e701          	ld	(1,x),a
3414                     ; 233                 if (p->sec > 59)
3416  01cf 1e03          	ldw	x,(OFST+1,sp)
3417  01d1 e601          	ld	a,(1,x)
3418  01d3 a13c          	cp	a,#60
3419  01d5 250b          	jrult	L5202
3420                     ; 235                     p->sec -= 60;
3422  01d7 1e03          	ldw	x,(OFST+1,sp)
3423  01d9 e601          	ld	a,(1,x)
3424  01db a03c          	sub	a,#60
3425  01dd e701          	ld	(1,x),a
3426                     ; 236                     ++p->min;
3428  01df 1e03          	ldw	x,(OFST+1,sp)
3429  01e1 7c            	inc	(x)
3430  01e2               L5202:
3431                     ; 241         p->blink = true;
3433  01e2 1e03          	ldw	x,(OFST+1,sp)
3434  01e4 e602          	ld	a,(2,x)
3435  01e6 aa04          	or	a,#4
3436  01e8 e702          	ld	(2,x),a
3437  01ea               L3202:
3438                     ; 243     if (p->min > 59)
3440  01ea 1e03          	ldw	x,(OFST+1,sp)
3441  01ec f6            	ld	a,(x)
3442  01ed a13c          	cp	a,#60
3443  01ef 2524          	jrult	L3302
3444                     ; 245         x = (uint16_t)p->min / 60;   // #hours
3446  01f1 1e03          	ldw	x,(OFST+1,sp)
3447  01f3 f6            	ld	a,(x)
3448  01f4 5f            	clrw	x
3449  01f5 97            	ld	xl,a
3450  01f6 a63c          	ld	a,#60
3451  01f8 62            	div	x,a
3452  01f9 1f01          	ldw	(OFST-1,sp),x
3454                     ; 246         p->digits = 40 * x + p->min; // hh:mm to display
3456  01fb 1e01          	ldw	x,(OFST-1,sp)
3457  01fd 90ae0028      	ldw	y,#40
3458  0201 cd0000        	call	c_imul
3460  0204 01            	rrwa	x,a
3461  0205 1603          	ldw	y,(OFST+1,sp)
3462  0207 90fb          	add	a,(y)
3463  0209 2401          	jrnc	L42
3464  020b 5c            	incw	x
3465  020c               L42:
3466  020c 1603          	ldw	y,(OFST+1,sp)
3467  020e 02            	rlwa	x,a
3468  020f 90ef03        	ldw	(3,y),x
3469  0212 01            	rrwa	x,a
3471  0213 2017          	jra	L5302
3472  0215               L3302:
3473                     ; 250         p->digits = 100 * p->min + p->sec; // mm:ss to display
3475  0215 1e03          	ldw	x,(OFST+1,sp)
3476  0217 f6            	ld	a,(x)
3477  0218 97            	ld	xl,a
3478  0219 a664          	ld	a,#100
3479  021b 42            	mul	x,a
3480  021c 01            	rrwa	x,a
3481  021d 1603          	ldw	y,(OFST+1,sp)
3482  021f 90eb01        	add	a,(1,y)
3483  0222 2401          	jrnc	L62
3484  0224 5c            	incw	x
3485  0225               L62:
3486  0225 1603          	ldw	y,(OFST+1,sp)
3487  0227 02            	rlwa	x,a
3488  0228 90ef03        	ldw	(3,y),x
3489  022b 01            	rrwa	x,a
3490  022c               L5302:
3491                     ; 252     p->active_prev = p->active;
3493  022c 1e03          	ldw	x,(OFST+1,sp)
3494  022e e602          	ld	a,(2,x)
3495  0230 a401          	and	a,#1
3496  0232 1e03          	ldw	x,(OFST+1,sp)
3497  0234 48            	sll	a
3498  0235 e802          	xor	a,(2,x)
3499  0237 a402          	and	a,#2
3500  0239 e802          	xor	a,(2,x)
3501  023b e702          	ld	(2,x),a
3502                     ; 253 } // update_clock()
3505  023d 5b04          	addw	sp,#4
3506  023f 81            	ret
3536                     ; 255 void update_clock_settings(void)
3536                     ; 256 {
3537                     	switch	.text
3538  0240               _update_clock_settings:
3542                     ; 257     clk1.min = clk2.min = times1[clk_idx];
3544  0240 5f            	clrw	x
3545  0241 b601          	ld	a,_clk_idx
3546  0243 2a01          	jrpl	L23
3547  0245 53            	cplw	x
3548  0246               L23:
3549  0246 97            	ld	xl,a
3550  0247 d60000        	ld	a,(_times1,x)
3551  024a b706          	ld	_clk2,a
3552  024c 45060b        	mov	_clk1,_clk2
3553                     ; 258     clk1.sec = clk2.sec = 0;
3555  024f 3f07          	clr	_clk2+1
3556  0251 3f0c          	clr	_clk1+1
3557                     ; 259     if (clk_idx < 7)       clk_mode = TIME;
3559  0253 9c            	rvf
3560  0254 b601          	ld	a,_clk_idx
3561  0256 a107          	cp	a,#7
3562  0258 2e04          	jrsge	L7402
3565  025a 3f05          	clr	_clk_mode
3567  025c 201e          	jra	L1502
3568  025e               L7402:
3569                     ; 260     else if (clk_idx < 11) clk_mode = FISCHER;
3571  025e 9c            	rvf
3572  025f b601          	ld	a,_clk_idx
3573  0261 a10b          	cp	a,#11
3574  0263 2e06          	jrsge	L3502
3577  0265 35010005      	mov	_clk_mode,#1
3579  0269 2011          	jra	L1502
3580  026b               L3502:
3581                     ; 261     else if (clk_idx < 14) clk_mode = DELAY;
3583  026b 9c            	rvf
3584  026c b601          	ld	a,_clk_idx
3585  026e a10e          	cp	a,#14
3586  0270 2e06          	jrsge	L7502
3589  0272 35030005      	mov	_clk_mode,#3
3591  0276 2004          	jra	L1502
3592  0278               L7502:
3593                     ; 262     else                   clk_mode = US_DLY;
3595  0278 35020005      	mov	_clk_mode,#2
3596  027c               L1502:
3597                     ; 264     if ((clk_mode == FISCHER) || (clk_mode == US_DLY))
3599  027c b605          	ld	a,_clk_mode
3600  027e a101          	cp	a,#1
3601  0280 2706          	jreq	L5602
3603  0282 b605          	ld	a,_clk_mode
3604  0284 a102          	cp	a,#2
3605  0286 261c          	jrne	L3602
3606  0288               L5602:
3607                     ; 266         clk1.sec += bonus[clk_idx];
3609  0288 5f            	clrw	x
3610  0289 b601          	ld	a,_clk_idx
3611  028b 2a01          	jrpl	L43
3612  028d 53            	cplw	x
3613  028e               L43:
3614  028e 97            	ld	xl,a
3615  028f b60c          	ld	a,_clk1+1
3616  0291 db0022        	add	a,(_bonus,x)
3617  0294 b70c          	ld	_clk1+1,a
3618                     ; 267         clk2.sec += bonus[clk_idx];
3620  0296 5f            	clrw	x
3621  0297 b601          	ld	a,_clk_idx
3622  0299 2a01          	jrpl	L63
3623  029b 53            	cplw	x
3624  029c               L63:
3625  029c 97            	ld	xl,a
3626  029d b607          	ld	a,_clk2+1
3627  029f db0022        	add	a,(_bonus,x)
3628  02a2 b707          	ld	_clk2+1,a
3629  02a4               L3602:
3630                     ; 269 } // update_clock_settings()
3633  02a4 81            	ret
3636                     	bsct
3637  0003               L7602_menu_std:
3638  0003 00            	dc.b	0
3639  0004               L1702_menu_idx:
3640  0004 00            	dc.b	0
3641                     	switch	.ubsct
3642  0000               L3702_tmr:
3643  0000 00            	ds.b	1
3644  0001               L5702_old_rotenc:
3645  0001 0000          	ds.b	2
3724                     ; 271 void menu_handler(void)
3724                     ; 272 {
3725                     	switch	.text
3726  02a5               _menu_handler:
3728  02a5 89            	pushw	x
3729       00000002      OFST:	set	2
3732                     ; 280     chess_main(); // call chess main STD
3734  02a6 cd0000        	call	_chess_main
3736                     ; 281     rotenc = get_timer1_value();
3738  02a9 cd003f        	call	_get_timer1_value
3740  02ac 1f01          	ldw	(OFST-1,sp),x
3742                     ; 282     switch (menu_std)
3744  02ae b603          	ld	a,L7602_menu_std
3746                     ; 357                 break;
3747  02b0 4d            	tnz	a
3748  02b1 2719          	jreq	L7702
3749  02b3 4a            	dec	a
3750  02b4 273c          	jreq	L1012
3751  02b6 4a            	dec	a
3752  02b7 2603          	jrne	L64
3753  02b9 cc0360        	jp	L3012
3754  02bc               L64:
3755  02bc 4a            	dec	a
3756  02bd 2603          	jrne	L05
3757  02bf cc037d        	jp	L5012
3758  02c2               L05:
3759  02c2 4a            	dec	a
3760  02c3 2603          	jrne	L25
3761  02c5 cc03e6        	jp	L7012
3762  02c8               L25:
3763  02c8 ac2e042e      	jpf	L1512
3764  02cc               L7702:
3765                     ; 284         case 0: // Clear menu-line
3765                     ; 285                 lcd_i2c_setCursor(0,1);
3767  02cc ae0001        	ldw	x,#1
3768  02cf cd0000        	call	_lcd_i2c_setCursor
3770                     ; 286                 lcd_i2c_print(clear_lcd);
3772  02d2 ae0033        	ldw	x,#_clear_lcd
3773  02d5 cd0000        	call	_lcd_i2c_print
3775                     ; 287                 if (rotenc_sw) 
3777                     	btst	_rotenc_sw
3778  02dd 2503          	jrult	L45
3779  02df cc042e        	jp	L1512
3780  02e2               L45:
3781                     ; 289                     menu_std = 1;      // rotate through menu-items
3783  02e2 35010003      	mov	L7602_menu_std,#1
3784                     ; 290                     rotenc_sw = false; // reset switch
3786  02e6 72110000      	bres	_rotenc_sw
3787                     ; 291                     menu_idx = 0;      // start with 1st menu-item
3789  02ea 3f04          	clr	L1702_menu_idx
3790                     ; 292                     tmr = 0;           // reset timer
3792  02ec 3f00          	clr	L3702_tmr
3793  02ee ac2e042e      	jpf	L1512
3794  02f2               L1012:
3795                     ; 295         case 1: // Rotate through menu-items
3795                     ; 296                 lcd_i2c_setCursor(0,1);
3797  02f2 ae0001        	ldw	x,#1
3798  02f5 cd0000        	call	_lcd_i2c_setCursor
3800                     ; 297                 lcd_i2c_print(menu[menu_idx]); // display menu-item
3802  02f8 5f            	clrw	x
3803  02f9 b604          	ld	a,L1702_menu_idx
3804  02fb 2a01          	jrpl	L24
3805  02fd 53            	cplw	x
3806  02fe               L24:
3807  02fe 97            	ld	xl,a
3808  02ff 90ae0014      	ldw	y,#20
3809  0303 cd0000        	call	c_imul
3811  0306 1c0048        	addw	x,#_menu
3812  0309 cd0000        	call	_lcd_i2c_print
3814                     ; 298                 if (rotenc_sw)
3816                     	btst	_rotenc_sw
3817  0311 2410          	jruge	L5512
3818                     ; 300                     rotenc_sw = false; // reset switch
3820  0313 72110000      	bres	_rotenc_sw
3821                     ; 301                     tmr = 0;           // reset timer
3823  0317 3f00          	clr	L3702_tmr
3824                     ; 302                     menu_std = 2 + menu_idx; // goto corresponding state
3826  0319 b604          	ld	a,L1702_menu_idx
3827  031b ab02          	add	a,#2
3828  031d b703          	ld	L7602_menu_std,a
3830  031f ac2e042e      	jpf	L1512
3831  0323               L5512:
3832                     ; 304                 else if (rotenc > old_rotenc)
3834  0323 1e01          	ldw	x,(OFST-1,sp)
3835  0325 b301          	cpw	x,L5702_old_rotenc
3836  0327 2313          	jrule	L1612
3837                     ; 306                     if (++menu_idx > 2) menu_idx = 2;
3839  0329 9c            	rvf
3840  032a 3c04          	inc	L1702_menu_idx
3841  032c b604          	ld	a,L1702_menu_idx
3842  032e a103          	cp	a,#3
3843  0330 2f04          	jrslt	L3612
3846  0332 35020004      	mov	L1702_menu_idx,#2
3847  0336               L3612:
3848                     ; 307                     tmr = 0;           // reset timer
3850  0336 3f00          	clr	L3702_tmr
3852  0338 ac2e042e      	jpf	L1512
3853  033c               L1612:
3854                     ; 309                 else if (rotenc < old_rotenc)
3856  033c 1e01          	ldw	x,(OFST-1,sp)
3857  033e b301          	cpw	x,L5702_old_rotenc
3858  0340 240d          	jruge	L7612
3859                     ; 311                     if (--menu_idx < 0) menu_idx = 0;
3861  0342 9c            	rvf
3862  0343 3a04          	dec	L1702_menu_idx
3863  0345 2e02          	jrsge	L1712
3866  0347 3f04          	clr	L1702_menu_idx
3867  0349               L1712:
3868                     ; 312                     tmr = 0;           // reset timer
3870  0349 3f00          	clr	L3702_tmr
3872  034b ac2e042e      	jpf	L1512
3873  034f               L7612:
3874                     ; 314                 else if (++tmr > 10) menu_std = 0;
3876  034f 3c00          	inc	L3702_tmr
3877  0351 b600          	ld	a,L3702_tmr
3878  0353 a10b          	cp	a,#11
3879  0355 2403          	jruge	L65
3880  0357 cc042e        	jp	L1512
3881  035a               L65:
3884  035a 3f03          	clr	L7602_menu_std
3885  035c ac2e042e      	jpf	L1512
3886  0360               L3012:
3887                     ; 316         case 2: // New game
3887                     ; 317                 lcd_i2c_setCursor(0,1);
3889  0360 ae0001        	ldw	x,#1
3890  0363 cd0000        	call	_lcd_i2c_setCursor
3892                     ; 318                 lcd_i2c_print("New game Selected"); // display menu-item
3894  0366 ae0289        	ldw	x,#L7712
3895  0369 cd0000        	call	_lcd_i2c_print
3897                     ; 319                 if (++tmr > 10) menu_std = 0;
3899  036c 3c00          	inc	L3702_tmr
3900  036e b600          	ld	a,L3702_tmr
3901  0370 a10b          	cp	a,#11
3902  0372 2403          	jruge	L06
3903  0374 cc042e        	jp	L1512
3904  0377               L06:
3907  0377 3f03          	clr	L7602_menu_std
3908  0379 ac2e042e      	jpf	L1512
3909  037d               L5012:
3910                     ; 321         case 3: // Setup clocks
3910                     ; 322                 lcd_i2c_setCursor(0,1);
3912  037d ae0001        	ldw	x,#1
3913  0380 cd0000        	call	_lcd_i2c_setCursor
3915                     ; 323                 lcd_i2c_print(clocks[clk_idx]); // display clock-item
3917  0383 5f            	clrw	x
3918  0384 b601          	ld	a,_clk_idx
3919  0386 2a01          	jrpl	L44
3920  0388 53            	cplw	x
3921  0389               L44:
3922  0389 97            	ld	xl,a
3923  038a 90ae0015      	ldw	y,#21
3924  038e cd0000        	call	c_imul
3926  0391 1c0084        	addw	x,#_clocks
3927  0394 cd0000        	call	_lcd_i2c_print
3929                     ; 324                 if (rotenc_sw)
3931                     	btst	_rotenc_sw
3932  039c 2410          	jruge	L3022
3933                     ; 326                     update_clock_settings(); // Update clock with new settings
3935  039e cd0240        	call	_update_clock_settings
3937                     ; 327                     rotenc_sw = false; // reset switch
3939  03a1 72110000      	bres	_rotenc_sw
3940                     ; 328                     tmr = 0;           // reset timer
3942  03a5 3f00          	clr	L3702_tmr
3943                     ; 329                     menu_std = 1;      // goto state 1
3945  03a7 35010003      	mov	L7602_menu_std,#1
3947  03ab cc042e        	jra	L1512
3948  03ae               L3022:
3949                     ; 331                 else if (rotenc > old_rotenc)
3951  03ae 1e01          	ldw	x,(OFST-1,sp)
3952  03b0 b301          	cpw	x,L5702_old_rotenc
3953  03b2 2311          	jrule	L7022
3954                     ; 333                     if (++clk_idx > 16) clk_idx = 16;
3956  03b4 9c            	rvf
3957  03b5 3c01          	inc	_clk_idx
3958  03b7 b601          	ld	a,_clk_idx
3959  03b9 a111          	cp	a,#17
3960  03bb 2f04          	jrslt	L1122
3963  03bd 35100001      	mov	_clk_idx,#16
3964  03c1               L1122:
3965                     ; 334                     tmr = 0;           // reset timer
3967  03c1 3f00          	clr	L3702_tmr
3969  03c3 2069          	jra	L1512
3970  03c5               L7022:
3971                     ; 336                 else if (rotenc < old_rotenc)
3973  03c5 1e01          	ldw	x,(OFST-1,sp)
3974  03c7 b301          	cpw	x,L5702_old_rotenc
3975  03c9 240b          	jruge	L5122
3976                     ; 338                     if (--clk_idx < 0) clk_idx = 0;
3978  03cb 9c            	rvf
3979  03cc 3a01          	dec	_clk_idx
3980  03ce 2e02          	jrsge	L7122
3983  03d0 3f01          	clr	_clk_idx
3984  03d2               L7122:
3985                     ; 339                     tmr = 0;           // reset timer
3987  03d2 3f00          	clr	L3702_tmr
3989  03d4 2058          	jra	L1512
3990  03d6               L5122:
3991                     ; 341                 else if (++tmr > 10) { menu_std = 1; tmr = 0; }
3993  03d6 3c00          	inc	L3702_tmr
3994  03d8 b600          	ld	a,L3702_tmr
3995  03da a10b          	cp	a,#11
3996  03dc 2550          	jrult	L1512
3999  03de 35010003      	mov	L7602_menu_std,#1
4002  03e2 3f00          	clr	L3702_tmr
4003  03e4 2048          	jra	L1512
4004  03e6               L7012:
4005                     ; 343         case 4: // Choose White
4005                     ; 344                 lcd_i2c_setCursor(0,1);
4007  03e6 ae0001        	ldw	x,#1
4008  03e9 cd0000        	call	_lcd_i2c_setCursor
4010                     ; 345                 lcd_i2c_print("This side: "); // display menu-item
4012  03ec ae027d        	ldw	x,#L5222
4013  03ef cd0000        	call	_lcd_i2c_print
4015                     ; 346                 if (rotenc_sw)
4017                     	btst	_rotenc_sw
4018  03f7 240c          	jruge	L7222
4019                     ; 348                     rotenc_sw = false;
4021  03f9 72110000      	bres	_rotenc_sw
4022                     ; 349                     this_side_white = !this_side_white;
4024  03fd 90100001      	bcpl	_this_side_white
4025                     ; 350                     tmr = 0;
4027  0401 3f00          	clr	L3702_tmr
4029  0403 200e          	jra	L1322
4030  0405               L7222:
4031                     ; 352                 else if (++tmr > 10) { menu_std = 1; tmr = 0; }
4033  0405 3c00          	inc	L3702_tmr
4034  0407 b600          	ld	a,L3702_tmr
4035  0409 a10b          	cp	a,#11
4036  040b 2506          	jrult	L1322
4039  040d 35010003      	mov	L7602_menu_std,#1
4042  0411 3f00          	clr	L3702_tmr
4043  0413               L1322:
4044                     ; 353                 lcd_i2c_setCursor(11,1);
4046  0413 ae0b01        	ldw	x,#2817
4047  0416 cd0000        	call	_lcd_i2c_setCursor
4049                     ; 354                 if (this_side_white)
4051                     	btst	_this_side_white
4052  041e 2408          	jruge	L5322
4053                     ; 355                      lcd_i2c_print("White");
4055  0420 ae0277        	ldw	x,#L7322
4056  0423 cd0000        	call	_lcd_i2c_print
4059  0426 2006          	jra	L1512
4060  0428               L5322:
4061                     ; 356                 else lcd_i2c_print("Black");
4063  0428 ae0271        	ldw	x,#L3422
4064  042b cd0000        	call	_lcd_i2c_print
4066  042e               L1512:
4067                     ; 359     old_rotenc = rotenc;
4069  042e 1e01          	ldw	x,(OFST-1,sp)
4070  0430 bf01          	ldw	L5702_old_rotenc,x
4071                     ; 360 } // menu_handler()
4074  0432 85            	popw	x
4075  0433 81            	ret
4078                     	bsct
4079  0005               L5422_col_nr:
4080  0005 00            	dc.b	0
4081                     	switch	.ubsct
4082  0003               L7422_i:
4083  0003 00            	ds.b	1
4084  0004               L3522_max_bit:
4085  0004 00            	ds.b	1
4148                     ; 368 void scan_task(void)
4148                     ; 369 {
4149                     	switch	.text
4150  0434               _scan_task:
4152  0434 5203          	subw	sp,#3
4153       00000003      OFST:	set	3
4156                     ; 373 	reeds = mcp23017_read(GPIOA);    // Read status of reed-relays
4158  0436 a612          	ld	a,#18
4159  0438 cd0000        	call	_mcp23017_read
4161  043b 6b03          	ld	(OFST+0,sp),a
4163                     ; 375     if (col_nr < 7) max_bit = 6-col_nr;
4165  043d b605          	ld	a,L5422_col_nr
4166  043f a107          	cp	a,#7
4167  0441 2408          	jruge	L7032
4170  0443 a606          	ld	a,#6
4171  0445 b005          	sub	a,L5422_col_nr
4172  0447 b704          	ld	L3522_max_bit,a
4174  0449 2004          	jra	L1132
4175  044b               L7032:
4176                     ; 376     else            max_bit = 7;
4178  044b 35070004      	mov	L3522_max_bit,#7
4179  044f               L1132:
4180                     ; 377     max_bit = (1<<max_bit);
4182  044f b604          	ld	a,L3522_max_bit
4183  0451 5f            	clrw	x
4184  0452 97            	ld	xl,a
4185  0453 a601          	ld	a,#1
4186  0455 5d            	tnzw	x
4187  0456 2704          	jreq	L46
4188  0458               L66:
4189  0458 48            	sll	a
4190  0459 5a            	decw	x
4191  045a 26fc          	jrne	L66
4192  045c               L46:
4193  045c b704          	ld	L3522_max_bit,a
4194                     ; 378     for (i = 0; i < 8; i++)
4196  045e 3f03          	clr	L7422_i
4197  0460               L3132:
4198                     ; 380         if (reeds & (1<<i)) reed_relays[i] |=  max_bit;
4200  0460 7b03          	ld	a,(OFST+0,sp)
4201  0462 5f            	clrw	x
4202  0463 97            	ld	xl,a
4203  0464 1f01          	ldw	(OFST-2,sp),x
4205  0466 ae0001        	ldw	x,#1
4206  0469 b603          	ld	a,L7422_i
4207  046b 4d            	tnz	a
4208  046c 2704          	jreq	L07
4209  046e               L27:
4210  046e 58            	sllw	x
4211  046f 4a            	dec	a
4212  0470 26fc          	jrne	L27
4213  0472               L07:
4214  0472 01            	rrwa	x,a
4215  0473 1402          	and	a,(OFST-1,sp)
4216  0475 01            	rrwa	x,a
4217  0476 1401          	and	a,(OFST-2,sp)
4218  0478 01            	rrwa	x,a
4219  0479 a30000        	cpw	x,#0
4220  047c 270c          	jreq	L1232
4223  047e b603          	ld	a,L7422_i
4224  0480 5f            	clrw	x
4225  0481 97            	ld	xl,a
4226  0482 e610          	ld	a,(_reed_relays,x)
4227  0484 ba04          	or	a,L3522_max_bit
4228  0486 e710          	ld	(_reed_relays,x),a
4230  0488 200b          	jra	L3232
4231  048a               L1232:
4232                     ; 381         else                reed_relays[i] &= ~max_bit;
4234  048a b603          	ld	a,L7422_i
4235  048c 5f            	clrw	x
4236  048d 97            	ld	xl,a
4237  048e b604          	ld	a,L3522_max_bit
4238  0490 43            	cpl	a
4239  0491 e410          	and	a,(_reed_relays,x)
4240  0493 e710          	ld	(_reed_relays,x),a
4241  0495               L3232:
4242                     ; 378     for (i = 0; i < 8; i++)
4244  0495 3c03          	inc	L7422_i
4247  0497 b603          	ld	a,L7422_i
4248  0499 a108          	cp	a,#8
4249  049b 25c3          	jrult	L3132
4250                     ; 383     max7219_write((MAX7219_REG_DIG0 + (col_nr << 8)) | reed_relays[col_nr]);
4252  049d b605          	ld	a,L5422_col_nr
4253  049f 5f            	clrw	x
4254  04a0 97            	ld	xl,a
4255  04a1 e610          	ld	a,(_reed_relays,x)
4256  04a3 6b02          	ld	(OFST-1,sp),a
4258  04a5 b605          	ld	a,L5422_col_nr
4259  04a7 5f            	clrw	x
4260  04a8 97            	ld	xl,a
4261  04a9 4f            	clr	a
4262  04aa 02            	rlwa	x,a
4263  04ab 1c0100        	addw	x,#256
4264  04ae 01            	rrwa	x,a
4265  04af 1a02          	or	a,(OFST-1,sp)
4266  04b1 02            	rlwa	x,a
4267  04b2 cd0000        	call	_max7219_write
4269                     ; 384     if (++col_nr > 7) col_nr = 0;    // start again
4271  04b5 3c05          	inc	L5422_col_nr
4272  04b7 b605          	ld	a,L5422_col_nr
4273  04b9 a108          	cp	a,#8
4274  04bb 2502          	jrult	L5232
4277  04bd 3f05          	clr	L5422_col_nr
4278  04bf               L5232:
4279                     ; 385 	mcp23017_write(GPIOB,1<<col_nr); // Scan next reed-relay column
4281  04bf b605          	ld	a,L5422_col_nr
4282  04c1 5f            	clrw	x
4283  04c2 97            	ld	xl,a
4284  04c3 a601          	ld	a,#1
4285  04c5 5d            	tnzw	x
4286  04c6 2704          	jreq	L47
4287  04c8               L67:
4288  04c8 48            	sll	a
4289  04c9 5a            	decw	x
4290  04ca 26fc          	jrne	L67
4291  04cc               L47:
4292  04cc ae1300        	ldw	x,#4864
4293  04cf 97            	ld	xl,a
4294  04d0 cd0000        	call	_mcp23017_write
4296                     ; 386 } // scan_task()
4299  04d3 5b03          	addw	sp,#3
4300  04d5 81            	ret
4373                     ; 394 void adc_task(void)
4373                     ; 395 {
4374                     	switch	.text
4375  04d6               _adc_task:
4377  04d6 5224          	subw	sp,#36
4378       00000024      OFST:	set	36
4381                     ; 399     uart_write('.');
4383  04d8 a62e          	ld	a,#46
4384  04da cd0000        	call	_uart_write
4386                     ; 400     tm1637_enable_clock_nr(CLOCK1);
4388  04dd 4f            	clr	a
4389  04de cd0000        	call	_tm1637_enable_clock_nr
4391                     ; 401     update_clock(&clk1);
4393  04e1 ae000b        	ldw	x,#_clk1
4394  04e4 cd0189        	call	_update_clock
4396                     ; 402     tm1637_set_brightness(7,true);
4398  04e7 ae0701        	ldw	x,#1793
4399  04ea cd0000        	call	_tm1637_set_brightness
4401                     ; 403     tm1637_show_nr_dec_ex(clk1.digits, clk1.blink?0x40:0x00, true, 4, 0);
4403  04ed 4b00          	push	#0
4404  04ef 4b04          	push	#4
4405  04f1 4b01          	push	#1
4406  04f3 b60d          	ld	a,_clk1+2
4407  04f5 a504          	bcp	a,#4
4408  04f7 2704          	jreq	L201
4409  04f9 a640          	ld	a,#64
4410  04fb 2001          	jra	L401
4411  04fd               L201:
4412  04fd 4f            	clr	a
4413  04fe               L401:
4414  04fe 88            	push	a
4415  04ff be0e          	ldw	x,_clk1+3
4416  0501 cd0000        	call	_tm1637_show_nr_dec_ex
4418  0504 5b04          	addw	sp,#4
4419                     ; 405     sprintf(s,"CLK ",h);
4421  0506 1e05          	ldw	x,(OFST-31,sp)
4422  0508 89            	pushw	x
4423  0509 ae026c        	ldw	x,#L1632
4424  050c 89            	pushw	x
4425  050d 96            	ldw	x,sp
4426  050e 1c000b        	addw	x,#OFST-25
4427  0511 cd0000        	call	_sprintf
4429  0514 5b04          	addw	sp,#4
4430                     ; 406     lcd_i2c_setCursor(0,2);
4432  0516 ae0002        	ldw	x,#2
4433  0519 cd0000        	call	_lcd_i2c_setCursor
4435                     ; 407     lcd_i2c_print(s);
4437  051c 96            	ldw	x,sp
4438  051d 1c0007        	addw	x,#OFST-29
4439  0520 cd0000        	call	_lcd_i2c_print
4441                     ; 408     h = clk1.min / 60;
4443  0523 b60b          	ld	a,_clk1
4444  0525 5f            	clrw	x
4445  0526 97            	ld	xl,a
4446  0527 a63c          	ld	a,#60
4447  0529 cd0000        	call	c_sdivx
4449  052c 1f05          	ldw	(OFST-31,sp),x
4451                     ; 409     m = clk1.min - 60*h;
4453  052e 1e05          	ldw	x,(OFST-31,sp)
4454  0530 90ae003c      	ldw	y,#60
4455  0534 cd0000        	call	c_imul
4457  0537 1f01          	ldw	(OFST-35,sp),x
4459  0539 b60b          	ld	a,_clk1
4460  053b 5f            	clrw	x
4461  053c 97            	ld	xl,a
4462  053d 72f001        	subw	x,(OFST-35,sp)
4463  0540 1f03          	ldw	(OFST-33,sp),x
4465                     ; 410     sprintf(s,"%d:%02d:%02d ",h,m,(uint16_t)clk1.sec);
4467  0542 b60c          	ld	a,_clk1+1
4468  0544 5f            	clrw	x
4469  0545 97            	ld	xl,a
4470  0546 89            	pushw	x
4471  0547 1e05          	ldw	x,(OFST-31,sp)
4472  0549 89            	pushw	x
4473  054a 1e09          	ldw	x,(OFST-27,sp)
4474  054c 89            	pushw	x
4475  054d ae025e        	ldw	x,#L3632
4476  0550 89            	pushw	x
4477  0551 96            	ldw	x,sp
4478  0552 1c000f        	addw	x,#OFST-21
4479  0555 cd0000        	call	_sprintf
4481  0558 5b08          	addw	sp,#8
4482                     ; 411     lcd_i2c_setCursor(4,2);
4484  055a ae0402        	ldw	x,#1026
4485  055d cd0000        	call	_lcd_i2c_setCursor
4487                     ; 412     lcd_i2c_print(s);
4489  0560 96            	ldw	x,sp
4490  0561 1c0007        	addw	x,#OFST-29
4491  0564 cd0000        	call	_lcd_i2c_print
4493                     ; 414     h = clk2.min / 60;
4495  0567 b606          	ld	a,_clk2
4496  0569 5f            	clrw	x
4497  056a 97            	ld	xl,a
4498  056b a63c          	ld	a,#60
4499  056d cd0000        	call	c_sdivx
4501  0570 1f05          	ldw	(OFST-31,sp),x
4503                     ; 415     m = clk2.min - 60*h;
4505  0572 1e05          	ldw	x,(OFST-31,sp)
4506  0574 90ae003c      	ldw	y,#60
4507  0578 cd0000        	call	c_imul
4509  057b 1f01          	ldw	(OFST-35,sp),x
4511  057d b606          	ld	a,_clk2
4512  057f 5f            	clrw	x
4513  0580 97            	ld	xl,a
4514  0581 72f001        	subw	x,(OFST-35,sp)
4515  0584 1f03          	ldw	(OFST-33,sp),x
4517                     ; 416     sprintf(s,"%d:%02d:%02d",h,m,(uint16_t)clk2.sec);
4519  0586 b607          	ld	a,_clk2+1
4520  0588 5f            	clrw	x
4521  0589 97            	ld	xl,a
4522  058a 89            	pushw	x
4523  058b 1e05          	ldw	x,(OFST-31,sp)
4524  058d 89            	pushw	x
4525  058e 1e09          	ldw	x,(OFST-27,sp)
4526  0590 89            	pushw	x
4527  0591 ae0251        	ldw	x,#L5632
4528  0594 89            	pushw	x
4529  0595 96            	ldw	x,sp
4530  0596 1c000f        	addw	x,#OFST-21
4531  0599 cd0000        	call	_sprintf
4533  059c 5b08          	addw	sp,#8
4534                     ; 417     lcd_i2c_setCursor(12,2);
4536  059e ae0c02        	ldw	x,#3074
4537  05a1 cd0000        	call	_lcd_i2c_setCursor
4539                     ; 418     lcd_i2c_print(s);
4541  05a4 96            	ldw	x,sp
4542  05a5 1c0007        	addw	x,#OFST-29
4543  05a8 cd0000        	call	_lcd_i2c_print
4545                     ; 420     tm1637_enable_clock_nr(CLOCK2);
4547  05ab a601          	ld	a,#1
4548  05ad cd0000        	call	_tm1637_enable_clock_nr
4550                     ; 421     update_clock(&clk2);
4552  05b0 ae0006        	ldw	x,#_clk2
4553  05b3 cd0189        	call	_update_clock
4555                     ; 422     tm1637_set_brightness(7,true);
4557  05b6 ae0701        	ldw	x,#1793
4558  05b9 cd0000        	call	_tm1637_set_brightness
4560                     ; 423     tm1637_show_nr_dec_ex(clk2.digits, clk2.blink?0x40:0x00, true, 4, 0);
4562  05bc 4b00          	push	#0
4563  05be 4b04          	push	#4
4564  05c0 4b01          	push	#1
4565  05c2 b608          	ld	a,_clk2+2
4566  05c4 a504          	bcp	a,#4
4567  05c6 2704          	jreq	L601
4568  05c8 a640          	ld	a,#64
4569  05ca 2001          	jra	L011
4570  05cc               L601:
4571  05cc 4f            	clr	a
4572  05cd               L011:
4573  05cd 88            	push	a
4574  05ce be09          	ldw	x,_clk2+3
4575  05d0 cd0000        	call	_tm1637_show_nr_dec_ex
4577  05d3 5b04          	addw	sp,#4
4578                     ; 425     tmr1 = get_timer1_value();
4580  05d5 cd003f        	call	_get_timer1_value
4582  05d8 1f03          	ldw	(OFST-33,sp),x
4584                     ; 426     sprintf(s,"Timer1:%04d",tmr1);
4586  05da 1e03          	ldw	x,(OFST-33,sp)
4587  05dc 89            	pushw	x
4588  05dd ae0245        	ldw	x,#L7632
4589  05e0 89            	pushw	x
4590  05e1 96            	ldw	x,sp
4591  05e2 1c000b        	addw	x,#OFST-25
4592  05e5 cd0000        	call	_sprintf
4594  05e8 5b04          	addw	sp,#4
4595                     ; 427     lcd_i2c_setCursor(0,3);
4597  05ea ae0003        	ldw	x,#3
4598  05ed cd0000        	call	_lcd_i2c_setCursor
4600                     ; 428     lcd_i2c_print(s);
4602  05f0 96            	ldw	x,sp
4603  05f1 1c0007        	addw	x,#OFST-29
4604  05f4 cd0000        	call	_lcd_i2c_print
4606                     ; 429 } // adc_task()
4609  05f7 5b24          	addw	sp,#36
4610  05f9 81            	ret
4613                     	switch	.const
4614  01e9               L1732_s:
4615  01e9 436865737320  	dc.b	"Chess stm8s105 v0."
4616  01fb 3100          	dc.b	"1",0
4656                     ; 431 void print_version_number(void)
4656                     ; 432 {
4657                     	switch	.text
4658  05fa               _print_version_number:
4660  05fa 5214          	subw	sp,#20
4661       00000014      OFST:	set	20
4664                     ; 433     const char s[] = "Chess stm8s105 v0.1";
4666  05fc 96            	ldw	x,sp
4667  05fd 1c0001        	addw	x,#OFST-19
4668  0600 90ae01e9      	ldw	y,#L1732_s
4669  0604 a614          	ld	a,#20
4670  0606 cd0000        	call	c_xymvx
4672                     ; 434     xputs(s);
4674  0609 96            	ldw	x,sp
4675  060a 1c0001        	addw	x,#OFST-19
4676  060d cd0000        	call	_xputs
4678                     ; 435     uart_write('\n');
4680  0610 a60a          	ld	a,#10
4681  0612 cd0000        	call	_uart_write
4683                     ; 436     lcd_i2c_clear();
4685  0615 cd0000        	call	_lcd_i2c_clear
4687                     ; 437     lcd_i2c_setCursor(0,0);
4689  0618 5f            	clrw	x
4690  0619 cd0000        	call	_lcd_i2c_setCursor
4692                     ; 438     lcd_i2c_backlight_on();
4694  061c cd0000        	call	_lcd_i2c_backlight_on
4696                     ; 439     lcd_i2c_print(s);
4698  061f 96            	ldw	x,sp
4699  0620 1c0001        	addw	x,#OFST-19
4700  0623 cd0000        	call	_lcd_i2c_print
4702                     ; 440 } // print_version_number()
4705  0626 5b14          	addw	sp,#20
4706  0628 81            	ret
4789                     ; 449 int main(void)
4789                     ; 450 {
4790                     	switch	.text
4791  0629               _main:
4793  0629 5221          	subw	sp,#33
4794       00000021      OFST:	set	33
4797                     ; 452     int     ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
4799  062b ce0000        	ldw	x,_eedata
4800  062e 1f01          	ldw	(OFST-32,sp),x
4802                     ; 453     uint8_t ok, buf[5], bb = false;
4804  0630 0f03          	clr	(OFST-30,sp)
4806                     ; 455     disable_interrupts();
4809  0632 9b            sim
4811                     ; 456     initialise_system_clock(); // Set system-clock to 16 MHz
4814  0633 cd0058        	call	_initialise_system_clock
4816                     ; 457     uart_init();               // UART init. to 115200,8,N,1
4818  0636 cd0000        	call	_uart_init
4820                     ; 458     setup_gpio_ports();        // Init. needed output-ports for LED and keys
4822  0639 cd00d8        	call	_setup_gpio_ports
4824                     ; 459     i2c_init(bb);              // Init. I2C bus
4826  063c 0d03          	tnz	(OFST-30,sp)
4827  063e 2704          	jreq	L611
4828  0640 a601          	ld	a,#1
4829  0642 2001          	jra	L021
4830  0644               L611:
4831  0644 4f            	clr	a
4832  0645               L021:
4833  0645 cd0000        	call	_i2c_init
4835                     ; 460     setup_timers();            // Set Timer 2 to 1 kHz and Timer 1 for a Rotary Encoder
4837  0648 cd008f        	call	_setup_timers
4839                     ; 463     scheduler_init();                        // clear task_list struct
4841  064b cd0000        	call	_scheduler_init
4843                     ; 464     add_task(adc_task    ,"Sec1" ,  0, 1000); // every second
4845  064e ae03e8        	ldw	x,#1000
4846  0651 89            	pushw	x
4847  0652 5f            	clrw	x
4848  0653 89            	pushw	x
4849  0654 ae0240        	ldw	x,#L5442
4850  0657 89            	pushw	x
4851  0658 ae04d6        	ldw	x,#_adc_task
4852  065b cd0000        	call	_add_task
4854  065e 5b06          	addw	sp,#6
4855                     ; 465     add_task(scan_task   ,"Scan" ,  0,   25); // every 25 msec.
4857  0660 ae0019        	ldw	x,#25
4858  0663 89            	pushw	x
4859  0664 5f            	clrw	x
4860  0665 89            	pushw	x
4861  0666 ae023b        	ldw	x,#L7442
4862  0669 89            	pushw	x
4863  066a ae0434        	ldw	x,#_scan_task
4864  066d cd0000        	call	_add_task
4866  0670 5b06          	addw	sp,#6
4867                     ; 466     add_task(menu_handler,"Menu" ,250,  500); // every 500 msec.
4869  0672 ae01f4        	ldw	x,#500
4870  0675 89            	pushw	x
4871  0676 ae00fa        	ldw	x,#250
4872  0679 89            	pushw	x
4873  067a ae0236        	ldw	x,#L1542
4874  067d 89            	pushw	x
4875  067e ae02a5        	ldw	x,#_menu_handler
4876  0681 cd0000        	call	_add_task
4878  0684 5b06          	addw	sp,#6
4879                     ; 467     enable_interrupts();
4882  0686 9a            rim
4884                     ; 468     lcd_i2c_init(0x4E,20,4,LCD_5x8DOTS); // Needs working interrupts!
4887  0687 4b00          	push	#0
4888  0689 4b04          	push	#4
4889  068b ae4e14        	ldw	x,#19988
4890  068e cd0000        	call	_lcd_i2c_init
4892  0691 85            	popw	x
4893                     ; 469     print_version_number();
4895  0692 cd05fa        	call	_print_version_number
4897                     ; 470     if (mcp23017_init())       
4899  0695 cd0000        	call	_mcp23017_init
4901  0698 4d            	tnz	a
4902  0699 2706          	jreq	L3542
4903                     ; 472 		xputs("mcp23017_init() error\n");
4905  069b ae021f        	ldw	x,#L5542
4906  069e cd0000        	call	_xputs
4908  06a1               L3542:
4909                     ; 475     max7219_init(); // Init. driver IC for LEDs on chess-board
4911  06a1 cd0000        	call	_max7219_init
4913                     ; 476     max7219_write(MAX7219_REG_TEST  | 0x01); // Test mode: all leds on
4915  06a4 ae0f01        	ldw	x,#3841
4916  06a7 cd0000        	call	_max7219_write
4918                     ; 477     delay_msec(1000);
4920  06aa ae03e8        	ldw	x,#1000
4921  06ad cd0000        	call	_delay_msec
4923                     ; 478     max7219_write(MAX7219_REG_TEST  | 0x00); // Test mode off
4925  06b0 ae0f00        	ldw	x,#3840
4926  06b3 cd0000        	call	_max7219_write
4928                     ; 480     clk1.min    = clk2.min    = 40;
4930  06b6 35280006      	mov	_clk2,#40
4931  06ba 45060b        	mov	_clk1,_clk2
4932                     ; 481     clk1.sec    = clk2.sec    =  0;
4934  06bd 3f07          	clr	_clk2+1
4935  06bf 3f0c          	clr	_clk1+1
4936                     ; 482     clk1.active = clk2.active = false;
4938  06c1 72110008      	bres	_clk2+2,#0
4939  06c5 7211000d      	bres	_clk1+2,#0
4940  06c9               L7542:
4941                     ; 486         dispatch_tasks();                // Run task-scheduler()
4943  06c9 cd0000        	call	_dispatch_tasks
4945                     ; 487 		switch (rs232_command_handler()) // run command handler continuously
4947  06cc cd0000        	call	_rs232_command_handler
4950                     ; 493 			default     : break;
4951  06cf 4a            	dec	a
4952  06d0 2705          	jreq	L1142
4953  06d2 4a            	dec	a
4954  06d3 270a          	jreq	L3142
4955  06d5 201e          	jra	L5642
4956  06d7               L1142:
4957                     ; 489 			case ERR_CMD: xputs("Command Error\n"); break;
4959  06d7 ae0210        	ldw	x,#L7642
4960  06da cd0000        	call	_xputs
4964  06dd 2016          	jra	L5642
4965  06df               L3142:
4966                     ; 490 			case ERR_NUM: sprintf(s,"Number Error (%s)\n",rs232_inbuf);
4968  06df 4b00          	push	#_rs232_inbuf
4969  06e1 ae01fd        	ldw	x,#L1742
4970  06e4 89            	pushw	x
4971  06e5 96            	ldw	x,sp
4972  06e6 1c0007        	addw	x,#OFST-26
4973  06e9 cd0000        	call	_sprintf
4975  06ec 5b03          	addw	sp,#3
4976                     ; 491 						  xputs(s);  
4978  06ee 96            	ldw	x,sp
4979  06ef 1c0004        	addw	x,#OFST-29
4980  06f2 cd0000        	call	_xputs
4982                     ; 492 						  break;
4984  06f5               L5142:
4985                     ; 493 			default     : break;
4987  06f5               L5642:
4988                     ; 495         wait_for_interrupt(); // do nothing
4991  06f5 8f            wfi
4995  06f6 20d1          	jra	L7542
5158                     	xdef	_main
5159                     	xdef	_adc_task
5160                     	xdef	_scan_task
5161                     	xdef	_menu_handler
5162                     	xdef	_update_clock_settings
5163                     	xdef	_update_clock
5164                     	xdef	_setup_timers
5165                     	xdef	_get_timer1_value
5166                     	xdef	_PORTC_IRQHandler
5167                     	xdef	_TIM2_UPD_OVF_IRQHandler
5168                     	xdef	_clocks
5169                     	xdef	_menu
5170                     	xdef	_clear_lcd
5171                     	xdef	_bonus
5172                     	xdef	_times2
5173                     	xdef	_times1
5174                     	xdef	_game_mode
5175                     	switch	.ubsct
5176  0005               _clk_mode:
5177  0005 00            	ds.b	1
5178                     	xdef	_clk_mode
5179                     	xdef	_clk_idx
5180                     	xdef	_this_side_white
5181                     	xdef	_rotenc_sw
5182  0006               _clk2:
5183  0006 0000000000    	ds.b	5
5184                     	xdef	_clk2
5185  000b               _clk1:
5186  000b 0000000000    	ds.b	5
5187                     	xdef	_clk1
5188  0010               _reed_relays:
5189  0010 000000000000  	ds.b	8
5190                     	xdef	_reed_relays
5191                     	xdef	_col_nr
5192                     	xref.b	_rs232_inbuf
5193                     	xref.b	_t2_millis
5194                     	xref	_eedata
5195                     	xref	_chess_main
5196                     	xref	_delay_msec
5197                     	xref	_lcd_i2c_print
5198                     	xref	_lcd_i2c_backlight_on
5199                     	xref	_lcd_i2c_setCursor
5200                     	xref	_lcd_i2c_clear
5201                     	xref	_lcd_i2c_init
5202                     	xref	_tm1637_show_nr_dec_ex
5203                     	xref	_tm1637_set_brightness
5204                     	xref	_tm1637_enable_clock_nr
5205                     	xref	_rs232_command_handler
5206                     	xref	_xputs
5207                     	xref	_uart_write
5208                     	xref	_uart_init
5209                     	xref	_max7219_write
5210                     	xref	_max7219_init
5211                     	xref	_mcp23017_write
5212                     	xref	_mcp23017_read
5213                     	xref	_mcp23017_init
5214                     	xref	_i2c_init
5215                     	xref	_add_task
5216                     	xref	_dispatch_tasks
5217                     	xref	_scheduler_isr
5218                     	xref	_scheduler_init
5219                     	xdef	_print_version_number
5220                     	xdef	_setup_gpio_ports
5221                     	xdef	_initialise_system_clock
5222                     	xref	_sprintf
5223                     	switch	.const
5224  01fd               L1742:
5225  01fd 4e756d626572  	dc.b	"Number Error (%s)",10,0
5226  0210               L7642:
5227  0210 436f6d6d616e  	dc.b	"Command Error",10,0
5228  021f               L5542:
5229  021f 6d6370323330  	dc.b	"mcp23017_init() er"
5230  0231 726f720a00    	dc.b	"ror",10,0
5231  0236               L1542:
5232  0236 4d656e7500    	dc.b	"Menu",0
5233  023b               L7442:
5234  023b 5363616e00    	dc.b	"Scan",0
5235  0240               L5442:
5236  0240 5365633100    	dc.b	"Sec1",0
5237  0245               L7632:
5238  0245 54696d657231  	dc.b	"Timer1:%04d",0
5239  0251               L5632:
5240  0251 25643a253032  	dc.b	"%d:%02d:%02d",0
5241  025e               L3632:
5242  025e 25643a253032  	dc.b	"%d:%02d:%02d ",0
5243  026c               L1632:
5244  026c 434c4b2000    	dc.b	"CLK ",0
5245  0271               L3422:
5246  0271 426c61636b00  	dc.b	"Black",0
5247  0277               L7322:
5248  0277 576869746500  	dc.b	"White",0
5249  027d               L5222:
5250  027d 546869732073  	dc.b	"This side: ",0
5251  0289               L7712:
5252  0289 4e6577206761  	dc.b	"New game Selected",0
5253                     	xref.b	c_x
5254                     	xref.b	c_y
5274                     	xref	c_xymvx
5275                     	xref	c_sdivx
5276                     	xref	c_imul
5277                     	xref	c_lgadc
5278                     	end
