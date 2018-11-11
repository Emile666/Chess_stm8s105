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
2736                     ; 80 @interrupt void TIM2_UPD_OVF_IRQHandler(void)
2736                     ; 81 {
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
2756                     ; 82 	uint8_t  reeds=0;
2758  0013 0f01          	clr	(OFST+0,sp)
2760                     ; 84     PD_ODR |= ISR_TIME; // Time-measurement interrupt routine
2762  0015 7210500f      	bset	_PD_ODR,#0
2763                     ; 85     t2_millis++;        // update millisecond counter
2765  0019 ae0000        	ldw	x,#_t2_millis
2766  001c a601          	ld	a,#1
2767  001e cd0000        	call	c_lgadc
2769                     ; 86     scheduler_isr();    // Run scheduler interrupt function
2771  0021 cd0000        	call	_scheduler_isr
2773                     ; 87     PD_ODR   &= ~ISR_TIME;      // Time-measurement interrupt routine
2775  0024 7211500f      	bres	_PD_ODR,#0
2776                     ; 88     TIM2_SR1 &= ~TIM2_SR1_UIF;  // Reset interrupt (UIF bit) so it will not fire again straight away.
2778  0028 72115302      	bres	_TIM2_SR1,#0
2779                     ; 89 } // TIM2_UPD_OVF_IRQHandler()
2782  002c 84            	pop	a
2783  002d 85            	popw	x
2784  002e bf00          	ldw	c_y,x
2785  0030 320002        	pop	c_y+2
2786  0033 85            	popw	x
2787  0034 bf00          	ldw	c_x,x
2788  0036 320002        	pop	c_x+2
2789  0039 80            	iret
2813                     ; 91 @interrupt void PORTA_IRQHandler(void)
2813                     ; 92 {
2814                     	switch	.text
2815  003a               _PORTA_IRQHandler:
2819                     ; 93     rotenc_sw = true;
2821  003a 72100000      	bset	_rotenc_sw
2822                     ; 94 } // PORTA_IRQHandler()
2825  003e 80            	iret
2861                     ; 102 uint16_t get_timer1_value(void)
2861                     ; 103 {
2862                     	switch	.text
2863  003f               _get_timer1_value:
2865  003f 89            	pushw	x
2866       00000002      OFST:	set	2
2869                     ; 104     uint16_t tmpcntr = 0;
2871                     ; 106     tmpcntr = ((uint16_t)TIM1_CNTRH << 8);
2873  0040 c6525e        	ld	a,_TIM1_CNTRH
2874  0043 5f            	clrw	x
2875  0044 97            	ld	xl,a
2876  0045 4f            	clr	a
2877  0046 02            	rlwa	x,a
2878  0047 1f01          	ldw	(OFST-1,sp),x
2880                     ; 107     return (uint16_t)(tmpcntr | (uint16_t)(TIM1_CNTRL));
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
2923                     ; 116 void initialise_system_clock(void)
2923                     ; 117 {
2924                     	switch	.text
2925  0058               _initialise_system_clock:
2929                     ; 118     CLK_ICKCR  = 0;                //  Reset the Internal Clock Register.
2931  0058 725f50c0      	clr	_CLK_ICKCR
2932                     ; 119     CLK_ICKCR |= CLK_ICKCR_HSIEN;  //  Enable the HSI.
2934  005c 721050c0      	bset	_CLK_ICKCR,#0
2936  0060               L7071:
2937                     ; 120     while ((CLK_ICKCR & CLK_ICKCR_HSIRDY) == 0); //  Wait for the HSI to be ready for use.
2939  0060 c650c0        	ld	a,_CLK_ICKCR
2940  0063 a502          	bcp	a,#2
2941  0065 27f9          	jreq	L7071
2942                     ; 121     CLK_CKDIVR     = 0;            //  Ensure the clocks are running at full speed.
2944  0067 725f50c6      	clr	_CLK_CKDIVR
2945                     ; 125     ADC_CR1     &= ~ADC_CR1_SPSEL_MSK;
2947  006b c65401        	ld	a,_ADC_CR1
2948  006e a48f          	and	a,#143
2949  0070 c75401        	ld	_ADC_CR1,a
2950                     ; 126     ADC_CR1     |= 0x20;          //  Set prescaler (SPSEL bits) to 4, fADC = 4 MHz
2952  0073 721a5401      	bset	_ADC_CR1,#5
2953                     ; 127     CLK_SWIMCCR  = 0x00;          //  Set SWIM to run at clock / 2.
2955  0077 725f50cd      	clr	_CLK_SWIMCCR
2956                     ; 128     CLK_SWR      = 0xE1;          //  Use HSI as the clock source.
2958  007b 35e150c4      	mov	_CLK_SWR,#225
2959                     ; 129     CLK_SWCR     = 0x00;          //  Reset the clock switch control register.
2961  007f 725f50c5      	clr	_CLK_SWCR
2962                     ; 130     CLK_SWCR    |= CLK_SWCR_SWEN; //  Enable switching.
2964  0083 721250c5      	bset	_CLK_SWCR,#1
2966  0087               L5171:
2967                     ; 131     while ((CLK_SWCR & CLK_SWCR_SWBSY) != 0);  //  Pause while the clock switch is busy.
2969  0087 c650c5        	ld	a,_CLK_SWCR
2970  008a a501          	bcp	a,#1
2971  008c 26f9          	jrne	L5171
2972                     ; 132 } // initialise_system_clock()
2975  008e 81            	ret
3015                     ; 142 void setup_timers(void)
3015                     ; 143 {
3016                     	switch	.text
3017  008f               _setup_timers:
3021                     ; 145     TIM2_PSCR = 0x04;         //  Prescaler = 16
3023  008f 3504530c      	mov	_TIM2_PSCR,#4
3024                     ; 146     TIM2_ARRH = 0x03;         //  High byte of 1000
3026  0093 3503530d      	mov	_TIM2_ARRH,#3
3027                     ; 147     TIM2_ARRL = 0xE8;         //  Low  byte of 1000
3029  0097 35e8530e      	mov	_TIM2_ARRL,#232
3030                     ; 148     TIM2_IER  = TIM2_IER_UIE; //  Enable the update interrupts, disable all others
3032  009b 35015301      	mov	_TIM2_IER,#1
3033                     ; 149     TIM2_CR1  = TIM2_CR1_CEN; //  Finally, enable the timer
3035  009f 35015300      	mov	_TIM2_CR1,#1
3036                     ; 152     TIM1_ARRH   = 0x03; // Autoreload value: High byte of 1000
3038  00a3 35035262      	mov	_TIM1_ARRH,#3
3039                     ; 153     TIM1_ARRL   = 0xE8; // Autoreload value: Low  byte of 1000
3041  00a7 35e85263      	mov	_TIM1_ARRL,#232
3042                     ; 154     TIM1_CNTRH  = 0x01; // TEST: does it work?
3044  00ab 3501525e      	mov	_TIM1_CNTRH,#1
3045                     ; 155     TIM1_CNTRL  = 0xF4; // TEST:	    
3047  00af 35f4525f      	mov	_TIM1_CNTRL,#244
3048                     ; 156     TIM1_PSCRH  = 0x00; // Prescaler high byte
3050  00b3 725f5260      	clr	_TIM1_PSCRH
3051                     ; 157     TIM1_PSCRL  = 0x10; // Prescaler is 16, clock is 1 MHz
3053  00b7 35105261      	mov	_TIM1_PSCRL,#16
3054                     ; 158     TIM1_CR1    = 0x00; // Edge-aligned mode, up-counter
3056  00bb 725f5250      	clr	_TIM1_CR1
3057                     ; 159     TIM1_RCR    = 0x01; // Repetition-rate
3059  00bf 35015264      	mov	_TIM1_RCR,#1
3060                     ; 160     TIM1_CCER1  = 0x22; // Set CC1P and CC2P: falling-edge
3062  00c3 3522525c      	mov	_TIM1_CCER1,#34
3063                     ; 161     TIM1_SMCR   = 0x03; // Encode mode 3, counts up/down on TI1FP1/TI2FP1 edges
3065  00c7 35035252      	mov	_TIM1_SMCR,#3
3066                     ; 162     TIM1_CCMR1  = 0x01; // CC1 is input, IC1 is mapped to TI1FP1
3068  00cb 35015258      	mov	_TIM1_CCMR1,#1
3069                     ; 163     TIM1_CCMR2  = 0x01; // CC2 is input, IC2 is mapped to TI2FP2
3071  00cf 35015259      	mov	_TIM1_CCMR2,#1
3072                     ; 164     TIM1_CR1   |= 0x01; // Finally, enable the timer
3074  00d3 72105250      	bset	_TIM1_CR1,#0
3075                     ; 165 } // setup_timers()
3078  00d7 81            	ret
3118                     ; 173 void setup_gpio_ports(void)
3118                     ; 174 {
3119                     	switch	.text
3120  00d8               _setup_gpio_ports:
3124                     ; 175     PA_DDR     |=  (LED_CLK | LED_LOAD | LED_DIN);            // Set as outputs
3126  00d8 c65002        	ld	a,_PA_DDR
3127  00db aa70          	or	a,#112
3128  00dd c75002        	ld	_PA_DDR,a
3129                     ; 177     PA_DDR     &= ~ROTENC_SW;                       // Set unused pins as input
3131  00e0 72175002      	bres	_PA_DDR,#3
3132                     ; 178     PA_CR1     |=  ROTENC_SW;                       // Enable pull-up
3134  00e4 72165003      	bset	_PA_CR1,#3
3135                     ; 179     PA_CR1     |=  (LED_CLK | LED_LOAD | LED_DIN);            // Set to Push-Pull
3137  00e8 c65003        	ld	a,_PA_CR1
3138  00eb aa70          	or	a,#112
3139  00ed c75003        	ld	_PA_CR1,a
3140                     ; 180     PA_CR2     |=  ROTENC_SW;                                 // Enable interrupt
3142  00f0 72165004      	bset	_PA_CR2,#3
3143                     ; 181     PA_ODR     &= ~(LED_CLK | LED_DIN | LED_LOAD);            // Disable PORTA outputs
3145  00f4 c65000        	ld	a,_PA_ODR
3146  00f7 a48f          	and	a,#143
3147  00f9 c75000        	ld	_PA_ODR,a
3148                     ; 182 	EXTI_CR1   |=  0x02;  // PAIS bits to Falling edge (0x20 for PORTC)
3150  00fc 721250a0      	bset	_EXTI_CR1,#1
3151                     ; 184     PB_DDR     &= ~PB_NC;            						  // Set as input
3153  0100 c65007        	ld	a,_PB_DDR
3154  0103 a400          	and	a,#0
3155  0105 c75007        	ld	_PB_DDR,a
3156                     ; 185     PB_CR1     |=  PB_NC;                                     // Enable pull-up
3158  0108 c65008        	ld	a,_PB_CR1
3159  010b aaff          	or	a,#255
3160  010d c75008        	ld	_PB_CR1,a
3161                     ; 187     PC_DDR     |=  (SPI_MOSI | SPI_CLK); 					     // Set as outputs
3163  0110 c6500c        	ld	a,_PC_DDR
3164  0113 aa60          	or	a,#96
3165  0115 c7500c        	ld	_PC_DDR,a
3166                     ; 188     PC_CR1     |=  (SPI_MOSI | SPI_CLK); 					     // Set to Push-Pull
3168  0118 c6500d        	ld	a,_PC_CR1
3169  011b aa60          	or	a,#96
3170  011d c7500d        	ld	_PC_CR1,a
3171                     ; 189     PC_CR2     |=  (SPI_MOSI | SPI_CLK);          		         // Set to 10 MHz
3173  0120 c6500e        	ld	a,_PC_CR2
3174  0123 aa60          	or	a,#96
3175  0125 c7500e        	ld	_PC_CR2,a
3176                     ; 190     PC_ODR     &= ~(SPI_MOSI | SPI_CLK);          		         // Disable PORTC outputs
3178  0128 c6500a        	ld	a,_PC_ODR
3179  012b a49f          	and	a,#159
3180  012d c7500a        	ld	_PC_ODR,a
3181                     ; 191     PC_DDR     &= ~(SPI_MISO | ROTENC_A | ROTENC_B | ROTENC_SW); // set as Input
3183  0130 c6500c        	ld	a,_PC_DDR
3184  0133 a471          	and	a,#113
3185  0135 c7500c        	ld	_PC_DDR,a
3186                     ; 192 	PC_DDR     &= ~PC_NC;										 // set as Input
3188  0138 c6500c        	ld	a,_PC_DDR
3189  013b a4ee          	and	a,#238
3190  013d c7500c        	ld	_PC_DDR,a
3191                     ; 193     PC_CR1     &= ~SPI_MISO;                      			     // set to Floating
3193  0140 721f500d      	bres	_PC_CR1,#7
3194                     ; 194     PC_CR1     |=  ROTENC_A | ROTENC_B | ROTENC_SW | PC_NC;      // Enable pull-up
3196  0144 c6500d        	ld	a,_PC_CR1
3197  0147 aa1f          	or	a,#31
3198  0149 c7500d        	ld	_PC_CR1,a
3199                     ; 196 	PD_DDR     |=  (CLK1 | DIO1 | CLK2 | DIO2 | ISR_TIME);       // Set as output
3201  014c c65011        	ld	a,_PD_DDR
3202  014f aa9d          	or	a,#157
3203  0151 c75011        	ld	_PD_DDR,a
3204                     ; 197     PD_CR1     |=  (CLK1 | DIO1 | CLK2 | DIO2 | ISR_TIME);       // Set to Push-Pull
3206  0154 c65012        	ld	a,_PD_CR1
3207  0157 aa9d          	or	a,#157
3208  0159 c75012        	ld	_PD_CR1,a
3209                     ; 198     PD_DDR     &= ~RX;                                           // Set as input
3211  015c 721d5011      	bres	_PD_DDR,#6
3212                     ; 199     PD_CR1     |=  RX;                                           // Enable Pull-up
3214  0160 721c5012      	bset	_PD_CR1,#6
3215                     ; 200     PD_ODR     |= (CLK1 | DIO1 | CLK2 | DIO2);                   // Clock and Data from TM1367 all high
3217  0164 c6500f        	ld	a,_PD_ODR
3218  0167 aa9c          	or	a,#156
3219  0169 c7500f        	ld	_PD_ODR,a
3220                     ; 201 	PD_ODR     &= ~ISR_TIME;
3222  016c 7211500f      	bres	_PD_ODR,#0
3223                     ; 203     PE_ODR     |=  (I2C_SCL | I2C_SDA); // Must be set here, or I2C will not work
3225  0170 c65014        	ld	a,_PE_ODR
3226  0173 aa06          	or	a,#6
3227  0175 c75014        	ld	_PE_ODR,a
3228                     ; 204     PE_DDR     |=  (I2C_SCL | I2C_SDA); // Set as outputs
3230  0178 c65016        	ld	a,_PE_DDR
3231  017b aa06          	or	a,#6
3232  017d c75016        	ld	_PE_DDR,a
3233                     ; 205     PE_DDR     &= ~PE_NC;               // Set unused ports as input
3235  0180 c65016        	ld	a,_PE_DDR
3236  0183 a406          	and	a,#6
3237  0185 c75016        	ld	_PE_DDR,a
3238                     ; 206     PE_CR1     |=  PE_NC;               // Enable pull-ups
3240  0188 c65017        	ld	a,_PE_CR1
3241  018b aaf9          	or	a,#249
3242  018d c75017        	ld	_PE_CR1,a
3243                     ; 207 } // setup_output_ports()
3246  0190 81            	ret
3353                     ; 209 void update_clock(clock_struct *p)
3353                     ; 210 {
3354                     	switch	.text
3355  0191               _update_clock:
3357  0191 89            	pushw	x
3358  0192 89            	pushw	x
3359       00000002      OFST:	set	2
3362                     ; 213     if (p->active) 
3364  0193 e602          	ld	a,(2,x)
3365  0195 a501          	bcp	a,#1
3366  0197 271c          	jreq	L3102
3367                     ; 217         if (p->sec == 0)
3369  0199 6d01          	tnz	(1,x)
3370  019b 260a          	jrne	L5102
3371                     ; 219             if (p->min > 0)
3373  019d 7d            	tnz	(x)
3374  019e 270b          	jreq	L1202
3375                     ; 221                 p->sec = 59;
3377  01a0 a63b          	ld	a,#59
3378  01a2 e701          	ld	(1,x),a
3379                     ; 222                 p->min--;
3381  01a4 7a            	dec	(x)
3382  01a5 2004          	jra	L1202
3383  01a7               L5102:
3384                     ; 225         else p->sec--;
3386  01a7 1e03          	ldw	x,(OFST+1,sp)
3387  01a9 6a01          	dec	(1,x)
3388  01ab               L1202:
3389                     ; 226         p->blink = !p->blink;
3391  01ab 1e03          	ldw	x,(OFST+1,sp)
3392  01ad e602          	ld	a,(2,x)
3393  01af a804          	xor	a,#4
3394  01b1 e702          	ld	(2,x),a
3396  01b3 203d          	jra	L3202
3397  01b5               L3102:
3398                     ; 230         if (p->active_prev)
3400  01b5 1e03          	ldw	x,(OFST+1,sp)
3401  01b7 e602          	ld	a,(2,x)
3402  01b9 a502          	bcp	a,#2
3403  01bb 272d          	jreq	L5202
3404                     ; 232             if (clk_mode == FISCHER)
3406  01bd b605          	ld	a,_clk_mode
3407  01bf a101          	cp	a,#1
3408  01c1 2627          	jrne	L5202
3409                     ; 234                 p->sec += bonus[clk_idx];
3411  01c3 1e03          	ldw	x,(OFST+1,sp)
3412  01c5 905f          	clrw	y
3413  01c7 b601          	ld	a,_clk_idx
3414  01c9 2a02          	jrpl	L22
3415  01cb 9053          	cplw	y
3416  01cd               L22:
3417  01cd 9097          	ld	yl,a
3418  01cf e601          	ld	a,(1,x)
3419  01d1 90db0022      	add	a,(_bonus,y)
3420  01d5 e701          	ld	(1,x),a
3421                     ; 235                 if (p->sec > 59)
3423  01d7 1e03          	ldw	x,(OFST+1,sp)
3424  01d9 e601          	ld	a,(1,x)
3425  01db a13c          	cp	a,#60
3426  01dd 250b          	jrult	L5202
3427                     ; 237                     p->sec -= 60;
3429  01df 1e03          	ldw	x,(OFST+1,sp)
3430  01e1 e601          	ld	a,(1,x)
3431  01e3 a03c          	sub	a,#60
3432  01e5 e701          	ld	(1,x),a
3433                     ; 238                     ++p->min;
3435  01e7 1e03          	ldw	x,(OFST+1,sp)
3436  01e9 7c            	inc	(x)
3437  01ea               L5202:
3438                     ; 243         p->blink = true;
3440  01ea 1e03          	ldw	x,(OFST+1,sp)
3441  01ec e602          	ld	a,(2,x)
3442  01ee aa04          	or	a,#4
3443  01f0 e702          	ld	(2,x),a
3444  01f2               L3202:
3445                     ; 245     if (p->min > 59)
3447  01f2 1e03          	ldw	x,(OFST+1,sp)
3448  01f4 f6            	ld	a,(x)
3449  01f5 a13c          	cp	a,#60
3450  01f7 2524          	jrult	L3302
3451                     ; 247         x = (uint16_t)p->min / 60;   // #hours
3453  01f9 1e03          	ldw	x,(OFST+1,sp)
3454  01fb f6            	ld	a,(x)
3455  01fc 5f            	clrw	x
3456  01fd 97            	ld	xl,a
3457  01fe a63c          	ld	a,#60
3458  0200 62            	div	x,a
3459  0201 1f01          	ldw	(OFST-1,sp),x
3461                     ; 248         p->digits = 40 * x + p->min; // hh:mm to display
3463  0203 1e01          	ldw	x,(OFST-1,sp)
3464  0205 90ae0028      	ldw	y,#40
3465  0209 cd0000        	call	c_imul
3467  020c 01            	rrwa	x,a
3468  020d 1603          	ldw	y,(OFST+1,sp)
3469  020f 90fb          	add	a,(y)
3470  0211 2401          	jrnc	L42
3471  0213 5c            	incw	x
3472  0214               L42:
3473  0214 1603          	ldw	y,(OFST+1,sp)
3474  0216 02            	rlwa	x,a
3475  0217 90ef03        	ldw	(3,y),x
3476  021a 01            	rrwa	x,a
3478  021b 2017          	jra	L5302
3479  021d               L3302:
3480                     ; 252         p->digits = 100 * p->min + p->sec; // mm:ss to display
3482  021d 1e03          	ldw	x,(OFST+1,sp)
3483  021f f6            	ld	a,(x)
3484  0220 97            	ld	xl,a
3485  0221 a664          	ld	a,#100
3486  0223 42            	mul	x,a
3487  0224 01            	rrwa	x,a
3488  0225 1603          	ldw	y,(OFST+1,sp)
3489  0227 90eb01        	add	a,(1,y)
3490  022a 2401          	jrnc	L62
3491  022c 5c            	incw	x
3492  022d               L62:
3493  022d 1603          	ldw	y,(OFST+1,sp)
3494  022f 02            	rlwa	x,a
3495  0230 90ef03        	ldw	(3,y),x
3496  0233 01            	rrwa	x,a
3497  0234               L5302:
3498                     ; 254     p->active_prev = p->active;
3500  0234 1e03          	ldw	x,(OFST+1,sp)
3501  0236 e602          	ld	a,(2,x)
3502  0238 a401          	and	a,#1
3503  023a 1e03          	ldw	x,(OFST+1,sp)
3504  023c 48            	sll	a
3505  023d e802          	xor	a,(2,x)
3506  023f a402          	and	a,#2
3507  0241 e802          	xor	a,(2,x)
3508  0243 e702          	ld	(2,x),a
3509                     ; 255 } // update_clock()
3512  0245 5b04          	addw	sp,#4
3513  0247 81            	ret
3543                     ; 257 void update_clock_settings(void)
3543                     ; 258 {
3544                     	switch	.text
3545  0248               _update_clock_settings:
3549                     ; 259     clk1.min = clk2.min = times1[clk_idx];
3551  0248 5f            	clrw	x
3552  0249 b601          	ld	a,_clk_idx
3553  024b 2a01          	jrpl	L23
3554  024d 53            	cplw	x
3555  024e               L23:
3556  024e 97            	ld	xl,a
3557  024f d60000        	ld	a,(_times1,x)
3558  0252 b706          	ld	_clk2,a
3559  0254 45060b        	mov	_clk1,_clk2
3560                     ; 260     clk1.sec = clk2.sec = 0;
3562  0257 3f07          	clr	_clk2+1
3563  0259 3f0c          	clr	_clk1+1
3564                     ; 261     if (clk_idx < 7)       clk_mode = TIME;
3566  025b 9c            	rvf
3567  025c b601          	ld	a,_clk_idx
3568  025e a107          	cp	a,#7
3569  0260 2e04          	jrsge	L7402
3572  0262 3f05          	clr	_clk_mode
3574  0264 201e          	jra	L1502
3575  0266               L7402:
3576                     ; 262     else if (clk_idx < 11) clk_mode = FISCHER;
3578  0266 9c            	rvf
3579  0267 b601          	ld	a,_clk_idx
3580  0269 a10b          	cp	a,#11
3581  026b 2e06          	jrsge	L3502
3584  026d 35010005      	mov	_clk_mode,#1
3586  0271 2011          	jra	L1502
3587  0273               L3502:
3588                     ; 263     else if (clk_idx < 14) clk_mode = DELAY;
3590  0273 9c            	rvf
3591  0274 b601          	ld	a,_clk_idx
3592  0276 a10e          	cp	a,#14
3593  0278 2e06          	jrsge	L7502
3596  027a 35030005      	mov	_clk_mode,#3
3598  027e 2004          	jra	L1502
3599  0280               L7502:
3600                     ; 264     else                   clk_mode = US_DLY;
3602  0280 35020005      	mov	_clk_mode,#2
3603  0284               L1502:
3604                     ; 266     if ((clk_mode == FISCHER) || (clk_mode == US_DLY))
3606  0284 b605          	ld	a,_clk_mode
3607  0286 a101          	cp	a,#1
3608  0288 2706          	jreq	L5602
3610  028a b605          	ld	a,_clk_mode
3611  028c a102          	cp	a,#2
3612  028e 261c          	jrne	L3602
3613  0290               L5602:
3614                     ; 268         clk1.sec += bonus[clk_idx];
3616  0290 5f            	clrw	x
3617  0291 b601          	ld	a,_clk_idx
3618  0293 2a01          	jrpl	L43
3619  0295 53            	cplw	x
3620  0296               L43:
3621  0296 97            	ld	xl,a
3622  0297 b60c          	ld	a,_clk1+1
3623  0299 db0022        	add	a,(_bonus,x)
3624  029c b70c          	ld	_clk1+1,a
3625                     ; 269         clk2.sec += bonus[clk_idx];
3627  029e 5f            	clrw	x
3628  029f b601          	ld	a,_clk_idx
3629  02a1 2a01          	jrpl	L63
3630  02a3 53            	cplw	x
3631  02a4               L63:
3632  02a4 97            	ld	xl,a
3633  02a5 b607          	ld	a,_clk2+1
3634  02a7 db0022        	add	a,(_bonus,x)
3635  02aa b707          	ld	_clk2+1,a
3636  02ac               L3602:
3637                     ; 271 } // update_clock_settings()
3640  02ac 81            	ret
3643                     	bsct
3644  0003               L7602_menu_std:
3645  0003 00            	dc.b	0
3646  0004               L1702_menu_idx:
3647  0004 00            	dc.b	0
3648                     	switch	.ubsct
3649  0000               L3702_tmr:
3650  0000 00            	ds.b	1
3651  0001               L5702_old_rotenc:
3652  0001 0000          	ds.b	2
3730                     ; 273 void menu_handler(void)
3730                     ; 274 {
3731                     	switch	.text
3732  02ad               _menu_handler:
3734  02ad 89            	pushw	x
3735       00000002      OFST:	set	2
3738                     ; 282     rotenc = get_timer1_value();
3740  02ae cd003f        	call	_get_timer1_value
3742  02b1 1f01          	ldw	(OFST-1,sp),x
3744                     ; 283     switch (menu_std)
3746  02b3 b603          	ld	a,L7602_menu_std
3748                     ; 358                 break;
3749  02b5 4d            	tnz	a
3750  02b6 2719          	jreq	L7702
3751  02b8 4a            	dec	a
3752  02b9 273c          	jreq	L1012
3753  02bb 4a            	dec	a
3754  02bc 2603          	jrne	L64
3755  02be cc0365        	jp	L3012
3756  02c1               L64:
3757  02c1 4a            	dec	a
3758  02c2 2603          	jrne	L05
3759  02c4 cc0382        	jp	L5012
3760  02c7               L05:
3761  02c7 4a            	dec	a
3762  02c8 2603          	jrne	L25
3763  02ca cc03eb        	jp	L7012
3764  02cd               L25:
3765  02cd ac330433      	jpf	L1512
3766  02d1               L7702:
3767                     ; 285         case 0: // Clear menu-line
3767                     ; 286                 lcd_i2c_setCursor(0,1);
3769  02d1 ae0001        	ldw	x,#1
3770  02d4 cd0000        	call	_lcd_i2c_setCursor
3772                     ; 287                 lcd_i2c_print(clear_lcd);
3774  02d7 ae0033        	ldw	x,#_clear_lcd
3775  02da cd0000        	call	_lcd_i2c_print
3777                     ; 288                 if (rotenc_sw) 
3779                     	btst	_rotenc_sw
3780  02e2 2503          	jrult	L45
3781  02e4 cc0433        	jp	L1512
3782  02e7               L45:
3783                     ; 290                     menu_std = 1;      // rotate through menu-items
3785  02e7 35010003      	mov	L7602_menu_std,#1
3786                     ; 291                     rotenc_sw = false; // reset switch
3788  02eb 72110000      	bres	_rotenc_sw
3789                     ; 292                     menu_idx = 0;      // start with 1st menu-item
3791  02ef 3f04          	clr	L1702_menu_idx
3792                     ; 293                     tmr = 0;           // reset timer
3794  02f1 3f00          	clr	L3702_tmr
3795  02f3 ac330433      	jpf	L1512
3796  02f7               L1012:
3797                     ; 296         case 1: // Rotate through menu-items
3797                     ; 297                 lcd_i2c_setCursor(0,1);
3799  02f7 ae0001        	ldw	x,#1
3800  02fa cd0000        	call	_lcd_i2c_setCursor
3802                     ; 298                 lcd_i2c_print(menu[menu_idx]); // display menu-item
3804  02fd 5f            	clrw	x
3805  02fe b604          	ld	a,L1702_menu_idx
3806  0300 2a01          	jrpl	L24
3807  0302 53            	cplw	x
3808  0303               L24:
3809  0303 97            	ld	xl,a
3810  0304 90ae0014      	ldw	y,#20
3811  0308 cd0000        	call	c_imul
3813  030b 1c0048        	addw	x,#_menu
3814  030e cd0000        	call	_lcd_i2c_print
3816                     ; 299                 if (rotenc_sw)
3818                     	btst	_rotenc_sw
3819  0316 2410          	jruge	L5512
3820                     ; 301                     rotenc_sw = false; // reset switch
3822  0318 72110000      	bres	_rotenc_sw
3823                     ; 302                     tmr = 0;           // reset timer
3825  031c 3f00          	clr	L3702_tmr
3826                     ; 303                     menu_std = 2 + menu_idx; // goto corresponding state
3828  031e b604          	ld	a,L1702_menu_idx
3829  0320 ab02          	add	a,#2
3830  0322 b703          	ld	L7602_menu_std,a
3832  0324 ac330433      	jpf	L1512
3833  0328               L5512:
3834                     ; 305                 else if (rotenc > old_rotenc)
3836  0328 1e01          	ldw	x,(OFST-1,sp)
3837  032a b301          	cpw	x,L5702_old_rotenc
3838  032c 2313          	jrule	L1612
3839                     ; 307                     if (++menu_idx > 2) menu_idx = 2;
3841  032e 9c            	rvf
3842  032f 3c04          	inc	L1702_menu_idx
3843  0331 b604          	ld	a,L1702_menu_idx
3844  0333 a103          	cp	a,#3
3845  0335 2f04          	jrslt	L3612
3848  0337 35020004      	mov	L1702_menu_idx,#2
3849  033b               L3612:
3850                     ; 308                     tmr = 0;           // reset timer
3852  033b 3f00          	clr	L3702_tmr
3854  033d ac330433      	jpf	L1512
3855  0341               L1612:
3856                     ; 310                 else if (rotenc < old_rotenc)
3858  0341 1e01          	ldw	x,(OFST-1,sp)
3859  0343 b301          	cpw	x,L5702_old_rotenc
3860  0345 240d          	jruge	L7612
3861                     ; 312                     if (--menu_idx < 0) menu_idx = 0;
3863  0347 9c            	rvf
3864  0348 3a04          	dec	L1702_menu_idx
3865  034a 2e02          	jrsge	L1712
3868  034c 3f04          	clr	L1702_menu_idx
3869  034e               L1712:
3870                     ; 313                     tmr = 0;           // reset timer
3872  034e 3f00          	clr	L3702_tmr
3874  0350 ac330433      	jpf	L1512
3875  0354               L7612:
3876                     ; 315                 else if (++tmr > 10) menu_std = 0;
3878  0354 3c00          	inc	L3702_tmr
3879  0356 b600          	ld	a,L3702_tmr
3880  0358 a10b          	cp	a,#11
3881  035a 2403          	jruge	L65
3882  035c cc0433        	jp	L1512
3883  035f               L65:
3886  035f 3f03          	clr	L7602_menu_std
3887  0361 ac330433      	jpf	L1512
3888  0365               L3012:
3889                     ; 317         case 2: // New game
3889                     ; 318                 lcd_i2c_setCursor(0,1);
3891  0365 ae0001        	ldw	x,#1
3892  0368 cd0000        	call	_lcd_i2c_setCursor
3894                     ; 319                 lcd_i2c_print("New game Selected"); // display menu-item
3896  036b ae0289        	ldw	x,#L7712
3897  036e cd0000        	call	_lcd_i2c_print
3899                     ; 320                 if (++tmr > 10) menu_std = 0;
3901  0371 3c00          	inc	L3702_tmr
3902  0373 b600          	ld	a,L3702_tmr
3903  0375 a10b          	cp	a,#11
3904  0377 2403          	jruge	L06
3905  0379 cc0433        	jp	L1512
3906  037c               L06:
3909  037c 3f03          	clr	L7602_menu_std
3910  037e ac330433      	jpf	L1512
3911  0382               L5012:
3912                     ; 322         case 3: // Setup clocks
3912                     ; 323                 lcd_i2c_setCursor(0,1);
3914  0382 ae0001        	ldw	x,#1
3915  0385 cd0000        	call	_lcd_i2c_setCursor
3917                     ; 324                 lcd_i2c_print(clocks[clk_idx]); // display clock-item
3919  0388 5f            	clrw	x
3920  0389 b601          	ld	a,_clk_idx
3921  038b 2a01          	jrpl	L44
3922  038d 53            	cplw	x
3923  038e               L44:
3924  038e 97            	ld	xl,a
3925  038f 90ae0015      	ldw	y,#21
3926  0393 cd0000        	call	c_imul
3928  0396 1c0084        	addw	x,#_clocks
3929  0399 cd0000        	call	_lcd_i2c_print
3931                     ; 325                 if (rotenc_sw)
3933                     	btst	_rotenc_sw
3934  03a1 2410          	jruge	L3022
3935                     ; 327                     update_clock_settings(); // Update clock with new settings
3937  03a3 cd0248        	call	_update_clock_settings
3939                     ; 328                     rotenc_sw = false; // reset switch
3941  03a6 72110000      	bres	_rotenc_sw
3942                     ; 329                     tmr = 0;           // reset timer
3944  03aa 3f00          	clr	L3702_tmr
3945                     ; 330                     menu_std = 1;      // goto state 1
3947  03ac 35010003      	mov	L7602_menu_std,#1
3949  03b0 cc0433        	jra	L1512
3950  03b3               L3022:
3951                     ; 332                 else if (rotenc > old_rotenc)
3953  03b3 1e01          	ldw	x,(OFST-1,sp)
3954  03b5 b301          	cpw	x,L5702_old_rotenc
3955  03b7 2311          	jrule	L7022
3956                     ; 334                     if (++clk_idx > 16) clk_idx = 16;
3958  03b9 9c            	rvf
3959  03ba 3c01          	inc	_clk_idx
3960  03bc b601          	ld	a,_clk_idx
3961  03be a111          	cp	a,#17
3962  03c0 2f04          	jrslt	L1122
3965  03c2 35100001      	mov	_clk_idx,#16
3966  03c6               L1122:
3967                     ; 335                     tmr = 0;           // reset timer
3969  03c6 3f00          	clr	L3702_tmr
3971  03c8 2069          	jra	L1512
3972  03ca               L7022:
3973                     ; 337                 else if (rotenc < old_rotenc)
3975  03ca 1e01          	ldw	x,(OFST-1,sp)
3976  03cc b301          	cpw	x,L5702_old_rotenc
3977  03ce 240b          	jruge	L5122
3978                     ; 339                     if (--clk_idx < 0) clk_idx = 0;
3980  03d0 9c            	rvf
3981  03d1 3a01          	dec	_clk_idx
3982  03d3 2e02          	jrsge	L7122
3985  03d5 3f01          	clr	_clk_idx
3986  03d7               L7122:
3987                     ; 340                     tmr = 0;           // reset timer
3989  03d7 3f00          	clr	L3702_tmr
3991  03d9 2058          	jra	L1512
3992  03db               L5122:
3993                     ; 342                 else if (++tmr > 10) { menu_std = 1; tmr = 0; }
3995  03db 3c00          	inc	L3702_tmr
3996  03dd b600          	ld	a,L3702_tmr
3997  03df a10b          	cp	a,#11
3998  03e1 2550          	jrult	L1512
4001  03e3 35010003      	mov	L7602_menu_std,#1
4004  03e7 3f00          	clr	L3702_tmr
4005  03e9 2048          	jra	L1512
4006  03eb               L7012:
4007                     ; 344         case 4: // Choose White
4007                     ; 345                 lcd_i2c_setCursor(0,1);
4009  03eb ae0001        	ldw	x,#1
4010  03ee cd0000        	call	_lcd_i2c_setCursor
4012                     ; 346                 lcd_i2c_print("This side: "); // display menu-item
4014  03f1 ae027d        	ldw	x,#L5222
4015  03f4 cd0000        	call	_lcd_i2c_print
4017                     ; 347                 if (rotenc_sw)
4019                     	btst	_rotenc_sw
4020  03fc 240c          	jruge	L7222
4021                     ; 349                     rotenc_sw = false;
4023  03fe 72110000      	bres	_rotenc_sw
4024                     ; 350                     this_side_white = !this_side_white;
4026  0402 90100001      	bcpl	_this_side_white
4027                     ; 351                     tmr = 0;
4029  0406 3f00          	clr	L3702_tmr
4031  0408 200e          	jra	L1322
4032  040a               L7222:
4033                     ; 353                 else if (++tmr > 10) { menu_std = 1; tmr = 0; }
4035  040a 3c00          	inc	L3702_tmr
4036  040c b600          	ld	a,L3702_tmr
4037  040e a10b          	cp	a,#11
4038  0410 2506          	jrult	L1322
4041  0412 35010003      	mov	L7602_menu_std,#1
4044  0416 3f00          	clr	L3702_tmr
4045  0418               L1322:
4046                     ; 354                 lcd_i2c_setCursor(11,1);
4048  0418 ae0b01        	ldw	x,#2817
4049  041b cd0000        	call	_lcd_i2c_setCursor
4051                     ; 355                 if (this_side_white)
4053                     	btst	_this_side_white
4054  0423 2408          	jruge	L5322
4055                     ; 356                      lcd_i2c_print("White");
4057  0425 ae0277        	ldw	x,#L7322
4058  0428 cd0000        	call	_lcd_i2c_print
4061  042b 2006          	jra	L1512
4062  042d               L5322:
4063                     ; 357                 else lcd_i2c_print("Black");
4065  042d ae0271        	ldw	x,#L3422
4066  0430 cd0000        	call	_lcd_i2c_print
4068  0433               L1512:
4069                     ; 360     old_rotenc = rotenc;
4071  0433 1e01          	ldw	x,(OFST-1,sp)
4072  0435 bf01          	ldw	L5702_old_rotenc,x
4073                     ; 361 } // menu_handler()
4076  0437 85            	popw	x
4077  0438 81            	ret
4080                     	bsct
4081  0005               L5422_col_nr:
4082  0005 00            	dc.b	0
4083                     	switch	.ubsct
4084  0003               L7422_i:
4085  0003 00            	ds.b	1
4086  0004               L3522_max_bit:
4087  0004 00            	ds.b	1
4150                     ; 369 void scan_task(void)
4150                     ; 370 {
4151                     	switch	.text
4152  0439               _scan_task:
4154  0439 5203          	subw	sp,#3
4155       00000003      OFST:	set	3
4158                     ; 374 	reeds = mcp23017_read(GPIOA);    // Read status of reed-relays
4160  043b a612          	ld	a,#18
4161  043d cd0000        	call	_mcp23017_read
4163  0440 6b03          	ld	(OFST+0,sp),a
4165                     ; 376     if (col_nr < 7) max_bit = 6-col_nr;
4167  0442 b605          	ld	a,L5422_col_nr
4168  0444 a107          	cp	a,#7
4169  0446 2408          	jruge	L7032
4172  0448 a606          	ld	a,#6
4173  044a b005          	sub	a,L5422_col_nr
4174  044c b704          	ld	L3522_max_bit,a
4176  044e 2004          	jra	L1132
4177  0450               L7032:
4178                     ; 377     else            max_bit = 7;
4180  0450 35070004      	mov	L3522_max_bit,#7
4181  0454               L1132:
4182                     ; 378     max_bit = (1<<max_bit);
4184  0454 b604          	ld	a,L3522_max_bit
4185  0456 5f            	clrw	x
4186  0457 97            	ld	xl,a
4187  0458 a601          	ld	a,#1
4188  045a 5d            	tnzw	x
4189  045b 2704          	jreq	L46
4190  045d               L66:
4191  045d 48            	sll	a
4192  045e 5a            	decw	x
4193  045f 26fc          	jrne	L66
4194  0461               L46:
4195  0461 b704          	ld	L3522_max_bit,a
4196                     ; 379     for (i = 0; i < 8; i++)
4198  0463 3f03          	clr	L7422_i
4199  0465               L3132:
4200                     ; 381         if (reeds & (1<<i)) reed_relays[i] |=  max_bit;
4202  0465 7b03          	ld	a,(OFST+0,sp)
4203  0467 5f            	clrw	x
4204  0468 97            	ld	xl,a
4205  0469 1f01          	ldw	(OFST-2,sp),x
4207  046b ae0001        	ldw	x,#1
4208  046e b603          	ld	a,L7422_i
4209  0470 4d            	tnz	a
4210  0471 2704          	jreq	L07
4211  0473               L27:
4212  0473 58            	sllw	x
4213  0474 4a            	dec	a
4214  0475 26fc          	jrne	L27
4215  0477               L07:
4216  0477 01            	rrwa	x,a
4217  0478 1402          	and	a,(OFST-1,sp)
4218  047a 01            	rrwa	x,a
4219  047b 1401          	and	a,(OFST-2,sp)
4220  047d 01            	rrwa	x,a
4221  047e a30000        	cpw	x,#0
4222  0481 270c          	jreq	L1232
4225  0483 b603          	ld	a,L7422_i
4226  0485 5f            	clrw	x
4227  0486 97            	ld	xl,a
4228  0487 e610          	ld	a,(_reed_relays,x)
4229  0489 ba04          	or	a,L3522_max_bit
4230  048b e710          	ld	(_reed_relays,x),a
4232  048d 200b          	jra	L3232
4233  048f               L1232:
4234                     ; 382         else                reed_relays[i] &= ~max_bit;
4236  048f b603          	ld	a,L7422_i
4237  0491 5f            	clrw	x
4238  0492 97            	ld	xl,a
4239  0493 b604          	ld	a,L3522_max_bit
4240  0495 43            	cpl	a
4241  0496 e410          	and	a,(_reed_relays,x)
4242  0498 e710          	ld	(_reed_relays,x),a
4243  049a               L3232:
4244                     ; 379     for (i = 0; i < 8; i++)
4246  049a 3c03          	inc	L7422_i
4249  049c b603          	ld	a,L7422_i
4250  049e a108          	cp	a,#8
4251  04a0 25c3          	jrult	L3132
4252                     ; 384     max7219_write((MAX7219_REG_DIG0 + (col_nr << 8)) | reed_relays[col_nr]);
4254  04a2 b605          	ld	a,L5422_col_nr
4255  04a4 5f            	clrw	x
4256  04a5 97            	ld	xl,a
4257  04a6 e610          	ld	a,(_reed_relays,x)
4258  04a8 6b02          	ld	(OFST-1,sp),a
4260  04aa b605          	ld	a,L5422_col_nr
4261  04ac 5f            	clrw	x
4262  04ad 97            	ld	xl,a
4263  04ae 4f            	clr	a
4264  04af 02            	rlwa	x,a
4265  04b0 1c0100        	addw	x,#256
4266  04b3 01            	rrwa	x,a
4267  04b4 1a02          	or	a,(OFST-1,sp)
4268  04b6 02            	rlwa	x,a
4269  04b7 cd0000        	call	_max7219_write
4271                     ; 385     if (++col_nr > 7) col_nr = 0;    // start again
4273  04ba 3c05          	inc	L5422_col_nr
4274  04bc b605          	ld	a,L5422_col_nr
4275  04be a108          	cp	a,#8
4276  04c0 2502          	jrult	L5232
4279  04c2 3f05          	clr	L5422_col_nr
4280  04c4               L5232:
4281                     ; 386 	mcp23017_write(GPIOB,1<<col_nr); // Scan next reed-relay column
4283  04c4 b605          	ld	a,L5422_col_nr
4284  04c6 5f            	clrw	x
4285  04c7 97            	ld	xl,a
4286  04c8 a601          	ld	a,#1
4287  04ca 5d            	tnzw	x
4288  04cb 2704          	jreq	L47
4289  04cd               L67:
4290  04cd 48            	sll	a
4291  04ce 5a            	decw	x
4292  04cf 26fc          	jrne	L67
4293  04d1               L47:
4294  04d1 ae1300        	ldw	x,#4864
4295  04d4 97            	ld	xl,a
4296  04d5 cd0000        	call	_mcp23017_write
4298                     ; 387 } // scan_task()
4301  04d8 5b03          	addw	sp,#3
4302  04da 81            	ret
4375                     ; 395 void adc_task(void)
4375                     ; 396 {
4376                     	switch	.text
4377  04db               _adc_task:
4379  04db 5224          	subw	sp,#36
4380       00000024      OFST:	set	36
4383                     ; 400     uart_write('.');
4385  04dd a62e          	ld	a,#46
4386  04df cd0000        	call	_uart_write
4388                     ; 401     tm1637_enable_clock_nr(CLOCK1);
4390  04e2 4f            	clr	a
4391  04e3 cd0000        	call	_tm1637_enable_clock_nr
4393                     ; 402     update_clock(&clk1);
4395  04e6 ae000b        	ldw	x,#_clk1
4396  04e9 cd0191        	call	_update_clock
4398                     ; 403     tm1637_set_brightness(7,true);
4400  04ec ae0701        	ldw	x,#1793
4401  04ef cd0000        	call	_tm1637_set_brightness
4403                     ; 404     tm1637_show_nr_dec_ex(clk1.digits, clk1.blink?0x40:0x00, true, 4, 0);
4405  04f2 4b00          	push	#0
4406  04f4 4b04          	push	#4
4407  04f6 4b01          	push	#1
4408  04f8 b60d          	ld	a,_clk1+2
4409  04fa a504          	bcp	a,#4
4410  04fc 2704          	jreq	L201
4411  04fe a640          	ld	a,#64
4412  0500 2001          	jra	L401
4413  0502               L201:
4414  0502 4f            	clr	a
4415  0503               L401:
4416  0503 88            	push	a
4417  0504 be0e          	ldw	x,_clk1+3
4418  0506 cd0000        	call	_tm1637_show_nr_dec_ex
4420  0509 5b04          	addw	sp,#4
4421                     ; 406     sprintf(s,"CLK ",h);
4423  050b 1e05          	ldw	x,(OFST-31,sp)
4424  050d 89            	pushw	x
4425  050e ae026c        	ldw	x,#L1632
4426  0511 89            	pushw	x
4427  0512 96            	ldw	x,sp
4428  0513 1c000b        	addw	x,#OFST-25
4429  0516 cd0000        	call	_sprintf
4431  0519 5b04          	addw	sp,#4
4432                     ; 407     lcd_i2c_setCursor(0,2);
4434  051b ae0002        	ldw	x,#2
4435  051e cd0000        	call	_lcd_i2c_setCursor
4437                     ; 408     lcd_i2c_print(s);
4439  0521 96            	ldw	x,sp
4440  0522 1c0007        	addw	x,#OFST-29
4441  0525 cd0000        	call	_lcd_i2c_print
4443                     ; 409     h = clk1.min / 60;
4445  0528 b60b          	ld	a,_clk1
4446  052a 5f            	clrw	x
4447  052b 97            	ld	xl,a
4448  052c a63c          	ld	a,#60
4449  052e cd0000        	call	c_sdivx
4451  0531 1f05          	ldw	(OFST-31,sp),x
4453                     ; 410     m = clk1.min - 60*h;
4455  0533 1e05          	ldw	x,(OFST-31,sp)
4456  0535 90ae003c      	ldw	y,#60
4457  0539 cd0000        	call	c_imul
4459  053c 1f01          	ldw	(OFST-35,sp),x
4461  053e b60b          	ld	a,_clk1
4462  0540 5f            	clrw	x
4463  0541 97            	ld	xl,a
4464  0542 72f001        	subw	x,(OFST-35,sp)
4465  0545 1f03          	ldw	(OFST-33,sp),x
4467                     ; 411     sprintf(s,"%d:%02d:%02d ",h,m,(uint16_t)clk1.sec);
4469  0547 b60c          	ld	a,_clk1+1
4470  0549 5f            	clrw	x
4471  054a 97            	ld	xl,a
4472  054b 89            	pushw	x
4473  054c 1e05          	ldw	x,(OFST-31,sp)
4474  054e 89            	pushw	x
4475  054f 1e09          	ldw	x,(OFST-27,sp)
4476  0551 89            	pushw	x
4477  0552 ae025e        	ldw	x,#L3632
4478  0555 89            	pushw	x
4479  0556 96            	ldw	x,sp
4480  0557 1c000f        	addw	x,#OFST-21
4481  055a cd0000        	call	_sprintf
4483  055d 5b08          	addw	sp,#8
4484                     ; 412     lcd_i2c_setCursor(4,2);
4486  055f ae0402        	ldw	x,#1026
4487  0562 cd0000        	call	_lcd_i2c_setCursor
4489                     ; 413     lcd_i2c_print(s);
4491  0565 96            	ldw	x,sp
4492  0566 1c0007        	addw	x,#OFST-29
4493  0569 cd0000        	call	_lcd_i2c_print
4495                     ; 415     h = clk2.min / 60;
4497  056c b606          	ld	a,_clk2
4498  056e 5f            	clrw	x
4499  056f 97            	ld	xl,a
4500  0570 a63c          	ld	a,#60
4501  0572 cd0000        	call	c_sdivx
4503  0575 1f05          	ldw	(OFST-31,sp),x
4505                     ; 416     m = clk2.min - 60*h;
4507  0577 1e05          	ldw	x,(OFST-31,sp)
4508  0579 90ae003c      	ldw	y,#60
4509  057d cd0000        	call	c_imul
4511  0580 1f01          	ldw	(OFST-35,sp),x
4513  0582 b606          	ld	a,_clk2
4514  0584 5f            	clrw	x
4515  0585 97            	ld	xl,a
4516  0586 72f001        	subw	x,(OFST-35,sp)
4517  0589 1f03          	ldw	(OFST-33,sp),x
4519                     ; 417     sprintf(s,"%d:%02d:%02d",h,m,(uint16_t)clk2.sec);
4521  058b b607          	ld	a,_clk2+1
4522  058d 5f            	clrw	x
4523  058e 97            	ld	xl,a
4524  058f 89            	pushw	x
4525  0590 1e05          	ldw	x,(OFST-31,sp)
4526  0592 89            	pushw	x
4527  0593 1e09          	ldw	x,(OFST-27,sp)
4528  0595 89            	pushw	x
4529  0596 ae0251        	ldw	x,#L5632
4530  0599 89            	pushw	x
4531  059a 96            	ldw	x,sp
4532  059b 1c000f        	addw	x,#OFST-21
4533  059e cd0000        	call	_sprintf
4535  05a1 5b08          	addw	sp,#8
4536                     ; 418     lcd_i2c_setCursor(12,2);
4538  05a3 ae0c02        	ldw	x,#3074
4539  05a6 cd0000        	call	_lcd_i2c_setCursor
4541                     ; 419     lcd_i2c_print(s);
4543  05a9 96            	ldw	x,sp
4544  05aa 1c0007        	addw	x,#OFST-29
4545  05ad cd0000        	call	_lcd_i2c_print
4547                     ; 421     tm1637_enable_clock_nr(CLOCK2);
4549  05b0 a601          	ld	a,#1
4550  05b2 cd0000        	call	_tm1637_enable_clock_nr
4552                     ; 422     update_clock(&clk2);
4554  05b5 ae0006        	ldw	x,#_clk2
4555  05b8 cd0191        	call	_update_clock
4557                     ; 423     tm1637_set_brightness(7,true);
4559  05bb ae0701        	ldw	x,#1793
4560  05be cd0000        	call	_tm1637_set_brightness
4562                     ; 424     tm1637_show_nr_dec_ex(clk2.digits, clk2.blink?0x40:0x00, true, 4, 0);
4564  05c1 4b00          	push	#0
4565  05c3 4b04          	push	#4
4566  05c5 4b01          	push	#1
4567  05c7 b608          	ld	a,_clk2+2
4568  05c9 a504          	bcp	a,#4
4569  05cb 2704          	jreq	L601
4570  05cd a640          	ld	a,#64
4571  05cf 2001          	jra	L011
4572  05d1               L601:
4573  05d1 4f            	clr	a
4574  05d2               L011:
4575  05d2 88            	push	a
4576  05d3 be09          	ldw	x,_clk2+3
4577  05d5 cd0000        	call	_tm1637_show_nr_dec_ex
4579  05d8 5b04          	addw	sp,#4
4580                     ; 426     tmr1 = get_timer1_value();
4582  05da cd003f        	call	_get_timer1_value
4584  05dd 1f03          	ldw	(OFST-33,sp),x
4586                     ; 427     sprintf(s,"Timer1:%04d",tmr1);
4588  05df 1e03          	ldw	x,(OFST-33,sp)
4589  05e1 89            	pushw	x
4590  05e2 ae0245        	ldw	x,#L7632
4591  05e5 89            	pushw	x
4592  05e6 96            	ldw	x,sp
4593  05e7 1c000b        	addw	x,#OFST-25
4594  05ea cd0000        	call	_sprintf
4596  05ed 5b04          	addw	sp,#4
4597                     ; 428     lcd_i2c_setCursor(0,3);
4599  05ef ae0003        	ldw	x,#3
4600  05f2 cd0000        	call	_lcd_i2c_setCursor
4602                     ; 429     lcd_i2c_print(s);
4604  05f5 96            	ldw	x,sp
4605  05f6 1c0007        	addw	x,#OFST-29
4606  05f9 cd0000        	call	_lcd_i2c_print
4608                     ; 430 } // adc_task()
4611  05fc 5b24          	addw	sp,#36
4612  05fe 81            	ret
4615                     	switch	.const
4616  01e9               L1732_s:
4617  01e9 436865737320  	dc.b	"Chess stm8s105 v0."
4618  01fb 3100          	dc.b	"1",0
4658                     ; 432 void print_version_number(void)
4658                     ; 433 {
4659                     	switch	.text
4660  05ff               _print_version_number:
4662  05ff 5214          	subw	sp,#20
4663       00000014      OFST:	set	20
4666                     ; 434     const char s[] = "Chess stm8s105 v0.1";
4668  0601 96            	ldw	x,sp
4669  0602 1c0001        	addw	x,#OFST-19
4670  0605 90ae01e9      	ldw	y,#L1732_s
4671  0609 a614          	ld	a,#20
4672  060b cd0000        	call	c_xymvx
4674                     ; 435     xputs(s);
4676  060e 96            	ldw	x,sp
4677  060f 1c0001        	addw	x,#OFST-19
4678  0612 cd0000        	call	_xputs
4680                     ; 436     uart_write('\n');
4682  0615 a60a          	ld	a,#10
4683  0617 cd0000        	call	_uart_write
4685                     ; 437     lcd_i2c_clear();
4687  061a cd0000        	call	_lcd_i2c_clear
4689                     ; 438     lcd_i2c_setCursor(0,0);
4691  061d 5f            	clrw	x
4692  061e cd0000        	call	_lcd_i2c_setCursor
4694                     ; 439     lcd_i2c_backlight_on();
4696  0621 cd0000        	call	_lcd_i2c_backlight_on
4698                     ; 440     lcd_i2c_print(s);
4700  0624 96            	ldw	x,sp
4701  0625 1c0001        	addw	x,#OFST-19
4702  0628 cd0000        	call	_lcd_i2c_print
4704                     ; 441 } // print_version_number()
4707  062b 5b14          	addw	sp,#20
4708  062d 81            	ret
4791                     ; 450 int main(void)
4791                     ; 451 {
4792                     	switch	.text
4793  062e               _main:
4795  062e 5221          	subw	sp,#33
4796       00000021      OFST:	set	33
4799                     ; 453     int     ee = eedata[0]; // This is to prevent the linker from removing .eeprom section
4801  0630 ce0000        	ldw	x,_eedata
4802  0633 1f01          	ldw	(OFST-32,sp),x
4804                     ; 454     uint8_t ok, buf[5], bb = false;
4806  0635 0f03          	clr	(OFST-30,sp)
4808                     ; 456     disable_interrupts();
4811  0637 9b            sim
4813                     ; 457     initialise_system_clock(); // Set system-clock to 16 MHz
4816  0638 cd0058        	call	_initialise_system_clock
4818                     ; 458     uart_init();               // UART init. to 115200,8,N,1
4820  063b cd0000        	call	_uart_init
4822                     ; 459     setup_gpio_ports();        // Init. needed output-ports for LED and keys
4824  063e cd00d8        	call	_setup_gpio_ports
4826                     ; 460     i2c_init(bb);              // Init. I2C bus
4828  0641 0d03          	tnz	(OFST-30,sp)
4829  0643 2704          	jreq	L611
4830  0645 a601          	ld	a,#1
4831  0647 2001          	jra	L021
4832  0649               L611:
4833  0649 4f            	clr	a
4834  064a               L021:
4835  064a cd0000        	call	_i2c_init
4837                     ; 461     setup_timers();            // Set Timer 2 to 1 kHz and Timer 1 for a Rotary Encoder
4839  064d cd008f        	call	_setup_timers
4841                     ; 464     scheduler_init();                        // clear task_list struct
4843  0650 cd0000        	call	_scheduler_init
4845                     ; 465     add_task(adc_task    ,"Sec1",  0, 1000); // every second
4847  0653 ae03e8        	ldw	x,#1000
4848  0656 89            	pushw	x
4849  0657 5f            	clrw	x
4850  0658 89            	pushw	x
4851  0659 ae0240        	ldw	x,#L5442
4852  065c 89            	pushw	x
4853  065d ae04db        	ldw	x,#_adc_task
4854  0660 cd0000        	call	_add_task
4856  0663 5b06          	addw	sp,#6
4857                     ; 466     add_task(scan_task   ,"Scan",  0,   25); // every 25 msec.
4859  0665 ae0019        	ldw	x,#25
4860  0668 89            	pushw	x
4861  0669 5f            	clrw	x
4862  066a 89            	pushw	x
4863  066b ae023b        	ldw	x,#L7442
4864  066e 89            	pushw	x
4865  066f ae0439        	ldw	x,#_scan_task
4866  0672 cd0000        	call	_add_task
4868  0675 5b06          	addw	sp,#6
4869                     ; 467     add_task(menu_handler,"Menu",250,  500); // every 500 msec.
4871  0677 ae01f4        	ldw	x,#500
4872  067a 89            	pushw	x
4873  067b ae00fa        	ldw	x,#250
4874  067e 89            	pushw	x
4875  067f ae0236        	ldw	x,#L1542
4876  0682 89            	pushw	x
4877  0683 ae02ad        	ldw	x,#_menu_handler
4878  0686 cd0000        	call	_add_task
4880  0689 5b06          	addw	sp,#6
4881                     ; 468     enable_interrupts();
4884  068b 9a            rim
4886                     ; 469     lcd_i2c_init(0x48,20,4,LCD_5x8DOTS); // Needs working interrupts!
4889  068c 4b00          	push	#0
4890  068e 4b04          	push	#4
4891  0690 ae4814        	ldw	x,#18452
4892  0693 cd0000        	call	_lcd_i2c_init
4894  0696 85            	popw	x
4895                     ; 470     print_version_number();
4897  0697 cd05ff        	call	_print_version_number
4899                     ; 471     if (mcp23017_init())       
4901  069a cd0000        	call	_mcp23017_init
4903  069d 4d            	tnz	a
4904  069e 2706          	jreq	L3542
4905                     ; 473 		xputs("mcp23017_init() error\n");
4907  06a0 ae021f        	ldw	x,#L5542
4908  06a3 cd0000        	call	_xputs
4910  06a6               L3542:
4911                     ; 476     max7219_init(); // Init. driver IC for LEDs on chess-board
4913  06a6 cd0000        	call	_max7219_init
4915                     ; 477     max7219_write(MAX7219_REG_TEST  | 0x01); // Test mode: all leds on
4917  06a9 ae0f01        	ldw	x,#3841
4918  06ac cd0000        	call	_max7219_write
4920                     ; 478     delay_msec(1000);
4922  06af ae03e8        	ldw	x,#1000
4923  06b2 cd0000        	call	_delay_msec
4925                     ; 479     max7219_write(MAX7219_REG_TEST  | 0x00); // Test mode off
4927  06b5 ae0f00        	ldw	x,#3840
4928  06b8 cd0000        	call	_max7219_write
4930                     ; 481     clk1.min    = clk2.min    = 40;
4932  06bb 35280006      	mov	_clk2,#40
4933  06bf 45060b        	mov	_clk1,_clk2
4934                     ; 482     clk1.sec    = clk2.sec    =  0;
4936  06c2 3f07          	clr	_clk2+1
4937  06c4 3f0c          	clr	_clk1+1
4938                     ; 483     clk1.active = clk2.active = false;
4940  06c6 72110008      	bres	_clk2+2,#0
4941  06ca 7211000d      	bres	_clk1+2,#0
4942  06ce               L7542:
4943                     ; 487         dispatch_tasks();                // Run task-scheduler()
4945  06ce cd0000        	call	_dispatch_tasks
4947                     ; 488 		switch (rs232_command_handler()) // run command handler continuously
4949  06d1 cd0000        	call	_rs232_command_handler
4952                     ; 494 			default     : break;
4953  06d4 4a            	dec	a
4954  06d5 2705          	jreq	L1142
4955  06d7 4a            	dec	a
4956  06d8 270a          	jreq	L3142
4957  06da 201e          	jra	L5642
4958  06dc               L1142:
4959                     ; 490 			case ERR_CMD: xputs("Command Error\n"); break;
4961  06dc ae0210        	ldw	x,#L7642
4962  06df cd0000        	call	_xputs
4966  06e2 2016          	jra	L5642
4967  06e4               L3142:
4968                     ; 491 			case ERR_NUM: sprintf(s,"Number Error (%s)\n",rs232_inbuf);
4970  06e4 4b00          	push	#_rs232_inbuf
4971  06e6 ae01fd        	ldw	x,#L1742
4972  06e9 89            	pushw	x
4973  06ea 96            	ldw	x,sp
4974  06eb 1c0007        	addw	x,#OFST-26
4975  06ee cd0000        	call	_sprintf
4977  06f1 5b03          	addw	sp,#3
4978                     ; 492 						  xputs(s);  
4980  06f3 96            	ldw	x,sp
4981  06f4 1c0004        	addw	x,#OFST-29
4982  06f7 cd0000        	call	_xputs
4984                     ; 493 						  break;
4986  06fa               L5142:
4987                     ; 494 			default     : break;
4989  06fa               L5642:
4990                     ; 496         wait_for_interrupt(); // do nothing
4993  06fa 8f            wfi
4997  06fb 20d1          	jra	L7542
5160                     	xdef	_main
5161                     	xdef	_adc_task
5162                     	xdef	_scan_task
5163                     	xdef	_menu_handler
5164                     	xdef	_update_clock_settings
5165                     	xdef	_update_clock
5166                     	xdef	_setup_timers
5167                     	xdef	_get_timer1_value
5168                     	xdef	_PORTA_IRQHandler
5169                     	xdef	_TIM2_UPD_OVF_IRQHandler
5170                     	xdef	_clocks
5171                     	xdef	_menu
5172                     	xdef	_clear_lcd
5173                     	xdef	_bonus
5174                     	xdef	_times2
5175                     	xdef	_times1
5176                     	xdef	_game_mode
5177                     	switch	.ubsct
5178  0005               _clk_mode:
5179  0005 00            	ds.b	1
5180                     	xdef	_clk_mode
5181                     	xdef	_clk_idx
5182                     	xdef	_this_side_white
5183                     	xdef	_rotenc_sw
5184  0006               _clk2:
5185  0006 0000000000    	ds.b	5
5186                     	xdef	_clk2
5187  000b               _clk1:
5188  000b 0000000000    	ds.b	5
5189                     	xdef	_clk1
5190  0010               _reed_relays:
5191  0010 000000000000  	ds.b	8
5192                     	xdef	_reed_relays
5193                     	xdef	_col_nr
5194                     	xref.b	_rs232_inbuf
5195                     	xref.b	_t2_millis
5196                     	xref	_eedata
5197                     	xref	_delay_msec
5198                     	xref	_lcd_i2c_print
5199                     	xref	_lcd_i2c_backlight_on
5200                     	xref	_lcd_i2c_setCursor
5201                     	xref	_lcd_i2c_clear
5202                     	xref	_lcd_i2c_init
5203                     	xref	_tm1637_show_nr_dec_ex
5204                     	xref	_tm1637_set_brightness
5205                     	xref	_tm1637_enable_clock_nr
5206                     	xref	_rs232_command_handler
5207                     	xref	_xputs
5208                     	xref	_uart_write
5209                     	xref	_uart_init
5210                     	xref	_max7219_write
5211                     	xref	_max7219_init
5212                     	xref	_mcp23017_write
5213                     	xref	_mcp23017_read
5214                     	xref	_mcp23017_init
5215                     	xref	_i2c_init
5216                     	xref	_add_task
5217                     	xref	_dispatch_tasks
5218                     	xref	_scheduler_isr
5219                     	xref	_scheduler_init
5220                     	xdef	_print_version_number
5221                     	xdef	_setup_gpio_ports
5222                     	xdef	_initialise_system_clock
5223                     	xref	_sprintf
5224                     	switch	.const
5225  01fd               L1742:
5226  01fd 4e756d626572  	dc.b	"Number Error (%s)",10,0
5227  0210               L7642:
5228  0210 436f6d6d616e  	dc.b	"Command Error",10,0
5229  021f               L5542:
5230  021f 6d6370323330  	dc.b	"mcp23017_init() er"
5231  0231 726f720a00    	dc.b	"ror",10,0
5232  0236               L1542:
5233  0236 4d656e7500    	dc.b	"Menu",0
5234  023b               L7442:
5235  023b 5363616e00    	dc.b	"Scan",0
5236  0240               L5442:
5237  0240 5365633100    	dc.b	"Sec1",0
5238  0245               L7632:
5239  0245 54696d657231  	dc.b	"Timer1:%04d",0
5240  0251               L5632:
5241  0251 25643a253032  	dc.b	"%d:%02d:%02d",0
5242  025e               L3632:
5243  025e 25643a253032  	dc.b	"%d:%02d:%02d ",0
5244  026c               L1632:
5245  026c 434c4b2000    	dc.b	"CLK ",0
5246  0271               L3422:
5247  0271 426c61636b00  	dc.b	"Black",0
5248  0277               L7322:
5249  0277 576869746500  	dc.b	"White",0
5250  027d               L5222:
5251  027d 546869732073  	dc.b	"This side: ",0
5252  0289               L7712:
5253  0289 4e6577206761  	dc.b	"New game Selected",0
5254                     	xref.b	c_x
5255                     	xref.b	c_y
5275                     	xref	c_xymvx
5276                     	xref	c_sdivx
5277                     	xref	c_imul
5278                     	xref	c_lgadc
5279                     	end
