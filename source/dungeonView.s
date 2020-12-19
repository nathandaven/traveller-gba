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
	.file	"dungeonView.c"
	.text
	.global	__aeabi_i2d
	.global	__aeabi_dsub
	.global	__aeabi_d2iz
	.global	__aeabi_dmul
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMead.part.0, %function
updateMead.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r10, .L28+24
	ldr	r3, [r10]
	ldr	fp, .L28+28
	cmp	r3, #0
	sub	sp, sp, #20
	ldr	r3, [fp]
	bne	.L2
	cmp	r3, #0
	beq	.L25
.L3:
	ldr	r2, .L28+32
	cmp	r3, r2
	ble	.L1
	mov	r3, #0
	ldr	r4, .L28+36
	str	r3, [r10]
	ldr	r5, .L28+40
	str	r3, [r4, #44]
	ldr	r0, [r4, #52]
	mov	lr, pc
	bx	r5
	mov	r6, r0
	mov	r7, r1
	adr	r3, .L28
	ldmia	r3, {r2-r3}
	str	r6, [sp, #8]
	str	r7, [sp, #12]
	ldr	r10, .L28+44
	mov	lr, pc
	bx	r10
	ldr	r9, .L28+48
	mov	lr, pc
	bx	r9
	mov	r2, r0
	mov	r3, r1
	ldr	r8, [r4]
	ldr	r0, [r4, #20]
	stm	sp, {r2-r3}
	add	r0, r8, r0
	mov	lr, pc
	bx	r5
	ldr	r7, .L28+52
	ldmia	sp, {r2-r3}
	mov	lr, pc
	bx	r7
	ldr	r6, .L28+56
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #4]
	ldr	r2, .L28+60
	add	r1, r3, r0, lsl #9
	lsl	r1, r1, #1
	ldrh	r1, [r2, r1]
	cmp	r1, #0
	lsl	r0, r0, #9
	beq	.L13
	add	r1, r4, #12
	ldm	r1, {r1, ip}
	add	r3, r3, ip
	sub	r3, r3, r1
	add	r3, r3, r0
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	beq	.L13
	adr	r3, .L28+8
	ldmia	r3, {r2-r3}
	add	r1, sp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	str	r0, [r4, #52]
	mov	lr, pc
	bx	r5
	adr	r3, .L28
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
	mov	r2, r0
	mov	r9, r1
	mov	r0, r8
	mov	r8, r2
	mov	lr, pc
	bx	r5
	mov	r2, r8
	mov	r3, r9
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	str	r0, [r4]
.L1:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	mov	r2, #1
	ldr	r3, .L28+64
	ldr	r0, .L28+68
	ldr	r1, [r3]
	ldr	r3, .L28+72
	str	r2, [r10]
	mov	lr, pc
	bx	r3
	ldr	r3, [r10]
	cmp	r3, #0
	ldr	r3, [fp]
	beq	.L3
.L2:
	add	r2, r3, #80
	cmp	r2, #158
	add	r3, r3, #1
	str	r3, [fp]
	bls	.L26
.L6:
	mov	r9, #0
	ldr	r4, .L28+76
	ldr	r5, .L28+40
	ldr	r8, .L28+52
	ldr	r7, .L28+56
	add	r6, r4, #640
.L11:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	strne	r9, [r4, #52]
	strne	r9, [r4]
	bne	.L10
	ldr	r0, [r4, #52]
	mov	lr, pc
	bx	r5
	adr	r3, .L28+16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	str	r0, [r4, #52]
	mov	lr, pc
	bx	r5
	ldr	ip, .L28+44
	adr	r3, .L28
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	ldr	r3, .L28+48
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	ldr	r0, [r4]
	stm	sp, {r2-r3}
	mov	lr, pc
	bx	r5
	ldmia	sp, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	lr, pc
	bx	r7
	str	r0, [r4]
.L10:
	add	r4, r4, #64
	cmp	r4, r6
	bne	.L11
	ldr	r3, [fp]
	b	.L3
.L13:
	mov	r3, #0
	str	r3, [r4, #52]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L26:
	mov	r4, #0
	ldr	r6, .L28+80
	ldr	r5, .L28+84
.L5:
	mov	lr, pc
	bx	r6
	ldr	r3, [r5, r4, lsl #6]
	cmp	r3, #1
	lsl	r3, r4, #6
	add	r4, r4, #1
	beq	.L27
	cmp	r4, #10
	bne	.L5
	b	.L6
.L27:
	mov	r1, #0
	ldr	r2, .L28+76
	add	r3, r2, r3
	str	r1, [r3, #44]
	b	.L6
.L29:
	.align	3
.L28:
	.word	2576980378
	.word	1069128089
	.word	1202590843
	.word	1074035425
	.word	2576980378
	.word	1073322393
	.word	meadTimerStarted
	.word	rainingMeadTimer
	.word	450
	.word	mead
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	dungeonCollisionBitmap
	.word	mainTheme_length
	.word	mainTheme_data
	.word	playSoundA
	.word	rainingMeads
	.word	rand
	.word	rainingMeads+44
	.size	updateMead.part.0, .-updateMead.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDungeonViewPlayer.part.0, %function
drawDungeonViewPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L32
	ldr	r2, .L32+4
	ldr	r3, [r0, #4]
	ldr	r1, [r2]
	ldr	r2, .L32+8
	str	lr, [sp, #-4]!
	ldr	ip, [r0, #36]
	ldr	lr, [r2]
	sub	r3, r3, r1
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	lsl	r3, r3, #23
	ldr	r0, .L32+12
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
.L33:
	.align	2
.L32:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawDungeonViewPlayer.part.0, .-drawDungeonViewPlayer.part.0
	.align	2
	.global	initDungeonViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDungeonViewPlayer, %function
initDungeonViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	lr, #16
	mov	r4, #3
	mov	ip, #1
	ldr	r1, .L36
	ldr	r3, .L36+4
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L36+8
	add	r0, r0, #70
	add	r1, r1, #120
	str	r4, [r3, #40]
	str	lr, [r3, #16]
	str	lr, [r3, #20]
	stm	r3, {r0, r1}
	str	ip, [r3, #8]
	str	ip, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	vOff
	.word	hOff
	.word	player
	.size	initDungeonViewPlayer, .-initDungeonViewPlayer
	.align	2
	.global	initDungeonViewEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDungeonViewEnemies, %function
initDungeonViewEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #1
	ldr	ip, .L50
	mov	r2, r5
	str	r5, [ip, #72]
	str	r5, [ip, #692]
	str	r5, [ip, #1312]
	str	r5, [ip, #1968]
	str	r5, [ip, #1964]
	mov	r5, #380
	str	r5, [ip, #12]
	mov	r5, #420
	str	r5, [ip, #1252]
	mov	r5, #70
	str	r5, [ip, #1868]
	mov	r5, #272
	str	r5, [ip, #1872]
	mov	r5, #292
	str	r5, [ip, #2488]
	mov	r5, #280
	str	r5, [ip, #2492]
	mov	r5, #7
	mov	r6, #0
	mov	r8, #432
	mov	r7, #4
	mov	r10, #400
	mov	fp, #5
	str	r5, [ip, #3100]
	ldr	r5, .L50+4
	mov	r3, ip
	mov	r0, r6
	mov	lr, #20
	mov	r1, #16
	mov	r4, #3
	mov	r9, #32
	str	r5, [ip, #3112]
	str	r10, [ip, #8]
	str	r10, [ip, #632]
	str	fp, [ip]
	str	fp, [ip, #620]
	str	r8, [ip, #628]
	str	r8, [ip, #1248]
	str	r8, [ip, #3108]
	str	r7, [ip, #1240]
	str	r7, [ip, #1860]
	str	r7, [ip, #2480]
	str	r6, [ip, #1932]
	str	r6, [ip, #2552]
	str	r6, [ip, #3172]
	b	.L43
.L49:
	cmp	ip, #4
	beq	.L47
.L41:
	add	lr, lr, #20
	cmp	lr, #140
	add	r3, r3, #620
	beq	.L48
.L43:
	ldr	ip, [r3]
	cmp	ip, #5
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r0, [r3, #32]
	str	r0, [r3, #44]
	str	r4, [r3, #48]
	str	r2, [r3, #56]
	str	r0, [r3, #80]
	str	r0, [r3, #108]
	str	r0, [r3, #52]
	streq	r4, [r3, #4]
	beq	.L41
	cmp	ip, #7
	bne	.L49
	mov	ip, #6
	add	lr, lr, #20
	cmp	lr, #140
	str	ip, [r3, #4]
	str	r9, [r3, #24]
	str	r9, [r3, #28]
	add	r3, r3, #620
	bne	.L43
.L48:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L47:
	mov	ip, r3
	mov	r5, #0
	str	r4, [r3, #4]
	str	lr, [r3, #112]
	ldr	r7, [r3, #8]
	ldr	r6, [r3, #12]
.L42:
	add	r5, r5, #1
	cmp	r5, #6
	str	r1, [ip, #140]
	str	r1, [ip, #144]
	str	r2, [ip, #132]
	str	r2, [ip, #136]
	str	r7, [ip, #124]
	str	r6, [ip, #128]
	str	r2, [ip, #168]
	str	r2, [ip, #172]
	add	ip, ip, #64
	bne	.L42
	str	r1, [r3, #524]
	str	r1, [r3, #528]
	str	r2, [r3, #516]
	str	r2, [r3, #520]
	str	r7, [r3, #508]
	str	r6, [r3, #512]
	str	r2, [r3, #552]
	b	.L41
.L51:
	.align	2
.L50:
	.word	enemies
	.word	450
	.size	initDungeonViewEnemies, .-initDungeonViewEnemies
	.align	2
	.global	initDungeonViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDungeonViewArrows, %function
initDungeonViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #16
	mov	r2, #1
	ldr	r0, .L56
	ldr	r3, .L56+4
	ldr	ip, [r0]
	ldr	r0, [r0, #4]
	str	lr, [sp, #-4]!
	add	lr, r3, #256
.L53:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r2, [r3, #44]
	add	r3, r3, #64
	cmp	r3, lr
	bne	.L53
	ldr	r3, .L56+8
	ldr	lr, [sp], #4
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r2, [r3, #44]
	bx	lr
.L57:
	.align	2
.L56:
	.word	player
	.word	arrows
	.word	bow
	.size	initDungeonViewArrows, .-initDungeonViewArrows
	.align	2
	.global	initDungeonViewButtons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDungeonViewButtons, %function
initDungeonViewButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	mov	r0, #16
	ldr	r3, .L60
	str	lr, [sp, #-4]!
	ldm	r3, {ip, lr}
	ldr	r2, .L60+4
	ldr	r3, .L60+8
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
.L61:
	.align	2
.L60:
	.word	player
	.word	aButton
	.word	bButton
	.size	initDungeonViewButtons, .-initDungeonViewButtons
	.align	2
	.global	initDungeonView
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDungeonView, %function
initDungeonView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, lr}
	mov	lr, #67108864
	mvn	r5, #0
	mov	r0, #16
	mov	r1, #1
	ldr	r4, .L66
	str	r3, [r4]
	ldr	r4, .L66+4
	str	r3, [r4]
	ldr	r4, .L66+8
	mov	r2, r3
	str	r5, [r4]
	mov	ip, r3
	strh	r3, [lr, #18]	@ movhi
	strh	r3, [lr, #16]	@ movhi
	ldr	r3, .L66+12
.L63:
	str	r2, [r3, #4]
	add	r2, r2, #24
	cmp	r2, #240
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3]
	str	r1, [r3, #44]
	add	r3, r3, #64
	bne	.L63
	mov	r5, #392
	mov	r2, #70
	mov	lr, #3
	mov	r4, #120
	ldr	r3, .L66+16
	str	r5, [r3]
	sub	r5, r5, #22
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r5, [r3, #4]
	str	r1, [r3, #44]
	ldr	r3, .L66+20
	str	r2, [r3]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	ldr	r2, .L66+24
	ldr	r0, .L66+28
	str	r4, [r3, #4]
	str	lr, [r3, #40]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	ip, [r3, #24]
	str	ip, [r3, #36]
	str	ip, [r3, #28]
	str	ip, [r0]
	str	ip, [r2]
	bl	initDungeonViewEnemies
	bl	initDungeonViewButtons
	pop	{r4, r5, r6, lr}
	b	initDungeonViewArrows
.L67:
	.align	2
.L66:
	.word	vOff
	.word	hOff
	.word	textViewChoice
	.word	rainingMeads
	.word	mead
	.word	player
	.word	rainingMeadTimer
	.word	meadTimerStarted
	.size	initDungeonView, .-initDungeonView
	.align	2
	.global	resumeDungeonView
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeDungeonView, %function
resumeDungeonView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L70
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r1, .L70+4
	ldr	r2, .L70+8
	ldr	r0, [r1]
	ldr	r2, [r2]
	ldr	lr, .L70+12
	ldr	ip, .L70+16
	str	r2, [lr]
	str	r0, [ip]
	lsl	r1, r2, #16
	ldr	ip, .L70+20
	lsl	r2, r0, #16
	ldr	r0, .L70+24
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
	ldr	r3, .L70+28
	ldr	r2, [r0]
	pop	{r4, lr}
	stm	r3, {r1, r2}
	bx	lr
.L71:
	.align	2
.L70:
	.word	waitForVBlank
	.word	savedhOff
	.word	savedvOff
	.word	vOff
	.word	hOff
	.word	savedWorldRow
	.word	savedWorldCol
	.word	player
	.size	resumeDungeonView, .-resumeDungeonView
	.align	2
	.global	updateMead
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMead, %function
updateMead:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L77
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, .L77+4
	ldr	r3, [r3]
	cmp	r3, #0
	bxne	lr
	b	updateMead.part.0
.L78:
	.align	2
.L77:
	.word	bossDead
	.word	meadCollected
	.size	updateMead, .-updateMead
	.global	__aeabi_idivmod
	.align	2
	.global	animateDungeonViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateDungeonViewPlayer, %function
animateDungeonViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L91
	ldr	r3, .L91+4
	ldr	r5, [r4, #24]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #28]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bne	.L80
	ldr	r0, [r4, #36]
	ldr	r3, .L91+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L80:
	ldr	r3, .L91+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L81
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L82
.L84:
	mov	r3, #2
	str	r3, [r4, #28]
.L82:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L84
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animateDungeonViewPlayer, .-animateDungeonViewPlayer
	.align	2
	.global	updateDungeonViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDungeonViewPlayer, %function
updateDungeonViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L178+8
	sub	sp, sp, #44
	bl	initDungeonViewButtons
	add	r2, fp, #12
	ldm	r2, {r2, r4}
	ldr	r5, [fp, #4]
	ldr	r10, [fp]
	ldr	r3, [fp, #8]
	add	r4, r5, r4
	sub	r4, r4, r2
	sub	r3, r10, r3
	ldr	r8, .L178+12
	add	r3, r4, r3, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r8, r3]
	cmp	r3, #31
	moveq	r2, #0
	ldr	r3, .L178+16
	ldr	r3, [r3]
	str	r3, [sp, #24]
	ldreq	r3, .L178+20
	ldr	r9, .L178+24
	streq	r2, [r3]
	ldr	r0, [fp, #52]
	mov	lr, pc
	bx	r9
	mov	r6, r0
	mov	r7, r1
	ldr	ip, .L178+28
	adr	r3, .L178
	ldmia	r3, {r2-r3}
	str	r6, [sp, #32]
	str	r7, [sp, #36]
	mov	lr, pc
	bx	ip
	ldr	r3, .L178+32
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	str	r2, [sp, #16]
	str	r3, [sp, #20]
	ldr	r2, [fp, #20]
	str	r2, [sp, #28]
	add	r0, r10, r2
	mov	lr, pc
	bx	r9
	ldr	r7, .L178+36
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r7
	ldr	r6, .L178+40
	mov	lr, pc
	bx	r6
	add	r5, r5, r0, lsl #9
	lsl	r5, r5, #1
	ldrh	r3, [r8, r5]
	cmp	r3, #0
	lsl	r0, r0, #9
	beq	.L95
	add	r0, r4, r0
	lsl	r0, r0, #1
	ldrh	r3, [r8, r0]
	cmp	r3, #0
	bne	.L170
.L95:
	mov	r3, #0
	mov	r4, #1
	str	r3, [fp, #52]
.L96:
	mov	r2, #0
	ldr	r3, .L178+44
	str	r2, [r3]
	ldr	r2, .L178+48
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L98
	mov	r0, #1
	mvn	r2, #0
	ldr	lr, .L178+52
	ldr	r1, [fp, #4]
	ldr	ip, [lr]
	sub	r5, r1, ip
	cmp	r5, #0
	str	r0, [r3]
	str	r2, [fp, #48]
	ble	.L98
	ldr	r5, [fp, #12]
	ldr	r2, [fp]
	sub	r1, r1, r5
	add	r0, r1, r2, lsl #9
	lsl	r0, r0, #1
	ldrh	r0, [r8, r0]
	cmp	r0, #0
	beq	.L98
	ldr	r6, [fp, #20]
	ldr	r0, [fp, #8]
	add	r2, r2, r6
	sub	r2, r2, r0
	add	r2, r1, r2, lsl #9
	lsl	r2, r2, #1
	ldrh	r2, [r8, r2]
	cmp	r2, #0
	beq	.L98
	ldr	r7, .L178+56
	ldr	r6, .L178+60
	ldr	r0, [r7, #4]
	ldr	r2, [r6, #4]
	sub	r0, r0, r5
	cmp	ip, #0
	sub	r5, r2, r5
	str	r1, [fp, #4]
	str	r0, [r7, #4]
	str	r5, [r6, #4]
	ble	.L98
	sub	r1, r1, ip
	cmp	r1, #119
	suble	r2, ip, #1
	strle	r2, [lr]
.L98:
	ldr	r2, .L178+48
	ldrh	r1, [r2, #48]
	ldr	r2, .L178+64
	tst	r1, #16
	ldr	ip, [r2, #12]
	bne	.L100
	mov	r1, #1
	ldr	r5, .L178+52
	ldr	r6, [fp, #4]
	ldr	lr, [r5]
	ldr	r0, [fp, #16]
	sub	r2, r6, lr
	add	r2, r2, r0
	cmp	r2, #239
	str	r1, [r3]
	str	r1, [fp, #48]
	bgt	.L102
	ldr	r2, [fp]
	add	r0, r6, r0
	add	r3, r0, r2, lsl #9
	lsl	r3, r3, r1
	ldrh	r3, [r8, r3]
	cmp	r3, #0
	beq	.L102
	ldr	r1, [fp, #20]
	ldr	r3, [fp, #8]
	add	r2, r2, r1
	sub	r2, r2, r3
	add	r0, r0, r2, lsl #9
	lsl	r2, r0, #1
	ldrh	r3, [r8, r2]
	cmp	r3, #0
	beq	.L102
	ldr	r8, .L178+56
	ldr	r7, .L178+60
	ldr	r0, [fp, #12]
	ldr	r1, [r8, #4]
	ldr	r2, [r7, #4]
	add	r1, r1, r0
	add	r3, r6, r0
	add	r2, r2, r0
	cmp	lr, #272
	str	r1, [r8, #4]
	str	r3, [fp, #4]
	str	r2, [r7, #4]
	bge	.L102
	sub	r3, r3, lr
	cmp	r3, #119
	addgt	lr, lr, #1
	strgt	lr, [r5]
.L102:
	cmp	ip, #0
	beq	.L104
.L107:
	ldr	r5, .L178+68
	ldrh	r3, [r5]
	tst	r3, #64
	beq	.L109
	ldr	r3, .L178+72
	ldrh	r3, [r3]
	eor	r3, r3, #64
	ands	r3, r4, r3, lsr #6
	bne	.L171
.L109:
	ldr	r2, .L178+76
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	movle	r3, #0
	str	r3, [r2]
	ldr	r3, .L178+80
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L112
	ldrh	r3, [r5]
	tst	r3, #2
	bne	.L172
.L112:
	ldr	r5, .L178+84
	add	r7, r5, #3712
	mov	r8, #1
	ldr	r1, [fp, #4]
	ldr	r2, [fp]
	ldr	r9, .L178+88
	ldr	r10, .L178+92
	add	r7, r7, #8
	b	.L124
.L175:
	cmp	r3, #4
	beq	.L173
.L119:
	add	r5, r5, #620
	cmp	r5, r7
	beq	.L174
.L124:
	ldr	r3, [r5]
	cmp	r3, #5
	beq	.L116
	cmp	r3, #7
	bne	.L175
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L176
.L120:
	ldr	r0, [fp, #20]
	ldr	r3, [fp, #16]
	stm	sp, {r1, r2}
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r5, #24
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #8]
	ldr	r0, [r5, #12]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	movne	r3, #60
	strne	r8, [r5, #116]
	strne	r3, [r5, #88]
	add	r5, r5, #620
	strne	r8, [r10]
	cmp	r5, r7
	ldr	r1, [fp, #4]
	ldr	r2, [fp]
	bne	.L124
.L174:
	ldr	r0, .L178+96
	ldr	r3, .L178+100
	str	r1, [r0]
	str	r2, [r3]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateDungeonViewPlayer
.L173:
	mov	r4, r5
	mov	r6, #0
	b	.L118
.L122:
	add	r6, r6, #1
	cmp	r6, #6
	add	r4, r4, #64
	beq	.L119
.L118:
	ldr	r3, [r4, #168]
	cmp	r3, #0
	bne	.L122
	ldr	r0, [fp, #20]
	ldr	r3, [fp, #16]
	stm	sp, {r1, r2}
	str	r0, [sp, #12]
	str	r3, [sp, #8]
	add	r2, r4, #140
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #124]
	ldr	r0, [r4, #128]
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	strne	r8, [r4, #168]
	strne	r8, [r10]
	ldr	r1, [fp, #4]
	ldr	r2, [fp]
	b	.L122
.L116:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L119
	b	.L120
.L179:
	.align	3
.L178:
	.word	2576980378
	.word	1069128089
	.word	player
	.word	dungeonCollisionBitmap
	.word	vOff
	.word	playerHealth
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	playerIsMoving
	.word	67109120
	.word	hOff
	.word	aButton
	.word	bButton
	.word	soundB
	.word	oldButtons
	.word	buttons
	.word	playerShootCooldown
	.word	playerHasBow
	.word	enemies
	.word	collision
	.word	playerTookDamage
	.word	savedWorldCol
	.word	savedWorldRow
	.word	bossDead
.L176:
	ldr	r3, .L178+104
	str	r8, [r3]
	b	.L119
.L170:
	adr	r3, .L180
	ldmia	r3, {r2-r3}
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	str	r0, [fp, #52]
	mov	lr, pc
	bx	r9
	ldr	ip, .L180+16
	adr	r3, .L180+8
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	ldr	r3, .L180+20
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r5, r1
	mov	r4, r2
	mov	r0, r10
	mov	lr, pc
	bx	r9
	mov	r2, r4
	mov	r3, r5
	str	r4, [sp, #16]
	str	r5, [sp, #20]
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r10, .L180+24
	mov	r4, r0
	str	r0, [fp]
	ldr	r0, [r10]
	mov	lr, pc
	bx	r9
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r5, .L180+28
	str	r0, [r10]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r9
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r1, [sp, #24]
	ldr	r2, [sp, #28]
	sub	r4, r4, r1
	add	r4, r4, r2
	ldr	r3, .L180+32
	cmp	r4, #125
	movgt	r4, #1
	movle	r4, #0
	cmp	r1, r3
	movgt	r4, #0
	cmp	r4, #0
	str	r0, [r5]
	beq	.L96
	mov	r0, r1
	mov	lr, pc
	bx	r9
	add	r3, sp, #16
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r7
	mov	lr, pc
	bx	r6
	ldr	r3, .L180+36
	mov	r4, #0
	str	r0, [r3]
	b	.L96
.L172:
	ldr	r3, .L180+40
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L112
	ldr	r1, [r2]
	cmp	r1, #1
	bgt	.L112
	ldr	r0, .L180+44
.L115:
	ldr	r1, [r0, r3, lsl #6]
	cmp	r1, #0
	lsl	r1, r3, #6
	bne	.L177
	add	r3, r3, #1
	cmp	r3, #4
	bne	.L115
.L114:
	ldr	r3, .L180+48
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L180+52
	ldr	r3, .L180+56
	mov	lr, pc
	bx	r3
	b	.L112
.L100:
	cmp	ip, #0
	ldr	r3, [r3]
	bne	.L103
	cmp	r3, #0
	bne	.L104
.L108:
	ldr	r2, [r2]
	ldr	r3, .L180+60
	cmp	r2, r3
	bne	.L107
	ldr	r3, .L180+64
	mov	lr, pc
	bx	r3
	b	.L107
.L104:
	ldr	r3, .L180+68
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L180+60
	ldr	r3, .L180+56
	mov	lr, pc
	bx	r3
	b	.L107
.L171:
	mov	lr, #40
	ldr	ip, .L180+24
	ldr	r0, .L180+28
	ldr	r1, [ip, #4]
	ldr	r2, [r0, #4]
	ldr	r3, [fp]
	sub	r1, r1, #1
	str	r1, [ip, #4]
	ldr	r1, .L180+72
	sub	r2, r2, #1
	sub	r3, r3, #4
	str	r2, [r0, #4]
	str	r3, [fp]
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, .L180+76
	ldr	r3, .L180+56
	str	lr, [fp, #52]
	mov	lr, pc
	bx	r3
	b	.L109
.L103:
	cmp	r3, #0
	bne	.L107
	b	.L108
.L177:
	mov	lr, #80
	mov	ip, #0
	mov	r4, #10
	ldr	r0, .L180+80
	ldr	r0, [r0]
	rsb	r0, r0, #30
	str	r0, [r2]
	ldr	r0, .L180+84
	ldr	r2, [fp, #4]
	add	r1, r0, r1
	str	r2, [r1, #4]
	ldr	r2, [fp]
	str	lr, [r1, #56]
	ldr	lr, [fp, #48]
	sub	r2, r2, #2
	str	r4, [r1, #52]
	str	r2, [r0, r3, lsl #6]
	str	lr, [r1, #48]
	str	ip, [r1, #44]
	str	ip, [r1, #60]
	b	.L114
.L181:
	.align	3
.L180:
	.word	1202590843
	.word	1074035425
	.word	2576980378
	.word	1069128089
	.word	__aeabi_dmul
	.word	round
	.word	aButton
	.word	bButton
	.word	341
	.word	vOff
	.word	buttons
	.word	arrows+44
	.word	arrowShot_length
	.word	arrowShot_data
	.word	playSoundB
	.word	walking_data
	.word	pauseSoundB
	.word	walking_length
	.word	playerJump_length
	.word	playerJump_data
	.word	playerShootSpeed
	.word	arrows
	.size	updateDungeonViewPlayer, .-updateDungeonViewPlayer
	.global	__aeabi_dadd
	.align	2
	.global	updateDungeonViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDungeonViewArrows, %function
updateDungeonViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1
	mov	r1, #0
	mov	r0, r3
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L205+16
	ldr	r9, .L205+20
	ldr	r4, .L205+24
	sub	sp, sp, #20
	str	r3, [r9, #44]
	ldr	r10, [r2]
	str	r9, [sp, #4]
	add	r5, r4, #256
.L188:
	ldr	r7, [r4]
	ldr	r3, [r4, #20]
	sub	r2, r7, r10
	add	r2, r2, r3
	cmp	r2, #159
	bgt	.L183
	ldr	r6, [r4, #4]
	add	r3, r7, r3
	add	r2, r6, r3, lsl #9
	ldr	lr, .L205+28
	lsl	r2, r2, #1
	ldrh	r2, [lr, r2]
	cmp	r2, #0
	lsl	r3, r3, #9
	beq	.L183
	ldr	r2, [r4, #16]
	ldr	ip, [r4, #12]
	add	r2, r6, r2
	sub	r2, r2, ip
	add	r3, r2, r3
	lsl	r3, r3, #1
	ldrh	r3, [lr, r3]
	cmp	r3, #0
	beq	.L183
	ldr	fp, .L205+32
	ldr	r0, [r4, #52]
	mov	lr, pc
	bx	fp
	mov	r8, r0
	mov	r0, r7
	mov	r9, r1
	mov	lr, pc
	bx	fp
	adr	r3, .L205
	ldmia	r3, {r2-r3}
	str	r0, [sp, #8]
	str	r1, [sp, #12]
	ldr	ip, .L205+36
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	ip, .L205+40
	mov	r2, r0
	mov	r3, r1
	add	r1, sp, #8
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	ip
	ldr	r3, .L205+44
	mov	lr, pc
	bx	r3
	mov	r3, r0
	mov	r0, r6
	str	r3, [r4]
	mov	lr, pc
	bx	fp
	ldr	r3, [r4, #48]
	cmp	r3, #1
	mov	r6, r0
	mov	r7, r1
	ldr	r0, [r4, #56]
	beq	.L203
	ldr	r3, .L205+32
	mov	lr, pc
	bx	r3
	adr	r3, .L205
	ldmia	r3, {r2-r3}
	ldr	ip, .L205+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L205+48
	mov	lr, pc
	bx	r3
	ldr	ip, .L205+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	ip
	ldr	r3, .L205+44
	mov	lr, pc
	bx	r3
	mov	r6, r0
.L185:
	adr	r3, .L205+8
	ldmia	r3, {r2-r3}
	str	r6, [r4, #4]
	ldr	ip, .L205+40
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	ip
	ldr	r3, .L205+44
	mov	lr, pc
	bx	r3
	sub	r6, r6, #1
	cmp	r6, #496
	str	r0, [r4, #52]
	movcc	r1, #1
	movcc	r0, #0
	bcc	.L187
	mov	r3, #1
	add	r4, r4, #64
	str	r3, [r4, #-20]
	cmp	r4, r5
	mov	r0, #0
	mov	r1, r3
	bne	.L188
.L204:
	ldr	r2, .L205+52
	ldr	r9, [sp, #4]
	ldr	r3, [r2, #48]
	cmp	r1, #0
	strne	r0, [r9, #44]
	cmp	r3, #1
	ldr	r3, [r2, #4]
	ldr	r2, [r2]
	addeq	r3, r3, #5
	subne	r3, r3, #5
	stm	r9, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L183:
	mov	r3, #4
	mov	r2, #1
	str	r3, [r4]
	str	r2, [r4, #44]
	str	r3, [r4, #4]
.L187:
	add	r4, r4, #64
	cmp	r4, r5
	bne	.L188
	b	.L204
.L203:
	mov	lr, pc
	bx	fp
	adr	r3, .L205
	ldmia	r3, {r2-r3}
	ldr	ip, .L205+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L205+48
	mov	lr, pc
	bx	r3
	mov	r2, r6
	mov	r3, r7
	ldr	ip, .L205+56
	mov	lr, pc
	bx	ip
	ldr	r3, .L205+44
	mov	lr, pc
	bx	r3
	mov	r6, r0
	b	.L185
.L206:
	.align	3
.L205:
	.word	2576980378
	.word	1069128089
	.word	2576980378
	.word	1073322393
	.word	vOff
	.word	bow
	.word	arrows
	.word	dungeonCollisionBitmap
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	round
	.word	player
	.word	__aeabi_dadd
	.size	updateDungeonViewArrows, .-updateDungeonViewArrows
	.align	2
	.global	updateDungeonViewHostileArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDungeonViewHostileArrows, %function
updateDungeonViewHostileArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L230+16
	mov	r9, r7
	ldr	r3, .L230+20
	add	r2, r7, #3712
	ldr	fp, [r3]
	sub	sp, sp, #20
	add	r3, r2, #8
	ldr	r10, .L230+24
	str	r3, [sp, #12]
.L216:
	mov	r3, #1
	mov	r7, r9
	str	r3, [r9, #168]
	sub	r4, r9, #384
	b	.L213
.L226:
	add	r3, r6, r3
	add	r2, r5, r3, lsl #9
	lsl	r2, r2, #1
	ldrh	r2, [r10, r2]
	cmp	r2, #0
	lsl	r3, r3, #9
	beq	.L208
	add	r1, r4, #136
	ldm	r1, {r1, r2}
	add	r2, r5, r2
	sub	r2, r2, r1
	add	r3, r2, r3
	lsl	r3, r3, #1
	ldrh	r3, [r10, r3]
	cmp	r3, #0
	beq	.L208
	ldr	r0, [r4, #176]
	ldr	r3, .L230+28
	mov	lr, pc
	bx	r3
	adr	r3, .L230
	ldmia	r3, {r2-r3}
	ldr	ip, .L230+32
	mov	r8, r0
	mov	r9, r1
	mov	lr, pc
	bx	ip
	ldr	r2, .L230+36
	mov	lr, pc
	bx	r2
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	stm	sp, {r2-r3}
	ldr	r3, .L230+28
	mov	lr, pc
	bx	r3
	ldmia	sp, {r2-r3}
	ldr	ip, .L230+40
	mov	lr, pc
	bx	ip
	ldr	r3, .L230+44
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r0, [r4, #124]
	ldr	r2, [r7, #-328]
	str	r3, [r7, #168]
	cmp	r2, #1
	ldr	r0, [r4, #180]
	ldr	r3, .L230+28
	beq	.L228
	mov	lr, pc
	bx	r3
	adr	r3, .L230
	ldmia	r3, {r2-r3}
	ldr	ip, .L230+32
	mov	lr, pc
	bx	ip
	ldr	r2, .L230+36
	mov	lr, pc
	bx	r2
	mov	r2, r0
	mov	r6, r1
	mov	r0, r5
	mov	r5, r2
	ldr	r3, .L230+28
	mov	lr, pc
	bx	r3
	mov	r2, r5
	mov	r3, r6
	ldr	ip, .L230+40
	mov	lr, pc
	bx	ip
	ldr	r3, .L230+44
	mov	lr, pc
	bx	r3
	mov	r5, r0
.L210:
	adr	r3, .L230+8
	ldmia	r3, {r2-r3}
	ldr	ip, .L230+40
	mov	r0, r8
	mov	r1, r9
	str	r5, [r4, #128]
	mov	lr, pc
	bx	ip
	ldr	r3, .L230+44
	mov	lr, pc
	bx	r3
	str	r0, [r4, #176]
.L211:
	sub	r5, r5, #1
	cmp	r5, #496
	movcs	r3, #1
	add	r4, r4, #64
	strcs	r3, [r4, #104]
	cmp	r4, r7
	beq	.L229
.L213:
	ldr	r6, [r4, #124]
	ldr	r3, [r4, #144]
	sub	r2, r6, fp
	add	r2, r2, r3
	cmp	r2, #159
	ldr	r5, [r4, #128]
	ble	.L226
.L208:
	mov	r3, #1
	str	r3, [r4, #168]
	b	.L211
.L229:
	ldr	r3, [r7, #-328]
	cmp	r3, #1
	ldr	r3, [r7, #-372]
	addeq	r3, r3, #5
	subne	r3, r3, #5
	str	r3, [r7, #128]
	ldr	r3, [sp, #12]
	ldr	r2, [r7, #-376]
	add	r9, r7, #620
	cmp	r9, r3
	str	r2, [r7, #124]
	bne	.L216
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L228:
	mov	lr, pc
	bx	r3
	adr	r3, .L230
	ldmia	r3, {r2-r3}
	ldr	ip, .L230+32
	mov	lr, pc
	bx	ip
	ldr	r2, .L230+36
	mov	lr, pc
	bx	r2
	mov	r2, r0
	mov	r6, r1
	add	r0, r5, #1
	mov	r5, r2
	ldr	r3, .L230+28
	mov	lr, pc
	bx	r3
	mov	r2, r5
	mov	r3, r6
	ldr	ip, .L230+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L230+44
	mov	lr, pc
	bx	r3
	mov	r5, r0
	b	.L210
.L231:
	.align	3
.L230:
	.word	2576980378
	.word	1069128089
	.word	2576980378
	.word	1074370969
	.word	enemies+384
	.word	vOff
	.word	dungeonCollisionBitmap
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	__aeabi_dadd
	.size	updateDungeonViewHostileArrows, .-updateDungeonViewHostileArrows
	.align	2
	.global	animateDungeonViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateDungeonViewVillagers, %function
animateDungeonViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L255
	add	r6, r4, #3712
	mov	r10, #0
	mov	r9, #2
	ldr	fp, .L255+4
	ldr	r7, .L255+8
	add	r6, r6, #8
	b	.L239
.L236:
	sub	r2, r3, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	cmp	r8, #0
	moveq	r3, #0
	cmp	r3, #0
	strne	r9, [r4, #36]
	bne	.L238
.L237:
	str	r10, [r4, #44]
	str	r10, [r4, #32]
	str	r5, [r4, #36]
	add	r4, r4, #620
	cmp	r4, r6
	beq	.L254
.L239:
	ldr	r8, [r4, #80]
	cmp	r8, #0
	bne	.L253
	ldr	r5, [r4, #108]
	cmp	r5, #0
	beq	.L234
.L253:
	ldr	r5, [r4, #36]
.L234:
	ldr	r3, [r4, #104]
	cmp	r3, #0
	str	r5, [r4, #40]
	bne	.L235
	ldr	r1, [r4, #32]
	smull	r3, r0, fp, r1
	asr	r3, r1, #31
	rsb	r3, r3, r0, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r1, r3, lsl #2
	bne	.L235
	add	r0, r4, #44
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r7
	str	r1, [r4, #44]
.L235:
	ldr	r3, [r4, #56]
	cmn	r3, #1
	bne	.L236
	cmp	r8, #0
	movne	r3, #3
	strne	r3, [r4, #36]
	beq	.L237
.L238:
	ldr	r3, [r4, #32]
	add	r3, r3, #1
	str	r3, [r4, #32]
	add	r4, r4, #620
	cmp	r4, r6
	bne	.L239
.L254:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L256:
	.align	2
.L255:
	.word	enemies
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateDungeonViewVillagers, .-animateDungeonViewVillagers
	.align	2
	.global	updateDungeonViewEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDungeonViewEnemies, %function
updateDungeonViewEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	ldr	fp, .L404+16
	str	r3, [sp, #20]
	ldr	r10, .L404+20
.L318:
	ldr	r7, .L404+24
	ldr	r0, [fp, #-108]
	mov	lr, pc
	bx	r7
	adr	r3, .L404
	ldmia	r3, {r2-r3}
	ldr	ip, .L404+28
	mov	r4, r0
	mov	r5, r1
	mov	lr, pc
	bx	ip
	ldr	r3, .L404+32
	mov	lr, pc
	bx	r3
	mov	r2, r0
	mov	r3, r1
	ldr	r6, [fp, #-160]
	ldr	r8, [fp, #-140]
	str	r2, [sp, #24]
	str	r3, [sp, #28]
	add	r0, r6, r8
	mov	lr, pc
	bx	r7
	add	r3, sp, #24
	ldmia	r3, {r2-r3}
	ldr	ip, .L404+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L404+40
	mov	lr, pc
	bx	r3
	ldr	r9, [fp, #-156]
	add	r3, r9, r0, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r10, r3]
	cmp	r3, #0
	ldr	r7, [fp, #-144]
	lsl	r0, r0, #9
	beq	.L258
	ldr	r2, [fp, #-148]
	add	r3, r9, r7
	sub	r3, r3, r2
	add	r0, r3, r0
	lsl	r0, r0, #1
	ldrh	r3, [r10, r0]
	cmp	r3, #0
	beq	.L258
	ldr	ip, .L404+36
	adr	r3, .L404+8
	ldmia	r3, {r2-r3}
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	ip
	ldr	r3, .L404+40
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, .L404+24
	str	r3, [fp, #408]
	str	r0, [fp, #-108]
	mov	lr, pc
	bx	r2
	ldr	r4, .L404+28
	adr	r3, .L404
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r4
	ldr	r4, .L404+32
	mov	lr, pc
	bx	r4
	mov	r4, r0
	mov	r5, r1
	mov	r0, r6
	ldr	r2, .L404+24
	mov	lr, pc
	bx	r2
	mov	r2, r4
	mov	r3, r5
	ldr	ip, .L404+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L404+40
	mov	lr, pc
	bx	r3
	mov	r3, #1
	mov	r6, r0
	str	r3, [fp, #420]
	str	r0, [fp, #-160]
.L259:
	ldr	r3, .L404+44
	ldr	r2, [r3]
	sub	r2, r9, r2
	cmp	r2, #0
	ble	.L327
	ldr	r3, [fp, #-148]
	sub	r3, r9, r3
	add	r1, r3, r6, lsl #9
	lsl	r1, r1, #1
	ldrh	r1, [r10, r1]
	cmp	r1, #0
	beq	.L327
	ldr	r0, [fp, #-152]
	add	r1, r6, r8
	sub	r1, r1, r0
	add	r3, r3, r1, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r10, r3]
	rsbs	r3, r3, #1
	movcc	r3, #0
.L260:
	add	r1, r2, r7
	cmp	r1, #239
	str	r3, [fp, #412]
	bgt	.L329
	add	r7, r9, r7
	add	r3, r7, r6, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r10, r3]
	cmp	r3, #0
	beq	.L329
	ldr	r3, [fp, #-152]
	add	r8, r6, r8
	sub	r8, r8, r3
	add	r7, r7, r8, lsl #9
	lsl	r7, r7, #1
	ldrh	r3, [r10, r7]
	rsbs	r3, r3, #1
	movcc	r3, #0
.L261:
	cmp	r2, #240
	movhi	r2, #1
	str	r3, [fp, #416]
	bhi	.L262
	ldr	r3, .L404+48
	ldr	r2, [r3]
	sub	r2, r6, r2
	cmp	r2, #160
	movls	r2, #0
	movhi	r2, #1
.L262:
	ldr	r1, .L404+68
	ldr	r3, [r1]
	sub	r6, r6, r3
	add	r6, r6, #49
	cmp	r6, #98
	movhi	r3, #0
	str	r2, [fp, #-116]
	bhi	.L263
	ldr	r3, [r1, #4]
	sub	r3, r9, r3
	add	r3, r3, #119
	cmp	r3, #238
	movhi	r3, #0
	movls	r3, #1
.L263:
	ldr	r2, [fp, #-96]
	cmp	r2, #0
	str	r3, [fp, #-60]
	bne	.L264
.L274:
	ldr	r3, [fp, #404]
	cmp	r3, #0
	movlt	r3, #0
	subge	r3, r3, #1
.L266:
	mov	r7, #0
	mov	r6, #10
	mov	r0, r9
	str	r3, [fp, #404]
	ldr	r4, .L404+52
	ldr	r8, .L404+56
.L282:
	ldr	r3, [fp, #-164]
	cmp	r3, #0
	ldr	r5, [r4, #60]
	ble	.L275
	cmp	r5, #0
	beq	.L276
.L280:
	ldr	r3, [fp, #404]
	cmp	r3, #1
	bgt	.L281
	ldr	r3, [fp, #-164]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [fp, #-164]
	movle	r3, #1
	str	r7, [r4, #60]
	str	r6, [fp, #404]
	strle	r3, [fp, #-116]
.L281:
	ldr	r3, .L404+60
	add	r4, r4, #64
	cmp	r3, r4
	bne	.L282
	ldr	r3, [fp, #-168]
	bic	r2, r3, #2
	cmp	r2, #5
	ldr	r2, [sp, #20]
	mov	r9, r0
	add	r4, r2, #1
	beq	.L283
	cmp	r3, #4
	beq	.L396
.L284:
	ldr	r3, .L404+44
	ldr	r3, [r3]
	sub	r3, r9, r3
	cmp	r3, #0
	ble	.L397
	ldr	r2, [fp, #-148]
	ldr	r6, [fp, #-160]
	sub	r2, r9, r2
	add	r1, r2, r6, lsl #9
	lsl	r1, r1, #1
	ldrh	r1, [r10, r1]
	cmp	r1, #0
	beq	.L306
	ldr	r1, [fp, #-140]
	ldr	r0, [fp, #-152]
	add	r1, r6, r1
	sub	r1, r1, r0
	add	r2, r2, r1, lsl #9
	lsl	r2, r2, #1
	ldrh	r1, [r10, r2]
	cmp	r1, #0
	beq	.L306
	mov	r1, #1
	ldr	r2, [fp, #-144]
	add	r3, r3, r2
	cmp	r3, #512
	str	r1, [fp, #412]
	blt	.L304
	mov	r3, #0
	str	r1, [fp, #408]
	str	r3, [fp, #416]
.L308:
	ldr	r3, [fp, #420]
	cmp	r3, #0
	bne	.L313
	ldr	r3, [fp, #424]
	cmp	r3, #0
	bne	.L314
	mov	r2, #1
	mov	r1, #40
	str	r3, [fp, #408]
	ldr	r3, [fp, #-160]
	sub	r3, r3, #1
	str	r3, [fp, #-160]
	str	r1, [fp, #-108]
	str	r2, [fp, #420]
	str	r2, [fp, #424]
	b	.L405
.L406:
	.align	3
.L404:
	.word	2576980378
	.word	1069128089
	.word	1202590843
	.word	1074035425
	.word	enemies+168
	.word	dungeonCollisionBitmap
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	hOff
	.word	vOff
	.word	arrows
	.word	enemyHit_data
	.word	arrows+256
	.word	494
	.word	player
	.word	enemyHit_length
	.word	playSoundB
	.word	rand
	.word	1717986919
	.word	collision
	.word	1374389535
	.word	__aeabi_idivmod
	.word	enemies
.L405:
.L313:
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	beq	.L392
.L385:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bne	.L392
	ldr	r3, [fp, #-148]
	ldr	r2, [fp, #-112]
	mla	r2, r3, r2, r9
	mov	r9, r2
	ldr	r3, [fp, #-84]
	ldr	r1, [fp, #-80]
	sub	r3, r3, #1
	sub	r1, r1, #1
	str	r2, [fp, #-156]
	str	r3, [fp, #-84]
	str	r1, [fp, #-80]
.L315:
	ldr	r2, .L404+64
	sub	r1, r9, #2
	cmp	r1, r2
	ldrhi	r2, [fp, #-112]
	rsbhi	r2, r2, #0
	strhi	r2, [fp, #-112]
	cmp	r3, #0
	streq	r3, [fp, #-88]
	ldr	r3, [fp, #-92]
	cmp	r4, #6
	add	r3, r3, #1
	str	r3, [fp, #-92]
	add	fp, fp, #620
	beq	.L398
	str	r4, [sp, #20]
	b	.L318
.L397:
	mov	r1, #0
	ldr	r2, [fp, #-144]
	add	r3, r3, r2
	cmp	r3, #512
	str	r1, [fp, #412]
	bge	.L393
	ldr	r6, [fp, #-160]
.L304:
	add	r2, r9, r2
	add	r3, r2, r6, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r10, r3]
	cmp	r3, #0
	beq	.L309
	ldr	r0, [fp, #-140]
	ldr	r3, [fp, #-152]
	add	r6, r6, r0
	sub	r6, r6, r3
	add	r2, r2, r6, lsl #9
	lsl	r2, r2, #1
	ldrh	r3, [r10, r2]
	cmp	r3, #0
	beq	.L309
	mov	r3, #1
	cmp	r1, #0
	str	r3, [fp, #416]
	moveq	r3, #1
	streq	r3, [fp, #408]
	beq	.L308
.L399:
	mov	r3, #0
	ldr	r2, [fp, #424]
	cmp	r2, r3
	str	r3, [fp, #408]
	beq	.L313
	ldr	r3, [fp, #420]
	cmp	r3, #0
	bne	.L313
.L314:
	mov	r2, #0
	ldr	r3, [fp, #-112]
	rsb	r3, r3, #0
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	str	r2, [fp, #424]
	bne	.L385
.L392:
	ldr	r3, [fp, #-84]
	b	.L315
.L276:
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldm	r4, {r2, r3}
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	sub	r2, fp, #144
	ldm	r2, {r2, r3}
	ldr	r1, [fp, #-160]
	ldr	ip, .L404+88
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L279
.L389:
	ldr	r5, [r4, #60]
	ldr	r0, [fp, #-156]
.L275:
	cmp	r5, #0
	beq	.L281
	b	.L280
.L329:
	mov	r3, #1
	b	.L261
.L258:
	mov	r3, #0
	str	r3, [fp, #-108]
	str	r3, [fp, #420]
	b	.L259
.L327:
	mov	r3, #1
	b	.L260
.L306:
	ldr	r2, [fp, #-144]
	add	r3, r3, r2
	cmp	r3, #512
	str	r1, [fp, #412]
	blt	.L304
.L393:
	mov	r3, #1
	str	r1, [fp, #416]
	str	r3, [fp, #408]
	b	.L308
.L309:
	str	r3, [fp, #416]
	mov	r3, #1
	str	r3, [fp, #408]
	b	.L308
.L283:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L284
	ldr	r3, [fp, #-164]
	cmp	r3, #0
	ble	.L284
	ldr	r1, [fp, #-56]
	sub	r2, fp, #80
	ldm	r2, {r2, r3}
	add	r1, r1, #1
	ldr	r0, [fp, #-48]
	str	r1, [fp, #-56]
	ldr	r1, .L404+68
	sub	r3, r3, #1
	sub	r2, r2, #1
	cmp	r0, #0
	str	r3, [fp, #-76]
	str	r2, [fp, #-80]
	ldr	r1, [r1, #4]
	beq	.L295
	cmp	r3, #2
	bgt	.L284
	cmp	r2, #2
	bgt	.L321
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	movne	r0, #0
	strne	r0, [fp, #-52]
	strne	r0, [fp, #-48]
	b	.L321
.L396:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L284
	ldr	r3, [fp, #-164]
	cmp	r3, #0
	ble	.L284
	ldr	r3, .L404+68
	ldr	ip, [r3, #4]
	ldr	r3, [fp, #-76]
	ldr	r0, [fp, #-56]
	sub	ip, r9, ip
	sub	r3, r3, #1
	eor	r2, ip, ip, asr #31
	add	r0, r0, #1
	cmp	r3, #2
	str	r3, [fp, #-76]
	str	r0, [fp, #-56]
	sub	r2, r2, ip, asr #31
	ble	.L400
.L286:
	cmp	r2, #39
	bgt	.L390
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L290
	mov	r2, #20
	mov	r3, #1
	cmp	ip, #0
	str	r2, [fp, #-76]
	str	r3, [fp, #-48]
	ble	.L391
.L302:
	mvn	r3, #0
.L391:
	str	r3, [fp, #-112]
	b	.L284
.L279:
	mov	r3, #1
	ldr	r1, .L404+72
	str	r3, [r4, #44]
	str	r3, [r4, #60]
	mov	r2, r5
	mov	r0, r8
	ldr	r1, [r1]
	str	r5, [r4, #4]
	str	r5, [r4]
	ldr	r3, .L404+76
	mov	lr, pc
	bx	r3
	b	.L389
.L398:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateDungeonViewVillagers
.L264:
	ldr	r4, .L404+80
	ldr	r5, [fp, #-92]
	mov	lr, pc
	bx	r4
	ldr	r3, .L404+84
	smull	r2, r3, r0, r3
	asr	r1, r0, #31
	rsb	r1, r1, r3, asr #4
	add	r1, r1, r1, lsl #2
	sub	r1, r0, r1, lsl #3
	ldr	r3, .L404+96
	mov	r0, r5
	add	r1, r1, #100
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	beq	.L401
.L268:
	mov	r5, #0
	mov	r7, #60
	mov	r6, #1
	ldr	r4, .L404+100
	ldr	r8, [sp, #20]
.L273:
	cmp	r8, r5
	add	r5, r5, #1
	beq	.L271
	add	r2, r4, #8
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #28]
	ldr	r1, [r4, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	sub	r2, fp, #144
	ldm	r2, {r2, r3}
	ldr	r1, [fp, #-160]
	ldr	r0, [fp, #-156]
	ldr	ip, .L404+88
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L271
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	streq	r7, [fp, #-84]
	streq	r6, [fp, #-88]
.L271:
	cmp	r5, #6
	add	r4, r4, #620
	bne	.L273
	ldr	r9, [fp, #-156]
	b	.L274
.L401:
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	bne	.L268
	mov	r2, #1
	ldr	r3, [sp, #20]
	lsl	r3, r3, #2
	add	r3, r3, #60
	str	r3, [fp, #-84]
	str	r2, [fp, #-88]
	mov	lr, pc
	bx	r4
	ldr	r2, .L404+92
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #60
	ldrgt	r3, [fp, #-112]
	rsbgt	r3, r3, #0
	strgt	r3, [fp, #-112]
	b	.L268
.L400:
	cmp	r2, #80
	ble	.L286
	mov	r3, #1
	cmp	ip, #0
	str	r3, [fp, #-88]
	mvngt	r3, #0
	lsl	r1, r4, #2
	add	r2, r1, #16
	str	r2, [fp, #-84]
	str	r3, [fp, #-112]
	b	.L288
.L295:
	cmp	r3, #3
	ble	.L297
	ldr	r2, [fp, #-52]
	cmp	r2, #0
	beq	.L284
	cmp	r3, #4
	moveq	r3, #1
	str	r0, [fp, #-88]
	str	r0, [fp, #-84]
	streq	r3, [fp, #-48]
	b	.L284
.L403:
	mov	r3, #1
	str	r3, [fp, #-112]
.L390:
	lsl	r1, r4, #2
.L288:
	add	r1, r1, r4
	ldr	r3, .L404+96
	lsl	r1, r1, #3
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bgt	.L284
	mov	r3, #0
.L294:
	ldr	r2, [fp, r3, lsl #6]
	cmp	r2, #0
	bne	.L402
	add	r3, r3, #1
	cmp	r3, #6
	bne	.L294
	b	.L284
.L290:
	cmp	ip, #0
	ble	.L403
	mvn	r3, #0
	lsl	r1, r4, #2
	str	r3, [fp, #-112]
	b	.L288
.L297:
	beq	.L284
.L321:
	subs	r1, r9, r1
	beq	.L298
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L299
	lsl	ip, r4, #2
	cmp	r1, #0
	add	ip, ip, #16
	mov	lr, #1
	str	ip, [fp, #-84]
	mvngt	ip, #0
	str	lr, [fp, #-88]
	strgt	ip, [fp, #-112]
	strle	lr, [fp, #-112]
.L299:
	cmp	r2, #3
	ble	.L320
	eor	r0, r1, r1, asr #31
	add	r2, r4, r4, lsl #1
	sub	r0, r0, r1, asr #31
	add	r2, r2, #47
	cmp	r0, r2
	bge	.L284
	cmp	r3, #0
	beq	.L284
	mov	r2, #1
	rsb	r3, r4, r4, lsl #3
	add	r3, r3, #43
	cmp	r1, #0
	str	r3, [fp, #-84]
	str	r2, [fp, #-88]
	ble	.L302
	str	r2, [fp, #-112]
	b	.L284
.L298:
	cmp	r2, #3
	ble	.L320
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L284
	mov	r2, #1
	rsb	r3, r4, r4, lsl #3
	add	r3, r3, #43
	str	r3, [fp, #-84]
	str	r2, [fp, #-88]
	b	.L302
.L320:
	cmp	r2, #2
	cmple	r0, #0
	bne	.L284
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	addne	r3, r4, r4, lsl #2
	addne	r3, r3, #95
	strne	r3, [fp, #-76]
	b	.L284
.L402:
	mov	r1, #0
	mov	ip, #10
	mov	r0, #80
	ldr	r2, [sp, #20]
	add	r2, r2, r2, lsl #2
	rsb	r2, r2, r2, lsl #5
	lsl	r2, r2, #2
	add	r2, r2, r3, lsl #6
	ldr	r3, .L404+100
	add	r3, r3, r2
	str	r1, [r3, #168]
	ldr	r2, [fp, #-160]
	sub	r2, r2, #3
	str	r2, [r3, #124]
	str	r9, [r3, #128]
	str	r1, [r3, #184]
	str	ip, [r3, #176]
	str	r0, [r3, #180]
	ldr	r2, [fp, #-112]
	str	r2, [r3, #172]
	ldr	r9, [fp, #-156]
	b	.L284
	.size	updateDungeonViewEnemies, .-updateDungeonViewEnemies
	.align	2
	.global	updateDungeonView
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDungeonView, %function
updateDungeonView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, lr}
	ldr	r2, .L421
	ldr	r2, [r2, #3104]
	ldr	r4, .L421+4
	cmp	r2, r3
	str	r3, [r4]
	sub	sp, sp, #20
	ble	.L420
	ldr	r3, .L421+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L409
.L410:
	bl	updateDungeonViewPlayer
	bl	updateDungeonViewEnemies
	bl	updateDungeonViewArrows
	bl	updateDungeonViewHostileArrows
	ldr	r3, .L421+12
	add	r1, r3, #16
	ldm	r1, {r1, ip}
	ldm	r3, {r2, r3}
	ldr	r0, .L421+16
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldr	r1, [r0]
	ldm	r2, {r2, r3}
	ldr	r0, [r0, #4]
	ldr	r5, .L421+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L412
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L421+24
	ldr	r3, .L421+28
	str	r0, [r1]
	str	r2, [r3, #44]
.L413:
	ldr	ip, .L421+32
	ldr	r3, [ip]
	cmp	r3, #0
	ldr	r2, [r4]
	ble	.L414
	sub	r3, r3, #1
	cmp	r2, #0
	str	r3, [ip]
	beq	.L407
	cmp	r3, #0
	beq	.L418
.L407:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L420:
	mov	r2, #1
	ldr	r3, .L421+8
	str	r2, [r3]
.L409:
	ldr	r3, .L421+36
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L410
	bl	updateMead.part.0
	b	.L410
.L412:
	mov	r1, #1
	ldr	r2, .L421+28
	ldr	r3, .L421+24
	str	r1, [r2, #44]
	str	r0, [r3]
	b	.L413
.L414:
	cmp	r2, #0
	beq	.L407
.L418:
	mov	r2, #0
	mov	lr, #60
	ldr	r0, .L421+40
	ldr	r3, [r0]
	ldr	r1, .L421+44
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r1, [r1]
	ldr	r0, .L421+48
	ldr	r3, .L421+52
	str	r2, [r4]
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L422:
	.align	2
.L421:
	.word	enemies
	.word	playerTookDamage
	.word	bossDead
	.word	mead
	.word	player
	.word	collision
	.word	touchingMead
	.word	aButton
	.word	damageTimer
	.word	meadCollected
	.word	playerHealth
	.word	playerHit_length
	.word	playerHit_data
	.word	playSoundB
	.size	updateDungeonView, .-updateDungeonView
	.align	2
	.global	drawDungeonViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDungeonViewPlayer, %function
drawDungeonViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L427
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L424
	ldr	r2, .L427+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L424:
	b	drawDungeonViewPlayer.part.0
.L428:
	.align	2
.L427:
	.word	player
	.word	shadowOAM
	.size	drawDungeonViewPlayer, .-drawDungeonViewPlayer
	.align	2
	.global	drawDungeonViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDungeonViewVillagers, %function
drawDungeonViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L446
	ldr	r3, .L446+4
	ldr	r1, .L446+8
	push	{r4, r5, r6, r7, r8, r9, lr}
	add	ip, r3, #3712
	ldrh	r4, [r2]
	ldrh	r5, [r1]
	ldr	r2, .L446+12
	ldr	lr, .L446+16
	ldr	r6, .L446+20
	ldr	r8, .L446+24
	ldr	r7, .L446+28
	add	ip, ip, #8
.L443:
	ldr	r1, [r3, #52]
	cmp	r1, #0
	bne	.L430
	ldr	r1, [r3, #4]
	cmp	r1, #0
	ble	.L430
	add	r0, r3, #8
	ldm	r0, {r0, r1}
	sub	r1, r1, r4
	and	r1, r1, lr
	orr	r9, r1, #16384
	strh	r9, [r2, #82]	@ movhi
	sub	r0, r0, r5
	ldr	r9, [r3]
	and	r0, r0, #255
	strh	r0, [r2, #80]	@ movhi
	cmp	r9, #7
	ldrls	pc, [pc, r9, asl #2]
	b	.L432
.L434:
	.word	.L439
	.word	.L437
	.word	.L437
	.word	.L432
	.word	.L436
	.word	.L435
	.word	.L432
	.word	.L433
.L437:
	ldr	r0, [r3, #44]
	ldr	r1, [r3, #36]
	add	r1, r1, r0, lsl #5
	add	r1, r1, #100
	lsl	r1, r1, #1
	strh	r1, [r2, #84]	@ movhi
.L432:
	add	r3, r3, #620
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L443
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L430:
	ldrh	r1, [r2, #80]
	orr	r1, r1, #512
	strh	r1, [r2, #80]	@ movhi
	b	.L432
.L435:
	ldr	r1, [r3, #36]
	ldr	r0, [r3, #44]
	add	r1, r1, #12
	add	r1, r1, r0, lsl #5
	lsl	r1, r1, #1
	orr	r1, r1, #8192
	strh	r1, [r2, #84]	@ movhi
	b	.L432
.L436:
	ldr	r1, [r3, #36]
	ldr	r0, [r3, #44]
	add	r1, r1, #8
	add	r1, r1, r0, lsl #5
	lsl	r1, r1, #1
	strh	r1, [r2, #84]	@ movhi
	b	.L432
.L433:
	ldr	r0, [r3, #588]
	orr	r1, r1, r6
	cmp	r0, #0
	strh	r1, [r2, #82]	@ movhi
	ldr	r0, [r3, #56]
	bne	.L440
	ldr	r1, [r3, #44]
	lsl	r1, r1, #23
	add	r1, r1, #12582912
	lsr	r1, r1, #16
	cmp	r0, #1
	addeq	r1, r1, #16
	addne	r1, r1, #20
	orr	r1, r1, #8192
	strh	r1, [r2, #84]	@ movhi
	b	.L432
.L439:
	ldr	r1, [r3, #36]
	ldr	r0, [r3, #44]
	add	r1, r1, #4
	add	r1, r1, r0, lsl #5
	lsl	r1, r1, #1
	strh	r1, [r2, #84]	@ movhi
	b	.L432
.L440:
	cmp	r0, #1
	movne	r1, r8
	moveq	r1, r7
	strh	r1, [r2, #84]	@ movhi
	b	.L432
.L447:
	.align	2
.L446:
	.word	hOff
	.word	enemies
	.word	vOff
	.word	shadowOAM
	.word	511
	.word	-32768
	.word	8668
	.word	8664
	.size	drawDungeonViewVillagers, .-drawDungeonViewVillagers
	.align	2
	.global	drawDungeonViewHostileArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDungeonViewHostileArrows, %function
drawDungeonViewHostileArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	mov	r10, #4416
	ldr	r2, .L466
	ldr	r3, .L466+4
	ldr	r5, .L466+8
	sub	sp, sp, #12
	add	r1, r9, #36
	str	r1, [sp, #4]
	ldrh	r8, [r2]
	ldrh	r7, [r3]
	ldr	r4, .L466+12
	ldr	r6, .L466+16
	ldr	fp, .L466+20
	add	lr, r5, #416
.L449:
	mov	r2, r4
	sub	r3, lr, #48
	b	.L453
.L464:
	ldrh	r1, [r3]
	orr	r1, r1, #512
	strh	r1, [r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, lr
	add	r2, r2, #64
	beq	.L463
.L453:
	ldr	r1, [r2, #168]
	cmp	r1, #0
	bne	.L464
	ldr	r1, [r2, #172]
	cmp	r1, #1
	movne	ip, fp
	moveq	ip, r10
	ldr	r1, [r2, #128]
	ldr	r0, [r2, #124]
	sub	r1, r1, r7
	and	r1, r1, r6
	sub	r0, r0, r8
	orr	r1, r1, #16384
	and	r0, r0, #255
	strh	ip, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r0, [r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, lr
	add	r2, r2, #64
	bne	.L453
.L463:
	ldr	r3, [r4, #552]
	cmp	r3, #0
	add	r9, r9, #6
	beq	.L454
	ldrh	r3, [r5, #160]
	orr	r3, r3, #512
	strh	r3, [r5, #160]	@ movhi
.L455:
	ldr	r3, [sp, #4]
	cmp	r3, r9
	add	r5, r5, #8
	add	r4, r4, #620
	add	lr, lr, #48
	bne	.L449
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L454:
	add	r2, r4, #508
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #108]
	sub	r3, r3, r7
	and	r3, r3, r6
	sub	r2, r2, r8
	cmp	r1, #0
	orr	r3, r3, #16384
	and	r2, r2, #255
	beq	.L456
	ldr	r1, [r4, #56]
	cmp	r1, #1
	beq	.L465
.L456:
	strh	r3, [r5, #162]	@ movhi
	ldr	r3, .L466+24
	strh	r2, [r5, #160]	@ movhi
	strh	r3, [r5, #164]	@ movhi
	b	.L455
.L465:
	strh	r3, [r5, #162]	@ movhi
	mov	r3, #4352	@ movhi
	strh	r2, [r5, #160]	@ movhi
	strh	r3, [r5, #164]	@ movhi
	b	.L455
.L467:
	.align	2
.L466:
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	enemies
	.word	511
	.word	4418
	.word	4354
	.size	drawDungeonViewHostileArrows, .-drawDungeonViewHostileArrows
	.align	2
	.global	drawDungeonViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDungeonViewArrows, %function
drawDungeonViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #4416
	ldr	r8, .L478
	ldr	r9, .L478+4
	ldr	r3, .L478+8
	ldrh	r6, [r8]
	ldrh	r5, [r9]
	ldr	r2, .L478+12
	ldr	r4, .L478+16
	ldr	lr, .L478+20
	add	ip, r3, #32
.L472:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	beq	.L469
	ldrh	r1, [r3]
	orr	r1, r1, #512
	strh	r1, [r3]	@ movhi
.L470:
	add	r3, r3, #8
	cmp	r3, ip
	add	r2, r2, #64
	bne	.L472
	ldr	r1, .L478+24
	ldr	r3, [r1, #44]
	cmp	r3, #0
	beq	.L473
	ldr	r2, .L478+28
	ldrh	r3, [r2, #72]
	orr	r3, r3, #512
	strh	r3, [r2, #72]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L469:
	ldr	r1, [r2, #48]
	cmp	r1, #1
	movne	r0, lr
	moveq	r0, r7
	ldr	r1, [r2, #4]
	ldr	r10, [r2]
	sub	r1, r1, r5
	and	r1, r1, r4
	sub	r10, r10, r6
	orr	r1, r1, #16384
	and	r10, r10, #255
	strh	r0, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r10, [r3]	@ movhi
	b	.L470
.L473:
	ldr	r2, [r9]
	ldr	r3, [r1, #4]
	ldr	ip, .L478+32
	sub	r3, r3, r2
	ldr	r2, [r1]
	ldr	r1, [ip, #48]
	ldr	r0, [r8]
	cmp	r1, #1
	sub	r2, r2, r0
	moveq	r0, #4352
	lsl	r3, r3, #23
	ldreq	r1, .L478+28
	ldrne	r1, .L478+28
	ldrne	r0, .L478+36
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
.L479:
	.align	2
.L478:
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
	.size	drawDungeonViewArrows, .-drawDungeonViewArrows
	.align	2
	.global	drawDungeonView
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDungeonView, %function
drawDungeonView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L494
	ldr	r3, [r3, #44]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	beq	.L481
	ldr	r2, .L494+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L482:
	bl	drawDungeonViewVillagers
	bl	drawDungeonViewArrows
	bl	drawDungeonViewHostileArrows
	ldr	r3, .L494+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L483
	ldr	r5, .L494+12
	ldr	r4, .L494+16
	ldr	r0, [r5]
	ldr	r1, [r4]
.L484:
	ldr	r3, .L494+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L494+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L494+28
	mov	lr, pc
	bx	r3
	ldr	r6, .L494+32
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L494+4
	mov	r0, #3
	mov	lr, pc
	bx	r6
	mov	r3, #67108864
	ldrh	r1, [r5]
	ldrh	r2, [r4]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L481:
	bl	drawDungeonViewPlayer.part.0
	b	.L482
.L483:
	ldr	r2, .L494+36
	ldr	r3, .L494+40
	ldr	ip, [r2]
	ldr	r5, .L494+44
	ldr	r2, .L494+48
	ldr	r4, .L494+52
	sub	r0, r3, #80
	b	.L488
.L493:
	cmp	ip, #0
	beq	.L485
	ldr	r1, [r2, #4]
	ldrb	lr, [r2]	@ zero_extendqisi2
	and	r1, r1, r5
	orr	r1, r1, #16384
	strh	r4, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	lr, [r3]	@ movhi
	sub	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #64
	beq	.L492
.L488:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	beq	.L493
.L485:
	ldrh	r1, [r3]
	orr	r1, r1, #512
	strh	r1, [r3]	@ movhi
	sub	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #64
	bne	.L488
.L492:
	ldr	r2, .L494+56
	ldr	r3, [r2, #44]
	ldr	r4, .L494+16
	ldr	r5, .L494+12
	cmp	r3, #0
	ldr	r1, [r4]
	ldr	r0, [r5]
	beq	.L489
	ldr	r2, .L494+60
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	b	.L484
.L489:
	ldm	r2, {r2, r3}
	sub	r3, r3, r0
	lsl	r3, r3, #23
	ldr	ip, .L494+60
	ldr	lr, .L494+52
	lsr	r3, r3, #23
	sub	r2, r2, r1
	orr	r3, r3, #16384
	and	r2, r2, #255
	strh	r3, [ip, #2]	@ movhi
	strh	r2, [ip]	@ movhi
	strh	lr, [ip, #4]	@ movhi
	b	.L484
.L495:
	.align	2
.L494:
	.word	player
	.word	shadowOAM
	.word	bossDead
	.word	hOff
	.word	vOff
	.word	drawButtons
	.word	drawGlobal
	.word	waitForVBlank
	.word	DMANow
	.word	meadTimerStarted
	.word	shadowOAM+1016
	.word	511
	.word	rainingMeads
	.word	12674
	.word	mead
	.word	shadowOAM+552
	.size	drawDungeonView, .-drawDungeonView
	.comm	bow,64,4
	.comm	arrows,256,4
	.comm	player,64,4
	.comm	meadTimerStarted,4,4
	.comm	rainingMeadTimer,4,4
	.comm	rainingMeads,640,4
	.comm	mead,64,4
	.comm	boss,620,4
	.comm	enemies,3720,4
	.comm	storedMusicDuration,4,4
	.comm	playerIsMoving,4,4
	.comm	playerShootCooldown,4,4
	.comm	damageTimer,4,4
	.comm	playerTookDamage,4,4
	.comm	savedhOff,4,4
	.comm	savedvOff,4,4
	.comm	savedWorldCol,4,4
	.comm	savedWorldRow,4,4
	.comm	screenPan,4,4
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
