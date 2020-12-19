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
	.file	"townView.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTownViewPlayer.part.0, %function
drawTownViewPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L4
	ldr	r2, .L4+4
	ldr	r3, [r0, #4]
	ldr	r1, [r2]
	ldr	r2, .L4+8
	str	lr, [sp, #-4]!
	ldr	ip, [r0, #36]
	ldr	lr, [r2]
	sub	r3, r3, r1
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	lsl	r3, r3, #23
	ldr	r0, .L4+12
	sub	r1, r1, lr
	lsr	r3, r3, #23
	add	r2, r2, ip, lsl #5
	orr	r3, r3, #16384
	and	r1, r1, #255
	lsl	r2, r2, #1
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawTownViewPlayer.part.0, .-drawTownViewPlayer.part.0
	.align	2
	.global	setUpTown
	.syntax unified
	.arm
	.fpu softvfp
	.type	setUpTown, %function
setUpTown:
	@ Function supports interworking.
	@ args = 32, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
	sub	ip, sp, #4
	stmib	ip, {r0, r1, r2, r3}
	add	sp, sp, #16
	bx	lr
	.size	setUpTown, .-setUpTown
	.align	2
	.global	initTownViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTownViewPlayer, %function
initTownViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r0, #16
	mov	r4, #127
	mov	lr, #20
	mov	r1, #1
	mov	ip, #3
	ldr	r3, .L10
	stm	r3, {r4, lr}
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3, #40]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.size	initTownViewPlayer, .-initTownViewPlayer
	.align	2
	.global	resetTownView
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetTownView, %function
resetTownView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 624
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L16
	ldr	r6, .L16+4
	add	r5, r4, #3712
	sub	sp, sp, #624
	add	r5, r5, #8
.L13:
	mov	r2, #620
	mov	r0, r4
	add	r1, sp, #4
	add	r4, r4, r2
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L13
	mov	r3, #0
	ldr	r0, .L16+8
	ldr	r1, .L16+12
	ldr	r2, .L16+16
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	ldr	lr, .L16+20
	ldr	ip, .L16+24
	ldr	r0, .L16+28
	ldr	r1, .L16+32
	ldr	r2, .L16+36
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	add	sp, sp, #624
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	villagers
	.word	memcpy
	.word	playerShootCooldown
	.word	savedWorldRow
	.word	savedWorldCol
	.word	savedvOff
	.word	savedhOff
	.word	playerTookDamage
	.word	damageTimer
	.word	playerIsMoving
	.size	resetTownView, .-resetTownView
	.global	__aeabi_idiv
	.align	2
	.global	initTownViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTownViewVillagers, %function
initTownViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L70
	ldr	r2, [r6, #24]
	cmp	r2, #2
	movgt	r1, #0
	movle	r1, #2
	ldr	r3, [r6, #12]
	ldr	r0, .L70+4
	cmp	r3, #3
	str	r1, [r0]
	sub	sp, sp, #12
	beq	.L67
	mov	r0, #0
	mov	r1, #1
	cmp	r2, r0
	ldr	r2, .L70+4
	str	r0, [r2, #620]
	str	r1, [r2, #692]
	bne	.L24
.L22:
	mov	ip, #3
	mov	r0, #1
	mov	r1, #0
	mov	r2, #140
	ldr	lr, .L70+4
	str	ip, [lr, #1860]
	str	r0, [lr, #2472]
	str	r1, [lr, #1932]
	str	r2, [lr, #1872]
.L24:
	cmp	r3, #0
	bne	.L25
	ldr	r2, .L70+4
	str	r3, [r2, #1240]
.L23:
	ldr	r3, [r6, #4]
	cmp	r3, #5
	ble	.L27
	mov	r1, #1
	ldr	r2, [r6, #16]
	ldr	r0, .L70+4
	cmp	r2, #0
	str	r1, [r0, #1860]
	bne	.L28
	mov	r1, #152
	str	r2, [r0, #1960]
	str	r2, [r0, #1932]
	str	r1, [r0, #1872]
.L27:
	ldr	r2, [r6, #8]
	cmp	r2, #0
	bne	.L30
	mov	r1, #3
	ldr	r0, .L70+4
	str	r2, [r0, #672]
	str	r1, [r0, #624]
.L33:
	cmp	r3, #0
	ble	.L32
	mov	fp, #0
	mov	r5, fp
	mov	r7, fp
	mov	r8, fp
	ldr	r4, .L70+4
	ldr	r9, .L70+8
	ldr	r10, .L70+12
.L44:
	ldr	r3, .L70+16
	mov	r0, #0
	mov	lr, pc
	bx	r3
	adds	r0, r5, r0
	adc	r1, r8, r1
	mov	lr, pc
	bx	r9
	ldr	r3, [r10]
	cmp	r3, #0
	movne	r3, #4
	mov	r2, #1
	mov	r0, #16
	ldr	r1, [r6, #20]
	strne	r3, [r4]
	ldr	r3, [r6, #4]
	rsb	r1, r1, #144
	str	r1, [r4, #8]
	str	r0, [r4, #24]
	add	r1, r3, r2
	str	r0, [r4, #28]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [sp, #4]
	mov	r0, #500
	ldr	r3, .L70+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	mov	r1, #3
	mul	r0, fp, r0
	add	r0, r0, #150
	cmp	r0, #492
	str	r2, [r4, #56]
	rsbgt	r2, fp, fp, lsl #28
	rsbgt	r2, fp, r2, lsl #2
	lslgt	r2, r2, #2
	addgt	r2, r2, #500
	str	r0, [r4, #12]
	strgt	r2, [r4, #12]
	ldr	r2, .L70+24
	ldr	r0, [r2]
	ldr	r2, .L70+28
	str	r1, [r4, #48]
	str	r1, [r4, #4]
	ldr	r1, [r2, #4]
	ldr	r2, .L70+32
	ldr	r2, [r2]
	add	r0, r0, r1
	add	r0, r0, r2
	ldr	r2, .L70+36
	ldr	r3, [sp, #4]
	ldr	r2, [r2]
	add	r0, r0, r3
	add	r0, r0, r2
	add	r0, r0, fp
	str	r7, [r4, #32]
	str	r7, [r4, #44]
	str	r7, [r4, #80]
	str	r7, [r4, #108]
	mov	lr, pc
	bx	r9
	ldr	r3, .L70+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+44
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	ldr	r2, [r4]
	sub	r0, r0, r3, lsl #1
	str	r0, [r4, #96]
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L36
.L38:
	.word	.L40
	.word	.L40
	.word	.L40
	.word	.L39
	.word	.L37
.L67:
	ldr	r1, .L70+48
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L21
	ldr	r1, .L70+52
	ldr	r1, [r1]
	cmp	r1, #0
	bne	.L21
	mov	r0, #4
	mov	r1, #1
	cmp	r2, #0
	ldr	r2, .L70+4
	str	r0, [r2, #620]
	str	r1, [r2, #692]
	beq	.L22
.L25:
	mov	r2, #3
	ldr	r1, .L70+4
	str	r3, [r1, #1852]
	str	r2, [r1, #1240]
	b	.L23
.L40:
	mov	r3, #1
	str	r3, [r4, #72]
.L36:
	ldr	r3, [r6, #4]
	adds	r5, r5, #100
	add	fp, fp, #1
	adc	r8, r8, #0
	cmp	r3, fp
	add	r4, r4, #620
	bgt	.L44
.L32:
	ldr	r2, [r6, #24]
	cmp	r2, #0
	moveq	r1, #140
	ldreq	r0, .L70+4
	streq	r2, [r0, #1932]
	streq	r1, [r0, #1872]
	cmp	r3, #6
	beq	.L68
.L18:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L39:
	mov	r3, #1
	ldr	r2, [r6, #12]
	cmp	r2, #2
	str	r3, [r4, #72]
	moveq	r3, #300
	streq	r7, [r4, #72]
	streq	r3, [r4, #12]
	b	.L36
.L37:
	mov	ip, #1
	mov	lr, #3
	mov	r3, r4
	mov	r1, #0
	mov	r0, #16
	mov	r2, ip
	str	ip, [r4, #72]
	str	lr, [r4, #4]
	ldr	ip, [r4, #12]
	ldr	lr, [r4, #8]
.L43:
	add	r1, r1, #1
	cmp	r1, #6
	str	r0, [r3, #140]
	str	r0, [r3, #144]
	str	r2, [r3, #132]
	str	r2, [r3, #136]
	str	lr, [r3, #124]
	str	ip, [r3, #128]
	str	r2, [r3, #168]
	str	r2, [r3, #172]
	add	r3, r3, #64
	bne	.L43
	str	r0, [r4, #524]
	str	r0, [r4, #528]
	str	r2, [r4, #516]
	str	r2, [r4, #520]
	str	lr, [r4, #508]
	str	ip, [r4, #512]
	str	r2, [r4, #552]
	b	.L36
.L30:
	mov	r2, #1
	ldr	r1, .L70+4
	str	r2, [r1, #672]
	b	.L33
.L28:
	cmp	r2, #1
	ldreq	r1, .L70+4
	streq	r2, [r1, #1960]
	b	.L27
.L68:
	ldr	r3, [r6, #16]
	cmp	r3, #0
	beq	.L69
	cmp	r3, #1
	bne	.L18
	ldr	r2, .L70+4
	str	r3, [r2, #1960]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	mov	r0, #0
	mov	r1, #1
	cmp	r2, r0
	ldr	r2, .L70+4
	str	r0, [r2, #620]
	str	r1, [r2, #692]
	beq	.L22
	b	.L25
.L69:
	mov	r2, #152
	ldr	r1, .L70+4
	str	r3, [r1, #1932]
	str	r2, [r1, #1872]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	currentTown
	.word	villagers
	.word	srand
	.word	cheatActive
	.word	time
	.word	__aeabi_idiv
	.word	playerMoney
	.word	player
	.word	dungeonKeys
	.word	playerHealth
	.word	rand
	.word	715827883
	.word	bountyStarted
	.word	bountyKilled
	.size	initTownViewVillagers, .-initTownViewVillagers
	.align	2
	.global	initTownViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTownViewArrows, %function
initTownViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #16
	mov	r2, #1
	mov	r4, #6
	ldr	r0, .L76
	ldr	r3, .L76+4
	ldr	ip, [r0]
	ldr	r0, [r0, #4]
	add	lr, r3, #256
.L73:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r4, [r3, #12]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r2, [r3, #44]
	add	r3, r3, #64
	cmp	r3, lr
	bne	.L73
	ldr	r3, .L76+8
	pop	{r4, lr}
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r2, [r3, #44]
	bx	lr
.L77:
	.align	2
.L76:
	.word	player
	.word	arrows
	.word	bow
	.size	initTownViewArrows, .-initTownViewArrows
	.align	2
	.global	initTownViewButtons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTownViewButtons, %function
initTownViewButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	mov	r0, #16
	ldr	r3, .L80
	str	lr, [sp, #-4]!
	ldm	r3, {ip, lr}
	ldr	r2, .L80+4
	ldr	r3, .L80+8
	sub	ip, ip, #24
	stm	r2, {ip, lr}
	stm	r3, {ip, lr}
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	str	r1, [r2, #44]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #44]
	ldr	lr, [sp], #4
	bx	lr
.L81:
	.align	2
.L80:
	.word	player
	.word	aButton
	.word	bButton
	.size	initTownViewButtons, .-initTownViewButtons
	.align	2
	.global	initTownView
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTownView, %function
initTownView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #67108864
	push	{r4, r5, r6, lr}
	mov	r0, #16
	mov	lr, #20
	mov	r1, #1
	mov	ip, #3
	mov	r4, #127
	ldr	r5, .L84
	str	r3, [r5]
	ldr	r5, .L84+4
	str	r3, [r5]
	strh	r3, [r2, #18]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	strh	r3, [r2, #26]	@ movhi
	strh	r3, [r2, #24]	@ movhi
	strh	r3, [r2, #30]	@ movhi
	strh	r3, [r2, #28]	@ movhi
	ldr	r2, .L84+8
	stm	r2, {r4, lr}
	str	r3, [r2, #24]
	str	r3, [r2, #36]
	str	r3, [r2, #28]
	str	ip, [r2, #40]
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	str	r1, [r2, #8]
	str	r1, [r2, #12]
	bl	initTownViewButtons
	bl	initTownViewArrows
	pop	{r4, r5, r6, lr}
	b	initTownViewVillagers
.L85:
	.align	2
.L84:
	.word	vOff
	.word	hOff
	.word	player
	.size	initTownView, .-initTownView
	.align	2
	.global	resumeTownView
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeTownView, %function
resumeTownView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L88
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r1, .L88+4
	ldr	r2, .L88+8
	ldr	r0, [r1]
	ldr	r2, [r2]
	ldr	lr, .L88+12
	ldr	ip, .L88+16
	str	r2, [lr]
	str	r0, [ip]
	lsl	r1, r2, #16
	ldr	ip, .L88+20
	lsl	r2, r0, #16
	ldr	r0, .L88+24
	lsr	r1, r1, #16
	lsr	r2, r2, #16
	strh	r1, [r3, #18]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	strh	r1, [r3, #22]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	strh	r1, [r3, #26]	@ movhi
	strh	r2, [r3, #24]	@ movhi
	strh	r1, [r3, #30]	@ movhi
	strh	r2, [r3, #28]	@ movhi
	ldr	r1, [ip]
	ldr	r3, .L88+28
	ldr	r2, [r0]
	pop	{r4, lr}
	stm	r3, {r1, r2}
	bx	lr
.L89:
	.align	2
.L88:
	.word	waitForVBlank
	.word	savedhOff
	.word	savedvOff
	.word	vOff
	.word	hOff
	.word	savedWorldRow
	.word	savedWorldCol
	.word	player
	.size	resumeTownView, .-resumeTownView
	.global	__aeabi_idivmod
	.align	2
	.global	animateTownViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateTownViewPlayer, %function
animateTownViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L102
	ldr	r3, .L102+4
	ldr	r5, [r4, #24]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #28]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bne	.L91
	ldr	r0, [r4, #36]
	ldr	r3, .L102+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L91:
	ldr	r3, .L102+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L92
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L93
.L95:
	mov	r3, #2
	str	r3, [r4, #28]
.L93:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L95
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L103:
	.align	2
.L102:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animateTownViewPlayer, .-animateTownViewPlayer
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.global	__aeabi_dsub
	.global	__aeabi_dcmpgt
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"\000"
	.align	2
.LC1:
	.ascii	"I took an arrow in the knee!\000"
	.align	2
.LC2:
	.ascii	"Leave\000"
	.align	2
.LC3:
	.ascii	"How do you do on this hot day?\000"
	.align	2
.LC4:
	.ascii	"Happen to see my sweet roll?\000"
	.align	2
.LC5:
	.ascii	"Legend says 2020 will be hexed!\000"
	.align	2
.LC6:
	.ascii	"No lollygaggin!\000"
	.align	2
.LC7:
	.ascii	"Love me a good Nord...\000"
	.align	2
.LC8:
	.ascii	"Yes?\000"
	.align	2
.LC9:
	.ascii	"Old Man\000"
	.align	2
.LC10:
	.ascii	"Hey there traveller!\000"
	.align	2
.LC11:
	.ascii	"Take\000"
	.align	2
.LC12:
	.ascii	"You'll need this for your travels.\000"
	.align	2
.LC13:
	.ascii	"Take the bow?\000"
	.align	2
.LC14:
	.ascii	"Hopefully you'll make use of it.\000"
	.align	2
.LC15:
	.ascii	"Tip: press B to shoot!\000"
	.align	2
.LC16:
	.ascii	"Fine! Good riddance.\000"
	.align	2
.LC17:
	.ascii	"Good luck out there!\000"
	.align	2
.LC18:
	.ascii	"Debt Collector\000"
	.align	2
.LC19:
	.ascii	"I have a quest.\000"
	.align	2
.LC20:
	.ascii	"More\000"
	.align	2
.LC21:
	.ascii	"I need a man killed.\000"
	.align	2
.LC22:
	.ascii	"Accept\000"
	.align	2
.LC23:
	.ascii	"He's in the sand outskirts.\000"
	.align	2
.LC24:
	.ascii	"Accept the quest?\000"
	.align	2
.LC25:
	.ascii	"Counting on you traveller!\000"
	.align	2
.LC26:
	.ascii	"Quest accepted.\000"
	.align	2
.LC27:
	.ascii	"Thank you for your services.\000"
	.align	2
.LC28:
	.ascii	"Earned 10 gold & a key!\000"
	.align	2
.LC29:
	.ascii	"I owe you one traveller.\000"
	.align	2
.LC30:
	.ascii	"What?\000"
	.align	2
.LC31:
	.ascii	"Sister\000"
	.align	2
.LC32:
	.ascii	"I don't know what to do!\000"
	.align	2
.LC33:
	.ascii	"Help\000"
	.align	2
.LC34:
	.ascii	"I need a letter to my brother NOW!\000"
	.align	2
.LC35:
	.ascii	"He's in the small east town.\000"
	.align	2
.LC36:
	.ascii	"Oh boy! Thank you so much!\000"
	.align	2
.LC37:
	.ascii	"Thank you! Take this.\000"
	.align	2
.LC38:
	.ascii	"Earned a key!\000"
	.align	2
.LC39:
	.ascii	"Has he gotten it yet??\000"
	.align	2
.LC40:
	.ascii	"You're the best!!\000"
	.align	2
.LC41:
	.ascii	"Brother\000"
	.align	2
.LC42:
	.ascii	"Thank you! I don't have much but.\000"
	.align	2
.LC43:
	.ascii	"Earned 5 gold!\000"
	.align	2
.LC44:
	.ascii	"Yes!\000"
	.align	2
.LC45:
	.ascii	"Can you take this back to her?\000"
	.align	2
.LC46:
	.ascii	"Again, thank you so much.\000"
	.align	2
.LC47:
	.ascii	"Do I know you?\000"
	.align	2
.LC48:
	.ascii	"Upgrade\000"
	.align	2
.LC49:
	.ascii	"Weaponsmith\000"
	.align	2
.LC50:
	.ascii	"I can upgrade your bow for 15 gold!\000"
	.align	2
.LC51:
	.ascii	"Shopkeep\000"
	.align	2
.LC52:
	.ascii	"Your bow should feel brand new!\000"
	.align	2
.LC53:
	.ascii	"Bow speed increased.\000"
	.align	2
.LC54:
	.ascii	"Not enough money!\000"
	.align	2
.LC55:
	.ascii	"Buy\000"
	.align	2
.LC56:
	.ascii	"Scavenger\000"
	.align	2
.LC57:
	.ascii	"I found this relic in the sand.\000"
	.align	2
.LC58:
	.ascii	"Buy key for 10 gold?\000"
	.align	2
.LC59:
	.ascii	"Hope you can use for that!\000"
	.align	2
.LC60:
	.ascii	"Key found!\000"
	.align	2
.LC61:
	.ascii	"How's the quest coming along?\000"
	.align	2
.LC62:
	.ascii	"Heal up\000"
	.align	2
.LC63:
	.ascii	"Doctor\000"
	.align	2
.LC64:
	.ascii	"Are you feeling unwell?\000"
	.align	2
.LC65:
	.ascii	"Price: 3 coin\000"
	.align	2
.LC66:
	.ascii	"Give yoruself a break next time!\000"
	.align	2
.LC67:
	.ascii	"That's the stuff.\000"
	.align	2
.LC68:
	.ascii	"Fight\000"
	.align	2
.LC69:
	.ascii	"Suspicious Character\000"
	.align	2
.LC70:
	.ascii	"Got a problem?\000"
	.align	2
.LC71:
	.ascii	"You'll die!\000"
	.align	2
.LC72:
	.ascii	"...\000"
	.align	2
.LC73:
	.ascii	"Engage\000"
	.text
	.align	2
	.global	updateTownViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTownViewPlayer, %function
updateTownViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #0
	sub	sp, sp, #44
	bl	initTownViewButtons
	ldr	r4, .L306+16
	ldr	r3, .L306+20
	ldr	r2, [r4]
	ldr	r5, [r3]
	ldr	r3, .L306+140
	str	r2, [sp, #20]
	str	r6, [r3]
	ldr	r0, [r4, #52]
	ldr	r7, .L306+24
	sub	r5, r2, r5
	mov	lr, pc
	bx	r7
	adr	r3, .L306
	ldmia	r3, {r2-r3}
	ldr	ip, .L306+28
	mov	r8, r0
	mov	r9, r1
	mov	lr, pc
	bx	ip
	ldr	r3, .L306+32
	mov	lr, pc
	bx	r3
	ldr	fp, .L306+36
	mov	lr, pc
	bx	fp
	ldr	r10, .L306+40
	ldr	r1, [r4, #4]
	ldr	r3, [r4, #20]
	ldr	r2, [r10, #20]
	str	r1, [sp, #24]
	ldr	r1, .L306+60
	add	r5, r3, r5
	str	r3, [sp, #28]
	ldr	r1, [r1]
	sub	r5, r5, r0
	rsb	r3, r2, #160
	cmp	r5, r3
	str	r2, [sp, #32]
	str	r1, [sp, #36]
	bge	.L105
	ldr	r5, .L306+44
	adr	r3, .L306+8
	ldmia	r3, {r2-r3}
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	fp
	str	r0, [r4, #52]
	mov	lr, pc
	bx	r7
	ldr	ip, .L306+28
	adr	r3, .L306
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	ldr	r3, .L306+32
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [sp, #20]
	mov	lr, pc
	bx	r7
	mov	r2, r8
	mov	r3, r9
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	fp
	ldr	r3, .L306+124
	str	r0, [r4]
	str	r3, [sp, #20]
	ldr	r0, [r3]
	mov	lr, pc
	bx	r7
	mov	r2, r8
	mov	r3, r9
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	fp
	ldr	r3, [sp, #20]
	str	r0, [r3]
	ldr	r3, .L306+220
	ldr	r0, [r3]
	mov	lr, pc
	bx	r7
	mov	r3, r9
	mov	r2, r8
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	fp
	mov	fp, r6
	ldr	r3, .L306+220
	str	r0, [r3]
.L106:
	ldr	r3, .L306+48
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L108
	mov	r2, #1
	mvn	r3, #0
	ldr	r1, .L306+140
	ldr	r6, [sp, #36]
	str	r2, [r1]
	ldr	r2, [sp, #24]
	sub	r2, r2, r6
	cmp	r2, #0
	str	r3, [r4, #48]
	ble	.L108
	ldr	r0, [r4, #52]
	mov	lr, pc
	bx	r7
	adr	r3, .L306
	ldmia	r3, {r2-r3}
	ldr	ip, .L306+28
	mov	lr, pc
	bx	ip
	ldr	ip, .L306+32
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4]
	ldr	r1, [sp, #28]
	add	r0, r1, r0
	mov	lr, pc
	bx	r7
	ldr	r5, .L306+44
	mov	r2, r8
	mov	r3, r9
	mov	lr, pc
	bx	r5
	mov	r8, r0
	ldr	r0, [sp, #32]
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r5, .L306+52
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L108
	ldr	r0, .L306+220
	ldr	lr, [sp, #20]
	ldr	r3, [r4, #8]
	ldr	r1, [r0, #4]
	ldr	r2, [lr, #4]
	sub	r1, r1, r3
	sub	r2, r2, r3
	ldr	ip, [r4, #12]
	ldr	r3, [sp, #24]
	cmp	r6, #0
	sub	r3, r3, ip
	str	r1, [r0, #4]
	str	r2, [lr, #4]
	str	r3, [r4, #4]
	ble	.L108
	sub	r3, r3, r6
	cmp	r3, #119
	ldrle	r2, .L306+60
	suble	r3, r6, #1
	strle	r3, [r2]
.L108:
	ldr	r3, .L306+48
	ldrh	r2, [r3, #48]
	ldr	r3, .L306+56
	tst	r2, #16
	ldr	r5, [r3, #12]
	bne	.L111
	mov	r2, #1
	ldr	r1, .L306+60
	ldr	r3, [r4, #4]
	ldr	r6, [r1]
	ldr	r1, [r4, #16]
	str	r3, [sp, #24]
	sub	r3, r3, r6
	ldr	r0, .L306+140
	add	r3, r3, r1
	cmp	r3, #239
	str	r2, [r0]
	str	r2, [r4, #48]
	bgt	.L114
	ldr	r0, [r4, #52]
	mov	lr, pc
	bx	r7
	adr	r3, .L306
	ldmia	r3, {r2-r3}
	ldr	ip, .L306+28
	mov	lr, pc
	bx	ip
	ldr	ip, .L306+32
	mov	lr, pc
	bx	ip
	mov	r8, r0
	mov	r9, r1
	ldr	ip, [sp, #28]
	ldr	r0, [r4]
	add	r0, ip, r0
	mov	lr, pc
	bx	r7
	mov	r2, r8
	mov	r3, r9
	ldr	r8, .L306+44
	mov	lr, pc
	bx	r8
	mov	r8, r0
	ldr	r0, [sp, #32]
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r7, .L306+52
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L114
	ldr	r0, .L306+220
	ldr	lr, [sp, #20]
	ldr	r2, [r4, #8]
	ldr	r1, [r0, #4]
	ldr	r3, [lr, #4]
	add	r1, r1, r2
	add	r3, r3, r2
	ldr	ip, [r4, #12]
	ldr	r2, [sp, #24]
	b	.L307
.L308:
	.align	3
.L306:
	.word	2576980378
	.word	1069128089
	.word	1202590843
	.word	1074035425
	.word	player
	.word	vOff
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_d2iz
	.word	currentTown
	.word	__aeabi_dsub
	.word	67109120
	.word	__aeabi_dcmpgt
	.word	soundB
	.word	hOff
	.word	playerShootCooldown
	.word	villagers+384
	.word	collision
	.word	playerTookDamage
	.word	cheatActive
	.word	savedWorldCol
	.word	savedWorldRow
	.word	playerHealth
	.word	.LC66
	.word	.LC67
	.word	boughtKey
	.word	.LC55
	.word	.LC58
	.word	villagers
	.word	.LC7
	.word	aButton
	.word	arrows+44
	.word	arrowShot_length
	.word	arrowShot_data
	.word	playerIsMoving
	.word	pauseSoundB
	.word	playerShootSpeed
	.word	.LC51
	.word	.LC52
	.word	.LC53
	.word	walking_length
	.word	walking_data
	.word	bountyCompleted
	.word	bountyStarted
	.word	.LC36
	.word	.LC26
	.word	.LC17
	.word	letterStarted
	.word	oldButtons
	.word	letterCompleted
	.word	.LC44
	.word	.LC45
	.word	.LC62
	.word	.LC65
	.word	bButton
	.word	playerJump_length
	.word	playerJump_data
	.word	.LC73
	.word	.LC71
	.word	.LC72
	.word	.LC64
	.word	.LC63
	.word	.LC61
	.word	.LC29
	.word	.LC47
	.word	.LC68
	.word	.LC70
	.word	.LC69
	.word	.LC59
	.word	.LC60
	.word	.LC40
	.word	.LC8
	.word	.LC10
	.word	letterRecieved
	.word	.LC37
	.word	.LC38
	.word	bountyKilled
	.word	playerMoney
	.word	dungeonKeys
	.word	.LC11
	.word	.LC27
	.word	.LC28
	.word	.LC3
	.word	.LC16
	.word	hasTalkedToQuestGiver
	.word	playerHasBow
	.word	textViewChoice
	.word	.LC9
	.word	.LC14
	.word	.LC15
	.word	.LC48
	.word	.LC50
	.word	goToMerchantView
	.word	.LC49
	.word	.LANCHOR0
	.word	.LC1
	.word	.LC31
	.word	.LC39
	.word	.LC18
	.word	.LC25
	.word	.LC57
	.word	.LC54
	.word	.LC56
	.word	buttons
	.word	menuActivate_length
	.word	menuActivate_data
	.word	playSoundB
	.word	.LC2
	.word	.LC0
	.word	.LC41
	.word	.LC46
	.word	goToTextView
.L307:
	cmp	r6, #272
	add	r2, r2, ip
	str	r1, [r0, #4]
	str	r3, [lr, #4]
	str	r2, [r4, #4]
	bge	.L114
	sub	r3, r2, r6
	cmp	r3, #119
	ldrgt	r1, .L306+60
	addgt	r6, r6, #1
	strgt	r6, [r1]
.L114:
	cmp	r5, #0
	beq	.L116
.L119:
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L121
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	eor	r3, r3, #64
	ands	r3, fp, r3, lsr #6
	bne	.L281
.L121:
	ldr	r2, .L306+64
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	movle	r3, #0
	str	r3, [r2]
	ldr	r3, .L306+344
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L124
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L282
.L124:
	mov	r3, #1
	ldr	r2, [r10, #4]
	cmp	r2, #0
	ldr	r2, [sp, #20]
	str	r3, [r2, #44]
	ble	.L190
	mov	r6, #0
	ldr	r5, .L306+68
	ldr	r7, .L306+72
	ldr	fp, .L306+76
.L189:
	add	r2, r4, #16
	mov	r9, #1
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	sub	r8, r5, #384
	b	.L131
.L129:
	add	r8, r8, #64
	cmp	r5, r8
	beq	.L283
.L131:
	str	r9, [r5, #168]
	ldr	ip, [r8, #168]
	cmp	ip, #0
	bne	.L129
	stm	sp, {r0, r1, r2, r3}
	add	r2, r8, #140
	ldr	r1, [r8, #124]
	ldm	r2, {r2, r3}
	ldr	r0, [r8, #128]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	strne	r9, [r8, #168]
	add	r8, r8, #64
	strne	r9, [fp]
	add	r2, r4, #16
	cmp	r5, r8
	ldr	r0, [r4, #4]
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	bne	.L131
.L283:
	sub	ip, r5, #360
	ldm	ip, {ip, lr}
	str	lr, [sp, #12]
	ldr	lr, [r5, #-376]
	str	ip, [sp, #8]
	ldr	ip, [r5, #-372]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L133
	ldr	r2, [r5, #-276]
	cmp	r2, #0
	ldreq	r3, [sp, #20]
	streq	r2, [r3, #44]
	ldr	r3, [r5, #-384]
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L133
.L136:
	.word	.L140
	.word	.L139
	.word	.L138
	.word	.L137
	.word	.L135
.L135:
	ldr	r3, .L306+80
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r3, #1
	strne	r3, [r5, #-276]
	bne	.L133
	cmp	r2, #0
	bne	.L133
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L188
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L284
.L188:
	ldr	r3, .L306+348
	ldr	r8, [r3]
	cmp	r8, #1
	beq	.L285
.L133:
	ldr	r3, [r10, #4]
	add	r6, r6, #1
	cmp	r3, r6
	add	r5, r5, #620
	bgt	.L189
.L190:
	ldr	r1, .L306+84
	ldr	r0, [r4, #4]
	ldr	r2, [r4]
	ldr	r3, .L306+88
	str	r0, [r1]
	str	r2, [r3]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateTownViewPlayer
.L137:
	ldr	r3, [r5, #228]
	sub	r3, r3, #1
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L147
.L149:
	.word	.L152
	.word	.L151
	.word	.L147
	.word	.L150
	.word	.L148
.L138:
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L184
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	beq	.L286
.L184:
	ldr	r3, .L306+348
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L133
	ldr	ip, .L306+312
	ldr	r3, [ip]
	cmp	r3, #2
	ble	.L186
	mov	r2, #5
	ldr	r3, .L306+92
	str	r2, [r3]
	ldr	lr, [ip]
	ldr	r3, .L306+432
	sub	lr, lr, #3
	str	r3, [sp]
	ldr	r2, .L306+248
	ldr	r3, .L306+436
	ldr	r1, .L306+96
	str	lr, [ip]
	ldr	r8, .L306+448
	ldr	r0, .L306+100
	mov	lr, pc
	bx	r8
	b	.L133
.L139:
	ldr	r3, [r5, #-284]
	cmp	r3, #0
	beq	.L177
	cmp	r3, #1
	bne	.L147
	ldr	r8, .L306+104
	ldr	r3, .L306+196
	ldr	r2, [r8]
	ldrh	r3, [r3]
	cmp	r2, #0
	and	r3, r3, #1
	bne	.L181
	cmp	r3, #0
	beq	.L182
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L182
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+108
	str	r2, [sp]
	ldr	r1, .L306+404
	ldr	r2, .L306+412
	ldr	r0, .L306+112
	ldr	r9, .L306+372
	mov	lr, pc
	bx	r9
.L182:
	ldr	r3, .L306+348
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L287
.L147:
	mvn	r3, #0
	ldr	r2, .L306+348
	str	r3, [r2]
	b	.L133
.L140:
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	cmp	r6, #0
	ldr	r3, .L306+116
	beq	.L288
	cmp	r6, #1
	beq	.L289
	cmp	r6, #2
	beq	.L290
	cmp	r6, #3
	beq	.L291
	cmp	r6, #4
	beq	.L292
	ldr	r3, [r3, #3196]
	ldr	r2, .L306+380
	add	r3, r3, r3, lsl #2
	ldr	r1, .L306+432
	add	r2, r2, r3, lsl #1
	ldr	r3, .L306+436
	str	r1, [sp]
	mov	r0, r3
	ldr	r1, .L306+120
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L105:
	ldr	r3, .L306+124
	mov	fp, #1
	str	r6, [r4, #52]
	str	r3, [sp, #20]
	b	.L106
.L282:
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L124
	ldr	r1, [r2]
	cmp	r1, #1
	bgt	.L124
	ldr	r0, .L306+128
.L127:
	ldr	r1, [r0, r3, lsl #6]
	cmp	r1, #0
	lsl	r1, r3, #6
	bne	.L293
	add	r3, r3, #1
	cmp	r3, #4
	bne	.L127
.L126:
	ldr	r3, .L306+132
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L306+136
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	b	.L124
.L111:
	ldr	r2, .L306+140
	cmp	r5, #0
	ldr	r2, [r2]
	bne	.L115
	cmp	r2, #0
	bne	.L116
.L120:
	ldr	r2, [r3]
	ldr	r3, .L306+168
	cmp	r2, r3
	bne	.L119
	ldr	r3, .L306+144
	mov	lr, pc
	bx	r3
	b	.L119
.L177:
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L179
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	beq	.L294
.L179:
	ldr	r3, .L306+348
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L147
	ldr	ip, .L306+312
	ldr	r3, [ip]
	cmp	r3, #14
	ble	.L180
	ldr	r2, .L306+148
	ldr	r3, [r2]
	add	r3, r3, #10
	str	r3, [r2]
	ldr	lr, [ip]
	ldr	r3, .L306+432
	sub	lr, lr, #15
	str	r3, [sp]
	ldr	r2, .L306+152
	ldr	r3, .L306+436
	ldr	r1, .L306+156
	str	lr, [ip]
	ldr	r8, .L306+372
	ldr	r0, .L306+160
	mov	lr, pc
	bx	r8
	b	.L147
.L116:
	ldr	r3, .L306+164
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L306+168
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	b	.L119
.L151:
	ldr	r8, .L306+172
	ldr	r3, .L306+196
	ldr	r2, [r8]
	ldrh	r3, [r3]
	cmp	r2, #0
	and	r3, r3, #1
	bne	.L160
	ldr	r2, .L306+176
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L161
	cmp	r3, #0
	beq	.L162
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	beq	.L295
.L162:
	ldr	r3, .L306+348
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L147
	ldr	r8, .L306+340
	ldr	r3, [r8]
	cmp	r3, #1
	beq	.L296
.L164:
	cmp	r3, #2
	beq	.L297
.L165:
	cmp	r3, #3
	bne	.L147
	mov	r1, #0
	mov	ip, #1
	ldr	r3, .L306+432
	ldr	lr, .L306+176
	str	r3, [sp]
	ldr	r2, .L306+396
	str	r1, [r8]
	ldr	r3, .L306+436
	ldr	r1, .L306+400
	str	ip, [lr]
	ldr	r8, .L306+448
	ldr	r0, .L306+184
	mov	lr, pc
	bx	r8
	b	.L147
.L150:
	ldr	r8, .L306+200
	ldr	r3, .L306+196
	ldr	r2, [r8]
	ldrh	r3, [r3]
	cmp	r2, #0
	and	r3, r3, #1
	bne	.L167
	ldr	r2, .L306+192
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L168
	cmp	r3, #0
	beq	.L169
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	beq	.L298
.L169:
	ldr	r3, .L306+348
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L147
	ldr	r8, .L306+340
	ldr	r3, [r8]
	cmp	r3, #1
	beq	.L299
.L170:
	cmp	r3, #2
	beq	.L300
.L171:
	cmp	r3, #3
	bne	.L147
	mov	r1, #0
	mov	ip, #1
	ldr	r3, .L306+432
	ldr	lr, .L306+192
	str	r3, [sp]
	ldr	r2, .L306+388
	str	r1, [r8]
	ldr	r3, .L306+436
	ldr	r1, .L306+180
	str	ip, [lr]
	ldr	r8, .L306+448
	ldr	r0, .L306+184
	mov	lr, pc
	bx	r8
	b	.L147
.L152:
	ldr	r3, .L306+344
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L153
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L301
.L153:
	ldr	r3, .L306+348
	ldr	r0, [r3]
	cmp	r0, #1
	beq	.L302
.L154:
	cmp	r0, #0
	bne	.L157
	ldr	lr, .L306+340
	ldr	r3, [lr]
	cmp	r3, #2
	beq	.L303
.L157:
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L147
	ldr	r3, .L306+344
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L147
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+352
	ldr	r1, .L306+188
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L148:
	ldr	r3, .L306+192
	ldr	r2, [r3]
	ldr	r3, .L306+196
	ldrh	r3, [r3]
	cmp	r2, #0
	and	r3, r3, #1
	beq	.L173
	ldr	r2, .L306+200
	ldr	r2, [r2]
	cmp	r2, #0
	bne	.L174
	ldr	r8, .L306+296
	ldr	r2, [r8]
	cmp	r2, #0
	bne	.L175
	cmp	r3, #0
	beq	.L176
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	beq	.L304
.L176:
	ldr	r3, .L306+348
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L147
	ldr	ip, .L306+340
	ldr	r1, [ip]
	cmp	r1, #1
	bne	.L147
	mov	lr, #0
	ldr	r3, .L306+436
	ldr	r2, .L306+440
	str	r3, [sp]
	ldr	r0, .L306+436
	str	r1, [r8]
	ldr	r3, .L306+204
	ldr	r1, .L306+208
	str	lr, [ip]
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L286:
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+212
	str	r2, [sp]
	ldr	r1, .L306+244
	ldr	r2, .L306+248
	ldr	r8, .L306+448
	ldr	r0, .L306+216
	mov	lr, pc
	bx	r8
	b	.L184
.L281:
	mov	ip, #40
	ldr	lr, .L306+220
	ldr	r5, [sp, #20]
	ldr	r0, [r4]
	ldr	r2, [lr, #4]
	ldr	r3, [r5, #4]
	ldr	r1, .L306+224
	sub	r2, r2, #1
	sub	r0, r0, #1
	sub	r3, r3, #1
	str	r2, [lr, #4]
	str	r0, [r4]
	str	r3, [r5, #4]
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, .L306+228
	ldr	r3, .L306+428
	str	ip, [r4, #52]
	mov	lr, pc
	bx	r3
	b	.L121
.L285:
	ldr	r3, .L306+232
	ldr	r2, .L306+272
	str	r3, [sp]
	ldr	r1, .L306+236
	ldr	r3, .L306+436
	ldr	r0, .L306+240
	ldr	r9, .L306+448
	mov	lr, pc
	bx	r9
	str	r8, [r5, #-276]
	b	.L133
.L115:
	cmp	r2, #0
	bne	.L119
	b	.L120
.L186:
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	ldr	r1, .L306+244
	ldr	r2, .L306+248
	ldr	r8, .L306+448
	ldr	r0, .L306+408
	mov	lr, pc
	bx	r8
	b	.L133
.L181:
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+412
	ldr	r1, .L306+252
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L167:
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+388
	ldr	r1, .L306+284
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L160:
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+396
	ldr	r1, .L306+256
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L173:
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L147
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+440
	ldr	r1, .L306+260
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L284:
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+264
	str	r2, [sp]
	ldr	r1, .L306+268
	ldr	r2, .L306+272
	ldr	r8, .L306+448
	ldr	r0, .L306+436
	mov	lr, pc
	bx	r8
	b	.L188
.L180:
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	ldr	r1, .L306+368
	ldr	r2, .L306+376
	ldr	r8, .L306+448
	ldr	r0, .L306+408
	mov	lr, pc
	bx	r8
	b	.L147
.L287:
	ldr	ip, .L306+312
	ldr	r2, [ip]
	cmp	r2, #9
	ble	.L183
	ldr	r0, .L306+316
	ldr	lr, [ip]
	ldr	r1, [r0]
	ldr	r2, .L306+432
	add	r1, r1, #1
	sub	lr, lr, #10
	str	r2, [sp]
	str	r3, [r8]
	str	r1, [r0]
	ldr	r3, .L306+436
	ldr	r2, .L306+412
	ldr	r1, .L306+276
	str	lr, [ip]
	ldr	r8, .L306+372
	ldr	r0, .L306+280
	mov	lr, pc
	bx	r8
	b	.L147
.L174:
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+440
	ldr	r1, .L306+284
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L301:
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L153
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	mov	lr, #1
	ldr	r3, .L306+432
	ldr	ip, .L306+340
	str	r3, [sp]
	ldr	r2, .L306+352
	ldr	r3, .L306+288
	ldr	r1, .L306+292
	str	lr, [ip]
	ldr	r8, .L306+448
	ldr	r0, .L306+436
	mov	lr, pc
	bx	r8
	b	.L153
.L168:
	ldr	r2, .L306+296
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L172
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r0, .L306+316
	ldr	r1, [r0]
	ldr	r3, .L306+436
	add	r1, r1, ip
	str	r3, [sp]
	ldr	r2, .L306+388
	str	r1, [r0]
	ldr	r3, .L306+320
	str	ip, [r8]
	ldr	r1, .L306+300
	ldr	r8, .L306+448
	ldr	r0, .L306+304
	mov	lr, pc
	bx	r8
	b	.L147
.L161:
	ldr	r2, .L306+308
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L166
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r2, .L306+312
	ldr	r0, .L306+316
	ldr	r3, [r2]
	ldr	r1, [r0]
	ldr	lr, .L306+436
	add	r1, r1, ip
	add	r3, r3, #10
	str	lr, [sp]
	str	r3, [r2]
	str	r1, [r0]
	ldr	r3, .L306+320
	str	ip, [r8]
	ldr	r2, .L306+396
	ldr	r1, .L306+324
	ldr	r8, .L306+448
	ldr	r0, .L306+328
	mov	lr, pc
	bx	r8
	b	.L147
.L289:
	ldr	r3, [r3, #716]
	ldr	r2, .L306+380
	add	r3, r3, r3, lsl #2
	ldr	r1, .L306+432
	add	r2, r2, r3, lsl #1
	ldr	r3, .L306+436
	str	r1, [sp]
	mov	r0, r3
	ldr	r1, .L306+332
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L303:
	mvn	ip, #0
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	str	r0, [lr]
	ldr	lr, .L306+348
	mov	r0, r3
	ldr	r2, .L306+352
	ldr	r1, .L306+336
	ldr	r8, .L306+448
	str	ip, [lr]
	mov	lr, pc
	bx	r8
	b	.L157
.L302:
	ldr	r8, .L306+340
	ldr	r3, [r8]
	cmp	r3, #1
	beq	.L305
.L155:
	cmp	r3, #2
	bne	.L157
	mov	r1, #1
	ldr	r3, .L306+432
	ldr	lr, .L306+344
	str	r3, [sp]
	str	r1, [lr]
	ldr	lr, .L306+348
	mov	r0, #0
	mvn	ip, #0
	mov	r9, lr
	str	r0, [r8]
	ldr	r3, .L306+436
	ldr	r2, .L306+352
	ldr	r1, .L306+356
	ldr	r0, .L306+360
	ldr	r8, .L306+448
	str	ip, [lr]
	mov	lr, pc
	bx	r8
	ldr	r0, [r9]
	b	.L154
.L294:
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+364
	str	r2, [sp]
	ldr	r1, .L306+368
	ldr	r2, .L306+376
	ldr	r8, .L306+372
	ldr	r0, .L306+436
	mov	lr, pc
	bx	r8
	b	.L179
.L288:
	ldr	r3, [r3, #96]
	ldr	r2, .L306+380
	add	r3, r3, r3, lsl #2
	ldr	r1, .L306+432
	add	r2, r2, r3, lsl #1
	ldr	r3, .L306+436
	str	r1, [sp]
	mov	r0, r3
	ldr	r1, .L306+384
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L172:
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+388
	ldr	r1, .L306+392
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L166:
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+396
	ldr	r1, .L306+400
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L183:
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	ldr	r1, .L306+404
	ldr	r2, .L306+412
	ldr	r8, .L306+448
	ldr	r0, .L306+408
	mov	lr, pc
	bx	r8
	b	.L147
.L175:
	cmp	r3, #0
	beq	.L147
	ldr	r3, .L306+416
	ldrh	r3, [r3]
	ands	r2, r3, #1
	bne	.L147
	ldr	r3, .L306+420
	ldr	r0, .L306+424
	ldr	r1, [r3]
	ldr	r3, .L306+428
	mov	lr, pc
	bx	r3
	ldr	r2, .L306+432
	ldr	r3, .L306+436
	str	r2, [sp]
	mov	r0, r3
	ldr	r2, .L306+440
	ldr	r1, .L306+444
	ldr	r8, .L306+448
	mov	lr, pc
	bx	r8
	b	.L147
.L293:
	mov	lr, #80
	mov	ip, #0
	mov	r5, #10
	ldr	r0, .L309
	ldr	r0, [r0]
	rsb	r0, r0, #30
	str	r0, [r2]
	ldr	r0, .L309+4
	add	r2, r0, r1
	ldr	r1, [r4]
	ldr	r6, [r4, #4]
	str	lr, [r2, #56]
	ldr	lr, [r4, #48]
	sub	r1, r1, #2
	str	r6, [r2, #4]
	str	r5, [r2, #52]
	str	r1, [r0, r3, lsl #6]
	str	lr, [r2, #48]
	str	ip, [r2, #44]
	str	ip, [r2, #60]
	b	.L126
.L305:
	mov	ip, #2
	ldr	r2, .L309+8
	ldr	r3, .L309+12
	str	r2, [sp]
	ldr	r1, .L309+16
	ldr	r2, .L309+20
	ldr	r0, .L309+24
	ldr	r9, .L309+28
	str	ip, [r8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L309+32
	ldr	r0, [r3]
	cmp	r0, #1
	bne	.L154
	ldr	r3, [r8]
	b	.L155
.L291:
	ldr	r3, [r3, #1956]
	ldr	r2, .L309+36
	add	r3, r3, r3, lsl #2
	ldr	r1, .L309+8
	add	r2, r2, r3, lsl #1
	ldr	r3, .L309+40
	str	r1, [sp]
	mov	r0, r3
	ldr	r1, .L309+44
	ldr	r8, .L309+28
	mov	lr, pc
	bx	r8
	b	.L147
.L290:
	ldr	r3, [r3, #1336]
	ldr	r2, .L309+36
	add	r3, r3, r3, lsl #2
	ldr	r1, .L309+8
	add	r2, r2, r3, lsl #1
	ldr	r3, .L309+40
	str	r1, [sp]
	mov	r0, r3
	ldr	r1, .L309+48
	ldr	r8, .L309+28
	mov	lr, pc
	bx	r8
	b	.L147
.L295:
	mov	lr, #1
	ldr	r3, .L309+52
	ldr	ip, .L309+56
	ldr	r1, [r3]
	ldr	r0, .L309+60
	ldr	r3, .L309+64
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	ldr	r2, .L309+8
	ldr	r3, .L309+68
	str	r2, [sp]
	ldr	r1, .L309+72
	ldr	r2, .L309+76
	ldr	r8, .L309+28
	ldr	r0, .L309+40
	mov	lr, pc
	bx	r8
	b	.L162
.L298:
	mov	lr, #1
	ldr	r3, .L309+52
	ldr	ip, .L309+56
	ldr	r1, [r3]
	ldr	r0, .L309+60
	ldr	r3, .L309+64
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	ldr	r2, .L309+8
	ldr	r3, .L309+80
	str	r2, [sp]
	ldr	r1, .L309+84
	ldr	r2, .L309+88
	ldr	r8, .L309+28
	ldr	r0, .L309+40
	mov	lr, pc
	bx	r8
	b	.L169
.L292:
	ldr	r3, [r3, #2576]
	ldr	r2, .L309+36
	add	r3, r3, r3, lsl #2
	ldr	r1, .L309+8
	add	r2, r2, r3, lsl #1
	ldr	r3, .L309+40
	str	r1, [sp]
	mov	r0, r3
	ldr	r1, .L309+92
	ldr	r8, .L309+28
	mov	lr, pc
	bx	r8
	b	.L147
.L304:
	ldr	r3, .L309+52
	ldr	r0, .L309+60
	ldr	r1, [r3]
	ldr	r3, .L309+64
	mov	lr, pc
	bx	r3
	mov	lr, #1
	ldr	r0, .L309+96
	ldr	r1, [r0]
	ldr	ip, .L309+56
	ldr	r3, .L309+40
	add	r1, r1, #5
	str	r3, [sp]
	ldr	r2, .L309+100
	str	r1, [r0]
	ldr	r3, .L309+12
	ldr	r1, .L309+104
	str	lr, [ip]
	ldr	r9, .L309+28
	ldr	r0, .L309+108
	mov	lr, pc
	bx	r9
	b	.L176
.L297:
	mov	ip, #3
	ldr	r2, .L309+8
	ldr	r3, .L309+112
	str	r2, [sp]
	ldr	r1, .L309+116
	ldr	r2, .L309+76
	ldr	r0, .L309+120
	ldr	r9, .L309+28
	str	ip, [r8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L309+32
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L147
	ldr	r3, [r8]
	b	.L165
.L296:
	mov	ip, #2
	ldr	r2, .L309+8
	ldr	r3, .L309+124
	str	r2, [sp]
	ldr	r1, .L309+128
	ldr	r2, .L309+76
	ldr	r0, .L309+40
	ldr	r9, .L309+28
	str	ip, [r8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L309+32
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L147
	ldr	r3, [r8]
	b	.L164
.L300:
	mov	ip, #3
	ldr	r2, .L309+8
	ldr	r3, .L309+112
	str	r2, [sp]
	ldr	r1, .L309+132
	ldr	r2, .L309+88
	ldr	r0, .L309+120
	ldr	r9, .L309+28
	str	ip, [r8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L309+32
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L147
	ldr	r3, [r8]
	b	.L171
.L299:
	mov	ip, #2
	ldr	r2, .L309+8
	ldr	r3, .L309+136
	str	r2, [sp]
	ldr	r1, .L309+140
	ldr	r2, .L309+88
	ldr	r0, .L309+40
	ldr	r9, .L309+28
	str	ip, [r8]
	mov	lr, pc
	bx	r9
	ldr	r3, .L309+32
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L147
	ldr	r3, [r8]
	b	.L170
.L310:
	.align	2
.L309:
	.word	playerShootSpeed
	.word	arrows
	.word	.LC2
	.word	.LC11
	.word	.LC12
	.word	.LC9
	.word	.LC13
	.word	goToTextView
	.word	textViewChoice
	.word	.LANCHOR0
	.word	.LC0
	.word	.LC5
	.word	.LC4
	.word	menuActivate_length
	.word	hasTalkedToQuestGiver
	.word	menuActivate_data
	.word	playSoundB
	.word	.LC8
	.word	.LC19
	.word	.LC18
	.word	.LC30
	.word	.LC32
	.word	.LC31
	.word	.LC6
	.word	playerMoney
	.word	.LC41
	.word	.LC42
	.word	.LC43
	.word	.LC22
	.word	.LC23
	.word	.LC24
	.word	.LC20
	.word	.LC21
	.word	.LC35
	.word	.LC33
	.word	.LC34
	.size	updateTownViewPlayer, .-updateTownViewPlayer
	.global	__aeabi_dadd
	.align	2
	.global	updateTownViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTownViewArrows, %function
updateTownViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r3, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	str	r2, [sp, #8]
	ldr	r1, .L327+16
	ldr	r2, .L327+20
	ldr	r0, .L327+24
	str	r3, [sp, #12]
	ldr	r2, [r2, #20]
	str	r3, [r0, #44]
	ldr	r3, [r1]
	str	r3, [sp]
	rsb	r3, r2, #168
	ldr	r4, .L327+28
	ldr	r10, .L327+32
	str	r3, [sp, #4]
.L317:
	ldr	r0, [r4, #52]
	mov	lr, pc
	bx	r10
	adr	r3, .L327
	ldmia	r3, {r2-r3}
	ldr	ip, .L327+36
	mov	r6, r0
	mov	r7, r1
	mov	lr, pc
	bx	ip
	ldr	r3, .L327+40
	mov	lr, pc
	bx	r3
	ldr	r2, [sp]
	ldr	fp, [r4]
	ldr	r3, [r4, #20]
	sub	r5, fp, r2
	add	r5, r5, r3
	ldr	r3, .L327+44
	mov	r8, r0
	mov	r9, r1
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #4]
	sub	r5, r5, r0
	cmp	r5, r2
	bge	.L312
	mov	r0, fp
	mov	lr, pc
	bx	r10
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L327+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L327+44
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #48]
	cmp	r3, #1
	str	r0, [r4]
	ldr	r0, [r4, #56]
	beq	.L326
	mov	lr, pc
	bx	r10
	adr	r3, .L327
	ldmia	r3, {r2-r3}
	ldr	ip, .L327+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L327+40
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r10
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L327+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L327+44
	mov	lr, pc
	bx	r3
.L314:
	adr	r3, .L327+8
	ldmia	r3, {r2-r3}
	str	r0, [r4, #4]
	ldr	ip, .L327+48
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	ip
	ldr	r3, .L327+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [sp, #8]
	mov	r3, #0
	str	r0, [r4, #52]
	str	r3, [sp, #12]
.L315:
	ldr	r3, [r4, #4]
	sub	r3, r3, #1
	cmp	r3, #496
	movcs	r3, #1
	strcs	r3, [r4, #44]
	ldr	r3, .L327+52
	add	r4, r4, #64
	cmp	r3, r4
	bne	.L317
	ldr	r3, [sp, #8]
	cmp	r3, #0
	ldrne	r2, [sp, #12]
	ldrne	r3, .L327+24
	strne	r2, [r3, #44]
	ldr	r2, .L327+56
	ldr	r3, [r2, #48]
	cmp	r3, #1
	ldr	r3, [r2, #4]
	ldr	r1, .L327+24
	ldr	r2, [r2]
	addeq	r3, r3, #5
	subne	r3, r3, #5
	stm	r1, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L312:
	mov	r3, #0
	str	r3, [r4, #52]
	str	r3, [r4, #56]
	mov	r3, #1
	str	r3, [r4, #44]
	b	.L315
.L326:
	mov	lr, pc
	bx	r10
	adr	r3, .L327
	ldmia	r3, {r2-r3}
	ldr	ip, .L327+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L327+40
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r10
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L327+60
	mov	lr, pc
	bx	ip
	ldr	r3, .L327+44
	mov	lr, pc
	bx	r3
	b	.L314
.L328:
	.align	3
.L327:
	.word	2576980378
	.word	1069128089
	.word	2576980378
	.word	1073322393
	.word	vOff
	.word	currentTown
	.word	bow
	.word	arrows
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_d2iz
	.word	__aeabi_dsub
	.word	arrows+256
	.word	player
	.word	__aeabi_dadd
	.size	updateTownViewArrows, .-updateTownViewArrows
	.align	2
	.global	updateTownViewHostileArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTownViewHostileArrows, %function
updateTownViewHostileArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L348+16
	ldr	r3, [r2, #4]
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r1, .L348+20
	ldr	r2, [r2, #20]
	ldr	r10, .L348+24
	add	r3, r3, r3, lsl #2
	ldr	r1, [r1]
	rsb	r3, r3, r3, lsl #5
	sub	sp, sp, #20
	rsb	r2, r2, #168
	add	r3, r10, r3, lsl #2
	str	r1, [sp, #4]
	str	r2, [sp, #8]
	str	r3, [sp, #12]
.L339:
	mov	r3, #1
	sub	r4, r10, #384
	str	r3, [r10, #168]
	b	.L336
.L332:
	mov	lr, pc
	bx	r5
	adr	r3, .L348
	ldmia	r3, {r2-r3}
	ldr	ip, .L348+28
	mov	lr, pc
	bx	ip
	ldr	r3, .L348+32
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4, #128]
	mov	lr, pc
	bx	r5
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L348+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L348+40
	mov	lr, pc
	bx	r3
.L333:
	adr	r3, .L348+8
	ldmia	r3, {r2-r3}
	str	r0, [r4, #128]
	ldr	ip, .L348+36
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	ip
	ldr	r3, .L348+40
	mov	lr, pc
	bx	r3
	str	r0, [r4, #176]
.L334:
	ldr	r3, [r4, #128]
	sub	r3, r3, #1
	cmp	r3, #496
	movcs	r3, #1
	add	r4, r4, #64
	strcs	r3, [r4, #104]
	cmp	r4, r10
	beq	.L347
.L336:
	ldr	r3, .L348+44
	ldr	r0, [r4, #176]
	mov	lr, pc
	bx	r3
	adr	r3, .L348
	ldmia	r3, {r2-r3}
	ldr	ip, .L348+28
	mov	r6, r0
	mov	r7, r1
	mov	lr, pc
	bx	ip
	ldr	r2, .L348+32
	mov	lr, pc
	bx	r2
	ldr	r2, [sp, #4]
	ldr	fp, [r4, #124]
	ldr	r3, [r4, #144]
	sub	r5, fp, r2
	ldr	r2, .L348+40
	add	r5, r5, r3
	mov	r9, r1
	mov	r8, r0
	mov	lr, pc
	bx	r2
	ldr	r1, [sp, #8]
	sub	r5, r5, r0
	cmp	r5, r1
	movge	r3, #1
	strge	r3, [r4, #168]
	bge	.L334
	ldr	r3, .L348+44
	mov	r0, fp
	mov	lr, pc
	bx	r3
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L348+36
	mov	lr, pc
	bx	ip
	ldr	r2, .L348+40
	mov	lr, pc
	bx	r2
	str	r0, [r4, #124]
	ldr	r3, [r10, #-328]
	cmp	r3, #1
	mov	r3, #0
	str	r3, [r10, #168]
	ldr	r5, .L348+44
	ldr	r0, [r4, #180]
	bne	.L332
	mov	lr, pc
	bx	r5
	adr	r3, .L348
	ldmia	r3, {r2-r3}
	ldr	ip, .L348+28
	mov	lr, pc
	bx	ip
	ldr	r3, .L348+32
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4, #128]
	mov	lr, pc
	bx	r5
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L348+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L348+40
	mov	lr, pc
	bx	r3
	b	.L333
.L347:
	ldr	r3, [r10, #-328]
	cmp	r3, #1
	ldr	r3, [r10, #-372]
	ldr	r2, [r10, #-376]
	addeq	r3, r3, #5
	subne	r3, r3, #5
	str	r3, [r10, #128]
	ldr	r3, [sp, #12]
	str	r2, [r10, #124]
	add	r10, r10, #620
	cmp	r10, r3
	bne	.L339
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L349:
	.align	3
.L348:
	.word	2576980378
	.word	1069128089
	.word	2576980378
	.word	1074370969
	.word	currentTown
	.word	vOff
	.word	villagers+384
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.size	updateTownViewHostileArrows, .-updateTownViewHostileArrows
	.align	2
	.global	animateTownViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateTownViewVillagers, %function
animateTownViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L373
	ldr	r3, [r3, #4]
	cmp	r3, #0
	ble	.L350
	ldr	r4, .L373+4
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r3, lsl #5
	mov	r8, #0
	ldr	fp, .L373+8
	ldr	r9, .L373+12
	add	r10, r4, r3, lsl #2
	b	.L358
.L355:
	sub	r3, r1, #1
	rsbs	r1, r3, #0
	adc	r1, r1, r3
	cmp	r7, #0
	movne	r7, r1
	moveq	r7, #0
	cmp	r7, #0
	movne	r3, #2
	strne	r3, [r4, #36]
	bne	.L357
.L356:
	str	r8, [r4, #44]
	str	r8, [r4, #32]
	str	r6, [r4, #36]
	add	r4, r4, #620
	cmp	r4, r10
	beq	.L350
.L358:
	ldr	r7, [r4, #80]
	cmp	r7, #0
	bne	.L372
	ldr	r6, [r4, #108]
	cmp	r6, #0
	beq	.L353
.L372:
	ldr	r6, [r4, #36]
.L353:
	ldr	r5, [r4, #32]
	smull	r3, r0, fp, r5
	asr	r1, r5, #31
	rsb	r1, r1, r0, asr #3
	add	r1, r1, r1, lsl #2
	cmp	r5, r1, lsl #2
	str	r6, [r4, #40]
	bne	.L354
	add	r0, r4, #44
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r9
	str	r1, [r4, #44]
.L354:
	ldr	r1, [r4, #56]
	cmn	r1, #1
	bne	.L355
	cmp	r7, #0
	movne	r3, #3
	strne	r3, [r4, #36]
	beq	.L356
.L357:
	add	r5, r5, #1
	str	r5, [r4, #32]
	add	r4, r4, #620
	cmp	r4, r10
	bne	.L358
.L350:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L374:
	.align	2
.L373:
	.word	currentTown
	.word	villagers
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateTownViewVillagers, .-animateTownViewVillagers
	.align	2
	.global	updateTownViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTownViewVillagers, %function
updateTownViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r9, .L457
	ldr	r3, [r9, #4]
	cmp	r3, #0
	sub	sp, sp, #28
	ble	.L418
	mov	r8, #0
	ldr	r10, .L457+4
	ldr	fp, .L457+8
	b	.L417
.L452:
	ldr	r2, [r10, #-84]
.L414:
	ldr	r1, .L457+12
	sub	r3, r3, #2
	cmp	r3, r1
	ldrhi	r3, [r10, #-112]
	rsbhi	r3, r3, #0
	strhi	r3, [r10, #-112]
	cmp	r2, #0
	streq	r2, [r10, #-88]
	ldr	r3, [r10, #-92]
	ldr	r2, [r9, #4]
	add	r8, r8, #1
	add	r3, r3, #1
	cmp	r2, r8
	str	r3, [r10, #-92]
	add	r10, r10, #620
	ble	.L418
.L417:
	ldr	r3, [fp]
	cmp	r3, #0
	movne	r3, #1
	strne	r3, [r10, #-60]
	ldr	r3, [r10, #-164]
	cmp	r3, #0
	bgt	.L378
	mov	r3, #1
	ldr	r2, .L457+16
	ldr	r1, [r9, #24]
	add	r2, r2, r1, lsl #5
	str	r3, [r2, #8]
	str	r3, [r10, #-116]
	str	r3, [r9, #8]
.L378:
	ldr	r3, [r10, #-96]
	cmp	r3, #0
	bne	.L379
.L385:
	ldr	r3, [r10, #-168]
	cmp	r3, #4
	beq	.L380
.L451:
	ldr	r3, [r10, #-156]
.L390:
	ldr	r2, [r10, #-88]
	cmp	r2, #0
	beq	.L452
.L420:
	ldr	r2, [r10, #-112]
	ldr	r1, [r10, #-148]
	mla	r3, r1, r2, r3
	ldr	r2, [r10, #-84]
	sub	r2, r2, #1
	str	r3, [r10, #-156]
	str	r2, [r10, #-84]
	b	.L414
.L380:
	ldr	r2, [r10, #404]
	cmp	r2, #0
	mov	r3, r2
	ldr	r1, [r10, #-164]
	ble	.L391
	sub	r3, r2, #1
	cmp	r1, #0
	str	r3, [r10, #404]
	ble	.L453
.L392:
	sub	r3, r3, #1
.L395:
	mov	r7, #0
	ldr	r4, .L457+20
	str	r3, [r10, #404]
	ldr	r3, [r10, #-60]
	add	r6, r4, #256
.L403:
	cmp	r3, #0
	ldr	r5, [r4, #60]
	beq	.L396
	ldr	r2, [r10, #-164]
	cmp	r2, #0
	ble	.L396
	cmp	r5, #0
	beq	.L397
	ldr	r2, [r10, #404]
	cmp	r2, #1
	ble	.L454
.L402:
	add	r4, r4, #64
	cmp	r6, r4
	bne	.L403
	cmp	r3, #0
	beq	.L451
	ldr	r2, [r10, #-116]
	cmp	r2, #0
	bne	.L451
	ldr	r1, .L457+24
	ldr	r0, [r10, #-76]
	ldr	ip, [r1, #4]
	ldr	r3, [r10, #-156]
	ldr	r1, [r10, #-56]
	sub	ip, r3, ip
	sub	r0, r0, #1
	eor	lr, ip, ip, asr #31
	add	r1, r1, #1
	cmp	r0, #2
	str	r0, [r10, #-76]
	str	r1, [r10, #-56]
	sub	lr, lr, ip, asr #31
	bgt	.L404
	cmp	lr, #80
	ble	.L404
	lsl	r0, r8, #2
	cmp	ip, #0
	add	r0, r0, #20
	str	r0, [r10, #-84]
	mvngt	r0, #0
	mov	lr, #1
	ldr	ip, .L457+28
	strgt	r0, [r10, #-112]
	smull	r0, ip, r1, ip
	asr	r0, r1, #31
	add	ip, ip, r1
	rsb	r0, r0, ip, asr #5
	rsb	r0, r0, r0, lsl #4
	sub	r1, r1, r0, lsl #2
	add	r0, r8, #2
	strle	lr, [r10, #-112]
	cmp	r1, r0
	str	lr, [r10, #-88]
	bgt	.L420
.L413:
	ldr	r1, [r10, r2, lsl #6]
	cmp	r1, #0
	bne	.L455
	add	r2, r2, #1
	cmp	r2, #6
	bne	.L413
	b	.L390
.L397:
	ldm	r4, {r2, r3}
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	sub	r2, r10, #144
	ldm	r2, {r2, r3}
	ldr	r1, [r10, #-160]
	ldr	r0, [r10, #-156]
	ldr	ip, .L457+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L449
	mov	r3, #1
	ldr	r1, .L457+36
	str	r3, [r4, #44]
	str	r3, [r4, #60]
	mov	r2, r5
	ldr	r1, [r1]
	str	r5, [r4, #4]
	str	r5, [r4]
	ldr	r0, .L457+40
	ldr	r3, .L457+44
	mov	lr, pc
	bx	r3
.L449:
	ldr	r5, [r4, #60]
	ldr	r3, [r10, #-60]
.L396:
	cmp	r5, #0
	beq	.L402
	ldr	r2, [r10, #404]
	cmp	r2, #1
	bgt	.L402
.L454:
	mov	r1, #10
	ldr	r2, [r10, #-164]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r7, [r4, #60]
	str	r2, [r10, #-164]
	str	r1, [r10, #404]
	bgt	.L402
	mov	r2, #1
	ldr	r1, [fp]
	cmp	r1, #0
	ldrne	r1, .L457+48
	str	r2, [r10, #-116]
	ldrne	r2, [r1]
	addne	r2, r2, #1
	strne	r2, [r1]
	b	.L402
.L418:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateTownViewVillagers
.L379:
	ldr	r6, .L457+52
	ldr	r4, [r10, #-92]
	mov	lr, pc
	bx	r6
	ldr	r3, .L457+56
	smull	r2, r3, r0, r3
	asr	r1, r0, #31
	rsb	r1, r1, r3, asr #4
	add	r1, r1, r1, lsl #2
	sub	r1, r0, r1, lsl #3
	ldr	r3, .L457+60
	mov	r0, r4
	add	r1, r1, #180
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	beq	.L456
.L383:
	ldr	r3, [r9, #4]
	cmp	r3, #0
	ble	.L385
	mov	r7, #1
	rsb	r3, r8, r8, lsl #31
	lsl	r3, r3, r7
	add	r3, r3, #55
	mov	r4, #0
	ldr	r5, .L457+64
	str	r3, [sp, #20]
	b	.L389
.L387:
	ldr	r3, [r9, #4]
	cmp	r3, r4
	add	r5, r5, #620
	ble	.L385
.L389:
	cmp	r4, r8
	add	r4, r4, #1
	beq	.L387
	add	r2, r5, #8
	ldm	r2, {r2, r3}
	ldr	r0, [r5, #28]
	ldr	r1, [r5, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	sub	r2, r10, #144
	ldm	r2, {r2, r3}
	ldr	r1, [r10, #-160]
	ldr	r0, [r10, #-156]
	ldr	ip, .L457+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L387
	ldr	r3, [r10, #-88]
	cmp	r3, #0
	bne	.L387
	ldr	r3, [sp, #20]
	str	r7, [r10, #-88]
	str	r3, [r10, #-84]
	mov	lr, pc
	bx	r6
	ldr	r2, .L457+68
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #50
	ldrgt	r3, [r10, #-112]
	rsbgt	r3, r3, #0
	strgt	r3, [r10, #-112]
	b	.L387
.L391:
	cmp	r1, #0
	ble	.L394
	cmp	r2, #0
	movlt	r3, #0
	blt	.L395
	b	.L392
.L453:
	mov	r2, r3
.L394:
	mov	r3, #1
	mov	r0, #0
	ldr	r1, .L457+72
	cmp	r2, #0
	str	r3, [r10, #-116]
	str	r3, [r1]
	str	r0, [r10, #448]
	mov	r3, r2
	movlt	r3, #0
	blt	.L395
	b	.L392
.L456:
	ldr	r3, [r10, #-88]
	cmp	r3, #0
	bne	.L383
	mov	r2, #1
	lsl	r3, r8, r2
	add	r3, r3, #30
	str	r3, [r10, #-84]
	str	r2, [r10, #-88]
	mov	lr, pc
	bx	r6
	ldr	r2, .L457+68
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #60
	ldrgt	r3, [r10, #-112]
	rsbgt	r3, r3, #0
	strgt	r3, [r10, #-112]
	b	.L383
.L404:
	cmp	lr, #39
	bgt	.L408
	ldr	r0, [r10, #-48]
	cmp	r0, #0
	bne	.L409
	mov	r2, #1
	cmp	ip, #0
	mov	r1, #20
	str	r2, [r10, #-48]
	mvngt	r2, #0
	str	r1, [r10, #-76]
	str	r2, [r10, #-112]
	b	.L390
.L409:
	cmp	ip, #0
	mvngt	r0, #0
	strgt	r0, [r10, #-112]
	movle	r0, #1
	strle	r0, [r10, #-112]
.L408:
	ldr	ip, .L457+28
	smull	r0, ip, r1, ip
	asr	r0, r1, #31
	add	ip, ip, r1
	rsb	r0, r0, ip, asr #5
	rsb	r0, r0, r0, lsl #4
	sub	r1, r1, r0, lsl #2
	add	r0, r8, #2
	cmp	r1, r0
	bgt	.L390
	b	.L413
.L455:
	mov	lr, #0
	mov	ip, #10
	mov	r0, #80
	add	r1, r8, r8, lsl #2
	rsb	r1, r1, r1, lsl #5
	lsl	r1, r1, #2
	add	r1, r1, r2, lsl #6
	ldr	r2, .L457+64
	add	r2, r2, r1
	str	lr, [r2, #168]
	ldr	r1, [r10, #-160]
	sub	r1, r1, #3
	str	r1, [r2, #124]
	str	r3, [r2, #128]
	str	ip, [r2, #176]
	str	r0, [r2, #180]
	ldr	r3, [r10, #-112]
	str	r3, [r2, #172]
	b	.L451
.L458:
	.align	2
.L457:
	.word	currentTown
	.word	villagers+168
	.word	cheatActive
	.word	494
	.word	towns
	.word	arrows
	.word	player
	.word	-2004318071
	.word	collision
	.word	enemyHit_length
	.word	enemyHit_data
	.word	playSoundB
	.word	playerMoney
	.word	rand
	.word	1717986919
	.word	__aeabi_idivmod
	.word	villagers
	.word	1374389535
	.word	bountyKilled
	.size	updateTownViewVillagers, .-updateTownViewVillagers
	.align	2
	.global	updateTownView
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTownView, %function
updateTownView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, lr}
	ldr	r4, .L466
	str	r3, [r4]
	bl	updateTownViewPlayer
	bl	updateTownViewVillagers
	bl	updateTownViewArrows
	bl	updateTownViewHostileArrows
	ldr	ip, .L466+4
	ldr	r3, [ip]
	cmp	r3, #0
	ble	.L460
	ldr	r2, [r4]
	sub	r3, r3, #1
	cmp	r2, #0
	str	r3, [ip]
	beq	.L459
	cmp	r3, #0
	beq	.L464
.L459:
	pop	{r4, lr}
	bx	lr
.L460:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L459
.L464:
	mov	lr, #80
	mov	r2, #0
	ldr	r0, .L466+8
	ldr	r3, [r0]
	ldr	r1, .L466+12
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r1, [r1]
	ldr	r0, .L466+16
	ldr	r3, .L466+20
	str	r2, [r4]
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L467:
	.align	2
.L466:
	.word	playerTookDamage
	.word	damageTimer
	.word	playerHealth
	.word	playerHit_length
	.word	playerHit_data
	.word	playSoundB
	.size	updateTownView, .-updateTownView
	.align	2
	.global	drawTownViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTownViewPlayer, %function
drawTownViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L472
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L469
	ldr	r2, .L472+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L469:
	b	drawTownViewPlayer.part.0
.L473:
	.align	2
.L472:
	.word	player
	.word	shadowOAM
	.size	drawTownViewPlayer, .-drawTownViewPlayer
	.align	2
	.global	drawTownViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTownViewVillagers, %function
drawTownViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L529
	ldr	r4, [r3, #4]
	cmp	r4, #0
	sub	sp, sp, #68
	ble	.L474
	mov	r8, #0
	ldr	r10, .L529+4
	ldr	r0, .L529+8
	ldr	r1, .L529+12
	mov	r2, r10
	ldr	r0, [r0]
	ldr	r1, [r1]
	str	r1, [sp, #60]
	orrs	r1, r0, r1
	str	r1, [sp, #24]
	moveq	r1, #1
	movne	r1, r8
	ldr	r6, .L529+16
	ldr	r6, [r6]
	mov	r9, r6
	ldr	r7, .L529+20
	ldr	r7, [r7]
	ldr	r3, .L529+24
	str	r7, [sp, #8]
	add	r7, r2, #728
	ldr	r3, [r3]
	str	r6, [sp, #56]
	ldrh	r6, [r7]
	ldr	lr, .L529+28
	str	r1, [sp, #12]
	ldr	ip, .L529+32
	sub	r1, r3, r8
	str	r6, [sp, #4]
	ldrh	r6, [r7, #2]
	rsbs	r3, r1, #0
	adc	r3, r3, r1
	str	r6, [sp, #16]
	ldr	r1, .L529+36
	ldrh	r6, [lr]
	ldr	lr, [ip]
	str	r3, [sp, #44]
	ldr	r3, .L529+40
	str	r0, [sp, #36]
	str	lr, [sp, #48]
	mov	r0, r10
	ldr	lr, [r1]
	add	r10, r10, #732
	ldr	r1, [sp, #8]
	ldr	r5, .L529+44
	ldr	r3, [r3]
	str	r10, [sp, #32]
	ldrh	r10, [r10]
	orr	r1, r1, r9
	str	r10, [sp, #20]
	ldrh	r7, [r5]
	str	r3, [sp, #28]
	mov	fp, r8
	mov	r10, r8
	str	lr, [sp, #52]
	ldr	r3, .L529+48
	ldr	r5, .L529+52
	str	r1, [sp, #40]
	add	r4, r2, r4, lsl #3
	b	.L505
.L526:
	ldrh	r1, [r2, #80]
	orr	r1, r1, #512
	strh	r1, [r2, #80]	@ movhi
.L478:
	add	r2, r2, #8
	cmp	r2, r4
	add	r3, r3, #620
	sub	r0, r0, #8
	beq	.L525
.L505:
	ldr	ip, [r3, #52]
	cmp	ip, #0
	bne	.L526
	ldr	r8, [r3, #8]
	ldr	r1, [r3, #12]
	sub	r8, r8, r7
	lsl	lr, r8, #16
	sub	r1, r1, r6
	and	r8, r8, #255
	strh	r8, [r2, #80]	@ movhi
	and	r1, r1, r5
	ldr	r8, [r3]
	orr	r1, r1, #16384
	strh	r1, [r2, #82]	@ movhi
	lsr	lr, lr, #16
	cmp	r8, #4
	ldrls	pc, [pc, r8, asl #2]
	b	.L478
.L480:
	.word	.L484
	.word	.L483
	.word	.L482
	.word	.L481
	.word	.L479
.L479:
	ldr	ip, [r3, #108]
	cmp	ip, #0
	ldr	ip, [sp, #12]
	str	ip, [r3, #616]
	beq	.L503
	ldr	r1, [r3, #36]
	ldr	ip, [r3, #44]
	add	r1, r1, #8
	add	r1, r1, ip, lsl #5
	mov	ip, #0
	lsl	r1, r1, #1
	str	ip, [r3, #616]
	strh	r1, [r2, #84]	@ movhi
.L504:
	add	ip, r0, #720
	ldrh	r1, [ip]
	orr	r1, r1, #512
	strh	r1, [ip]	@ movhi
	b	.L478
.L481:
	ldr	r8, [r3, #612]
	sub	r8, r8, #1
	cmp	r8, #4
	ldrls	pc, [pc, r8, asl #2]
	b	.L492
.L494:
	.word	.L497
	.word	.L496
	.word	.L492
	.word	.L495
	.word	.L493
.L482:
	ldr	ip, [r3, #44]
	ldr	r1, [r3, #36]
	add	r1, r1, ip, lsl #5
	add	r1, r1, #100
	lsl	r1, r1, #1
	strh	r1, [r2, #84]	@ movhi
	b	.L478
.L483:
	ldr	ip, [r3, #100]
	cmp	ip, #0
	beq	.L485
	cmp	ip, #1
	bne	.L522
	ldr	r8, [sp, #28]
	cmp	r8, #0
	streq	ip, [r3, #616]
	beq	.L489
	ldr	ip, [r3, #44]
	ldr	r1, [r3, #36]
	add	r1, r1, ip, lsl #5
	mov	ip, #0
	add	r1, r1, #292
	lsl	r1, r1, #1
	orr	r1, r1, #12288
	str	ip, [r3, #616]
	strh	r1, [r2, #84]	@ movhi
.L491:
	ldr	r1, [sp, #4]
	orr	r1, r1, #512
	mov	fp, #1
	str	r1, [sp, #4]
	b	.L478
.L484:
	ldr	r1, [r3, #36]
	ldr	ip, [r3, #44]
	add	r1, r1, #4
	add	r1, r1, ip, lsl #5
	lsl	r1, r1, #1
	strh	r1, [r2, #84]	@ movhi
	b	.L478
.L525:
	cmp	fp, #0
	ldrne	r3, [sp, #4]
	ldrne	r2, .L529+56
	strhne	r3, [r2]	@ movhi
	cmp	r10, #0
	beq	.L474
	ldr	r3, [sp, #16]
	ldr	r2, .L529+56
	strh	r3, [r2, #2]	@ movhi
	ldr	r3, [sp, #32]
	ldr	r2, [sp, #20]
	strh	r2, [r3]	@ movhi
.L474:
	add	sp, sp, #68
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L522:
	ldr	fp, [r3, #44]
	ldr	ip, [r3, #36]
	add	ip, ip, fp, lsl #5
	ldr	r8, [r3, #616]
	add	ip, ip, #292
	lsl	ip, ip, #1
	orr	ip, ip, #12288
	cmp	r8, #0
	strh	ip, [r2, #84]	@ movhi
	beq	.L491
.L508:
	mov	r10, #1
	str	r1, [sp, #16]
	sub	lr, lr, #20
	ldr	r1, .L529+60
	and	ip, lr, #255
	mov	fp, r10
	str	ip, [sp, #4]
	str	r1, [sp, #20]
	b	.L478
.L503:
	ldr	ip, [r3, #36]
	ldr	r8, [r3, #44]
	add	ip, ip, #8
	add	ip, ip, r8, lsl #5
	ldr	r8, [sp, #24]
	lsl	ip, ip, #1
	cmp	r8, #0
	strh	ip, [r2, #84]	@ movhi
	bne	.L504
.L524:
	add	ip, r0, #720
	strh	r1, [ip, #2]	@ movhi
	mov	r1, #12672	@ movhi
	sub	lr, lr, #20
	and	lr, lr, #255
	add	r8, r0, #724
	strh	lr, [ip]	@ movhi
	strh	r1, [r8]	@ movhi
	b	.L478
.L485:
	ldr	ip, .L529+64
	ldr	ip, [ip]
	cmp	ip, #49
	bgt	.L522
	mov	ip, #1
	str	ip, [r3, #616]
.L489:
	ldr	r8, [r3, #44]
	ldr	ip, [r3, #36]
	add	ip, ip, r8, lsl #5
	add	ip, ip, #292
	lsl	ip, ip, #1
	orr	ip, ip, #12288
	strh	ip, [r2, #84]	@ movhi
	b	.L508
.L497:
	ldr	r8, [r3, #44]
	ldr	ip, [r3, #36]
	add	ip, ip, r8, lsl #5
	add	ip, ip, #388
	ldr	r8, [sp, #44]
	lsl	ip, ip, #1
	orr	ip, ip, #12288
	strh	ip, [r2, #84]	@ movhi
	mov	ip, r8
	str	r8, [r3, #616]
.L498:
	cmp	ip, #0
	beq	.L504
	b	.L524
.L496:
	ldr	r8, [sp, #36]
	cmp	r8, #0
	bne	.L499
	ldr	ip, [sp, #52]
	cmp	ip, #0
	moveq	ip, #1
	bne	.L527
.L499:
	ldr	r8, [r3, #44]
	add	r8, r8, #12
	b	.L523
.L495:
	ldr	r8, [sp, #8]
	cmp	r8, #0
	bne	.L500
	ldr	ip, [sp, #48]
	cmp	ip, #0
	moveq	ip, #1
	bne	.L528
.L500:
	ldr	r8, [r3, #36]
	ldr	r9, [r3, #44]
	add	r8, r8, r9, lsl #5
	add	r8, r8, #196
	lsl	r8, r8, #1
	orr	r8, r8, #12288
	str	ip, [r3, #616]
	strh	r8, [r2, #84]	@ movhi
	b	.L498
.L493:
	ldr	r8, [sp, #40]
	cmp	r8, #0
	bne	.L501
	ldr	ip, [sp, #48]
	subs	ip, ip, #0
	movne	ip, #1
.L501:
	ldr	r8, [r3, #44]
	add	r8, r8, #9
.L523:
	ldr	r9, [r3, #36]
	add	r8, r9, r8, lsl #5
	lsl	r8, r8, #1
	orr	r8, r8, #12288
	str	ip, [r3, #616]
	strh	r8, [r2, #84]	@ movhi
	b	.L498
.L492:
	ldr	ip, [r3, #616]
	b	.L498
.L528:
	ldr	ip, [sp, #56]
	subs	ip, ip, #0
	movne	ip, #1
	b	.L500
.L527:
	ldr	ip, [sp, #60]
	subs	ip, ip, #0
	movne	ip, #1
	b	.L499
.L530:
	.align	2
.L529:
	.word	currentTown
	.word	shadowOAM
	.word	bountyCompleted
	.word	bountyKilled
	.word	letterRecieved
	.word	letterCompleted
	.word	playerHasBow
	.word	hOff
	.word	letterStarted
	.word	bountyStarted
	.word	boughtKey
	.word	vOff
	.word	villagers
	.word	511
	.word	shadowOAM+728
	.word	8518
	.word	playerShootSpeed
	.size	drawTownViewVillagers, .-drawTownViewVillagers
	.align	2
	.global	drawTownViewHostileArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTownViewHostileArrows, %function
drawTownViewHostileArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L551
	ldr	r3, [r3, #4]
	sub	sp, sp, #12
	cmp	r3, #0
	str	r3, [sp, #4]
	ble	.L531
	mov	r7, #0
	mov	fp, #4416
	ldr	r2, .L551+4
	ldr	r3, .L551+8
	ldrh	r10, [r2]
	ldrh	r9, [r3]
	ldr	r6, .L551+12
	ldr	r5, .L551+16
	ldr	r8, .L551+20
.L540:
	mov	r3, r5
	mov	r0, #0
	ldr	r2, .L551+24
	lsl	r4, r7, #3
	b	.L536
.L549:
	ldrh	r1, [r2]
	orr	r1, r1, #512
	strh	r1, [r2]	@ movhi
.L534:
	add	r0, r0, #1
	cmp	r0, #6
	add	r3, r3, #64
	add	r2, r2, r4
	beq	.L548
.L536:
	ldr	r1, [r3, #168]
	cmp	r1, #0
	bne	.L549
	ldr	r1, [r3, #172]
	cmp	r1, #1
	ldr	r1, .L551+28
	moveq	lr, fp
	movne	lr, r1
	ldr	r1, [r3, #128]
	ldr	ip, [r3, #124]
	sub	r1, r1, r9
	and	r1, r1, r8
	sub	ip, ip, r10
	orr	r1, r1, #16384
	and	ip, ip, #255
	strh	lr, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	b	.L534
.L548:
	ldr	r3, [r5, #552]
	cmp	r3, #0
	beq	.L537
	ldrh	r3, [r6, #160]
	orr	r3, r3, #512
	strh	r3, [r6, #160]	@ movhi
.L538:
	ldr	r3, [sp, #4]
	add	r7, r7, #1
	cmp	r3, r7
	add	r6, r6, #8
	add	r5, r5, #620
	bne	.L540
.L531:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L537:
	add	r2, r5, #508
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #108]
	sub	r3, r3, r9
	and	r3, r3, r8
	sub	r2, r2, r10
	cmp	r1, #0
	orr	r3, r3, #16384
	and	r2, r2, #255
	beq	.L539
	ldr	r1, [r5, #56]
	cmp	r1, #1
	beq	.L550
.L539:
	strh	r3, [r6, #162]	@ movhi
	ldr	r3, .L551+32
	strh	r2, [r6, #160]	@ movhi
	strh	r3, [r6, #164]	@ movhi
	b	.L538
.L550:
	strh	r3, [r6, #162]	@ movhi
	mov	r3, #4352	@ movhi
	strh	r2, [r6, #160]	@ movhi
	strh	r3, [r6, #164]	@ movhi
	b	.L538
.L552:
	.align	2
.L551:
	.word	currentTown
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	villagers
	.word	511
	.word	shadowOAM+360
	.word	4418
	.word	4354
	.size	drawTownViewHostileArrows, .-drawTownViewHostileArrows
	.align	2
	.global	drawTownViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTownViewArrows, %function
drawTownViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #0
	mov	r8, #4416
	ldr	r6, .L563
	ldr	r7, .L563+4
	ldr	r3, .L563+8
	ldrh	r4, [r6]
	ldrh	lr, [r7]
	ldr	r2, .L563+12
	ldr	ip, .L563+16
	ldr	r5, .L563+20
	add	r0, r3, #32
.L557:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	beq	.L554
	ldrh	r1, [r3]
	orr	r1, r1, #512
	strh	r1, [r3]	@ movhi
.L555:
	add	r3, r3, #8
	cmp	r0, r3
	add	r2, r2, #64
	bne	.L557
	ldr	r2, .L563+24
	ldr	r3, [r2, #44]
	cmp	r3, #0
	eor	r10, r10, #1
	movne	r10, #1
	andeq	r10, r10, #1
	cmp	r10, #0
	beq	.L558
	ldr	r2, .L563+28
	ldrh	r3, [r2, #72]
	orr	r3, r3, #512
	strh	r3, [r2, #72]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L554:
	ldr	r1, [r2, #4]
	ldr	r9, [r2]
	ldr	r10, [r2, #48]
	sub	r1, r1, lr
	and	r1, r1, ip
	sub	r9, r9, r4
	cmp	r10, #1
	orr	r1, r1, #16384
	and	r9, r9, #255
	movne	r10, #1
	strh	r1, [r3, #2]	@ movhi
	strh	r9, [r3]	@ movhi
	strheq	r8, [r3, #4]	@ movhi
	strhne	r5, [r3, #4]	@ movhi
	b	.L555
.L558:
	ldr	r1, .L563+32
	ldr	r1, [r1, #48]
	ldr	r0, [r6]
	ldr	r3, [r2, #4]
	ldr	r2, [r2]
	cmp	r1, #1
	sub	r2, r2, r0
	moveq	r0, #4352
	ldr	ip, [r7]
	sub	r3, r3, ip
	lsl	r3, r3, #23
	ldreq	r1, .L563+28
	ldrne	r1, .L563+28
	ldrne	r0, .L563+36
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	and	r2, r2, #255
	strheq	r0, [r1, #76]	@ movhi
	strheq	r2, [r1, #72]	@ movhi
	strheq	r3, [r1, #74]	@ movhi
	strhne	r2, [r1, #72]	@ movhi
	strhne	r3, [r1, #74]	@ movhi
	strhne	r0, [r1, #76]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L564:
	.align	2
.L563:
	.word	vOff
	.word	hOff
	.word	shadowOAM+280
	.word	arrows
	.word	511
	.word	4418
	.word	bow
	.word	shadowOAM
	.word	player
	.word	4354
	.size	drawTownViewArrows, .-drawTownViewArrows
	.align	2
	.global	drawTownView
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTownView, %function
drawTownView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L569
	ldr	r3, [r3, #44]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	beq	.L566
	ldr	r2, .L569+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L567:
	bl	drawTownViewVillagers
	ldr	r4, .L569+8
	bl	drawTownViewArrows
	bl	drawTownViewHostileArrows
	ldr	r3, .L569+12
	ldr	r0, [r4]
	ldr	r1, [r3]
	ldr	r3, .L569+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L569+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L569+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L569+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L569+4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #67108864
	ldr	r3, [r4]
	add	r2, r3, r3, lsr #31
	asr	r2, r2, #1
	lsl	r2, r2, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	strh	r3, [r1, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r3, [r1, #20]	@ movhi
	strh	r2, [r1, #24]	@ movhi
	bx	lr
.L566:
	bl	drawTownViewPlayer.part.0
	b	.L567
.L570:
	.align	2
.L569:
	.word	player
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.word	drawButtons
	.word	drawGlobal
	.word	waitForVBlank
	.word	DMANow
	.size	drawTownView, .-drawTownView
	.comm	bow,64,4
	.comm	arrows,256,4
	.comm	player,64,4
	.comm	hasTalkedToQuestGiver,4,4
	.comm	villagers,3720,4
	.comm	storedText,41,4
	.global	villagerGreetings
	.global	villagerNames
	.comm	playerIsMoving,4,4
	.comm	damageTimer,4,4
	.comm	playerTookDamage,4,4
	.comm	savedhOff,4,4
	.comm	savedvOff,4,4
	.comm	savedWorldCol,4,4
	.comm	savedWorldRow,4,4
	.comm	playerShootCooldown,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	villagerNames, %object
	.size	villagerNames, 80
villagerNames:
	.ascii	"Farquad:\000"
	.space	1
	.ascii	"Linus:\000"
	.space	3
	.ascii	"Dovakihn:\000"
	.ascii	"Fredrick:\000"
	.ascii	"Salvador:\000"
	.ascii	"Bungus:\000"
	.space	2
	.ascii	"Leonardo:\000"
	.ascii	"George:\000"
	.space	2
	.type	villagerGreetings, %object
	.size	villagerGreetings, 120
villagerGreetings:
	.ascii	"I took an arrow in t"
	.ascii	"How do you do on thi"
	.ascii	"Happen to seen my sw"
	.ascii	"Need me a horse.... "
	.ascii	"*groans*\000\000"
	.space	10
	.space	20
	.ident	"GCC: (devkitARM release 53) 9.1.0"
