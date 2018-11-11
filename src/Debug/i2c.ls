   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
2562                     ; 32 void i2c_delay(void)
2562                     ; 33 {   
2564                     	switch	.text
2565  0000               _i2c_delay:
2567  0000 88            	push	a
2568       00000001      OFST:	set	1
2571                     ; 36     for (i = 0; i < 100; i++);
2573  0001 0f01          	clr	(OFST+0,sp)
2575  0003               L7461:
2579  0003 0c01          	inc	(OFST+0,sp)
2583  0005 7b01          	ld	a,(OFST+0,sp)
2584  0007 a164          	cp	a,#100
2585  0009 25f8          	jrult	L7461
2586                     ; 38 } // i2c_delay()
2589  000b 84            	pop	a
2590  000c 81            	ret
2646                     ; 40 uint8_t i2c_write_bb(uint8_t data)
2646                     ; 41 {
2647                     	switch	.text
2648  000d               _i2c_write_bb:
2650  000d 88            	push	a
2651  000e 89            	pushw	x
2652       00000002      OFST:	set	2
2655                     ; 42     uint8_t i   = 0x80;
2657  000f a680          	ld	a,#128
2658  0011 6b02          	ld	(OFST+0,sp),a
2660                     ; 43     uint8_t ack = I2C_ACK;
2662  0013 0f01          	clr	(OFST-1,sp)
2664                     ; 45     SCL0; // clock low
2666  0015 72135014      	bres	_PE_ODR,#1
2669  0019 ae0005        	ldw	x,#5
2670  001c cd0000        	call	_delay_usec
2674  001f 2026          	jra	L5071
2675  0021               L3071:
2676                     ; 48         if (data & i) SDA1;
2678  0021 7b03          	ld	a,(OFST+1,sp)
2679  0023 1502          	bcp	a,(OFST+0,sp)
2680  0025 2706          	jreq	L1171
2683  0027 72145014      	bset	_PE_ODR,#2
2685  002b 2004          	jra	L3171
2686  002d               L1171:
2687                     ; 49         else          SDA0;
2689  002d 72155014      	bres	_PE_ODR,#2
2690  0031               L3171:
2691                     ; 50         SCL1;
2693  0031 72125014      	bset	_PE_ODR,#1
2696  0035 ae0005        	ldw	x,#5
2697  0038 cd0000        	call	_delay_usec
2699                     ; 51         SCL0;
2702  003b 72135014      	bres	_PE_ODR,#1
2705  003f ae0005        	ldw	x,#5
2706  0042 cd0000        	call	_delay_usec
2708                     ; 52         i >>= 1;
2711  0045 0402          	srl	(OFST+0,sp)
2713  0047               L5071:
2714                     ; 46     while (i > 0)
2716  0047 0d02          	tnz	(OFST+0,sp)
2717  0049 26d6          	jrne	L3071
2718                     ; 54     SDA_in; // set as input
2720  004b 72155016      	bres	_PE_DDR,#2
2721                     ; 55     delay_usec(5);
2723  004f ae0005        	ldw	x,#5
2724  0052 cd0000        	call	_delay_usec
2726                     ; 56     SCL1;
2728  0055 72125014      	bset	_PE_ODR,#1
2731  0059 ae0005        	ldw	x,#5
2732  005c cd0000        	call	_delay_usec
2734                     ; 57     if (PE_IDR & I2C_SDA)
2737  005f c65015        	ld	a,_PE_IDR
2738  0062 a504          	bcp	a,#4
2739  0064 2704          	jreq	L5171
2740                     ; 58          ack = I2C_NACK; // nack (1) 
2742  0066 a601          	ld	a,#1
2743  0068 6b01          	ld	(OFST-1,sp),a
2745  006a               L5171:
2746                     ; 59     SCL0;
2748  006a 72135014      	bres	_PE_ODR,#1
2751  006e ae0005        	ldw	x,#5
2752  0071 cd0000        	call	_delay_usec
2754                     ; 60     SDA_out; // set to output again
2757  0074 72145016      	bset	_PE_DDR,#2
2758                     ; 61     SDA0;
2760  0078 72155014      	bres	_PE_ODR,#2
2761                     ; 62     return ack;
2763  007c 7b01          	ld	a,(OFST-1,sp)
2766  007e 5b03          	addw	sp,#3
2767  0080 81            	ret
2823                     ; 65 uint8_t i2c_read_bb(uint8_t ack)
2823                     ; 66 {
2824                     	switch	.text
2825  0081               _i2c_read_bb:
2827  0081 88            	push	a
2828  0082 89            	pushw	x
2829       00000002      OFST:	set	2
2832                     ; 67     uint8_t result = 0;
2834  0083 0f02          	clr	(OFST+0,sp)
2836                     ; 68     uint8_t i      = 0x80;
2838  0085 a680          	ld	a,#128
2839  0087 6b01          	ld	(OFST-1,sp),a
2841                     ; 70     SCL0; // clock low
2843  0089 72135014      	bres	_PE_ODR,#1
2846  008d ae0005        	ldw	x,#5
2847  0090 cd0000        	call	_delay_usec
2849                     ; 71     SDA_in; // set as input
2852  0093 72155016      	bres	_PE_DDR,#2
2854  0097 2025          	jra	L7471
2855  0099               L5471:
2856                     ; 74         result <<= 1; // make room for new bit
2858  0099 0802          	sll	(OFST+0,sp)
2860                     ; 75         SCL1;
2862  009b 72125014      	bset	_PE_ODR,#1
2865  009f ae0005        	ldw	x,#5
2866  00a2 cd0000        	call	_delay_usec
2868                     ; 76         if (PE_IDR & I2C_SDA)
2871  00a5 c65015        	ld	a,_PE_IDR
2872  00a8 a504          	bcp	a,#4
2873  00aa 2706          	jreq	L3571
2874                     ; 77              result |=  0x01;
2876  00ac 7b02          	ld	a,(OFST+0,sp)
2877  00ae aa01          	or	a,#1
2878  00b0 6b02          	ld	(OFST+0,sp),a
2880  00b2               L3571:
2881                     ; 78         SCL0;
2883  00b2 72135014      	bres	_PE_ODR,#1
2886  00b6 ae0005        	ldw	x,#5
2887  00b9 cd0000        	call	_delay_usec
2889                     ; 79         i >>= 1;
2892  00bc 0401          	srl	(OFST-1,sp)
2894  00be               L7471:
2895                     ; 72     while (i > 0)
2897  00be 0d01          	tnz	(OFST-1,sp)
2898  00c0 26d7          	jrne	L5471
2899                     ; 81     SDA_out; // set to output again
2901  00c2 72145016      	bset	_PE_DDR,#2
2902                     ; 82     if (ack == I2C_ACK) 
2904  00c6 0d03          	tnz	(OFST+1,sp)
2905  00c8 2606          	jrne	L5571
2906                     ; 83          SDA0; // output ACK
2908  00ca 72155014      	bres	_PE_ODR,#2
2910  00ce 2004          	jra	L7571
2911  00d0               L5571:
2912                     ; 84     else SDA1; // output NACK
2914  00d0 72145014      	bset	_PE_ODR,#2
2915  00d4               L7571:
2916                     ; 85     SCL1;
2918  00d4 72125014      	bset	_PE_ODR,#1
2921  00d8 ae0005        	ldw	x,#5
2922  00db cd0000        	call	_delay_usec
2924                     ; 86     SCL0;
2927  00de 72135014      	bres	_PE_ODR,#1
2930  00e2 ae0005        	ldw	x,#5
2931  00e5 cd0000        	call	_delay_usec
2933                     ; 87     SDA0;
2936  00e8 72155014      	bres	_PE_ODR,#2
2937                     ; 88     return result;
2939  00ec 7b02          	ld	a,(OFST+0,sp)
2942  00ee 5b03          	addw	sp,#3
2943  00f0 81            	ret
2980                     ; 91 uint8_t i2c_start_bb(uint8_t address)
2980                     ; 92 {   // Pre-condition : SDA = 1
2981                     	switch	.text
2982  00f1               _i2c_start_bb:
2984  00f1 88            	push	a
2985       00000000      OFST:	set	0
2988                     ; 94     SCL1; 
2990  00f2 72125014      	bset	_PE_ODR,#1
2993  00f6 ae0005        	ldw	x,#5
2994  00f9 cd0000        	call	_delay_usec
2996                     ; 95     SDA0;
2999  00fc 72155014      	bres	_PE_ODR,#2
3000                     ; 96     delay_usec(5);
3002  0100 ae0005        	ldw	x,#5
3003  0103 cd0000        	call	_delay_usec
3005                     ; 97     SCL0;
3007  0106 72135014      	bres	_PE_ODR,#1
3010  010a ae0005        	ldw	x,#5
3011  010d cd0000        	call	_delay_usec
3013                     ; 98     return i2c_write_bb(address);
3016  0110 7b01          	ld	a,(OFST+1,sp)
3017  0112 cd000d        	call	_i2c_write_bb
3021  0115 5b01          	addw	sp,#1
3022  0117 81            	ret
3059                     ; 101 uint8_t i2c_rep_start_bb(uint8_t address)
3059                     ; 102 {   
3060                     	switch	.text
3061  0118               _i2c_rep_start_bb:
3063  0118 88            	push	a
3064       00000000      OFST:	set	0
3067                     ; 103     SDA1;
3069  0119 72145014      	bset	_PE_ODR,#2
3070                     ; 104     delay_usec(5);
3072  011d ae0005        	ldw	x,#5
3073  0120 cd0000        	call	_delay_usec
3075                     ; 105     return i2c_start_bb(address);
3077  0123 7b01          	ld	a,(OFST+1,sp)
3078  0125 adca          	call	_i2c_start_bb
3082  0127 5b01          	addw	sp,#1
3083  0129 81            	ret
3108                     ; 108 void i2c_stop_bb(void)
3108                     ; 109 {   // Pre-condition : SDA = 0
3109                     	switch	.text
3110  012a               _i2c_stop_bb:
3114                     ; 110     SCL1;
3116  012a 72125014      	bset	_PE_ODR,#1
3119  012e ae0005        	ldw	x,#5
3120  0131 cd0000        	call	_delay_usec
3122                     ; 111     SDA1;
3125  0134 72145014      	bset	_PE_ODR,#2
3126                     ; 112     delay_usec(5);
3128  0138 ae0005        	ldw	x,#5
3129  013b cd0000        	call	_delay_usec
3131                     ; 113 } // i2c_stop_bb;
3134  013e 81            	ret
3157                     ; 116 @interrupt void I2C_IRQHandler(void)
3157                     ; 117 {
3158                     	switch	.text
3159  013f               _I2C_IRQHandler:
3163                     ; 118 } // I2C_IRQHandler()
3166  013f 80            	iret
3212                     ; 125 void i2c_init(bool bb)
3212                     ; 126 {
3213                     	switch	.text
3214  0140               _i2c_init:
3216  0140 88            	push	a
3217       00000000      OFST:	set	0
3220                     ; 127 	I2C_CR1    = 0;     // Disable I2C before configuration starts
3222  0141 725f5210      	clr	_I2C_CR1
3223                     ; 128     I2C_FREQR  = 16;    // Set the internal clock frequency to 16 MHz
3225  0145 35105212      	mov	_I2C_FREQR,#16
3226                     ; 129     I2C_CCRH   = 0x00;  // I2C running is standard mode.
3228  0149 725f521c      	clr	_I2C_CCRH
3229                     ; 130     I2C_CCRL   = 0x50;  // SCL clock speed is 100 kHz.
3231  014d 3550521b      	mov	_I2C_CCRL,#80
3232                     ; 131     I2C_OARH   = 0x40;  // 7 bit address mode.
3234  0151 35405214      	mov	_I2C_OARH,#64
3235                     ; 132     I2C_OARL   = 0x00;  // Clear the address registers
3237  0155 725f5213      	clr	_I2C_OARL
3238                     ; 133     I2C_TRISER = 17;    // Set SCL rise-time to 1000 nsec.
3240  0159 3511521d      	mov	_I2C_TRISER,#17
3241                     ; 134     I2C_ITR    = 0x00;  // Disable I2C interrupts
3243  015d 725f521a      	clr	_I2C_ITR
3244                     ; 135     if (bb)
3246  0161 7b01          	ld	a,(OFST+1,sp)
3247  0163 a501          	bcp	a,#1
3248  0165 2714          	jreq	L3502
3249                     ; 137         SDA_out;
3251  0167 72145016      	bset	_PE_DDR,#2
3252                     ; 138         SDA1; 
3254  016b 72145014      	bset	_PE_ODR,#2
3255                     ; 139         SCL1;
3257  016f 72125014      	bset	_PE_ODR,#1
3260  0173 ae0005        	ldw	x,#5
3261  0176 cd0000        	call	_delay_usec
3265  0179 2004          	jra	L5502
3266  017b               L3502:
3267                     ; 141     else I2C_CR1 = 1;     // Configuration complete so turn the peripheral on
3269  017b 35015210      	mov	_I2C_CR1,#1
3270  017f               L5502:
3271                     ; 142 } // i2c_init()
3274  017f 84            	pop	a
3275  0180 81            	ret
3332                     ; 150 uint8_t recv_ack_bit(void)
3332                     ; 151 {
3333                     	switch	.text
3334  0181               _recv_ack_bit:
3336  0181 5203          	subw	sp,#3
3337       00000003      OFST:	set	3
3340  0183               L5012:
3341                     ; 155 	ack  = (I2C_SR1 & I2C_SR1_ADDR);
3343  0183 c65217        	ld	a,_I2C_SR1
3344  0186 a402          	and	a,#2
3345  0188 6b03          	ld	(OFST+0,sp),a
3347                     ; 156 	nack = (I2C_SR2 & I2C_SR2_AF);
3349  018a c65218        	ld	a,_I2C_SR2
3350  018d a404          	and	a,#4
3351  018f 6b02          	ld	(OFST-1,sp),a
3353                     ; 157 	i2c_delay();
3355  0191 cd0000        	call	_i2c_delay
3357                     ; 158   } while (!ack && !nack);
3359  0194 0d03          	tnz	(OFST+0,sp)
3360  0196 2604          	jrne	L3112
3362  0198 0d02          	tnz	(OFST-1,sp)
3363  019a 27e7          	jreq	L5012
3364  019c               L3112:
3365                     ; 159   if (ack)
3367  019c 0d03          	tnz	(OFST+0,sp)
3368  019e 270d          	jreq	L5112
3369                     ; 161       reg = I2C_SR1; // Clear ADDR bit by reading I2C_SR1 and I2C_SR3
3371  01a0 c65217        	ld	a,_I2C_SR1
3372                     ; 162       reg = I2C_SR3;
3374  01a3 c65219        	ld	a,_I2C_SR3
3375                     ; 163       I2C_CR2 |= I2C_CR2_ACK; // Set ACK-bit for further I2C communications
3377  01a6 72145211      	bset	_I2C_CR2,#2
3378                     ; 164 	  return I2C_ACK;
3380  01aa 4f            	clr	a
3382  01ab 2006          	jra	L62
3383  01ad               L5112:
3384                     ; 168 	I2C_SR2 &= ~I2C_SR2_AF; // clear error bit
3386  01ad 72155218      	bres	_I2C_SR2,#2
3387                     ; 169 	return I2C_NACK;
3389  01b1 a601          	ld	a,#1
3391  01b3               L62:
3393  01b3 5b03          	addw	sp,#3
3394  01b5 81            	ret
3433                     ; 179 uint8_t i2c_start(uint8_t address)
3433                     ; 180 {
3434                     	switch	.text
3435  01b6               _i2c_start:
3437  01b6 88            	push	a
3438       00000000      OFST:	set	0
3441                     ; 183   I2C_CR2 |= I2C_CR2_START;    // Generate Start condition
3443  01b7 72105211      	bset	_I2C_CR2,#0
3445  01bb 2003          	jra	L1412
3446  01bd               L7312:
3447                     ; 184   while (!(I2C_SR1 & I2C_SR1_SB)) i2c_delay(); // Wait until Start is sent
3449  01bd cd0000        	call	_i2c_delay
3451  01c0               L1412:
3454  01c0 c65217        	ld	a,_I2C_SR1
3455  01c3 a501          	bcp	a,#1
3456  01c5 27f6          	jreq	L7312
3457                     ; 185   I2C_DR   = address; // Send the slave address and the R/W bit
3459  01c7 7b01          	ld	a,(OFST+1,sp)
3460  01c9 c75216        	ld	_I2C_DR,a
3461                     ; 186   return recv_ack_bit();
3463  01cc adb3          	call	_recv_ack_bit
3467  01ce 5b01          	addw	sp,#1
3468  01d0 81            	ret
3516                     ; 195 uint8_t i2c_rep_start(uint8_t address)
3516                     ; 196 {
3517                     	switch	.text
3518  01d1               _i2c_rep_start:
3520  01d1 88            	push	a
3521  01d2 88            	push	a
3522       00000001      OFST:	set	1
3525                     ; 199     I2C_CR2 |= I2C_CR2_START; // Generate Repeated Start condition
3527  01d3 72105211      	bset	_I2C_CR2,#0
3529  01d7 2003          	jra	L1712
3530  01d9               L7612:
3531                     ; 200     while (!(I2C_SR1 & I2C_SR1_SB)) i2c_delay(); // Wait until Start is sent
3533  01d9 cd0000        	call	_i2c_delay
3535  01dc               L1712:
3538  01dc c65217        	ld	a,_I2C_SR1
3539  01df a501          	bcp	a,#1
3540  01e1 27f6          	jreq	L7612
3541                     ; 201     I2C_DR = address;         // Send the slave address and the R/W bit
3543  01e3 7b02          	ld	a,(OFST+1,sp)
3544  01e5 c75216        	ld	_I2C_DR,a
3546  01e8 2003          	jra	L1022
3547  01ea               L5712:
3548                     ; 202     while (!(I2C_SR1 & I2C_SR1_ADDR)) i2c_delay();
3550  01ea cd0000        	call	_i2c_delay
3552  01ed               L1022:
3555  01ed c65217        	ld	a,_I2C_SR1
3556  01f0 a502          	bcp	a,#2
3557  01f2 27f6          	jreq	L5712
3558                     ; 203     reg = I2C_SR3; // clear ADDR bit
3560  01f4 c65219        	ld	a,_I2C_SR3
3561                     ; 204 } // i2c_rep_start()
3564  01f7 85            	popw	x
3565  01f8 81            	ret
3593                     ; 211 void i2c_stop(void)
3593                     ; 212 {
3594                     	switch	.text
3595  01f9               _i2c_stop:
3599                     ; 213     disable_interrupts();       // Errata workaround (Disable interrupt)
3602  01f9 9b            sim
3604                     ; 214     I2C_CR2 |= I2C_CR2_STOP;    // generate stop here (STOP=1)
3607  01fa 72125211      	bset	_I2C_CR2,#1
3608                     ; 215     enable_interrupts();		// Errata workaround (Enable interrupt)
3611  01fe 9a            rim
3615  01ff 2003          	jra	L7122
3616  0201               L5122:
3617                     ; 216     while((I2C_SR3 & I2C_SR3_MSL)) i2c_delay(); // wait until stop is performed
3619  0201 cd0000        	call	_i2c_delay
3621  0204               L7122:
3624  0204 c65219        	ld	a,_I2C_SR3
3625  0207 a501          	bcp	a,#1
3626  0209 26f6          	jrne	L5122
3627                     ; 217 } // i2c_stop()
3630  020b 81            	ret
3667                     ; 225 void i2c_write(uint8_t data)
3667                     ; 226 {
3668                     	switch	.text
3669  020c               _i2c_write:
3673                     ; 227 	I2C_DR = data; // send byte over I2C bus
3675  020c c75216        	ld	_I2C_DR,a
3677  020f 2003          	jra	L5422
3678  0211               L1422:
3679                     ; 228 	while (!(I2C_SR1 & I2C_SR1_TXE)) i2c_delay(); // wait until Data Register is empty
3681  0211 cd0000        	call	_i2c_delay
3683  0214               L5422:
3686  0214 c65217        	ld	a,_I2C_SR1
3687  0217 a580          	bcp	a,#128
3688  0219 27f6          	jreq	L1422
3689                     ; 230 } // i2c_write()
3692  021b 81            	ret
3719                     ; 238 uint8_t i2c_read1(void)
3719                     ; 239 {
3720                     	switch	.text
3721  021c               _i2c_read1:
3725                     ; 240     I2C_CR2 &= ~I2C_CR2_ACK;
3727  021c 72155211      	bres	_I2C_CR2,#2
3728                     ; 241     i2c_stop();
3730  0220 add7          	call	_i2c_stop
3733  0222               L3622:
3734                     ; 242     while (!(I2C_SR1 & I2C_SR1_RXNE));
3736  0222 c65217        	ld	a,_I2C_SR1
3737  0225 a540          	bcp	a,#64
3738  0227 27f9          	jreq	L3622
3739                     ; 243     return I2C_DR;
3741  0229 c65216        	ld	a,_I2C_DR
3744  022c 81            	ret
3792                     ; 251 uint8_t i2c_read(uint8_t ack)
3792                     ; 252 {
3793                     	switch	.text
3794  022d               _i2c_read:
3796  022d 5203          	subw	sp,#3
3797       00000003      OFST:	set	3
3800                     ; 255     if (ack == I2C_ACK)
3802  022f 4d            	tnz	a
3803  0230 2611          	jrne	L1132
3805  0232 2003          	jra	L5132
3806  0234               L3132:
3807                     ; 257         while (!(I2C_SR1 & I2C_SR1_BTF)) i2c_delay(); // Wait for BTF
3809  0234 cd0000        	call	_i2c_delay
3811  0237               L5132:
3814  0237 c65217        	ld	a,_I2C_SR1
3815  023a a504          	bcp	a,#4
3816  023c 27f6          	jreq	L3132
3817                     ; 258 	    return I2C_DR;                 	              // Reading next data byte
3819  023e c65216        	ld	a,_I2C_DR
3821  0241 200c          	jra	L44
3822  0243               L1132:
3823                     ; 262         i2c_readN(3,buf); // read 3 bytes, return 1st byte
3825  0243 96            	ldw	x,sp
3826  0244 1c0001        	addw	x,#OFST-2
3827  0247 89            	pushw	x
3828  0248 a603          	ld	a,#3
3829  024a ad39          	call	_i2c_readN
3831  024c 85            	popw	x
3832                     ; 263         return buf[0];
3834  024d 7b01          	ld	a,(OFST-2,sp)
3836  024f               L44:
3838  024f 5b03          	addw	sp,#3
3839  0251 81            	ret
3887                     ; 274 void i2c_read_arr(uint8_t *buf, int len)
3887                     ; 275 {
3888                     	switch	.text
3889  0252               _i2c_read_arr:
3891  0252 89            	pushw	x
3892       00000000      OFST:	set	0
3895  0253 2019          	jra	L7432
3896  0255               L5432:
3897                     ; 278         I2C_CR2 |= I2C_CR2_ACK;
3899  0255 72145211      	bset	_I2C_CR2,#2
3901  0259               L5532:
3902                     ; 279         while (!(I2C_SR1 & I2C_SR1_RXNE));
3904  0259 c65217        	ld	a,_I2C_SR1
3905  025c a540          	bcp	a,#64
3906  025e 27f9          	jreq	L5532
3907                     ; 280         *(buf++) = I2C_DR;
3909  0260 1e01          	ldw	x,(OFST+1,sp)
3910  0262 1c0001        	addw	x,#1
3911  0265 1f01          	ldw	(OFST+1,sp),x
3912  0267 1d0001        	subw	x,#1
3913  026a c65216        	ld	a,_I2C_DR
3914  026d f7            	ld	(x),a
3915  026e               L7432:
3916                     ; 276     while (len-- > 1) 
3918  026e 9c            	rvf
3919  026f 1e05          	ldw	x,(OFST+5,sp)
3920  0271 1d0001        	subw	x,#1
3921  0274 1f05          	ldw	(OFST+5,sp),x
3922  0276 1c0001        	addw	x,#1
3923  0279 a30002        	cpw	x,#2
3924  027c 2ed7          	jrsge	L5432
3925                     ; 282     *buf = i2c_read1();
3927  027e ad9c          	call	_i2c_read1
3929  0280 1e01          	ldw	x,(OFST+1,sp)
3930  0282 f7            	ld	(x),a
3931                     ; 283 } // i2c_read_arr()
3934  0283 85            	popw	x
3935  0284 81            	ret
3991                     ; 291 void i2c_readN(uint8_t num_bytes, uint8_t *buf)
3991                     ; 292 {
3992                     	switch	.text
3993  0285               _i2c_readN:
3995  0285 88            	push	a
3996       00000000      OFST:	set	0
3999                     ; 295     if (num_bytes > 2)
4001  0286 a103          	cp	a,#3
4002  0288 2575          	jrult	L3042
4004  028a 201f          	jra	L7042
4005  028c               L5042:
4006                     ; 299             i2c_delay();
4008  028c cd0000        	call	_i2c_delay
4011  028f 2003          	jra	L5142
4012  0291               L3142:
4013                     ; 300             while (!(I2C_SR1 & I2C_SR1_BTF)) i2c_delay(); // Wait for BTF
4015  0291 cd0000        	call	_i2c_delay
4017  0294               L5142:
4020  0294 c65217        	ld	a,_I2C_SR1
4021  0297 a504          	bcp	a,#4
4022  0299 27f6          	jreq	L3142
4023                     ; 301 			*buf++ = I2C_DR;                 			  // Reading next data byte
4025  029b 1e04          	ldw	x,(OFST+4,sp)
4026  029d 1c0001        	addw	x,#1
4027  02a0 1f04          	ldw	(OFST+4,sp),x
4028  02a2 1d0001        	subw	x,#1
4029  02a5 c65216        	ld	a,_I2C_DR
4030  02a8 f7            	ld	(x),a
4031                     ; 302             num_bytes--;								  // Decrease bytes to read
4033  02a9 0a01          	dec	(OFST+1,sp)
4034  02ab               L7042:
4035                     ; 297         while (num_bytes > 3) // not last three bytes?
4037  02ab 7b01          	ld	a,(OFST+1,sp)
4038  02ad a104          	cp	a,#4
4039  02af 24db          	jruge	L5042
4041  02b1 2003          	jra	L3242
4042  02b3               L1242:
4043                     ; 305         while (!(I2C_SR1 & I2C_SR1_BTF)) i2c_delay();  // Wait for BTF
4045  02b3 cd0000        	call	_i2c_delay
4047  02b6               L3242:
4050  02b6 c65217        	ld	a,_I2C_SR1
4051  02b9 a504          	bcp	a,#4
4052  02bb 27f6          	jreq	L1242
4053                     ; 306         I2C_CR2 &= ~I2C_CR2_ACK;                       // Clear ACK (= send NACK)
4055  02bd 72155211      	bres	_I2C_CR2,#2
4056                     ; 307         disable_interrupts();                          // Errata workaround (Disable interrupt)
4059  02c1 9b            sim
4061                     ; 308         *buf++   = I2C_DR;                     		   // Read 1st byte
4064  02c2 1e04          	ldw	x,(OFST+4,sp)
4065  02c4 1c0001        	addw	x,#1
4066  02c7 1f04          	ldw	(OFST+4,sp),x
4067  02c9 1d0001        	subw	x,#1
4068  02cc c65216        	ld	a,_I2C_DR
4069  02cf f7            	ld	(x),a
4070                     ; 309         I2C_CR2 |= I2C_CR2_STOP;                       // Generate stop here (STOP=1)
4072  02d0 72125211      	bset	_I2C_CR2,#1
4073                     ; 310         *buf++   = I2C_DR;                     	       // Read 2nd byte
4075  02d4 1e04          	ldw	x,(OFST+4,sp)
4076  02d6 1c0001        	addw	x,#1
4077  02d9 1f04          	ldw	(OFST+4,sp),x
4078  02db 1d0001        	subw	x,#1
4079  02de c65216        	ld	a,_I2C_DR
4080  02e1 f7            	ld	(x),a
4081                     ; 311         enable_interrupts();						   // Errata workaround (Enable interrupt)
4084  02e2 9a            rim
4088  02e3 2003          	jra	L1342
4089  02e5               L7242:
4090                     ; 312         while (!(I2C_SR1 & I2C_SR1_RXNE)) i2c_delay(); // Wait for RXNE
4092  02e5 cd0000        	call	_i2c_delay
4094  02e8               L1342:
4097  02e8 c65217        	ld	a,_I2C_SR1
4098  02eb a540          	bcp	a,#64
4099  02ed 27f6          	jreq	L7242
4100                     ; 313         *buf++   = I2C_DR;                   		   // Read 3rd Data byte
4102  02ef 1e04          	ldw	x,(OFST+4,sp)
4103  02f1 1c0001        	addw	x,#1
4104  02f4 1f04          	ldw	(OFST+4,sp),x
4105  02f6 1d0001        	subw	x,#1
4106  02f9 c65216        	ld	a,_I2C_DR
4107  02fc f7            	ld	(x),a
4109  02fd 2059          	jra	L1642
4110  02ff               L3042:
4111                     ; 317         if (num_bytes == 2)
4113  02ff 7b01          	ld	a,(OFST+1,sp)
4114  0301 a102          	cp	a,#2
4115  0303 2632          	jrne	L7342
4116                     ; 319             I2C_CR2 |= I2C_CR2_POS;                       // Set POS bit (NACK at next received byte)
4118  0305 72165211      	bset	_I2C_CR2,#3
4119                     ; 320             disable_interrupts();                         // Errata workaround (Disable interrupt)
4122  0309 9b            sim
4124                     ; 321             I2C_CR2 &= ~I2C_CR2_ACK;                      // Clear ACK 
4127  030a 72155211      	bres	_I2C_CR2,#2
4128                     ; 322             enable_interrupts();						  // Errata workaround (Enable interrupt)
4131  030e 9a            rim
4135  030f 2003          	jra	L3442
4136  0311               L1442:
4137                     ; 323             while (!(I2C_SR1 & I2C_SR1_BTF)) i2c_delay(); // Wait for BTF
4139  0311 cd0000        	call	_i2c_delay
4141  0314               L3442:
4144  0314 c65217        	ld	a,_I2C_SR1
4145  0317 a504          	bcp	a,#4
4146  0319 27f6          	jreq	L1442
4147                     ; 324             disable_interrupts();                         // Errata workaround (Disable interrupt)
4150  031b 9b            sim
4152                     ; 325             I2C_CR2 |= I2C_CR2_STOP;                      // Generate stop here (STOP=1)
4155  031c 72125211      	bset	_I2C_CR2,#1
4156                     ; 326             *buf++   = I2C_DR;                     	      // Read 1st Data byte
4158  0320 1e04          	ldw	x,(OFST+4,sp)
4159  0322 1c0001        	addw	x,#1
4160  0325 1f04          	ldw	(OFST+4,sp),x
4161  0327 1d0001        	subw	x,#1
4162  032a c65216        	ld	a,_I2C_DR
4163  032d f7            	ld	(x),a
4164                     ; 327             enable_interrupts();						  // Errata workaround (Enable interrupt)
4167  032e 9a            rim
4169                     ; 328 			*buf     = I2C_DR;							  // Read 2nd Data byte
4172  032f 1e04          	ldw	x,(OFST+4,sp)
4173  0331 c65216        	ld	a,_I2C_DR
4174  0334 f7            	ld	(x),a
4176  0335 2021          	jra	L1642
4177  0337               L7342:
4178                     ; 332             I2C_CR2 &= ~I2C_CR2_ACK;         		       // Clear ACK 
4180  0337 72155211      	bres	_I2C_CR2,#2
4181                     ; 333             disable_interrupts();           		       // Errata workaround (Disable interrupt)
4184  033b 9b            sim
4186                     ; 334             I2C_CR2 |= I2C_CR2_STOP;            	       // generate stop here (STOP=1)
4189  033c 72125211      	bset	_I2C_CR2,#1
4190                     ; 335             enable_interrupts();					       // Errata workaround (Enable interrupt)
4193  0340 9a            rim
4197  0341 2003          	jra	L3542
4198  0343               L1542:
4199                     ; 336             while (!(I2C_SR1 & I2C_SR1_RXNE)) i2c_delay(); // test EV7, wait for RxNE
4201  0343 cd0000        	call	_i2c_delay
4203  0346               L3542:
4206  0346 c65217        	ld	a,_I2C_SR1
4207  0349 a540          	bcp	a,#64
4208  034b 27f6          	jreq	L1542
4209                     ; 337             *buf = I2C_DR;                             // Read Data byte
4211  034d 1e04          	ldw	x,(OFST+4,sp)
4212  034f c65216        	ld	a,_I2C_DR
4213  0352 f7            	ld	(x),a
4214  0353 2003          	jra	L1642
4215  0355               L7542:
4216                     ; 340     while ((I2C_CR2 & I2C_CR2_STOP)) i2c_delay();  // Wait until stop is performed (STOPF = 1)
4218  0355 cd0000        	call	_i2c_delay
4220  0358               L1642:
4223  0358 c65211        	ld	a,_I2C_CR2
4224  035b a502          	bcp	a,#2
4225  035d 26f6          	jrne	L7542
4226                     ; 341     I2C_CR2 &= ~I2C_CR2_POS;                       // return POS to default state (POS=0)
4228  035f 72175211      	bres	_I2C_CR2,#3
4229                     ; 342 } // i2c_readN()
4232  0363 84            	pop	a
4233  0364 81            	ret
4317                     ; 344 int16_t lm92_read(uint8_t addr, uint8_t *err)
4317                     ; 345 /*------------------------------------------------------------------
4317                     ; 346   Purpose  : This function reads the LM92 13-bit Temp. Sensor and
4317                     ; 347              returns the temperature.
4317                     ; 348              Reading Register 0 of the LM92 results in the following bits:
4317                     ; 349               15   14  13 12      3   2    1   0
4317                     ; 350              Sign MSB B10 B9 ... B0 Crit High Low
4317                     ; 351   Variables:
4317                     ; 352       addr : I2C-address of LM92
4317                     ; 353   Returns  : The temperature from the LM92 in a signed Q8.7 format.
4317                     ; 354              Q8.7 is chosen here for accuracy reasons when filtering.
4317                     ; 355   ------------------------------------------------------------------*/
4317                     ; 356 {
4318                     	switch	.text
4319  0365               _lm92_read:
4321  0365 88            	push	a
4322  0366 5205          	subw	sp,#5
4323       00000005      OFST:	set	5
4326                     ; 360    int16_t  temp = 0;  // the temp. from the LM92 as an int
4328  0368 5f            	clrw	x
4329  0369 1f04          	ldw	(OFST-1,sp),x
4331                     ; 363    *err = (i2c_start(addr) == I2C_NACK); // generate I2C start + output address to I2C bus
4333  036b cd01b6        	call	_i2c_start
4335  036e a101          	cp	a,#1
4336  0370 2604          	jrne	L45
4337  0372 a601          	ld	a,#1
4338  0374 2001          	jra	L65
4339  0376               L45:
4340  0376 4f            	clr	a
4341  0377               L65:
4342  0377 1e09          	ldw	x,(OFST+4,sp)
4343  0379 f7            	ld	(x),a
4344                     ; 365    if (*err) i2c_stop();
4346  037a 1e09          	ldw	x,(OFST+4,sp)
4347  037c 7d            	tnz	(x)
4348  037d 2705          	jreq	L7252
4351  037f cd01f9        	call	_i2c_stop
4354  0382 205e          	jra	L1352
4355  0384               L7252:
4356                     ; 368       i2c_readN(2,buffer);
4358  0384 96            	ldw	x,sp
4359  0385 1c0001        	addw	x,#OFST-4
4360  0388 89            	pushw	x
4361  0389 a602          	ld	a,#2
4362  038b cd0285        	call	_i2c_readN
4364  038e 85            	popw	x
4365                     ; 369       temp_int = buffer[0] & 0x00FF;    // store {Sign, MSB, bit 10..5} at bits temp_int bits 7..0
4367  038f 7b01          	ld	a,(OFST-4,sp)
4368  0391 5f            	clrw	x
4369  0392 97            	ld	xl,a
4370  0393 1f04          	ldw	(OFST-1,sp),x
4372                     ; 370       temp_int <<= 8;                   // SHL 8, Sign now at bit 15
4374  0395 7b05          	ld	a,(OFST+0,sp)
4375  0397 6b04          	ld	(OFST-1,sp),a
4376  0399 0f05          	clr	(OFST+0,sp)
4378                     ; 371       temp_int &= 0xFF00;               // Clear bits 7..0
4380  039b 0f05          	clr	(OFST+0,sp)
4382                     ; 372       temp_int |= (buffer[1] & 0x00FF); // Add bits D4..D0 to temp_int bits 7..3
4384  039d 7b02          	ld	a,(OFST-3,sp)
4385  039f 5f            	clrw	x
4386  03a0 97            	ld	xl,a
4387  03a1 01            	rrwa	x,a
4388  03a2 1a05          	or	a,(OFST+0,sp)
4389  03a4 01            	rrwa	x,a
4390  03a5 1a04          	or	a,(OFST-1,sp)
4391  03a7 01            	rrwa	x,a
4392  03a8 1f04          	ldw	(OFST-1,sp),x
4394                     ; 373       temp_int &= 0xFFF8;               // Clear Crit High & Low bits
4396  03aa 7b05          	ld	a,(OFST+0,sp)
4397  03ac a4f8          	and	a,#248
4398  03ae 6b05          	ld	(OFST+0,sp),a
4400                     ; 374       sign = ((temp_int & LM92_SIGNb) == LM92_SIGNb);
4402  03b0 7b04          	ld	a,(OFST-1,sp)
4403  03b2 97            	ld	xl,a
4404  03b3 7b05          	ld	a,(OFST+0,sp)
4405  03b5 9f            	ld	a,xl
4406  03b6 a480          	and	a,#128
4407  03b8 97            	ld	xl,a
4408  03b9 4f            	clr	a
4409  03ba 02            	rlwa	x,a
4410  03bb a38000        	cpw	x,#32768
4411  03be 2604          	jrne	L06
4412  03c0 a601          	ld	a,#1
4413  03c2 2001          	jra	L26
4414  03c4               L06:
4415  03c4 4f            	clr	a
4416  03c5               L26:
4417  03c5 6b03          	ld	(OFST-2,sp),a
4419                     ; 375       if (sign)
4421  03c7 0d03          	tnz	(OFST-2,sp)
4422  03c9 270e          	jreq	L3352
4423                     ; 377          temp_int &= ~LM92_SIGNb;        // Clear sign bit
4425  03cb 7b04          	ld	a,(OFST-1,sp)
4426  03cd a47f          	and	a,#127
4427  03cf 6b04          	ld	(OFST-1,sp),a
4429                     ; 378          temp_int  = LM92_FS - temp_int; // Convert two complement number
4431  03d1 ae8000        	ldw	x,#32768
4432  03d4 72f004        	subw	x,(OFST-1,sp)
4433  03d7 1f04          	ldw	(OFST-1,sp),x
4435  03d9               L3352:
4436                     ; 381 	  temp = temp_int; // without shifting! Returns Q8.7 format
4439                     ; 382       if (sign)
4441  03d9 0d03          	tnz	(OFST-2,sp)
4442  03db 2705          	jreq	L1352
4443                     ; 384          temp = -temp; // negate number
4445  03dd 1e04          	ldw	x,(OFST-1,sp)
4446  03df 50            	negw	x
4447  03e0 1f04          	ldw	(OFST-1,sp),x
4449  03e2               L1352:
4450                     ; 388    return temp;     // Return value now in °C << 7
4452  03e2 1e04          	ldw	x,(OFST-1,sp)
4455  03e4 5b06          	addw	sp,#6
4456  03e6 81            	ret
4491                     ; 391 uint8_t mcp23017_init(void)
4491                     ; 392 /*------------------------------------------------------------------
4491                     ; 393   Purpose  : This function inits the MCP23017 16-bit IO-expander
4491                     ; 394              PORTA is input from all reed-relays
4491                     ; 395              PORTB is output for all reed-relays
4491                     ; 396   Variables: -
4491                     ; 397   Returns  : 0: no error, 1: error
4491                     ; 398   ------------------------------------------------------------------*/
4491                     ; 399 {
4492                     	switch	.text
4493  03e7               _mcp23017_init:
4495  03e7 88            	push	a
4496       00000001      OFST:	set	1
4499                     ; 401 	err = mcp23017_write(IOCON, MCP23017_INIT);
4501  03e8 ae0a00        	ldw	x,#2560
4502  03eb ad4d          	call	_mcp23017_write
4504  03ed 6b01          	ld	(OFST+0,sp),a
4506                     ; 402 	if (!err)
4508  03ef 0d01          	tnz	(OFST+0,sp)
4509  03f1 2611          	jrne	L5552
4510                     ; 404 		err = mcp23017_write(IODIRA, 0xFF); // all PORTA bits are input
4512  03f3 ae00ff        	ldw	x,#255
4513  03f6 ad42          	call	_mcp23017_write
4515                     ; 405 		err = mcp23017_write(IODIRB, 0x00); // all PORTB bits are output
4517  03f8 ae0100        	ldw	x,#256
4518  03fb ad3d          	call	_mcp23017_write
4520                     ; 406 		err = mcp23017_write(GPIOB,  0x00); // All IO is OFF at power-up
4522  03fd ae1300        	ldw	x,#4864
4523  0400 ad38          	call	_mcp23017_write
4525  0402 6b01          	ld	(OFST+0,sp),a
4527  0404               L5552:
4528                     ; 408 	return err;	
4530  0404 7b01          	ld	a,(OFST+0,sp)
4533  0406 5b01          	addw	sp,#1
4534  0408 81            	ret
4591                     ; 411 uint8_t mcp23017_read(uint8_t reg)
4591                     ; 412 /*------------------------------------------------------------------
4591                     ; 413   Purpose  : This function reads one register from the MCP23008 or
4591                     ; 414              the MCP23017 IO-expander.
4591                     ; 415   Variables:
4591                     ; 416        reg : The register to read from
4591                     ; 417   Returns  : the value returned from the register
4591                     ; 418   ------------------------------------------------------------------*/
4591                     ; 419 {
4592                     	switch	.text
4593  0409               _mcp23017_read:
4595  0409 88            	push	a
4596  040a 89            	pushw	x
4597       00000002      OFST:	set	2
4600                     ; 420 	uint8_t err, ret = 0;
4602  040b 0f02          	clr	(OFST+0,sp)
4604                     ; 423 	err = (i2c_start(MCP23017_ADDR | I2C_WRITE) == I2C_NACK); 
4606  040d a640          	ld	a,#64
4607  040f cd01b6        	call	_i2c_start
4609  0412 a101          	cp	a,#1
4610  0414 2604          	jrne	L07
4611  0416 a601          	ld	a,#1
4612  0418 2001          	jra	L27
4613  041a               L07:
4614  041a 4f            	clr	a
4615  041b               L27:
4616  041b 6b01          	ld	(OFST-1,sp),a
4618                     ; 424 	if (err) i2c_stop();
4620  041d 0d01          	tnz	(OFST-1,sp)
4621  041f 2705          	jreq	L5062
4624  0421 cd01f9        	call	_i2c_stop
4627  0424 200f          	jra	L7062
4628  0426               L5062:
4629                     ; 427 		i2c_write(reg); // write register address
4631  0426 7b03          	ld	a,(OFST+1,sp)
4632  0428 cd020c        	call	_i2c_write
4634                     ; 428 		i2c_rep_start(MCP23017_ADDR | I2C_READ);
4636  042b a641          	ld	a,#65
4637  042d cd01d1        	call	_i2c_rep_start
4639                     ; 429 		ret = i2c_read1(); // Read byte, generate I2C stop condition
4641  0430 cd021c        	call	_i2c_read1
4643  0433 6b02          	ld	(OFST+0,sp),a
4645  0435               L7062:
4646                     ; 431 	return ret;
4648  0435 7b02          	ld	a,(OFST+0,sp)
4651  0437 5b03          	addw	sp,#3
4652  0439 81            	ret
4707                     ; 434 uint8_t mcp23017_write(uint8_t reg, uint8_t data)
4707                     ; 435 /*------------------------------------------------------------------
4707                     ; 436   Purpose  : This function write one data byte to a specific register 
4707                     ; 437 			 of the MCP23008 or MCP23017 IO-expander.
4707                     ; 438   Variables:
4707                     ; 439        reg : The register to write to
4707                     ; 440 	   data: The data byte to write into the register
4707                     ; 441   Returns  : 0: no error, 1: error
4707                     ; 442   ------------------------------------------------------------------*/
4707                     ; 443 {
4708                     	switch	.text
4709  043a               _mcp23017_write:
4711  043a 89            	pushw	x
4712  043b 88            	push	a
4713       00000001      OFST:	set	1
4716                     ; 447 	err = (i2c_start(MCP23017_ADDR | I2C_WRITE) == I2C_NACK);
4718  043c a640          	ld	a,#64
4719  043e cd01b6        	call	_i2c_start
4721  0441 a101          	cp	a,#1
4722  0443 2604          	jrne	L67
4723  0445 a601          	ld	a,#1
4724  0447 2001          	jra	L001
4725  0449               L67:
4726  0449 4f            	clr	a
4727  044a               L001:
4728  044a 6b01          	ld	(OFST+0,sp),a
4730                     ; 448 	if (err) i2c_stop();
4732  044c 0d01          	tnz	(OFST+0,sp)
4733  044e 2705          	jreq	L7362
4736  0450 cd01f9        	call	_i2c_stop
4739  0453 200d          	jra	L1462
4740  0455               L7362:
4741                     ; 451 		i2c_write(reg);  // write register address
4743  0455 7b02          	ld	a,(OFST+1,sp)
4744  0457 cd020c        	call	_i2c_write
4746                     ; 452 		i2c_write(data); // write register value
4748  045a 7b03          	ld	a,(OFST+2,sp)
4749  045c cd020c        	call	_i2c_write
4751                     ; 453 		i2c_stop();
4753  045f cd01f9        	call	_i2c_stop
4755  0462               L1462:
4756                     ; 455 	return err;
4758  0462 7b01          	ld	a,(OFST+0,sp)
4761  0464 5b03          	addw	sp,#3
4762  0466 81            	ret
4818                     ; 470 int8_t ds2482_reset(uint8_t addr)
4818                     ; 471 {
4819                     	switch	.text
4820  0467               _ds2482_reset:
4822  0467 88            	push	a
4823  0468 89            	pushw	x
4824       00000002      OFST:	set	2
4827                     ; 475 	err = (i2c_start(addr | I2C_WRITE) == I2C_NACK);
4829  0469 cd01b6        	call	_i2c_start
4831  046c a101          	cp	a,#1
4832  046e 2604          	jrne	L401
4833  0470 a601          	ld	a,#1
4834  0472 2001          	jra	L601
4835  0474               L401:
4836  0474 4f            	clr	a
4837  0475               L601:
4838  0475 6b02          	ld	(OFST+0,sp),a
4840                     ; 476 	if (!err)
4842  0477 0d02          	tnz	(OFST+0,sp)
4843  0479 2613          	jrne	L1762
4844                     ; 478 		i2c_write(CMD_DRST); // write register address
4846  047b a6f0          	ld	a,#240
4847  047d cd020c        	call	_i2c_write
4849                     ; 479 		i2c_rep_start(addr | I2C_READ);
4851  0480 7b03          	ld	a,(OFST+1,sp)
4852  0482 aa01          	or	a,#1
4853  0484 cd01d1        	call	_i2c_rep_start
4855                     ; 480 		ret = i2c_read(I2C_NACK);
4857  0487 a601          	ld	a,#1
4858  0489 cd022d        	call	_i2c_read
4860  048c 6b01          	ld	(OFST-1,sp),a
4862  048e               L1762:
4863                     ; 485    if (!err && ((ret & 0xF7) == 0x10))
4865  048e 0d02          	tnz	(OFST+0,sp)
4866  0490 260c          	jrne	L3762
4868  0492 7b01          	ld	a,(OFST-1,sp)
4869  0494 a4f7          	and	a,#247
4870  0496 a110          	cp	a,#16
4871  0498 2604          	jrne	L3762
4872                     ; 486    		  return true;
4874  049a a601          	ld	a,#1
4876  049c 2001          	jra	L011
4877  049e               L3762:
4878                     ; 487    else return false;	
4880  049e 4f            	clr	a
4882  049f               L011:
4884  049f 5b03          	addw	sp,#3
4885  04a1 81            	ret
4942                     ; 502 int8_t ds2482_reset_bb(uint8_t addr)
4942                     ; 503 {
4943                     	switch	.text
4944  04a2               _ds2482_reset_bb:
4946  04a2 88            	push	a
4947  04a3 89            	pushw	x
4948       00000002      OFST:	set	2
4951                     ; 507 	err = (i2c_start_bb(addr | I2C_WRITE) == I2C_NACK);
4953  04a4 cd00f1        	call	_i2c_start_bb
4955  04a7 a101          	cp	a,#1
4956  04a9 2604          	jrne	L411
4957  04ab a601          	ld	a,#1
4958  04ad 2001          	jra	L611
4959  04af               L411:
4960  04af 4f            	clr	a
4961  04b0               L611:
4962  04b0 6b02          	ld	(OFST+0,sp),a
4964                     ; 508 	if (!err)
4966  04b2 0d02          	tnz	(OFST+0,sp)
4967  04b4 261c          	jrne	L5272
4968                     ; 510 		err  = i2c_write_bb(CMD_DRST); // write register address
4970  04b6 a6f0          	ld	a,#240
4971  04b8 cd000d        	call	_i2c_write_bb
4973  04bb 6b02          	ld	(OFST+0,sp),a
4975                     ; 511 		err |= i2c_rep_start_bb(addr | I2C_READ);
4977  04bd 7b03          	ld	a,(OFST+1,sp)
4978  04bf aa01          	or	a,#1
4979  04c1 cd0118        	call	_i2c_rep_start_bb
4981  04c4 1a02          	or	a,(OFST+0,sp)
4982  04c6 6b02          	ld	(OFST+0,sp),a
4984                     ; 512 		ret  = i2c_read_bb(I2C_NACK);
4986  04c8 a601          	ld	a,#1
4987  04ca cd0081        	call	_i2c_read_bb
4989  04cd 6b01          	ld	(OFST-1,sp),a
4991                     ; 513         i2c_stop_bb();
4993  04cf cd012a        	call	_i2c_stop_bb
4995  04d2               L5272:
4996                     ; 516    if (!err && ((ret & 0xF7) == 0x10))
4998  04d2 0d02          	tnz	(OFST+0,sp)
4999  04d4 260c          	jrne	L7272
5001  04d6 7b01          	ld	a,(OFST-1,sp)
5002  04d8 a4f7          	and	a,#247
5003  04da a110          	cp	a,#16
5004  04dc 2604          	jrne	L7272
5005                     ; 517    		  return true;
5007  04de a601          	ld	a,#1
5009  04e0 2001          	jra	L021
5010  04e2               L7272:
5011                     ; 518    else return false;	
5013  04e2 4f            	clr	a
5015  04e3               L021:
5017  04e3 5b03          	addw	sp,#3
5018  04e5 81            	ret
5077                     ; 535 int8_t ds2482_write_config_bb(uint8_t addr)
5077                     ; 536 {
5078                     	switch	.text
5079  04e6               _ds2482_write_config_bb:
5081  04e6 88            	push	a
5082  04e7 89            	pushw	x
5083       00000002      OFST:	set	2
5086                     ; 540 	err = (i2c_start_bb(addr | I2C_WRITE) == I2C_NACK);
5088  04e8 cd00f1        	call	_i2c_start_bb
5090  04eb a101          	cp	a,#1
5091  04ed 2604          	jrne	L421
5092  04ef a601          	ld	a,#1
5093  04f1 2001          	jra	L621
5094  04f3               L421:
5095  04f3 4f            	clr	a
5096  04f4               L621:
5097  04f4 6b02          	ld	(OFST+0,sp),a
5099                     ; 541 	if (!err)
5101  04f6 0d02          	tnz	(OFST+0,sp)
5102  04f8 261d          	jrne	L1672
5103                     ; 543 		err = i2c_write_bb(CMD_WCFG); // write register address
5105  04fa a6d2          	ld	a,#210
5106  04fc cd000d        	call	_i2c_write_bb
5108                     ; 544 		err = i2c_write_bb(DS2482_CONFIG); // write register address
5110  04ff a6e1          	ld	a,#225
5111  0501 cd000d        	call	_i2c_write_bb
5113                     ; 545         err = i2c_rep_start_bb(addr | I2C_READ);
5115  0504 7b03          	ld	a,(OFST+1,sp)
5116  0506 aa01          	or	a,#1
5117  0508 cd0118        	call	_i2c_rep_start_bb
5119  050b 6b02          	ld	(OFST+0,sp),a
5121                     ; 546 		read_config = i2c_read_bb(I2C_NACK);
5123  050d a601          	ld	a,#1
5124  050f cd0081        	call	_i2c_read_bb
5126  0512 6b01          	ld	(OFST-1,sp),a
5128                     ; 547         i2c_stop_bb();
5130  0514 cd012a        	call	_i2c_stop_bb
5132  0517               L1672:
5133                     ; 550    if (err || (read_config != (DS2482_CONFIG & 0x0f)))
5135  0517 0d02          	tnz	(OFST+0,sp)
5136  0519 2606          	jrne	L5672
5138  051b 7b01          	ld	a,(OFST-1,sp)
5139  051d a101          	cp	a,#1
5140  051f 2708          	jreq	L3672
5141  0521               L5672:
5142                     ; 552       ds2482_reset_bb(addr); // handle error
5144  0521 7b03          	ld	a,(OFST+1,sp)
5145  0523 cd04a2        	call	_ds2482_reset_bb
5147                     ; 553       return false;
5149  0526 4f            	clr	a
5151  0527 2002          	jra	L031
5152  0529               L3672:
5153                     ; 555    return true;
5155  0529 a601          	ld	a,#1
5157  052b               L031:
5159  052b 5b03          	addw	sp,#3
5160  052d 81            	ret
5218                     ; 572 int8_t ds2482_write_config(uint8_t addr)
5218                     ; 573 {
5219                     	switch	.text
5220  052e               _ds2482_write_config:
5222  052e 88            	push	a
5223  052f 89            	pushw	x
5224       00000002      OFST:	set	2
5227                     ; 577 	err = (i2c_start(addr | I2C_WRITE) == I2C_NACK);
5229  0530 cd01b6        	call	_i2c_start
5231  0533 a101          	cp	a,#1
5232  0535 2604          	jrne	L431
5233  0537 a601          	ld	a,#1
5234  0539 2001          	jra	L631
5235  053b               L431:
5236  053b 4f            	clr	a
5237  053c               L631:
5238  053c 6b02          	ld	(OFST+0,sp),a
5240                     ; 578 	if (!err)
5242  053e 0d02          	tnz	(OFST+0,sp)
5243  0540 2618          	jrne	L5103
5244                     ; 580 		i2c_write(CMD_WCFG); // write register address
5246  0542 a6d2          	ld	a,#210
5247  0544 cd020c        	call	_i2c_write
5249                     ; 581 		i2c_write(DS2482_CONFIG); // write register address
5251  0547 a6e1          	ld	a,#225
5252  0549 cd020c        	call	_i2c_write
5254                     ; 582         i2c_rep_start(addr | I2C_READ);
5256  054c 7b03          	ld	a,(OFST+1,sp)
5257  054e aa01          	or	a,#1
5258  0550 cd01d1        	call	_i2c_rep_start
5260                     ; 583 		read_config = i2c_read(I2C_NACK);
5262  0553 a601          	ld	a,#1
5263  0555 cd022d        	call	_i2c_read
5265  0558 6b01          	ld	(OFST-1,sp),a
5267  055a               L5103:
5268                     ; 588    if (err || (read_config != (DS2482_CONFIG & 0x0f)))
5270  055a 0d02          	tnz	(OFST+0,sp)
5271  055c 2606          	jrne	L1203
5273  055e 7b01          	ld	a,(OFST-1,sp)
5274  0560 a101          	cp	a,#1
5275  0562 2708          	jreq	L7103
5276  0564               L1203:
5277                     ; 590       ds2482_reset(addr); // handle error
5279  0564 7b03          	ld	a,(OFST+1,sp)
5280  0566 cd0467        	call	_ds2482_reset
5282                     ; 591       return false;
5284  0569 4f            	clr	a
5286  056a 2002          	jra	L041
5287  056c               L7103:
5288                     ; 593    return true;
5290  056c a601          	ld	a,#1
5292  056e               L041:
5294  056e 5b03          	addw	sp,#3
5295  0570 81            	ret
5331                     ; 604 int8_t ds2482_detect(uint8_t addr)
5331                     ; 605 {
5332                     	switch	.text
5333  0571               _ds2482_detect:
5335  0571 88            	push	a
5336       00000000      OFST:	set	0
5339                     ; 606    if (!ds2482_reset(addr)) // reset the DS2482
5341  0572 cd0467        	call	_ds2482_reset
5343  0575 4d            	tnz	a
5344  0576 2604          	jrne	L1403
5345                     ; 607       return false;
5347  0578 4f            	clr	a
5350  0579 5b01          	addw	sp,#1
5351  057b 81            	ret
5352  057c               L1403:
5353                     ; 609    if (!ds2482_write_config(addr)) // write default configuration settings
5355  057c 7b01          	ld	a,(OFST+1,sp)
5356  057e adae          	call	_ds2482_write_config
5358  0580 4d            	tnz	a
5359  0581 2604          	jrne	L3403
5360                     ; 610         return false;
5362  0583 4f            	clr	a
5365  0584 5b01          	addw	sp,#1
5366  0586 81            	ret
5367  0587               L3403:
5368                     ; 611    else return true;
5370  0587 a601          	ld	a,#1
5373  0589 5b01          	addw	sp,#1
5374  058b 81            	ret
5410                     ; 622 int8_t ds2482_detect_bb(uint8_t addr)
5410                     ; 623 {
5411                     	switch	.text
5412  058c               _ds2482_detect_bb:
5414  058c 88            	push	a
5415       00000000      OFST:	set	0
5418                     ; 624    if (!ds2482_reset_bb(addr)) // reset the DS2482
5420  058d cd04a2        	call	_ds2482_reset_bb
5422  0590 4d            	tnz	a
5423  0591 2604          	jrne	L5603
5424                     ; 625       return false;
5426  0593 4f            	clr	a
5429  0594 5b01          	addw	sp,#1
5430  0596 81            	ret
5431  0597               L5603:
5432                     ; 627    if (!ds2482_write_config_bb(addr)) // write default configuration settings
5434  0597 7b01          	ld	a,(OFST+1,sp)
5435  0599 cd04e6        	call	_ds2482_write_config_bb
5437  059c 4d            	tnz	a
5438  059d 2604          	jrne	L7603
5439                     ; 628         return false;
5441  059f 4f            	clr	a
5444  05a0 5b01          	addw	sp,#1
5445  05a2 81            	ret
5446  05a3               L7603:
5447                     ; 629    else return true;
5449  05a3 a601          	ld	a,#1
5452  05a5 5b01          	addw	sp,#1
5453  05a7 81            	ret
5529                     ; 640 uint8_t ds2482_search_triplet(uint8_t search_direction, uint8_t addr)
5529                     ; 641 {
5530                     	switch	.text
5531  05a8               _ds2482_search_triplet:
5533  05a8 89            	pushw	x
5534  05a9 5203          	subw	sp,#3
5535       00000003      OFST:	set	3
5538                     ; 643    int poll_count = 0;
5540  05ab 5f            	clrw	x
5541  05ac 1f01          	ldw	(OFST-2,sp),x
5543                     ; 652 	   err = (i2c_start(addr | I2C_WRITE) == I2C_NACK);
5545  05ae 7b05          	ld	a,(OFST+2,sp)
5546  05b0 cd01b6        	call	_i2c_start
5548  05b3 a101          	cp	a,#1
5549  05b5 2604          	jrne	L051
5550  05b7 a601          	ld	a,#1
5551  05b9 2001          	jra	L251
5552  05bb               L051:
5553  05bb 4f            	clr	a
5554  05bc               L251:
5555  05bc 6b03          	ld	(OFST+0,sp),a
5557                     ; 653    if (!err)
5559  05be 0d03          	tnz	(OFST+0,sp)
5560  05c0 265a          	jrne	L1313
5561                     ; 655 	   i2c_write(CMD_1WT); // write register address
5563  05c2 a678          	ld	a,#120
5564  05c4 cd020c        	call	_i2c_write
5566                     ; 656    	   i2c_write(search_direction ? 0x80 : 0x00);
5568  05c7 0d04          	tnz	(OFST+1,sp)
5569  05c9 2704          	jreq	L451
5570  05cb a680          	ld	a,#128
5571  05cd 2001          	jra	L651
5572  05cf               L451:
5573  05cf 4f            	clr	a
5574  05d0               L651:
5575  05d0 cd020c        	call	_i2c_write
5577                     ; 657 	   i2c_rep_start(addr | I2C_READ);
5579  05d3 7b05          	ld	a,(OFST+2,sp)
5580  05d5 aa01          	or	a,#1
5581  05d7 cd01d1        	call	_i2c_rep_start
5583                     ; 660 	   status = i2c_read(I2C_ACK); // Read byte
5585  05da 4f            	clr	a
5586  05db cd022d        	call	_i2c_read
5588  05de 6b03          	ld	(OFST+0,sp),a
5590  05e0               L3313:
5591                     ; 663 	     if (status & STATUS_1WB) status = i2c_read(I2C_ACK);
5593  05e0 7b03          	ld	a,(OFST+0,sp)
5594  05e2 a501          	bcp	a,#1
5595  05e4 2706          	jreq	L5313
5598  05e6 4f            	clr	a
5599  05e7 cd022d        	call	_i2c_read
5601  05ea 6b03          	ld	(OFST+0,sp),a
5603  05ec               L5313:
5604                     ; 665 	   while ((status & STATUS_1WB) && (poll_count++ < DS2482_OW_POLL_LIMIT));
5606  05ec 7b03          	ld	a,(OFST+0,sp)
5607  05ee a501          	bcp	a,#1
5608  05f0 2710          	jreq	L3413
5610  05f2 9c            	rvf
5611  05f3 1e01          	ldw	x,(OFST-2,sp)
5612  05f5 1c0001        	addw	x,#1
5613  05f8 1f01          	ldw	(OFST-2,sp),x
5614  05fa 1d0001        	subw	x,#1
5616  05fd a300c8        	cpw	x,#200
5617  0600 2fde          	jrslt	L3313
5618  0602               L3413:
5619                     ; 666 	   i2c_read(I2C_NACK); // Read 1 byte and generate stop condition
5621  0602 a601          	ld	a,#1
5622  0604 cd022d        	call	_i2c_read
5624                     ; 668    	   if (poll_count >= DS2482_OW_POLL_LIMIT)
5626  0607 9c            	rvf
5627  0608 1e01          	ldw	x,(OFST-2,sp)
5628  060a a300c8        	cpw	x,#200
5629  060d 2f08          	jrslt	L5413
5630                     ; 670       	  ds2482_reset(addr); // handle error
5632  060f 7b05          	ld	a,(OFST+2,sp)
5633  0611 cd0467        	call	_ds2482_reset
5635                     ; 671       	  return false;
5637  0614 4f            	clr	a
5639  0615 2002          	jra	L061
5640  0617               L5413:
5641                     ; 673    	   return status;
5643  0617 7b03          	ld	a,(OFST+0,sp)
5645  0619               L061:
5647  0619 5b05          	addw	sp,#5
5648  061b 81            	ret
5649  061c               L1313:
5650                     ; 675    else return false;
5652  061c 4f            	clr	a
5654  061d 20fa          	jra	L061
5667                     	xdef	_ds2482_write_config_bb
5668                     	xdef	_recv_ack_bit
5669                     	xdef	_I2C_IRQHandler
5670                     	xdef	_i2c_stop_bb
5671                     	xdef	_i2c_rep_start_bb
5672                     	xdef	_i2c_start_bb
5673                     	xdef	_i2c_read_bb
5674                     	xdef	_i2c_write_bb
5675                     	xdef	_i2c_delay
5676                     	xref	_delay_usec
5677                     	xdef	_ds2482_search_triplet
5678                     	xdef	_ds2482_detect_bb
5679                     	xdef	_ds2482_detect
5680                     	xdef	_ds2482_write_config
5681                     	xdef	_ds2482_reset_bb
5682                     	xdef	_ds2482_reset
5683                     	xdef	_mcp23017_write
5684                     	xdef	_mcp23017_read
5685                     	xdef	_mcp23017_init
5686                     	xdef	_lm92_read
5687                     	xdef	_i2c_read_arr
5688                     	xdef	_i2c_read1
5689                     	xdef	_i2c_readN
5690                     	xdef	_i2c_read
5691                     	xdef	_i2c_write
5692                     	xdef	_i2c_stop
5693                     	xdef	_i2c_rep_start
5694                     	xdef	_i2c_start
5695                     	xdef	_i2c_init
5714                     	end
