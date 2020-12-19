	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #768
	mov	r4, #67108864
	mov	r5, #0
	strh	r3, [r4]	@ movhi
	ldr	r6, .L4
	strh	r5, [r4, #16]	@ movhi
	mov	r3, #256
	strh	r5, [r4, #18]	@ movhi
	mov	r2, #83886080
	strh	r5, [r4, #20]	@ movhi
	mov	r0, #3
	ldr	r1, .L4+4
	strh	r5, [r4, #22]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r2, #22784
	mov	r0, #3
	strh	r2, [r4, #10]	@ movhi
	ldr	r3, .L4+8
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r6
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r6
	ldr	r2, .L4+24
	mov	r3, #3120
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r2, .L4+36
	ldr	r1, .L4+40
	mov	r3, #1024
	mov	lr, pc
	bx	r6
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+48
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L4+52
	ldr	r3, .L4+56
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+60
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+64
	ldr	r3, .L4+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+76
	str	r5, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	titlePal
	.word	7824
	.word	mountainSkyTiles
	.word	100714496
	.word	mountainSkyMap
	.word	7428
	.word	100679680
	.word	titleTiles
	.word	100722688
	.word	titleMap
	.word	stopSound
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	mainTheme_length
	.word	mainTheme_data
	.word	playSoundA
	.word	waitForVBlank
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r3, .L8
	push	{r4, lr}
	ldrh	ip, [r3, #48]
	ldr	r0, .L8+4
	ldr	r2, .L8+8
	ldr	r3, .L8+12
	strh	ip, [r0]	@ movhi
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	setupSounds
	.word	setupInterrupts
	.word	initializeGlobal
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r2, #4864
	mov	r5, #67108864
	ldr	r4, .L12
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	ldr	r2, .L12+8
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	ldr	r3, .L12+12
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L12+24
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+32
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L12+36
	ldr	r3, .L12+40
	mov	lr, pc
	bx	r3
	mov	r5, #3
	mov	ip, #0
	mov	lr, #213
	mov	r6, #1
	mov	r2, #16
	mov	r7, #135
	mov	r3, #2
	ldr	r1, .L12+44
	mov	r0, r5
	stm	r1, {r7, lr}
	str	ip, [r1, #24]
	str	ip, [r1, #36]
	str	ip, [r1, #44]
	str	r5, [r1, #40]
	str	r3, [r1, #28]
	str	r2, [r1, #16]
	str	r2, [r1, #20]
	str	r6, [r1, #8]
	str	r6, [r1, #12]
	mov	r3, #16384
	ldr	r2, .L12+48
	ldr	r1, .L12+52
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r3, #256
	ldr	r2, .L12+56
	ldr	r1, .L12+60
	mov	lr, pc
	bx	r4
	mov	r0, r5
	mov	r2, #117440512
	ldr	r1, .L12+64
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+72
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+76
	str	r6, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionsPal
	.word	7428
	.word	7376
	.word	100679680
	.word	instructionsTiles
	.word	100722688
	.word	instructionsMap
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	tempPlayer
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	shadowOAM
	.word	hideSprites
	.word	waitForVBlank
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L21
	ldr	r3, [r1]
	add	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #4
	movge	r3, r2
	mov	r0, #67108864
	asr	r3, r3, #2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	push	{r4, lr}
	str	r2, [r1]
	strh	r3, [r0, #20]	@ movhi
	ldr	r2, .L21+4
	mov	lr, pc
	bx	r2
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	pop	{r4, lr}
	b	goToInstructions
.L22:
	.align	2
.L21:
	.word	backgroundTimer
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	goToMapView
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMapView, %function
goToMapView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4352
	mov	r5, #67108864
	ldr	r4, .L26
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	ldr	r1, .L26+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	ldr	r2, .L26+8
	mov	r0, #3
	ldr	r3, .L26+12
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L26+16
	ldr	r2, .L26+20
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L26+24
	ldr	r1, .L26+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L26+32
	ldr	r1, .L26+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L26+40
	ldr	r1, .L26+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L26+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+56
	ldr	r0, .L26+60
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r3, .L26+64
	mov	lr, pc
	bx	r3
	ldr	r3, .L26+68
	ldr	r0, .L26+72
	ldr	r3, [r3]
	cmp	r3, r0
	beq	.L24
	ldr	r3, .L26+76
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r3, .L26+80
	mov	lr, pc
	bx	r3
.L24:
	mov	r3, #2
	ldr	r1, .L26+84
	ldr	r2, .L26+88
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	DMANow
	.word	mapPal
	.word	-9212
	.word	16160
	.word	mapTiles
	.word	100679680
	.word	100720640
	.word	mapMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	soundA
	.word	mapTheme_data
	.word	mapTheme_length
	.word	playSoundA
	.word	currentGameState
	.word	state
	.size	goToMapView, .-goToMapView
	.global	__aeabi_idivmod
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L58
	ldr	r3, [ip]
	add	r0, r3, #1
	cmp	r0, #0
	addlt	r3, r3, #4
	movge	r3, r0
	push	{r4, r5, r6, lr}
	mov	lr, #67108864
	ldr	r4, .L58+4
	ldr	r2, .L58+8
	ldr	r5, [r4, #24]
	smull	r6, r1, r2, r5
	asr	r2, r5, #31
	rsb	r2, r2, r1, asr #3
	asr	r3, r3, #2
	lsl	r3, r3, #16
	add	r2, r2, r2, lsl #2
	lsr	r3, r3, #16
	cmp	r5, r2, lsl #2
	str	r0, [ip]
	ldr	r1, [r4, #36]
	strh	r3, [lr, #20]	@ movhi
	bne	.L29
	add	r0, r1, #1
	ldr	r3, .L58+12
	ldr	r1, [r4, #40]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L29:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #28]
	lsl	r3, r3, #23
	ldr	r6, .L58+16
	ldrb	r0, [r4]	@ zero_extendqisi2
	add	r2, r2, r1, lsl #5
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	lsl	r2, r2, #1
	ldr	r1, .L58+20
	strh	r3, [r6, #2]	@ movhi
	strh	r0, [r6]	@ movhi
	strh	r2, [r6, #4]	@ movhi
	add	r5, r5, #1
	str	r5, [r4, #24]
	mov	lr, pc
	bx	r1
	ldr	r4, .L58+24
	mov	r3, #512
	mov	r1, r6
	mov	r2, #117440512
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L58+28
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L30
	ldr	r2, .L58+32
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L30
.L31:
	mov	r3, #512
	ldrh	r0, [r6]
	orr	r0, r0, r3
	mov	r2, #117440512
	ldr	r1, .L58+16
	strh	r0, [r6]	@ movhi
	ldr	r5, .L58+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	mov	r0, #0
	mvn	r2, #0
	ldr	r1, .L58+40
	ldr	r3, .L58+44
	str	r0, [r1]
	str	r2, [r3]
	mov	lr, pc
	bx	r5
	ldr	r3, .L58+48
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToMapView
.L30:
	tst	r3, #1
	beq	.L32
	ldr	r2, .L58+32
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L31
.L32:
	tst	r3, #2
	bne	.L57
.L33:
	tst	r3, #4
	beq	.L28
	ldr	r3, .L58+32
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L31
.L28:
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	ldr	r2, .L58+32
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L31
	b	.L33
.L59:
	.align	2
.L58:
	.word	backgroundTimer
	.word	tempPlayer
	.word	1717986919
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	doingCheat
	.word	textViewChoice
	.word	initMapView
	.size	instructions, .-instructions
	.align	2
	.global	goToTownView
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToTownView, %function
goToTownView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 200
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L63
	sub	sp, sp, #204
	mov	lr, pc
	bx	r7
	ldr	r3, .L63+4
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L63+8
	ldr	r3, .L63+12
	mov	lr, pc
	bx	r3
	ldr	ip, .L63+16
	ldmia	ip!, {r0, r1, r2, r3}
	mov	lr, ip
	mov	r8, sp
	ldr	fp, [lr], #4
	stmia	r8!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	add	r10, ip, #24
	add	r5, sp, #20
	stmia	r5!, {r0, r1, r2, r3}
	ldmia	r10!, {r0, r1, r2, r3}
	add	r4, sp, #40
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r2, [lr]
	ldr	r3, [r10]
	str	fp, [r8]
	add	fp, ip, #44
	str	r2, [r5]
	str	r3, [r4]
	ldmia	fp!, {r0, r1, r2, r3}
	add	r8, sp, #60
	stmia	r8!, {r0, r1, r2, r3}
	add	r10, ip, #64
	ldmia	r10!, {r0, r1, r2, r3}
	add	r4, sp, #80
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [fp]
	mov	r6, #67108864
	add	r5, ip, #84
	mov	r9, #7936
	str	r3, [r8]
	ldmia	r5!, {r0, r1, r2, r3}
	add	lr, sp, #100
	stmia	lr!, {r0, r1, r2, r3}
	ldr	r3, [r5]
	add	fp, ip, #104
	ldr	r10, [r10]
	str	r3, [lr]
	ldmia	fp!, {r0, r1, r2, r3}
	add	r8, sp, #120
	str	r10, [r4]
	stmia	r8!, {r0, r1, r2, r3}
	add	r10, ip, #124
	ldmia	r10!, {r0, r1, r2, r3}
	add	r4, sp, #140
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, [fp]
	add	r5, ip, #144
	str	r3, [r8]
	ldmia	r5!, {r0, r1, r2, r3}
	add	lr, sp, #160
	stmia	lr!, {r0, r1, r2, r3}
	ldr	r3, [r5]
	add	ip, ip, #164
	str	r3, [lr]
	ldr	r10, [r10]
	ldmia	ip!, {r0, r1, r2, r3}
	add	r8, sp, #180
	str	r10, [r4]
	stmia	r8!, {r0, r1, r2, r3}
	ldr	r5, .L63+20
	ldr	r3, [ip]
	str	r3, [r8]
	ldr	r3, [r5]
	add	r2, sp, #200
	add	r3, r2, r3, lsl #2
	ldr	r4, .L63+24
	ldr	r1, [r3, #-204]
	mov	r2, #83886080
	mov	r3, #128
	mov	r0, #3
	strh	r9, [r6]	@ movhi
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+28
	ldr	r2, [r5]
	strh	r3, [r6, #12]	@ movhi
	sub	r2, r2, #1
	add	r3, sp, #200
	add	r2, r3, r2, lsl #2
	ldr	r3, [r2, #-160]
	add	r3, r3, r3, lsr #31
	ldr	r1, [r2, #-180]
	mov	r0, #3
	ldr	r2, .L63+32
	asr	r3, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	add	r2, sp, #200
	add	r3, r2, r3, lsl #2
	ldr	r1, [r3, #-144]
	mov	r0, #3
	mov	r3, #2048
	ldr	r2, .L63+36
	mov	lr, pc
	bx	r4
	ldr	r2, .L63+40
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r6, #14]	@ movhi
	ldr	r1, .L63+44
	ldr	r2, .L63+48
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L63+52
	ldr	r1, .L63+56
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+60
	ldr	r2, [r5]
	strh	r3, [r6, #10]	@ movhi
	sub	r2, r2, #1
	add	r3, sp, #200
	add	r2, r3, r2, lsl #2
	ldr	r3, [r2, #-100]
	add	r3, r3, r3, lsr #31
	ldr	r1, [r2, #-120]
	mov	r0, #3
	ldr	r2, .L63+64
	asr	r3, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	add	r2, sp, #200
	add	r3, r2, r3, lsl #2
	ldr	r1, [r3, #-84]
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L63+68
	mov	lr, pc
	bx	r4
	mov	r3, #22784
	ldr	r2, [r5]
	strh	r3, [r6, #8]	@ movhi
	sub	r2, r2, #1
	add	r3, sp, #200
	add	r2, r3, r2, lsl #2
	ldr	r3, [r2, #-40]
	add	r3, r3, r3, lsr #31
	ldr	r1, [r2, #-60]
	mov	r0, #3
	mov	r2, #100663296
	asr	r3, r3, #1
	mov	lr, pc
	bx	r4
	ldr	r3, [r5]
	add	r2, sp, #200
	add	r3, r2, r3, lsl #2
	ldr	r1, [r3, #-24]
	mov	r0, #3
	mov	r3, #2048
	ldr	r2, .L63+72
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r7
	mov	r3, #512
	mov	r0, #3
	mov	r2, #117440512
	ldr	r1, .L63+76
	mov	lr, pc
	bx	r4
	ldr	r3, .L63+80
	ldr	r0, .L63+84
	ldr	r3, [r3]
	cmp	r3, r0
	beq	.L61
	ldr	r3, .L63+88
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r3, .L63+92
	mov	lr, pc
	bx	r3
.L61:
	mov	r3, #3
	ldr	r1, .L63+96
	ldr	r2, .L63+100
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #204
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	hideSprites
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	.LANCHOR0
	.word	canTravel
	.word	DMANow
	.word	23816
	.word	100696064
	.word	100722688
	.word	7948
	.word	wallsTiles
	.word	100712448
	.word	100726784
	.word	wallsMap
	.word	7172
	.word	100679680
	.word	100720640
	.word	100714496
	.word	shadowOAM
	.word	soundA
	.word	townThemeA_data
	.word	townThemeA_length
	.word	playSoundA
	.word	currentGameState
	.word	state
	.size	goToTownView, .-goToTownView
	.align	2
	.global	goToBattleView
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToBattleView, %function
goToBattleView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L68
	mov	lr, pc
	bx	r6
	mov	r5, #67108864
	mov	r2, #5632
	ldr	r4, .L68+4
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	ldr	r1, .L68+8
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	ldr	r2, .L68+12
	mov	r3, #3344
	mov	r0, #3
	strh	r2, [r5, #12]	@ movhi
	ldr	r1, .L68+16
	ldr	r2, .L68+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L68+24
	ldr	r1, .L68+28
	mov	lr, pc
	bx	r4
	ldr	r2, .L68+32
	mov	r3, #944
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L68+36
	ldr	r2, .L68+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L68+44
	ldr	r1, .L68+48
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r6
	mov	r3, #512
	mov	r0, #3
	mov	r2, #117440512
	ldr	r1, .L68+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L68+56
	ldr	r0, .L68+60
	ldr	r3, [r3]
	cmp	r3, r0
	beq	.L66
	ldr	r3, .L68+64
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r3, .L68+68
	mov	lr, pc
	bx	r3
.L66:
	mov	r3, #4
	ldr	r1, .L68+72
	ldr	r2, .L68+76
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	hideSprites
	.word	DMANow
	.word	battleSkyPal
	.word	23816
	.word	battleSkyTiles
	.word	100696064
	.word	100722688
	.word	battleSkyMap
	.word	7172
	.word	mountainGroundTiles
	.word	100679680
	.word	100720640
	.word	mountainGroundMap
	.word	shadowOAM
	.word	soundA
	.word	dungeonTheme_data
	.word	dungeonTheme_length
	.word	playSoundA
	.word	currentGameState
	.word	state
	.size	goToBattleView, .-goToBattleView
	.align	2
	.global	goToDungeonView
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToDungeonView, %function
goToDungeonView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L73
	mov	lr, pc
	bx	r5
	mov	r6, #67108864
	mov	r2, #4352
	ldr	r4, .L73+4
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	ldr	r1, .L73+8
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	ldr	r2, .L73+12
	mov	r3, #3088
	mov	r0, #3
	strh	r2, [r6, #8]	@ movhi
	ldr	r1, .L73+16
	ldr	r2, .L73+20
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L73+24
	ldr	r1, .L73+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L73+32
	ldr	r1, .L73+36
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L73+40
	ldr	r1, .L73+44
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L73+48
	mov	lr, pc
	bx	r4
	ldr	r3, .L73+52
	ldr	r0, .L73+56
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r3, .L73+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+64
	ldr	r0, .L73+68
	ldr	r3, [r3]
	cmp	r3, r0
	beq	.L71
	ldr	r3, .L73+72
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r3, .L73+76
	mov	lr, pc
	bx	r3
.L71:
	mov	r3, #5
	ldr	r1, .L73+80
	ldr	r2, .L73+84
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	hideSprites
	.word	DMANow
	.word	dungeonPal
	.word	-9212
	.word	dungeonTiles
	.word	100679680
	.word	100720640
	.word	dungeonMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	shadowOAM
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	soundA
	.word	dungeonTheme_data
	.word	dungeonTheme_length
	.word	playSoundA
	.word	currentGameState
	.word	state
	.size	goToDungeonView, .-goToDungeonView
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC17:
	.ascii	"\000"
	.align	2
.LC18:
	.ascii	"You: \000"
	.text
	.align	2
	.global	goToTextView
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToTextView, %function
goToTextView:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r3
	ldr	r3, .L77
	ldr	r9, [sp, #40]
	mov	r4, r2
	subs	r2, r5, r3
	movne	r2, #1
	subs	r3, r9, r3
	movne	r3, #1
	mvn	lr, #0
	ldr	r8, .L77+4
	ldr	ip, .L77+8
	ldr	fp, .L77+12
	str	r2, [r8]
	ldr	r10, .L77+16
	ldr	r8, .L77+20
	str	lr, [ip]
	mov	r6, r0
	mov	r7, r1
	str	r3, [fp]
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r8
	mov	r2, #67108864
	ldr	r1, .L77+24
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L77+28
	ldr	r10, .L77+32
	mov	lr, pc
	bx	r10
	ldr	r0, .L77+36
	ldr	r3, .L77+40
	mov	lr, pc
	bx	r3
	mov	r1, #16
	mov	r2, r4
	mov	r0, r1
	ldr	r4, .L77+44
	mov	r3, #15
	mov	lr, pc
	bx	r4
	mov	r2, r7
	mov	r3, #15
	mov	r1, #32
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r3, #15
	mov	r1, #112
	mov	r0, #16
	ldr	r2, .L77+48
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r3, #15
	mov	r1, #128
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r2, r5
	mov	r3, #15
	mov	r1, #109
	mov	r0, #178
	mov	lr, pc
	bx	r4
	mov	r2, r9
	mov	r1, #133
	mov	r0, #178
	mov	r3, #15
	mov	lr, pc
	bx	r4
	ldr	r3, .L77+52
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r8
	mov	r2, #7
	ldr	r3, .L77+56
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	.LC17
	.word	aEnabled
	.word	textViewChoice
	.word	bEnabled
	.word	hideSprites
	.word	flipPage
	.word	1044
	.word	textViewBackgroundPal
	.word	DMANow
	.word	textViewBackgroundBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	.LC18
	.word	waitForVBlank
	.word	state
	.size	goToTextView, .-goToTextView
	.align	2
	.global	textView
	.syntax unified
	.arm
	.fpu softvfp
	.type	textView, %function
textView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L109
	ldr	r3, .L109+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L80
	ldr	r2, .L109+8
	ldrh	r2, [r2]
	ands	r2, r2, #1
	beq	.L107
.L80:
	tst	r3, #2
	beq	.L79
	ldr	r3, .L109+8
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L79
	ldr	r2, .L109+12
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L108
.L79:
	pop	{r4, r5, r6, lr}
	bx	lr
.L107:
	ldr	r1, .L109+16
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L80
	ldr	r3, .L109+20
	ldr	r0, .L109+24
	ldr	r1, [r3]
	ldr	r3, .L109+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L109+32
	ldr	r5, .L109+36
	str	r2, [r3]
	mov	lr, pc
	bx	r5
	ldr	r3, .L109+40
	ldr	r0, .L109+44
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	ldr	r3, .L109+48
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L106
.L83:
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L82
.L108:
	ldr	r2, .L109+32
	ldr	r4, .L109+36
	str	r3, [r2]
	mov	lr, pc
	bx	r4
	ldr	r3, .L109+40
	ldr	r0, .L109+44
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r4
	ldr	r3, .L109+48
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L79
.L89:
	.word	.L92
	.word	.L91
	.word	.L90
	.word	.L88
.L88:
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L109+52
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToDungeonView
.L90:
	mov	r3, #67108864
	mov	r2, #6656
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	b	goToBattleView
.L91:
	mov	r3, #67108864
	mov	r2, #5888
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	b	goToTownView
.L92:
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L109+56
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToMapView
.L82:
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L109+52
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	bl	goToDungeonView
	ldrh	r3, [r4]
	b	.L80
.L84:
	mov	r3, #67108864
	mov	r2, #6656
	strh	r2, [r3]	@ movhi
	bl	goToBattleView
.L106:
	ldrh	r3, [r4]
	b	.L80
.L86:
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L109+56
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	bl	goToMapView
	ldrh	r3, [r4]
	b	.L80
.L85:
	mov	r3, #67108864
	mov	r2, #5888
	strh	r2, [r3]	@ movhi
	bl	goToTownView
	ldrh	r3, [r4]
	b	.L80
.L110:
	.align	2
.L109:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	bEnabled
	.word	aEnabled
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	textViewChoice
	.word	flipPage
	.word	drawFullscreenImage4
	.word	textViewBackgroundBitmap
	.word	currentGameState
	.word	initDungeonView
	.word	resumeMapView
	.size	textView, .-textView
	.section	.rodata.str1.4
	.align	2
.LC19:
	.ascii	"Coins: %d\000"
	.text
	.align	2
	.global	goToMerchantView
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMerchantView, %function
goToMerchantView:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L113
	ldr	r10, .L113+4
	mov	r6, r0
	mov	r7, r1
	mov	r4, r2
	mov	r5, r3
	ldr	r9, [sp, #32]
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r8
	mov	r2, #67108864
	ldr	r1, .L113+8
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L113+12
	ldr	r10, .L113+16
	mov	lr, pc
	bx	r10
	ldr	r0, .L113+20
	ldr	r3, .L113+24
	mov	lr, pc
	bx	r3
	mov	r1, #16
	mov	r2, r4
	mov	r0, r1
	ldr	r4, .L113+28
	mov	r3, #15
	mov	lr, pc
	bx	r4
	mov	r2, r7
	mov	r3, #15
	mov	r1, #32
	mov	r0, #16
	mov	lr, pc
	bx	r4
	ldr	r7, .L113+32
	ldr	r3, .L113+36
	mov	r0, r7
	ldr	r2, [r3]
	ldr	r1, .L113+40
	ldr	r3, .L113+44
	mov	lr, pc
	bx	r3
	mov	r2, r7
	mov	r3, #15
	mov	r1, #128
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r3, #15
	mov	r1, #112
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r2, r5
	mov	r3, #15
	mov	r1, #109
	mov	r0, #178
	mov	lr, pc
	bx	r4
	mov	r2, r9
	mov	r3, #15
	mov	r1, #133
	mov	r0, #178
	mov	lr, pc
	bx	r4
	mov	r2, r9
	mov	r1, #133
	mov	r0, #178
	mov	r3, #15
	mov	lr, pc
	bx	r4
	ldr	r3, .L113+48
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r8
	mov	r2, #8
	ldr	r3, .L113+52
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r2, [r3]
	bx	lr
.L114:
	.align	2
.L113:
	.word	flipPage
	.word	hideSprites
	.word	1044
	.word	textViewBackgroundPal
	.word	DMANow
	.word	textViewBackgroundBitmap
	.word	drawFullscreenImage4
	.word	drawString4
	.word	moneyBuffer
	.word	playerMoney
	.word	.LC19
	.word	sprintf
	.word	waitForVBlank
	.word	state
	.size	goToMerchantView, .-goToMerchantView
	.align	2
	.global	merchantView
	.syntax unified
	.arm
	.fpu softvfp
	.type	merchantView, %function
merchantView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r4, .L139
	ldr	r5, .L139+4
	ldr	r3, .L139+8
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L116
	ldr	r2, .L139+12
	ldrh	r2, [r2]
	ands	r2, r2, #1
	beq	.L137
.L116:
	tst	r3, #2
	beq	.L115
	ldr	r3, .L139+12
	ldrh	r3, [r3]
	ands	r3, r3, #2
	beq	.L138
.L115:
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	ldr	r5, .L139+16
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, .L139+20
	ldr	r0, .L139+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	ldr	r3, .L139+28
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L115
.L125:
	.word	.L128
	.word	.L127
	.word	.L126
	.word	.L124
.L137:
	ldr	r3, .L139+32
	ldr	r0, .L139+36
	ldr	r1, [r3]
	ldr	r3, .L139+40
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r6, .L139+16
	str	r3, [r4]
	mov	lr, pc
	bx	r6
	ldr	r3, .L139+20
	ldr	r0, .L139+24
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r6
	ldr	r3, .L139+28
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L136
.L119:
	.word	.L122
	.word	.L121
	.word	.L120
	.word	.L118
.L118:
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L139+44
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	bl	goToDungeonView
	ldrh	r3, [r5]
	b	.L116
.L120:
	mov	r2, #67108864
	mov	r1, #6656
	ldr	r3, .L139+48
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	bl	goToBattleView
.L136:
	ldrh	r3, [r5]
	b	.L116
.L122:
	mov	r3, #67108864
	mov	r2, #4352
	strh	r2, [r3]	@ movhi
	bl	goToMapView
	ldrh	r3, [r5]
	b	.L116
.L121:
	mov	r3, #67108864
	mov	r2, #5888
	strh	r2, [r3]	@ movhi
	bl	goToTownView
	ldrh	r3, [r5]
	b	.L116
.L124:
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L139+44
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToDungeonView
.L126:
	mov	r2, #67108864
	mov	r1, #6656
	ldr	r3, .L139+48
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	b	goToBattleView
.L127:
	mov	r3, #67108864
	mov	r2, #5888
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	b	goToTownView
.L128:
	mov	r3, #67108864
	mov	r2, #4352
	pop	{r4, r5, r6, lr}
	strh	r2, [r3]	@ movhi
	b	goToMapView
.L140:
	.align	2
.L139:
	.word	textViewChoice
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	flipPage
	.word	drawFullscreenImage4
	.word	textViewBackgroundBitmap
	.word	currentGameState
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	initDungeonView
	.word	initBattleView
	.size	merchantView, .-merchantView
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #768
	mov	r4, #67108864
	mov	r5, #0
	strh	r3, [r4]	@ movhi
	ldr	r7, .L143
	mov	lr, pc
	bx	r7
	ldr	r6, .L143+4
	strh	r5, [r4, #16]	@ movhi
	mov	r3, #256
	strh	r5, [r4, #18]	@ movhi
	mov	r2, #83886080
	strh	r5, [r4, #20]	@ movhi
	mov	r0, #3
	ldr	r1, .L143+8
	strh	r5, [r4, #22]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r2, #22784
	mov	r0, #3
	strh	r2, [r4, #10]	@ movhi
	ldr	r3, .L143+12
	mov	r2, #100663296
	ldr	r1, .L143+16
	mov	lr, pc
	bx	r6
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L143+20
	ldr	r1, .L143+24
	mov	lr, pc
	bx	r6
	ldr	r2, .L143+28
	mov	r3, #1568
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L143+32
	ldr	r1, .L143+36
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r2, .L143+40
	ldr	r1, .L143+44
	mov	r3, #1024
	mov	lr, pc
	bx	r6
	ldr	r3, .L143+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+52
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L143+56
	ldr	r3, .L143+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L143+64
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r7
	mov	r2, #9
	ldr	r3, .L143+68
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L144:
	.align	2
.L143:
	.word	hideSprites
	.word	DMANow
	.word	pausePal
	.word	7824
	.word	mountainSkyTiles
	.word	100714496
	.word	mountainSkyMap
	.word	7428
	.word	100679680
	.word	pauseTiles
	.word	100722688
	.word	pauseMap
	.word	pauseSound
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC20:
	.ascii	"Yes\000"
	.align	2
.LC21:
	.ascii	"Activate gruelsome mode?\000"
	.align	2
.LC22:
	.ascii	"No\000"
	.align	2
.LC23:
	.ascii	"Are you ready for this battle?\000"
	.align	2
.LC24:
	.ascii	"There is no turning back.\000"
	.text
	.align	2
	.global	mapView
	.syntax unified
	.arm
	.fpu softvfp
	.type	mapView, %function
mapView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L171
	ldr	r3, [r4]
	cmp	r3, #1
	sub	sp, sp, #8
	beq	.L165
.L146:
	ldr	r6, .L171+4
	ldr	r2, [r6]
	cmp	r2, #0
	cmpne	r3, #0
	bne	.L166
.L147:
	ldr	r3, .L171+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L171+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L167
.L148:
	ldr	r5, .L171+16
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L149
	ldr	r2, .L171+20
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L168
.L149:
	tst	r3, #1
	beq	.L145
	ldr	r3, .L171+20
	ldrh	r3, [r3]
	ands	ip, r3, #1
	bne	.L145
	ldr	r3, .L171+24
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L145
	cmp	r3, #69
	beq	.L169
	cmp	r3, #6
	beq	.L170
	ldr	lr, .L171+28
	sub	r3, r3, #1
	add	lr, lr, r3, lsl #5
	ldmia	lr!, {r0, r1, r2, r3}
	ldr	r4, .L171+32
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r6, .L171+36
	ldm	lr, {r0, r1, r2, r3}
	ldr	r5, .L171+40
	stm	r4, {r0, r1, r2, r3}
	str	ip, [r6]
	mov	lr, pc
	bx	r5
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	b	goToTownView
.L170:
	mov	r5, #1
	ldr	r3, .L171+44
	ldr	r1, .L171+48
	ldr	r0, .L171+36
	str	r3, [sp]
	ldr	r2, .L171+52
	ldr	r3, .L171+56
	str	r5, [r1]
	str	ip, [r0]
	ldr	r1, .L171+60
	ldr	r0, .L171+64
	bl	goToTextView
	ldr	r3, [r4]
	cmp	r3, r5
	str	r5, [r6]
	bne	.L145
	bl	goToDungeonView
	ldr	r3, .L171+68
	mov	lr, pc
	bx	r3
.L145:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L165:
	ldr	r2, .L171+36
	ldr	r1, [r2]
	cmp	r1, #0
	beq	.L146
	ldr	r1, .L171+72
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L146
	mov	r6, #10
	mov	r5, #60
	mov	lr, #66
	mov	ip, #6
	str	r0, [r2]
	ldr	r2, .L171+76
	str	r6, [r2]
	ldr	r2, .L171+80
	str	r3, [r1]
	str	r5, [r2]
	ldr	r1, .L171+84
	ldr	r2, .L171+88
	str	lr, [r1]
	str	ip, [r2]
	b	.L146
.L167:
	mvn	r2, #0
	ldr	r3, .L171+92
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	bl	goToBattleView
	b	.L148
.L168:
	bl	goToPause
	ldrh	r3, [r5]
	b	.L149
.L166:
	bl	goToDungeonView
	ldr	r3, .L171+68
	mov	lr, pc
	bx	r3
	b	.L147
.L169:
	mov	r1, #1
	mvn	ip, #0
	ldr	r0, .L171+44
	ldr	r2, .L171+64
	ldr	r3, .L171+36
	str	r0, [sp]
	str	r1, [r3]
	mov	r0, r2
	ldr	r3, .L171+56
	ldr	r1, .L171+96
	str	ip, [r4]
	bl	goToTextView
	b	.L145
.L172:
	.align	2
.L171:
	.word	textViewChoice
	.word	playerReady
	.word	updateMapView
	.word	drawMapView
	.word	oldButtons
	.word	buttons
	.word	canTravel
	.word	towns
	.word	currentTown
	.word	doingCheat
	.word	initTownView
	.word	.LC22
	.word	dungeonUnlocked
	.word	.LC23
	.word	.LC20
	.word	.LC24
	.word	.LC17
	.word	initDungeonView
	.word	cheatActive
	.word	playerHealth
	.word	playerShootSpeed
	.word	playerMoney
	.word	dungeonKeys
	.word	initBattleView
	.word	.LC21
	.size	mapView, .-mapView
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L192
	ldr	r3, [r1]
	add	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #8
	movge	r3, r2
	mov	r0, #67108864
	asr	r3, r3, #3
	lsl	r3, r3, #16
	push	{r4, lr}
	lsr	r3, r3, #16
	ldr	r4, .L192+4
	str	r2, [r1]
	strh	r3, [r0, #20]	@ movhi
	ldr	r2, .L192+8
	mov	lr, pc
	bx	r2
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L174
	ldr	r2, .L192+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L190
.L174:
	tst	r3, #4
	beq	.L173
	ldr	r3, .L192+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L191
.L173:
	pop	{r4, lr}
	bx	lr
.L191:
	pop	{r4, lr}
	b	goToStart
.L190:
	ldr	r3, .L192+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L192+20
	ldr	r3, [r3]
	sub	r3, r3, #2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L189
.L177:
	.word	.L180
	.word	.L179
	.word	.L178
	.word	.L176
.L176:
	mov	r3, #67108864
	mov	r2, #4352
	strh	r2, [r3]	@ movhi
	bl	goToDungeonView
	ldrh	r3, [r4]
	b	.L174
.L178:
	mov	r3, #67108864
	mov	r2, #6656
	strh	r2, [r3]	@ movhi
	bl	goToBattleView
.L189:
	ldrh	r3, [r4]
	b	.L174
.L180:
	mov	r3, #67108864
	mov	r2, #4352
	strh	r2, [r3]	@ movhi
	bl	goToMapView
	ldrh	r3, [r4]
	b	.L174
.L179:
	mov	r3, #67108864
	mov	r2, #4864
	strh	r2, [r3]	@ movhi
	bl	goToTownView
	ldrh	r3, [r4]
	b	.L174
.L193:
	.align	2
.L192:
	.word	backgroundTimer
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	unpauseSound
	.word	currentGameState
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #67108864
	mov	r7, #256
	mov	r5, #0
	strh	r7, [r4]	@ movhi
	ldr	r3, .L196
	mov	lr, pc
	bx	r3
	ldr	r6, .L196+4
	strh	r5, [r4, #16]	@ movhi
	mov	r3, r7
	strh	r5, [r4, #18]	@ movhi
	mov	r2, #83886080
	strh	r5, [r4, #20]	@ movhi
	mov	r0, #3
	ldr	r1, .L196+8
	strh	r5, [r4, #22]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r2, #22784
	mov	r0, #3
	strh	r2, [r4, #10]	@ movhi
	ldr	r3, .L196+12
	mov	r2, #100663296
	ldr	r1, .L196+16
	mov	lr, pc
	bx	r6
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L196+20
	ldr	r1, .L196+24
	mov	lr, pc
	bx	r6
	ldr	r2, .L196+28
	mov	r3, #2240
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L196+32
	ldr	r1, .L196+36
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r2, .L196+40
	ldr	r1, .L196+44
	mov	r3, #1024
	mov	lr, pc
	bx	r6
	ldr	r3, .L196+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L196+52
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L196+56
	ldr	r3, .L196+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L196+64
	mov	lr, pc
	bx	r3
	mov	r2, #10
	ldr	r3, .L196+68
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L197:
	.align	2
.L196:
	.word	hideSprites
	.word	DMANow
	.word	winPal
	.word	7824
	.word	mountainSkyTiles
	.word	100714496
	.word	mountainSkyMap
	.word	7428
	.word	100679680
	.word	winTiles
	.word	100722688
	.word	winMap
	.word	stopSound
	.word	gameWin_length
	.word	gameWin_data
	.word	playSoundB
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L207
	ldr	r3, [r1]
	add	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #8
	movge	r3, r2
	mov	r0, #67108864
	push	{r4, r5, lr}
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	str	r2, [r1]
	sub	sp, sp, #36
	strh	r3, [r0, #20]	@ movhi
	ldr	r2, .L207+4
	mov	lr, pc
	bx	r2
	ldr	r3, .L207+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L198
	ldr	r3, .L207+12
	ldrh	r4, [r3]
	ands	r4, r4, #8
	beq	.L206
.L198:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L206:
	ldr	r3, .L207+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L207+20
	ldr	r0, .L207+24
	str	r4, [r3]
	ldr	r1, .L207+28
	ldr	r2, .L207+32
	ldr	r3, .L207+36
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	ldr	r0, .L207+40
	ldr	r1, .L207+44
	ldr	r2, .L207+48
	ldr	r3, .L207+52
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	ldr	r0, .L207+56
	ldr	r1, .L207+60
	ldr	r2, .L207+64
	ldr	r3, .L207+68
	mov	r5, r4
	str	r4, [r0]
	str	r4, [r1]
	str	r4, [r2]
	str	r4, [r3]
	ldr	r4, .L207+72
.L200:
	mov	lr, sp
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, r4, r5, lsl #5
	stmia	ip!, {r0, r1, r2, r3}
	add	r5, r5, #1
	ldm	lr, {r0, r1, r2, r3}
	cmp	r5, #6
	stm	ip, {r0, r1, r2, r3}
	bne	.L200
	mov	lr, #5
	mov	r3, #0
	mov	r0, #2
	ldr	r2, .L207+76
	ldr	ip, .L207+80
	ldr	r1, .L207+84
	str	lr, [r2]
	ldr	r2, .L207+88
	ldr	lr, .L207+92
	str	r3, [ip]
	str	r3, [r1]
	ldr	ip, .L207+96
	ldr	r1, .L207+100
	str	r3, [r2]
	ldr	r2, .L207+104
	str	r3, [lr]
	str	r3, [ip]
	str	r0, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L207+108
	mov	lr, pc
	bx	r3
	ldr	r3, .L207+112
	mov	lr, pc
	bx	r3
	bl	initialize
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, lr}
	b	goToStart
.L208:
	.align	2
.L207:
	.word	backgroundTimer
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	dungeonUnlocked
	.word	playerHasBow
	.word	bossDead
	.word	meadCollected
	.word	boughtKey
	.word	bountyStarted
	.word	bountyKilled
	.word	bountyCompleted
	.word	letterStarted
	.word	letterRecieved
	.word	letterCompleted
	.word	dungeonKeys
	.word	playerReady
	.word	towns
	.word	playerHealth
	.word	playerMoney
	.word	cheatActive
	.word	touchingMead
	.word	playerShootSpeed
	.word	canTravel
	.word	currentGameState
	.word	resetMapView
	.word	resetTownView
	.word	resetGlobal
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #67108864
	mov	r7, #256
	mov	r5, #0
	strh	r7, [r4]	@ movhi
	ldr	r3, .L212
	mov	lr, pc
	bx	r3
	ldr	r6, .L212+4
	strh	r5, [r4, #16]	@ movhi
	mov	r3, r7
	strh	r5, [r4, #18]	@ movhi
	mov	r2, #83886080
	strh	r5, [r4, #20]	@ movhi
	mov	r0, #3
	ldr	r1, .L212+8
	strh	r5, [r4, #22]	@ movhi
	mov	lr, pc
	bx	r6
	mov	r2, #22784
	mov	r0, #3
	strh	r2, [r4, #10]	@ movhi
	ldr	r3, .L212+12
	mov	r2, #100663296
	ldr	r1, .L212+16
	mov	lr, pc
	bx	r6
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L212+20
	ldr	r1, .L212+24
	mov	lr, pc
	bx	r6
	ldr	r2, .L212+28
	mov	r3, #3072
	strh	r2, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L212+32
	ldr	r1, .L212+36
	mov	lr, pc
	bx	r6
	mov	r0, #3
	ldr	r2, .L212+40
	ldr	r1, .L212+44
	mov	r3, #1024
	mov	lr, pc
	bx	r6
	ldr	r3, .L212+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L212+52
	mov	r2, r5
	ldr	r1, [r3]
	ldr	r0, .L212+56
	ldr	r3, .L212+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L212+64
	ldr	r2, [r3]
	sub	r2, r2, #3
	str	r2, [r3]
	ldr	r2, [r3]
	cmp	r2, r5
	strle	r5, [r3]
	ldr	r3, .L212+68
	mov	lr, pc
	bx	r3
	mov	r2, #11
	ldr	r3, .L212+72
	pop	{r4, r5, r6, r7, r8, lr}
	str	r2, [r3]
	bx	lr
.L213:
	.align	2
.L212:
	.word	hideSprites
	.word	DMANow
	.word	losePal
	.word	7824
	.word	mountainSkyTiles
	.word	100714496
	.word	mountainSkyMap
	.word	7428
	.word	100679680
	.word	loseTiles
	.word	100722688
	.word	loseMap
	.word	stopSound
	.word	playerDie_length
	.word	playerDie_data
	.word	playSoundA
	.word	playerMoney
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	townView
	.syntax unified
	.arm
	.fpu softvfp
	.type	townView, %function
townView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L228
	mov	lr, pc
	bx	r3
	ldr	r4, .L228+4
	ldr	r3, .L228+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L228+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L225
.L215:
	ldr	r4, .L228+16
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L216
	ldr	r2, .L228+20
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L226
.L216:
	tst	r3, #4
	beq	.L214
	ldr	r3, .L228+20
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L227
.L214:
	pop	{r4, lr}
	bx	lr
.L225:
	bl	goToLose
	mov	r3, #3
	str	r3, [r4]
	b	.L215
.L227:
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L228+24
	ldr	lr, .L228+28
	ldr	r4, [r3]
	ldr	ip, .L228+32
	strh	r1, [r2]	@ movhi
	sub	r4, r4, #1
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, ip, r4, lsl #5
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	ldr	r4, .L228+36
	stm	ip, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToMapView
.L226:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L216
.L229:
	.align	2
.L228:
	.word	updateTownView
	.word	playerHealth
	.word	drawTownView
	.word	updateGlobal
	.word	oldButtons
	.word	buttons
	.word	canTravel
	.word	currentTown
	.word	towns
	.word	resumeMapView
	.size	townView, .-townView
	.align	2
	.global	battleView
	.syntax unified
	.arm
	.fpu softvfp
	.type	battleView, %function
battleView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L241
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	bne	.L231
	ldr	r3, .L241+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L241+8
	ldr	r3, .L241+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L241+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L238
	ldr	r3, .L241+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L230
.L240:
	ldr	r3, .L241+24
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L230
	ldr	r3, .L241+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L239
.L230:
	pop	{r4, lr}
	bx	lr
.L231:
	ldr	r3, .L241+32
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L241+36
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMapView
.L238:
	bl	goToLose
	mov	r3, #3
	str	r3, [r4]
	ldr	r3, .L241+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L230
	b	.L240
.L239:
	pop	{r4, lr}
	b	goToPause
.L242:
	.align	2
.L241:
	.word	battleViewDefeated
	.word	updateBattleView
	.word	playerHealth
	.word	drawBattleView
	.word	updateGlobal
	.word	oldButtons
	.word	buttons
	.word	inMode4
	.word	flipPage
	.word	resumeMapView
	.size	battleView, .-battleView
	.align	2
	.global	dungeonView
	.syntax unified
	.arm
	.fpu softvfp
	.type	dungeonView, %function
dungeonView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L272
	mov	lr, pc
	bx	r3
	ldr	r4, .L272+4
	ldr	r3, .L272+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L272+12
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L269
.L244:
	ldr	r3, .L272+16
	ldr	r2, [r3]
	ldr	r3, .L272+20
	cmp	r2, #0
	ldr	r4, .L272+24
	ldr	r2, [r3]
	beq	.L245
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L245
	ldr	r1, .L272+28
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L245
	mov	r0, #1
	ldr	r1, .L272+32
	cmp	r2, #0
	str	r0, [r1]
	beq	.L247
.L246:
	bl	goToWin
.L268:
	ldrh	r3, [r4]
.L247:
	tst	r3, #8
	beq	.L250
	ldr	r2, .L272+28
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L270
.L250:
	tst	r3, #4
	beq	.L243
	ldr	r3, .L272+28
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L271
.L243:
	pop	{r4, lr}
	bx	lr
.L245:
	cmp	r2, #0
	beq	.L268
	ldr	r3, .L272+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L268
	b	.L246
.L269:
	bl	goToLose
	mov	r3, #3
	str	r3, [r4]
	b	.L244
.L271:
	mov	r2, #67108864
	mov	r1, #4352
	ldr	r3, .L272+36
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMapView
.L270:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L250
.L273:
	.align	2
.L272:
	.word	updateDungeonView
	.word	playerHealth
	.word	drawDungeonView
	.word	updateGlobal
	.word	touchingMead
	.word	bossDead
	.word	oldButtons
	.word	buttons
	.word	meadCollected
	.word	resumeMapView
	.size	dungeonView, .-dungeonView
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L281
	ldr	r3, [r1]
	add	r2, r3, #1
	cmp	r2, #0
	addlt	r3, r3, #8
	movge	r3, r2
	mov	r0, #67108864
	asr	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	push	{r4, lr}
	str	r2, [r1]
	strh	r3, [r0, #20]	@ movhi
	ldr	r2, .L281+4
	mov	lr, pc
	bx	r2
	ldr	r3, .L281+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L274
	ldr	r3, .L281+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L280
.L274:
	pop	{r4, lr}
	bx	lr
.L280:
	pop	{r4, lr}
	b	goToStart
.L282:
	.align	2
.L281:
	.word	backgroundTimer
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L301
	mov	lr, pc
	bx	r3
	ldr	r6, .L301+4
	ldr	r7, .L301+8
	ldr	r5, .L301+12
	ldr	fp, .L301+16
	ldr	r10, .L301+20
	ldr	r9, .L301+24
	ldr	r8, .L301+28
	ldr	r4, .L301+32
.L284:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L285:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #11
	ldrls	pc, [pc, r2, asl #2]
	b	.L285
.L287:
	.word	.L297
	.word	.L296
	.word	.L295
	.word	.L294
	.word	.L293
	.word	.L292
	.word	.L285
	.word	.L291
	.word	.L290
	.word	.L289
	.word	.L288
	.word	.L286
.L286:
	ldr	r3, .L301+36
	mov	lr, pc
	bx	r3
	b	.L284
.L288:
	ldr	r3, .L301+40
	mov	lr, pc
	bx	r3
	b	.L284
.L289:
	ldr	r3, .L301+44
	mov	lr, pc
	bx	r3
	b	.L284
.L290:
	ldr	r3, .L301+48
	mov	lr, pc
	bx	r3
	b	.L284
.L291:
	ldr	r3, .L301+52
	mov	lr, pc
	bx	r3
	b	.L284
.L292:
	ldr	r3, .L301+56
	mov	lr, pc
	bx	r3
	b	.L284
.L293:
	ldr	r3, .L301+60
	mov	lr, pc
	bx	r3
	b	.L284
.L294:
	mov	lr, pc
	bx	r8
	b	.L284
.L295:
	mov	lr, pc
	bx	r9
	b	.L284
.L296:
	mov	lr, pc
	bx	r10
	b	.L284
.L297:
	mov	lr, pc
	bx	fp
	b	.L284
.L302:
	.align	2
.L301:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	instructions
	.word	mapView
	.word	townView
	.word	67109120
	.word	lose
	.word	win
	.word	pause
	.word	merchantView
	.word	textView
	.word	dungeonView
	.word	battleView
	.size	main, .-main
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	tempPlayer,64,4
	.comm	bEnabled,4,4
	.comm	aEnabled,4,4
	.comm	cheatAnswers,16,4
	.comm	doingCheat,4,4
	.comm	failedCheat,4,4
	.comm	cheatHelperVar,4,4
	.comm	backgroundTimer,4,4
	.comm	moneyBuffer,10,4
	.comm	playerReady,4,4
	.comm	dungeonUnlocked,4,4
	.comm	currentGameState,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC10:
	.word	mountainBuildingsMediumPal
	.word	mountainBuildingsSmallPal
	.word	sandBuildingsSmallPal
	.word	mountainBuildingsLargePal
	.word	sandBuildingsLargePal
.LC11:
	.word	snowSkyTiles
	.word	mountainSkyTiles
	.word	sandSkyTiles
	.word	mountainSkyTiles
	.word	sandSkyTiles
.LC2:
	.word	13824
	.word	15648
	.word	7712
	.word	15648
	.word	7712
.LC12:
	.word	snowSkyMap
	.word	mountainSkyMap
	.word	sandSkyMap
	.word	mountainSkyMap
	.word	sandSkyMap
.LC13:
	.word	snowGroundTiles
	.word	mountainGroundTiles
	.word	sandGroundTiles
	.word	mountainGroundTiles
	.word	sandGroundTiles
.LC5:
	.word	2144
	.word	1888
	.word	2336
	.word	1888
	.word	2336
.LC14:
	.word	snowGroundMap
	.word	mountainGroundMap
	.word	sandGroundMap
	.word	mountainGroundMap
	.word	sandGroundMap
.LC15:
	.word	mountainBuildingsMediumTiles
	.word	mountainBuildingsSmallTiles
	.word	sandBuildingsSmallTiles
	.word	mountainBuildingsLargeTiles
	.word	sandBuildingsLargeTiles
.LC8:
	.word	7680
	.word	9024
	.word	12064
	.word	12160
	.word	12512
.LC16:
	.word	mountainBuildingsMediumMap
	.word	mountainBuildingsSmallMap
	.word	sandBuildingsSmallMap
	.word	mountainBuildingsLargeMap
	.word	sandBuildingsLargeMap
	.ident	"GCC: (devkitARM release 53) 9.1.0"
