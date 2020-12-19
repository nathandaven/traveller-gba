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
	.file	"battleView.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBattleViewPlayer.part.0, %function
drawBattleViewPlayer.part.0:
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
	.size	drawBattleViewPlayer.part.0, .-drawBattleViewPlayer.part.0
	.align	2
	.global	initBattleViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBattleViewPlayer, %function
initBattleViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r0, #16
	mov	r4, #127
	mov	lr, #40
	mov	r1, #1
	mov	ip, #3
	ldr	r3, .L8
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
.L9:
	.align	2
.L8:
	.word	player
	.size	initBattleViewPlayer, .-initBattleViewPlayer
	.align	2
	.global	initBattleViewEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBattleViewEnemies, %function
initBattleViewEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L18
	ldr	r2, .L18+4
	ldr	r3, [r3]
	ldr	r0, [r2]
	add	r3, r3, #5
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mul	r0, r3, r0
	ldr	r3, .L18+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+16
	ldr	lr, [r3]
	cmp	lr, #0
	ble	.L10
	mov	r2, #200
	ldr	r3, .L18+20
	mov	r7, #120
	str	r2, [r3, #12]
	mov	ip, #240
	mov	r0, #10
	mov	r8, #5
	mov	r2, #1
	mov	r5, #16
	mov	r1, #0
	mov	r4, #3
	mov	r9, #260
	add	lr, lr, #1
	str	r7, [r3, #8]
	add	lr, lr, lr, lsl #2
.L16:
	add	r6, r0, #40
	cmp	r0, lr
	str	r8, [r3]
	str	r2, [r3, #72]
	str	r5, [r3, #24]
	str	r5, [r3, #28]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	str	r4, [r3, #48]
	str	r2, [r3, #56]
	str	r1, [r3, #80]
	str	r2, [r3, #108]
	str	r1, [r3, #52]
	str	r2, [r3, #596]
	str	r4, [r3, #4]
	str	r0, [r3, #608]
	str	r1, [r3, #604]
	str	r6, [r3, #600]
	beq	.L10
	cmp	ip, #340
	movls	r6, ip
	movhi	r6, r9
	str	r7, [r3, #628]
	str	r6, [r3, #632]
	add	r0, r0, #5
	add	ip, ip, #40
	add	r3, r3, #620
	b	.L16
.L10:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	playerMoney
	.word	playerHealth
	.word	srand
	.word	rand
	.word	totalEnemies
	.word	enemies
	.size	initBattleViewEnemies, .-initBattleViewEnemies
	.align	2
	.global	initBattleViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBattleViewArrows, %function
initBattleViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #16
	mov	r2, #1
	mov	r4, #6
	ldr	r0, .L24
	ldr	r3, .L24+4
	ldr	ip, [r0]
	ldr	r0, [r0, #4]
	add	lr, r3, #256
.L21:
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r4, [r3, #12]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r2, [r3, #44]
	add	r3, r3, #64
	cmp	r3, lr
	bne	.L21
	ldr	r3, .L24+8
	pop	{r4, lr}
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r2, [r3, #44]
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.word	arrows
	.word	bow
	.size	initBattleViewArrows, .-initBattleViewArrows
	.align	2
	.global	initBattleViewButtons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBattleViewButtons, %function
initBattleViewButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	mov	r0, #16
	ldr	r3, .L28
	str	lr, [sp, #-4]!
	ldm	r3, {ip, lr}
	ldr	r2, .L28+4
	ldr	r3, .L28+8
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
.L29:
	.align	2
.L28:
	.word	player
	.word	aButton
	.word	bButton
	.size	initBattleViewButtons, .-initBattleViewButtons
	.align	2
	.global	initBattleView
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBattleView, %function
initBattleView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L33
	ldr	r4, .L33+4
	ldr	r3, [r6]
	ldr	r0, [r4]
	add	r3, r3, #5
	ldr	r5, .L33+8
	mul	r0, r3, r0
	mov	lr, pc
	bx	r5
	mov	r3, #3
	ldr	r8, .L33+12
	ldr	r7, .L33+16
	str	r3, [r8]
	mov	lr, pc
	bx	r7
	ldr	r3, .L33+20
	smull	r2, r3, r0, r3
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	cmp	r3, #0
	movlt	r3, #2
	strlt	r3, [r8]
	mov	lr, pc
	bx	r7
	mvn	r1, #0
	ldr	r3, [r6]
	ldr	r0, [r4]
	add	r3, r3, #5
	mul	r3, r0, r3
	ldr	r4, .L33+24
	ldr	r0, [r4, #4]
	ldr	r2, .L33+28
	add	r0, r0, #5
	mul	r0, r3, r0
	str	r1, [r2]
	mov	lr, pc
	bx	r5
	mov	lr, pc
	bx	r7
	mov	ip, #1
	mov	r5, #3
	mov	r3, #0
	mov	r1, #67108864
	mov	lr, #16
	mov	r7, #127
	mov	r6, #40
	ldr	r2, .L33+20
	smull	r8, r2, r0, r2
	sub	r2, r2, r0, asr #31
	add	r2, r2, r2, lsl ip
	sub	r0, r0, r2
	ldr	r2, .L33+32
	add	r0, r0, r5
	str	r0, [r2]
	ldr	r2, .L33+36
	str	r3, [r2]
	ldr	r2, .L33+40
	str	r3, [r2]
	ldr	r2, .L33+44
	str	r3, [r2]
	ldr	r2, .L33+48
	str	r3, [r2]
	strh	r3, [r1, #22]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	strh	r3, [r1, #26]	@ movhi
	strh	r3, [r1, #24]	@ movhi
	strh	r3, [r1, #30]	@ movhi
	strh	r3, [r1, #28]	@ movhi
	str	r3, [r4, #24]
	str	r3, [r4, #36]
	str	r3, [r4, #28]
	str	lr, [r4, #16]
	str	lr, [r4, #20]
	str	ip, [r4, #8]
	str	ip, [r4, #12]
	str	r7, [r4]
	str	r6, [r4, #4]
	str	r5, [r4, #40]
	bl	initBattleViewButtons
	bl	initBattleViewArrows
	pop	{r4, r5, r6, r7, r8, lr}
	b	initBattleViewEnemies
.L34:
	.align	2
.L33:
	.word	playerMoney
	.word	playerHealth
	.word	srand
	.word	totalEnemies
	.word	rand
	.word	1431655766
	.word	player
	.word	textViewChoice
	.word	battleValue
	.word	enemiesDefeated
	.word	battleViewDefeated
	.word	vOff
	.word	hOff
	.size	initBattleView, .-initBattleView
	.align	2
	.global	resumeBattleView
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeBattleView, %function
resumeBattleView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r1, .L37+4
	ldr	r2, .L37+8
	ldr	r0, [r1]
	ldr	r2, [r2]
	ldr	lr, .L37+12
	ldr	ip, .L37+16
	str	r2, [lr]
	str	r0, [ip]
	lsl	r1, r2, #16
	ldr	ip, .L37+20
	lsl	r2, r0, #16
	ldr	r0, .L37+24
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
	ldr	r3, .L37+28
	ldr	r2, [r0]
	pop	{r4, lr}
	stm	r3, {r1, r2}
	bx	lr
.L38:
	.align	2
.L37:
	.word	waitForVBlank
	.word	savedhOff
	.word	savedvOff
	.word	vOff
	.word	hOff
	.word	savedWorldRow
	.word	savedWorldCol
	.word	player
	.size	resumeBattleView, .-resumeBattleView
	.global	__aeabi_idivmod
	.align	2
	.global	animateBattleViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBattleViewPlayer, %function
animateBattleViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L51
	ldr	r3, .L51+4
	ldr	r5, [r4, #24]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #28]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bne	.L40
	ldr	r0, [r4, #36]
	ldr	r3, .L51+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L40:
	ldr	r3, .L51+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L41
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L42
.L44:
	mov	r3, #2
	str	r3, [r4, #28]
.L42:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L44
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animateBattleViewPlayer, .-animateBattleViewPlayer
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.global	__aeabi_dsub
	.global	__aeabi_dcmpgt
	.align	2
	.global	updateBattleViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBattleViewPlayer, %function
updateBattleViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #0
	sub	sp, sp, #44
	bl	initBattleViewButtons
	ldr	r3, .L120+16
	ldr	fp, .L120+20
	ldr	r4, [r3]
	ldr	r3, .L120+116
	ldr	r0, [fp, #52]
	str	r9, [r3]
	ldr	r8, .L120+24
	mov	lr, pc
	bx	r8
	mov	r6, r0
	mov	r7, r1
	adr	r3, .L120
	ldmia	r3, {r2-r3}
	str	r6, [sp, #32]
	str	r7, [sp, #36]
	ldr	ip, .L120+28
	mov	lr, pc
	bx	ip
	ldr	r7, .L120+32
	mov	lr, pc
	bx	r7
	ldr	r3, .L120+36
	ldr	r3, [r3]
	ldr	r10, .L120+40
	str	r3, [sp, #24]
	mov	r6, r3
	mov	lr, pc
	bx	r10
	ldr	r5, [fp]
	ldr	r3, [fp, #20]
	sub	r4, r5, r4
	add	r4, r3, r4
	str	r3, [sp, #20]
	sub	r4, r4, r0
	rsb	r3, r6, #160
	cmp	r4, r3
	ldr	r3, [fp, #4]
	str	r3, [sp, #16]
	ldr	r3, .L120+60
	ldr	r3, [r3]
	movge	r10, #1
	str	r3, [sp, #28]
	strge	r9, [fp, #52]
	bge	.L55
	ldr	r4, .L120+44
	adr	r3, .L120+8
	ldmia	r3, {r2-r3}
	add	r1, sp, #32
	ldmia	r1, {r0-r1}
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r10
	str	r0, [fp, #52]
	mov	lr, pc
	bx	r8
	ldr	ip, .L120+28
	adr	r3, .L120
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r7
	mov	r2, r0
	mov	r6, r1
	mov	r0, r5
	mov	r5, r2
	mov	lr, pc
	bx	r8
	mov	r2, r5
	mov	r3, r6
	str	r5, [sp, #32]
	str	r6, [sp, #36]
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r10
	ldr	r6, .L120+136
	str	r0, [fp]
	ldr	r0, [r6]
	mov	lr, pc
	bx	r8
	add	r3, sp, #32
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r10
	ldr	r5, .L120+140
	str	r0, [r6]
	ldr	r0, [r5]
	mov	lr, pc
	bx	r8
	add	r3, sp, #32
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r10
	mov	r10, r9
	str	r0, [r5]
.L55:
	ldr	r3, .L120+48
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L57
	mov	r2, #1
	mvn	r3, #0
	ldr	r1, .L120+116
	ldr	r9, [sp, #28]
	str	r2, [r1]
	ldr	r2, [sp, #16]
	sub	r2, r2, r9
	cmp	r2, #0
	str	r3, [fp, #48]
	ble	.L57
	ldr	r0, [fp, #52]
	mov	lr, pc
	bx	r8
	ldr	ip, .L120+28
	adr	r3, .L120
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r7
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [sp, #20]
	ldr	r0, [fp]
	add	r0, r3, r0
	mov	lr, pc
	bx	r8
	mov	r2, r4
	mov	r3, r5
	ldr	r4, .L120+44
	mov	lr, pc
	bx	r4
	mov	r4, r0
	ldr	r0, [sp, #24]
	mov	r5, r1
	mov	lr, pc
	bx	r8
	ldr	r6, .L120+52
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L57
	ldr	ip, .L120+136
	ldr	r0, .L120+140
	ldr	r3, [fp, #8]
	ldr	r1, [ip, #4]
	ldr	r2, [r0, #4]
	sub	r1, r1, r3
	sub	r2, r2, r3
	ldr	lr, [sp, #16]
	ldr	r3, [fp, #12]
	cmp	r9, #0
	sub	r3, lr, r3
	str	r1, [ip, #4]
	str	r2, [r0, #4]
	str	r3, [fp, #4]
	ble	.L57
	sub	r3, r3, r9
	cmp	r3, #119
	ldrle	r2, .L120+60
	suble	r3, r9, #1
	strle	r3, [r2]
.L57:
	ldr	r3, .L120+48
	ldrh	r2, [r3, #48]
	ldr	r3, .L120+56
	tst	r2, #16
	ldr	r4, [r3, #12]
	bne	.L60
	mov	r2, #1
	ldr	r3, .L120+60
	ldr	r9, [fp, #4]
	ldr	r5, [r3]
	ldr	r1, [fp, #16]
	sub	r3, r9, r5
	add	r3, r3, r1
	ldr	r1, .L120+116
	cmp	r3, #239
	str	r2, [r1]
	str	r2, [fp, #48]
	bgt	.L63
	ldr	r0, [fp, #52]
	mov	lr, pc
	bx	r8
	ldr	ip, .L120+28
	adr	r3, .L120
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	ip
	mov	lr, pc
	bx	r7
	mov	r6, r0
	mov	r7, r1
	ldr	r2, [sp, #20]
	ldr	r0, [fp]
	add	r0, r2, r0
	mov	lr, pc
	bx	r8
	mov	r2, r6
	mov	r3, r7
	ldr	r6, .L120+44
	mov	lr, pc
	bx	r6
	mov	r6, r0
	ldr	r0, [sp, #24]
	mov	r7, r1
	mov	lr, pc
	bx	r8
	ldr	r8, .L120+52
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L63
	ldr	r0, .L120+136
	ldr	r1, .L120+140
	ldr	ip, [fp, #8]
	ldr	r2, [r0, #4]
	ldr	r3, [r1, #4]
	add	r2, r2, ip
	add	r3, r3, ip
	ldr	ip, [fp, #12]
	b	.L121
.L122:
	.align	3
.L120:
	.word	2576980378
	.word	1069128089
	.word	1202590843
	.word	1074035425
	.word	vOff
	.word	player
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	.LANCHOR0
	.word	__aeabi_d2iz
	.word	__aeabi_dsub
	.word	67109120
	.word	__aeabi_dcmpgt
	.word	soundB
	.word	hOff
	.word	oldButtons
	.word	playerShootCooldown
	.word	playerHasBow
	.word	totalEnemies
	.word	enemies
	.word	collision
	.word	savedWorldCol
	.word	savedWorldRow
	.word	playerTookDamage
	.word	buttons
	.word	arrows+44
	.word	arrowShot_length
	.word	arrowShot_data
	.word	playerIsMoving
	.word	pauseSoundB
	.word	bossDead
	.word	walking_length
	.word	walking_data
	.word	aButton
	.word	bButton
	.word	playerJump_length
	.word	playerJump_data
	.word	playSoundB
	.word	playerShootSpeed
	.word	arrows
.L121:
	cmp	r5, #99
	add	r9, r9, ip
	str	r2, [r0, #4]
	str	r3, [r1, #4]
	str	r9, [fp, #4]
	bgt	.L63
	sub	r9, r9, r5
	cmp	r9, #119
	ldrgt	r3, .L120+60
	addgt	r5, r5, #1
	strgt	r5, [r3]
.L63:
	cmp	r4, #0
	beq	.L65
.L68:
	ldr	r4, .L120+64
	ldrh	r3, [r4]
	tst	r3, #64
	beq	.L70
	ldr	r3, .L120+100
	ldrh	r3, [r3]
	eor	r3, r3, #64
	ands	r3, r10, r3, lsr #6
	bne	.L115
.L70:
	ldr	r2, .L120+68
	ldr	r3, [r2]
	sub	r3, r3, #1
	cmp	r3, #0
	movle	r3, #0
	str	r3, [r2]
	ldr	r3, .L120+72
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L73
	ldrh	r3, [r4]
	tst	r3, #2
	bne	.L116
.L73:
	ldr	r8, .L120+76
	ldr	r3, [r8]
	cmp	r3, #0
	ldr	r1, [fp, #4]
	ldr	r2, [fp]
	ble	.L77
	mov	r7, #0
	mov	r9, #1
	ldr	r5, .L120+80
	ldr	r10, .L120+84
.L86:
	ldr	r3, [r5]
	cmp	r3, #5
	beq	.L78
	cmp	r3, #7
	beq	.L79
	cmp	r3, #4
	beq	.L117
.L81:
	ldr	r3, [r8]
	add	r7, r7, #1
	cmp	r3, r7
	add	r5, r5, #620
	bgt	.L86
.L77:
	ldr	r0, .L120+88
	ldr	r3, .L120+92
	str	r1, [r0]
	str	r2, [r3]
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateBattleViewPlayer
.L117:
	mov	r4, r5
	mov	r6, #0
	b	.L80
.L84:
	add	r6, r6, #1
	cmp	r6, #6
	add	r4, r4, #64
	beq	.L81
.L80:
	ldr	r3, [r4, #168]
	cmp	r3, #0
	bne	.L84
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
	bx	r10
	cmp	r0, #0
	ldrne	r3, .L120+96
	strne	r9, [r4, #168]
	strne	r9, [r3]
	ldr	r1, [fp, #4]
	ldr	r2, [fp]
	b	.L84
.L79:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L118
.L82:
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
	bx	r10
	cmp	r0, #0
	movne	r3, #60
	ldrne	r2, .L120+96
	strne	r9, [r5, #116]
	strne	r9, [r2]
	strne	r3, [r5, #88]
	ldr	r1, [fp, #4]
	ldr	r2, [fp]
	b	.L81
.L78:
	ldr	r3, [r5, #4]
	cmp	r3, #0
	ble	.L81
	b	.L82
.L116:
	ldr	r3, .L120+100
	ldrh	r3, [r3]
	ands	r3, r3, #2
	bne	.L73
	ldr	r1, [r2]
	cmp	r1, #1
	bgt	.L73
	ldr	r0, .L120+104
.L76:
	ldr	r1, [r0, r3, lsl #6]
	cmp	r1, #0
	lsl	r1, r3, #6
	bne	.L119
	add	r3, r3, #1
	cmp	r3, #4
	bne	.L76
.L75:
	ldr	r3, .L120+108
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L120+112
	ldr	r3, .L120+152
	mov	lr, pc
	bx	r3
	b	.L73
.L60:
	ldr	r2, .L120+116
	cmp	r4, #0
	ldr	r2, [r2]
	bne	.L64
	cmp	r2, #0
	bne	.L65
.L69:
	ldr	r2, [r3]
	ldr	r3, .L120+132
	cmp	r2, r3
	bne	.L68
	ldr	r3, .L120+120
	mov	lr, pc
	bx	r3
	b	.L68
.L118:
	ldr	r3, .L120+124
	str	r9, [r3]
	b	.L81
.L65:
	ldr	r3, .L120+128
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L120+132
	ldr	r3, .L120+152
	mov	lr, pc
	bx	r3
	b	.L68
.L115:
	mov	lr, #40
	ldr	ip, .L120+136
	ldr	r0, .L120+140
	ldr	r1, [ip, #4]
	ldr	r2, [r0, #4]
	ldr	r3, [fp]
	sub	r1, r1, #1
	str	r1, [ip, #4]
	ldr	r1, .L120+144
	sub	r2, r2, #1
	sub	r3, r3, #1
	str	r2, [r0, #4]
	str	r3, [fp]
	mov	r2, #0
	ldr	r1, [r1]
	ldr	r0, .L120+148
	ldr	r3, .L120+152
	str	lr, [fp, #52]
	mov	lr, pc
	bx	r3
	b	.L70
.L64:
	cmp	r2, #0
	bne	.L68
	b	.L69
.L119:
	mov	lr, #80
	mov	ip, #0
	mov	r4, #10
	ldr	r0, .L120+156
	ldr	r0, [r0]
	rsb	r0, r0, #30
	str	r0, [r2]
	ldr	r0, .L120+160
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
	b	.L75
	.size	updateBattleViewPlayer, .-updateBattleViewPlayer
	.global	__aeabi_dadd
	.align	2
	.global	updateBattleViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBattleViewArrows, %function
updateBattleViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	mov	r3, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #20
	str	r2, [sp, #8]
	ldr	r1, .L139+16
	ldr	r2, .L139+20
	ldr	r0, .L139+24
	str	r3, [sp, #12]
	ldr	r2, [r2]
	str	r3, [r0, #44]
	ldr	r3, [r1]
	str	r3, [sp]
	rsb	r3, r2, #168
	ldr	r4, .L139+28
	ldr	r10, .L139+32
	str	r3, [sp, #4]
.L129:
	ldr	r0, [r4, #52]
	mov	lr, pc
	bx	r10
	adr	r3, .L139
	ldmia	r3, {r2-r3}
	ldr	ip, .L139+36
	mov	r6, r0
	mov	r7, r1
	mov	lr, pc
	bx	ip
	ldr	r3, .L139+40
	mov	lr, pc
	bx	r3
	ldr	r2, [sp]
	ldr	fp, [r4]
	ldr	r3, [r4, #20]
	sub	r5, fp, r2
	add	r5, r5, r3
	ldr	r3, .L139+44
	mov	r8, r0
	mov	r9, r1
	mov	lr, pc
	bx	r3
	ldr	r2, [sp, #4]
	sub	r5, r5, r0
	cmp	r5, r2
	bge	.L124
	mov	r0, fp
	mov	lr, pc
	bx	r10
	mov	r2, r8
	mov	r3, r9
	ldr	ip, .L139+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L139+44
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #48]
	cmp	r3, #1
	str	r0, [r4]
	ldr	r0, [r4, #56]
	beq	.L138
	mov	lr, pc
	bx	r10
	adr	r3, .L139
	ldmia	r3, {r2-r3}
	ldr	ip, .L139+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L139+40
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r10
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L139+48
	mov	lr, pc
	bx	ip
	ldr	r3, .L139+44
	mov	lr, pc
	bx	r3
.L126:
	adr	r3, .L139+8
	ldmia	r3, {r2-r3}
	str	r0, [r4, #4]
	ldr	ip, .L139+48
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	ip
	ldr	r3, .L139+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r3, [sp, #8]
	mov	r3, #0
	str	r0, [r4, #52]
	str	r3, [sp, #12]
.L127:
	ldr	r3, [r4, #4]
	sub	r3, r3, #1
	cmp	r3, #324
	movcs	r3, #1
	strcs	r3, [r4, #44]
	ldr	r3, .L139+52
	add	r4, r4, #64
	cmp	r3, r4
	bne	.L129
	ldr	r3, [sp, #8]
	cmp	r3, #0
	ldrne	r2, [sp, #12]
	ldrne	r3, .L139+24
	strne	r2, [r3, #44]
	ldr	r2, .L139+56
	ldr	r3, [r2, #48]
	cmp	r3, #1
	ldr	r3, [r2, #4]
	ldr	r1, .L139+24
	ldr	r2, [r2]
	addeq	r3, r3, #5
	subne	r3, r3, #5
	stm	r1, {r2, r3}
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L124:
	mov	r3, #0
	str	r3, [r4, #52]
	str	r3, [r4, #56]
	mov	r3, #1
	str	r3, [r4, #44]
	b	.L127
.L138:
	mov	lr, pc
	bx	r10
	adr	r3, .L139
	ldmia	r3, {r2-r3}
	ldr	ip, .L139+36
	mov	lr, pc
	bx	ip
	ldr	r3, .L139+40
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r10
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L139+60
	mov	lr, pc
	bx	ip
	ldr	r3, .L139+44
	mov	lr, pc
	bx	r3
	b	.L126
.L140:
	.align	3
.L139:
	.word	2576980378
	.word	1069128089
	.word	2576980378
	.word	1073322393
	.word	vOff
	.word	.LANCHOR0
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
	.size	updateBattleViewArrows, .-updateBattleViewArrows
	.align	2
	.global	updateBattleViewHostileArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBattleViewHostileArrows, %function
updateBattleViewHostileArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L160+16
	ldr	r3, [r3]
	cmp	r3, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L160+20
	ldr	r1, .L160+24
	ldr	r10, .L160+28
	add	r3, r3, r3, lsl #2
	ldr	r2, [r2]
	rsb	r3, r3, r3, lsl #5
	sub	sp, sp, #20
	add	r3, r10, r3, lsl #2
	ldr	r1, [r1]
	str	r3, [sp, #12]
	rsb	r3, r2, #168
	str	r1, [sp, #4]
	str	r3, [sp, #8]
.L151:
	mov	r3, #1
	sub	r4, r10, #384
	str	r3, [r10, #168]
	b	.L148
.L144:
	mov	lr, pc
	bx	r5
	adr	r3, .L160
	ldmia	r3, {r2-r3}
	ldr	ip, .L160+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L160+36
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4, #128]
	mov	lr, pc
	bx	r5
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L160+40
	mov	lr, pc
	bx	ip
	ldr	r3, .L160+44
	mov	lr, pc
	bx	r3
.L145:
	adr	r3, .L160+8
	ldmia	r3, {r2-r3}
	str	r0, [r4, #128]
	ldr	ip, .L160+40
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	ip
	ldr	r3, .L160+44
	mov	lr, pc
	bx	r3
	str	r0, [r4, #176]
.L146:
	ldr	r3, [r4, #128]
	sub	r3, r3, #1
	cmp	r3, #324
	movcs	r3, #1
	add	r4, r4, #64
	strcs	r3, [r4, #104]
	cmp	r4, r10
	beq	.L159
.L148:
	ldr	r3, .L160+48
	ldr	r0, [r4, #176]
	mov	lr, pc
	bx	r3
	adr	r3, .L160
	ldmia	r3, {r2-r3}
	ldr	ip, .L160+32
	mov	r6, r0
	mov	r7, r1
	mov	lr, pc
	bx	ip
	ldr	r2, .L160+36
	mov	lr, pc
	bx	r2
	ldr	r2, [sp, #4]
	ldr	fp, [r4, #124]
	ldr	r3, [r4, #144]
	sub	r5, fp, r2
	ldr	r2, .L160+44
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
	bge	.L146
	ldr	r3, .L160+48
	mov	r0, fp
	mov	lr, pc
	bx	r3
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L160+40
	mov	lr, pc
	bx	ip
	ldr	r2, .L160+44
	mov	lr, pc
	bx	r2
	str	r0, [r4, #124]
	ldr	r3, [r10, #-328]
	cmp	r3, #1
	mov	r3, #0
	str	r3, [r10, #168]
	ldr	r5, .L160+48
	ldr	r0, [r4, #180]
	bne	.L144
	mov	lr, pc
	bx	r5
	adr	r3, .L160
	ldmia	r3, {r2-r3}
	ldr	ip, .L160+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L160+36
	mov	lr, pc
	bx	r3
	mov	r8, r0
	mov	r9, r1
	ldr	r0, [r4, #128]
	mov	lr, pc
	bx	r5
	mov	r3, r9
	mov	r2, r8
	ldr	ip, .L160+52
	mov	lr, pc
	bx	ip
	ldr	r3, .L160+44
	mov	lr, pc
	bx	r3
	b	.L145
.L159:
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
	bne	.L151
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L161:
	.align	3
.L160:
	.word	2576980378
	.word	1069128089
	.word	2576980378
	.word	1074370969
	.word	totalEnemies
	.word	.LANCHOR0
	.word	vOff
	.word	enemies+384
	.word	__aeabi_dmul
	.word	round
	.word	__aeabi_dsub
	.word	__aeabi_d2iz
	.word	__aeabi_i2d
	.word	__aeabi_dadd
	.size	updateBattleViewHostileArrows, .-updateBattleViewHostileArrows
	.align	2
	.global	animateBattleViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateBattleViewVillagers, %function
animateBattleViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L186
	ldr	r10, [r3]
	cmp	r10, #0
	ble	.L162
	mov	r6, #0
	mov	r9, r6
	ldr	r4, .L186+4
	ldr	fp, .L186+8
.L170:
	ldr	r8, [r4, #80]
	cmp	r8, #0
	bne	.L184
	ldr	r7, [r4, #108]
	cmp	r7, #0
	beq	.L165
.L184:
	ldr	r7, [r4, #36]
.L165:
	ldr	r5, [r4, #32]
	smull	r3, r2, fp, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r7, [r4, #40]
	bne	.L166
	add	r0, r4, #44
	ldm	r0, {r0, r1}
	ldr	r3, .L186+12
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #44]
.L166:
	ldr	r3, [r4, #56]
	cmn	r3, #1
	beq	.L185
	sub	r2, r3, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	cmp	r8, #0
	movne	r8, r3
	moveq	r8, #0
	cmp	r8, #0
	movne	r3, #2
	strne	r3, [r4, #36]
	bne	.L169
.L168:
	str	r9, [r4, #44]
	str	r9, [r4, #32]
	str	r7, [r4, #36]
.L172:
	add	r6, r6, #1
	cmp	r6, r10
	add	r4, r4, #620
	bne	.L170
.L162:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L185:
	cmp	r8, #0
	movne	r3, #3
	strne	r3, [r4, #36]
	beq	.L168
.L169:
	add	r5, r5, #1
	str	r5, [r4, #32]
	b	.L172
.L187:
	.align	2
.L186:
	.word	totalEnemies
	.word	enemies
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateBattleViewVillagers, .-animateBattleViewVillagers
	.align	2
	.global	updateBattleViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBattleViewVillagers, %function
updateBattleViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r10, .L298+16
	ldr	r3, [r10]
	cmp	r3, #0
	sub	sp, sp, #28
	ble	.L242
	mov	r3, #0
	mov	r9, r3
	ldr	r4, .L298+20
	ldr	fp, .L298+24
.L241:
	ldr	r3, .L298+28
	ldr	r0, [r4, #-108]
	mov	lr, pc
	bx	r3
	adr	r3, .L298
	ldmia	r3, {r2-r3}
	ldr	ip, .L298+32
	mov	r6, r0
	mov	r7, r1
	mov	lr, pc
	bx	ip
	ldr	r2, .L298+36
	mov	lr, pc
	bx	r2
	ldr	lr, .L298+40
	ldr	r5, [r4, #-160]
	ldr	r8, [lr]
	ldr	r3, [r4, #-140]
	ldr	r2, .L298+44
	sub	r8, r5, r8
	add	r8, r8, r3
	mov	lr, pc
	bx	r2
	ldr	r1, .L298+48
	ldr	r3, [r1]
	sub	r8, r8, r0
	rsb	r3, r3, #160
	cmp	r8, r3
	bge	.L190
	adr	r3, .L298+8
	ldmia	r3, {r2-r3}
	mov	r0, r6
	mov	r1, r7
	ldr	r8, .L298+52
	mov	lr, pc
	bx	r8
	ldr	r2, .L298+44
	mov	lr, pc
	bx	r2
	mov	r3, #0
	str	r0, [r4, #-108]
	str	r3, [r4, #408]
	ldr	r3, .L298+28
	mov	lr, pc
	bx	r3
	adr	r3, .L298
	ldmia	r3, {r2-r3}
	ldr	ip, .L298+32
	mov	lr, pc
	bx	ip
	ldr	ip, .L298+36
	mov	lr, pc
	bx	ip
	mov	r6, r0
	mov	r7, r1
	mov	r0, r5
	ldr	r3, .L298+28
	mov	lr, pc
	bx	r3
	mov	r3, r7
	mov	r2, r6
	mov	lr, pc
	bx	r8
	ldr	r2, .L298+44
	mov	lr, pc
	bx	r2
	mov	r3, #1
	mov	r5, r0
	str	r3, [r4, #420]
	str	r0, [r4, #-160]
.L191:
	ldr	r3, [r4, #-156]
	ldr	r1, [fp]
	ldr	r2, [r4, #-144]
	sub	r1, r3, r1
	add	r2, r1, r2
	cmp	r2, #340
	movlt	r2, #0
	movge	r2, #1
	cmp	r1, #0
	movgt	r0, #0
	movle	r0, #1
	cmp	r1, #240
	str	r2, [r4, #416]
	str	r0, [r4, #412]
	movhi	r2, #1
	bhi	.L192
	ldr	r2, .L298+40
	ldr	r2, [r2]
	sub	r2, r5, r2
	cmp	r2, #160
	movls	r2, #0
	movhi	r2, #1
.L192:
	ldr	r0, .L298+72
	ldr	r1, [r0]
	sub	r5, r5, r1
	add	r5, r5, #49
	cmp	r5, #98
	str	r2, [r4, #-116]
	movhi	r2, #0
	bhi	.L193
	ldr	r2, [r0, #4]
	ldr	r1, .L298+56
	sub	r2, r3, r2
	add	r2, r2, #139
	cmp	r2, r1
	movhi	r2, #0
	movls	r2, #1
.L193:
	ldr	r1, [r4, #-96]
	cmp	r1, #0
	str	r2, [r4, #-60]
	bne	.L194
.L203:
	ldr	r2, [r4, #404]
	cmp	r2, #0
	movlt	r2, #0
	subge	r2, r2, #1
.L196:
	mov	r8, #0
	mov	r7, #10
	mov	r0, r3
	str	r2, [r4, #404]
	ldr	r5, .L298+60
.L212:
	ldr	r2, [r4, #-164]
	cmp	r2, #0
	ldr	r6, [r5, #60]
	ble	.L205
	cmp	r6, #0
	beq	.L206
.L210:
	ldr	r2, [r4, #404]
	cmp	r2, #1
	bgt	.L211
	ldr	r2, [r4, #-164]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r4, #-164]
	movle	r2, #1
	str	r8, [r5, #60]
	str	r7, [r4, #404]
	strle	r2, [r4, #-116]
.L211:
	ldr	r3, .L298+64
	add	r5, r5, #64
	cmp	r3, r5
	bne	.L212
	ldr	r2, [r4, #-168]
	bic	r1, r2, #2
	cmp	r1, #5
	mov	r3, r0
	add	r5, r9, #1
	beq	.L213
	cmp	r2, #4
	beq	.L289
.L214:
	ldr	r2, [fp]
	ldr	r1, [r4, #-144]
	sub	r2, r3, r2
	add	r1, r2, r1
	cmp	r1, #239
	movgt	ip, #0
	movle	ip, #1
	cmp	r2, #0
	movle	r0, #0
	movgt	r0, #1
	cmp	r2, #0
	str	ip, [r4, #416]
	str	r0, [r4, #412]
	ble	.L232
	cmp	r1, #239
	movgt	r2, #1
	movle	r2, #0
	str	r2, [r4, #408]
	bgt	.L246
	ldr	r2, [r4, #424]
	cmp	r2, #0
	bne	.L290
.L234:
	ldr	r2, [r4, #-88]
	cmp	r2, #0
	bne	.L281
.L291:
	ldr	r2, [r4, #-84]
.L238:
	ldr	r1, .L298+68
	sub	r3, r3, #2
	cmp	r3, r1
	ldrhi	r3, [r4, #-112]
	rsbhi	r3, r3, #0
	strhi	r3, [r4, #-112]
	cmp	r2, #0
	streq	r2, [r4, #-88]
	ldr	r3, [r4, #-92]
	ldr	r2, [r10]
	add	r3, r3, #1
	cmp	r2, r5
	str	r3, [r4, #-92]
	add	r4, r4, #620
	ble	.L242
	mov	r9, r5
	b	.L241
.L206:
	add	ip, r5, #16
	ldm	r5, {r1, r2}
	ldm	ip, {ip, lr}
	stmib	sp, {r1, ip, lr}
	str	r2, [sp]
	sub	r2, r4, #144
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #-160]
	ldr	ip, .L298+92
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L209
.L286:
	ldr	r6, [r5, #60]
	ldr	r0, [r4, #-156]
.L205:
	cmp	r6, #0
	beq	.L211
	b	.L210
.L190:
	mov	r3, #0
	str	r3, [r4, #-108]
	str	r3, [r4, #420]
	b	.L191
.L299:
	.align	3
.L298:
	.word	2576980378
	.word	1069128089
	.word	1202590843
	.word	1074035425
	.word	totalEnemies
	.word	enemies+168
	.word	hOff
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	round
	.word	vOff
	.word	__aeabi_d2iz
	.word	.LANCHOR0
	.word	__aeabi_dsub
	.word	278
	.word	arrows
	.word	arrows+256
	.word	322
	.word	player
	.word	enemyHit_length
	.word	enemyHit_data
	.word	playSoundB
	.word	__aeabi_idivmod
	.word	collision
	.word	1717986919
	.word	rand
	.word	1374389535
	.word	enemies
.L232:
	mov	r2, #1
	str	r2, [r4, #408]
.L246:
	ldr	r2, [r4, #420]
	cmp	r2, #0
	bne	.L234
	ldr	r2, [r4, #424]
	cmp	r2, #0
	bne	.L235
	mov	r1, #1
	mov	r0, #40
	str	r2, [r4, #408]
	ldr	r2, [r4, #-160]
	sub	r2, r2, #1
	str	r2, [r4, #-160]
	ldr	r2, [r4, #-88]
	cmp	r2, #0
	str	r0, [r4, #-108]
	str	r1, [r4, #420]
	str	r1, [r4, #424]
	beq	.L291
.L281:
	ldr	r2, [r4, #-148]
	ldr	r1, [r4, #-112]
	mla	r1, r2, r1, r3
	ldr	r0, [r4, #-80]
	ldr	r2, [r4, #-84]
	sub	r0, r0, #1
	sub	r2, r2, #1
	mov	r3, r1
	str	r1, [r4, #-156]
	str	r2, [r4, #-84]
	str	r0, [r4, #-80]
	b	.L238
.L290:
	ldr	r2, [r4, #420]
	cmp	r2, #0
	bne	.L234
.L235:
	mov	r1, #0
	ldr	r2, [r4, #-112]
	rsb	r2, r2, #0
	str	r2, [r4, #-112]
	str	r1, [r4, #424]
	b	.L234
.L289:
	ldr	r2, [r4, #-60]
	cmp	r2, #0
	beq	.L214
	ldr	r2, [r4, #-164]
	cmp	r2, #0
	ble	.L214
	ldr	r2, .L298+72
	ldr	ip, [r2, #4]
	ldr	r2, [r4, #-76]
	ldr	r0, [r4, #-56]
	sub	ip, r3, ip
	sub	r2, r2, #1
	eor	r1, ip, ip, asr #31
	add	r0, r0, #1
	cmp	r2, #2
	str	r2, [r4, #-76]
	str	r0, [r4, #-56]
	sub	r1, r1, ip, asr #31
	bgt	.L217
	cmp	r1, #80
	ble	.L217
	mov	r2, #1
	cmp	ip, #0
	str	r2, [r4, #-88]
	mvngt	r2, #0
	lsl	r1, r5, #2
	add	ip, r1, #16
	str	ip, [r4, #-84]
	str	r2, [r4, #-112]
.L219:
	add	r1, r1, r5
	str	r3, [sp, #20]
	ldr	r2, .L298+88
	lsl	r1, r1, #3
	mov	lr, pc
	bx	r2
	cmp	r1, #0
	ldr	r3, [sp, #20]
	bgt	.L214
	mov	r2, #0
.L225:
	ldr	r1, [r4, r2, lsl #6]
	cmp	r1, #0
	bne	.L292
	add	r2, r2, #1
	cmp	r2, #6
	bne	.L225
	b	.L214
.L213:
	ldr	r2, [r4, #-60]
	cmp	r2, #0
	beq	.L214
	ldr	r2, [r4, #-164]
	cmp	r2, #0
	ble	.L214
	ldr	r0, [r4, #-56]
	sub	r1, r4, #80
	ldm	r1, {r1, r2}
	add	r0, r0, #1
	ldr	ip, [r4, #-48]
	str	r0, [r4, #-56]
	ldr	r0, .L298+72
	sub	r2, r2, #1
	sub	r1, r1, #1
	cmp	ip, #0
	str	r2, [r4, #-76]
	str	r1, [r4, #-80]
	ldr	r0, [r0, #4]
	bne	.L293
	cmp	r2, #3
	ble	.L228
	ldr	r1, [r4, #-52]
	cmp	r1, #0
	beq	.L214
	cmp	r2, #4
	moveq	r2, #1
	str	ip, [r4, #-88]
	str	ip, [r4, #-84]
	streq	r2, [r4, #-48]
	b	.L214
.L209:
	mov	r3, #1
	ldr	r1, .L298+76
	str	r3, [r5, #44]
	str	r3, [r5, #60]
	mov	r2, r6
	ldr	r1, [r1]
	str	r6, [r5, #4]
	str	r6, [r5]
	ldr	r0, .L298+80
	ldr	r3, .L298+84
	mov	lr, pc
	bx	r3
	b	.L286
.L242:
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateBattleViewVillagers
.L194:
	ldr	r8, .L298+100
	ldr	r5, [r4, #-92]
	mov	lr, pc
	bx	r8
	ldr	r3, .L298+96
	smull	r2, r3, r0, r3
	asr	r1, r0, #31
	rsb	r1, r1, r3, asr #4
	add	r1, r1, r1, lsl #2
	sub	r1, r0, r1, lsl #3
	ldr	r3, .L298+88
	mov	r0, r5
	add	r1, r1, #100
	mov	lr, pc
	bx	r3
	cmp	r1, #0
	bne	.L198
	ldr	r3, [r4, #-88]
	cmp	r3, #0
	beq	.L294
.L198:
	ldr	r3, [r10]
	cmp	r3, #0
	ble	.L285
	mov	r5, #0
	rsb	r7, r9, r9, lsl #31
	lsl	r7, r7, #1
	ldr	r6, .L298+108
	add	r7, r7, #55
.L202:
	cmp	r9, r5
	add	r5, r5, #1
	beq	.L200
	add	r2, r6, #8
	ldm	r2, {r2, r3}
	ldr	r0, [r6, #28]
	ldr	r1, [r6, #24]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	sub	r2, r4, #144
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #-160]
	ldr	r0, [r4, #-156]
	ldr	ip, .L298+92
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L200
	ldr	r3, [r4, #-88]
	cmp	r3, #0
	beq	.L295
.L200:
	ldr	r3, [r10]
	cmp	r3, r5
	add	r6, r6, #620
	bgt	.L202
.L285:
	ldr	r3, [r4, #-156]
	b	.L203
.L217:
	cmp	r1, #39
	bgt	.L287
	ldr	r2, [r4, #-48]
	cmp	r2, #0
	bne	.L221
	mov	r2, #1
	cmp	ip, #0
	mov	r1, #20
	str	r2, [r4, #-48]
	mvngt	r2, #0
	str	r1, [r4, #-76]
	str	r2, [r4, #-112]
	b	.L214
.L293:
	cmp	r2, #2
	bgt	.L214
	cmp	r1, #2
	bgt	.L245
	ldr	r2, [r4, #-52]
	cmp	r2, #0
	movne	ip, #0
	strne	ip, [r4, #-52]
	strne	ip, [r4, #-48]
.L245:
	sub	r6, r3, r0
	eor	r2, r6, r6, asr #31
	ldr	r0, [r4, #436]
	sub	r2, r2, r6, asr #31
	cmp	r2, r0
	ble	.L229
	ldr	r0, [r4, #-52]
	cmp	r0, #0
	beq	.L296
.L229:
	cmp	r1, #3
	ble	.L297
	ldr	r7, [r4, #432]
	cmp	r2, r7
	bge	.L214
	ldr	r2, [r4, #-52]
	cmp	r2, #0
	beq	.L214
	ldr	r3, [r4, #-88]
	add	r3, r3, #1
	ldr	r2, .L298+100
	str	r3, [r4, #-88]
	mov	lr, pc
	bx	r2
	mov	r3, r0
	mov	r1, #1
	ldr	r0, .L298+96
	smull	r2, r0, r3, r0
	asr	r2, r3, #31
	rsb	r2, r2, r0, asr r1
	add	r2, r2, r2, lsl #2
	sub	r3, r3, r2
	add	r3, r3, r7
	cmp	r6, #0
	str	r3, [r4, #-84]
	mvnle	r3, #0
	str	r1, [r4, #-88]
	strle	r3, [r4, #-112]
	strgt	r1, [r4, #-112]
	ldr	r3, [r4, #-156]
	b	.L214
.L221:
	cmp	ip, #0
	bgt	.L247
	mov	r2, #1
	str	r2, [r4, #-112]
.L287:
	lsl	r1, r5, #2
	b	.L219
.L294:
	mov	r2, #1
	lsl	r3, r9, #2
	add	r3, r3, #70
	str	r3, [r4, #-84]
	str	r2, [r4, #-88]
	mov	lr, pc
	bx	r8
	ldr	r2, .L298+104
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #60
	ldrgt	r3, [r4, #-112]
	rsbgt	r3, r3, #0
	strgt	r3, [r4, #-112]
	b	.L198
.L295:
	mov	r3, #1
	str	r7, [r4, #-84]
	str	r3, [r4, #-88]
	mov	lr, pc
	bx	r8
	b	.L200
.L297:
	cmp	r1, #2
	cmple	ip, #0
	bne	.L214
	ldr	r2, [r4, #-52]
	cmp	r2, #0
	beq	.L214
	ldr	r3, .L298+100
	ldr	r6, [r4, #440]
	mov	lr, pc
	bx	r3
	ldr	r1, .L298+104
	smull	r2, r1, r0, r1
	asr	r2, r0, #31
	rsb	r2, r2, r1, asr #4
	add	r2, r2, r2, lsl #2
	add	r2, r2, r2, lsl #2
	sub	r3, r0, r2, lsl #1
	add	r3, r3, r6
	str	r3, [r4, #-76]
	ldr	r3, [r4, #-156]
	b	.L214
.L228:
	bne	.L245
	b	.L214
.L247:
	mvn	r2, #0
	lsl	r1, r5, #2
	str	r2, [r4, #-112]
	b	.L219
.L296:
	lsl	r0, r5, #2
	cmp	r6, #0
	add	r0, r0, #16
	mov	lr, #1
	str	r0, [r4, #-84]
	mvngt	r0, #0
	str	lr, [r4, #-88]
	strgt	r0, [r4, #-112]
	strle	lr, [r4, #-112]
	b	.L229
.L292:
	mov	r0, #0
	mov	lr, #10
	mov	ip, #80
	add	r1, r9, r9, lsl #2
	rsb	r1, r1, r1, lsl #5
	lsl	r1, r1, #2
	add	r1, r1, r2, lsl #6
	ldr	r2, .L298+108
	add	r2, r2, r1
	str	r0, [r2, #168]
	ldr	r1, [r4, #-160]
	sub	r1, r1, #3
	str	r1, [r2, #124]
	str	r3, [r2, #128]
	str	r0, [r2, #184]
	str	lr, [r2, #176]
	str	ip, [r2, #180]
	ldr	r3, [r4, #-112]
	str	r3, [r2, #172]
	ldr	r3, [r4, #-156]
	b	.L214
	.size	updateBattleViewVillagers, .-updateBattleViewVillagers
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"You gained %d gold.\000"
	.align	2
.LC1:
	.ascii	"You defeated the attack!\000"
	.align	2
.LC2:
	.ascii	"Leave\000"
	.align	2
.LC3:
	.ascii	"\000"
	.text
	.align	2
	.global	drawEndScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEndScreen, %function
drawEndScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r2, .L302
	push	{r4, r5, r6, lr}
	ldr	r3, .L302+4
	ldr	r5, .L302+8
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	mov	r2, #67108864
	ldr	r1, .L302+12
	mov	r3, #256
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L302+16
	ldr	r4, .L302+20
	mov	lr, pc
	bx	r4
	ldr	r0, .L302+24
	ldr	r3, .L302+28
	mov	lr, pc
	bx	r3
	ldr	r6, .L302+32
	ldr	r3, .L302+36
	mov	r0, r6
	ldr	r2, [r3]
	ldr	r1, .L302+40
	ldr	r3, .L302+44
	mov	lr, pc
	bx	r3
	mov	r1, #16
	ldr	r4, .L302+48
	mov	r0, r1
	mov	r3, #15
	ldr	r2, .L302+52
	mov	lr, pc
	bx	r4
	mov	r2, r6
	mov	r3, #15
	mov	r1, #32
	mov	r0, #16
	mov	lr, pc
	bx	r4
	mov	r3, #15
	mov	r1, #109
	mov	r0, #178
	ldr	r2, .L302+56
	mov	lr, pc
	bx	r4
	mov	r1, #133
	mov	r0, #178
	ldr	r2, .L302+60
	mov	r3, #15
	mov	lr, pc
	bx	r4
	ldr	r3, .L302+64
	mov	lr, pc
	bx	r3
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L303:
	.align	2
.L302:
	.word	inMode4
	.word	hideSprites
	.word	flipPage
	.word	1044
	.word	textViewBackgroundPal
	.word	DMANow
	.word	textViewBackgroundBitmap
	.word	drawFullscreenImage4
	.word	buffer
	.word	battleValue
	.word	.LC0
	.word	sprintf
	.word	drawString4
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	waitForVBlank
	.size	drawEndScreen, .-drawEndScreen
	.align	2
	.global	updateBattleView
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBattleView, %function
updateBattleView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r2, .L321
	ldr	r5, .L321+4
	ldr	r3, [r2]
	ldr	r4, [r5]
	add	r3, r3, #1
	cmp	r4, #0
	str	r3, [r2]
	beq	.L320
	ldr	r3, .L321+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L304
	ldr	r3, .L321+12
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L304
	mov	lr, #1
	ldr	r1, .L321+16
	ldr	r0, .L321+20
	ldr	r2, [r1]
	ldr	r0, [r0]
	ldr	ip, .L321+24
	add	r2, r2, r0
	ldr	r0, .L321+28
	str	r2, [r1]
	str	lr, [ip]
	str	r3, [r0]
.L304:
	pop	{r4, r5, r6, lr}
	bx	lr
.L320:
	ldr	r6, .L321+32
	str	r4, [r6]
	bl	updateBattleViewPlayer
	bl	updateBattleViewVillagers
	bl	updateBattleViewArrows
	bl	updateBattleViewHostileArrows
	mov	r3, #1
	ldr	r2, .L321+36
	ldr	r1, [r2]
	cmp	r1, #0
	str	r3, [r5]
	ble	.L306
	ldr	r3, .L321+40
	b	.L309
.L307:
	cmp	r4, r1
	add	r3, r3, #620
	beq	.L306
.L309:
	ldr	r2, [r3, #4]
	cmp	r2, #0
	add	r4, r4, #1
	ble	.L307
	mov	r3, #0
	str	r3, [r5]
.L308:
	ldr	ip, .L321+44
	ldr	r3, [ip]
	cmp	r3, #0
	ldr	r2, [r6]
	ble	.L310
	sub	r3, r3, #1
	cmp	r2, #0
	str	r3, [ip]
	beq	.L304
	cmp	r3, #0
	bne	.L304
.L314:
	mov	r2, #0
	mov	lr, #30
	ldr	r0, .L321+48
	ldr	r3, [r0]
	ldr	r1, .L321+52
	sub	r3, r3, #1
	str	r3, [r0]
	ldr	r1, [r1]
	ldr	r0, .L321+56
	ldr	r3, .L321+60
	str	r2, [r6]
	str	lr, [ip]
	mov	lr, pc
	bx	r3
	b	.L304
.L310:
	cmp	r2, #0
	beq	.L304
	b	.L314
.L306:
	bl	drawEndScreen
	b	.L308
.L322:
	.align	2
.L321:
	.word	randomSeed
	.word	enemiesDefeated
	.word	oldButtons
	.word	buttons
	.word	playerMoney
	.word	battleValue
	.word	battleViewDefeated
	.word	inMode4
	.word	playerTookDamage
	.word	totalEnemies
	.word	enemies
	.word	damageTimer
	.word	playerHealth
	.word	playerHit_length
	.word	playerHit_data
	.word	playSoundB
	.size	updateBattleView, .-updateBattleView
	.align	2
	.global	drawBattleViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBattleViewPlayer, %function
drawBattleViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L327
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L324
	ldr	r2, .L327+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L324:
	b	drawBattleViewPlayer.part.0
.L328:
	.align	2
.L327:
	.word	player
	.word	shadowOAM
	.size	drawBattleViewPlayer, .-drawBattleViewPlayer
	.align	2
	.global	drawBattleViewVillagers
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBattleViewVillagers, %function
drawBattleViewVillagers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L354
	ldr	r0, [r3]
	cmp	r0, #0
	bxle	lr
	ldr	r2, .L354+4
	ldr	r1, .L354+8
	ldr	r3, .L354+12
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldrh	r4, [r2]
	ldrh	r5, [r1]
	ldr	r2, .L354+16
	ldr	lr, .L354+20
	ldr	r6, .L354+24
	ldr	r8, .L354+28
	ldr	r7, .L354+32
	add	r0, r3, r0, lsl #3
.L346:
	ldr	r1, [r2, #52]
	cmp	r1, #0
	bne	.L331
	ldr	r1, [r2, #4]
	cmp	r1, #0
	ble	.L331
	ldr	r1, [r2, #12]
	ldr	ip, [r2, #8]
	sub	r1, r1, r4
	and	r1, r1, lr
	sub	ip, ip, r5
	ldr	r9, [r2]
	orr	r10, r1, #16384
	and	ip, ip, #255
	strh	r10, [r3, #82]	@ movhi
	strh	ip, [r3, #80]	@ movhi
	cmp	r9, #7
	ldrls	pc, [pc, r9, asl #2]
	b	.L333
.L335:
	.word	.L341
	.word	.L339
	.word	.L339
	.word	.L333
	.word	.L338
	.word	.L337
	.word	.L336
	.word	.L334
.L334:
	ldr	ip, [r2, #588]
	orr	r1, r1, r6
	cmp	ip, #0
	strh	r1, [r3, #82]	@ movhi
	ldr	ip, [r2, #56]
	bne	.L343
	ldr	r1, [r2, #44]
	lsl	r1, r1, #23
	add	r1, r1, #12582912
	lsr	r1, r1, #16
	cmp	ip, #1
	addeq	r1, r1, #16
	addne	r1, r1, #20
	orr	r1, r1, #8192
	strh	r1, [r3, #84]	@ movhi
.L333:
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #620
	bne	.L346
.L353:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L331:
	ldrh	r1, [r3, #80]
	orr	r1, r1, #512
	strh	r1, [r3, #80]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #620
	bne	.L346
	b	.L353
.L339:
	ldr	ip, [r2, #44]
	ldr	r1, [r2, #36]
	add	r1, r1, ip, lsl #5
	add	r1, r1, #100
	lsl	r1, r1, #1
	strh	r1, [r3, #84]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #620
	bne	.L346
	b	.L353
.L338:
	ldr	r1, [r2, #36]
	ldr	ip, [r2, #44]
	add	r1, r1, #8
	add	r1, r1, ip, lsl #5
	lsl	r1, r1, #1
	strh	r1, [r3, #84]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #620
	bne	.L346
	b	.L353
.L336:
	ldr	r9, [r2, #56]
	orr	ip, ip, r6
	strh	ip, [r3, #80]	@ movhi
	ldr	r1, [r2, #44]
	ldr	ip, [r2, #36]
	cmp	r9, #1
	addeq	ip, ip, #3
	addne	ip, ip, #5
	add	r1, r1, #13
	add	r1, r1, ip, lsl #5
	lsl	r1, r1, #1
	orr	r1, r1, #4096
	strh	r1, [r3, #84]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #620
	bne	.L346
	b	.L353
.L341:
	ldr	r1, [r2, #36]
	ldr	ip, [r2, #44]
	add	r1, r1, #4
	add	r1, r1, ip, lsl #5
	lsl	r1, r1, #1
	strh	r1, [r3, #84]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #620
	bne	.L346
	b	.L353
.L337:
	ldr	r1, [r2, #36]
	ldr	ip, [r2, #44]
	add	r1, r1, #12
	add	r1, r1, ip, lsl #5
	lsl	r1, r1, #1
	orr	r1, r1, #8192
	strh	r1, [r3, #84]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #620
	bne	.L346
	b	.L353
.L343:
	cmp	ip, #1
	movne	r1, r8
	moveq	r1, r7
	strh	r1, [r3, #84]	@ movhi
	b	.L333
.L355:
	.align	2
.L354:
	.word	totalEnemies
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	enemies
	.word	511
	.word	-32768
	.word	8668
	.word	8664
	.size	drawBattleViewVillagers, .-drawBattleViewVillagers
	.align	2
	.global	drawBattleViewHostileArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBattleViewHostileArrows, %function
drawBattleViewHostileArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L376
	ldr	r3, [r3]
	sub	sp, sp, #12
	cmp	r3, #0
	str	r3, [sp, #4]
	ble	.L356
	mov	r7, #0
	mov	fp, #4416
	ldr	r2, .L376+4
	ldr	r3, .L376+8
	ldrh	r10, [r2]
	ldrh	r9, [r3]
	ldr	r6, .L376+12
	ldr	r5, .L376+16
	ldr	r8, .L376+20
.L365:
	mov	r3, r5
	mov	r0, #0
	ldr	r2, .L376+24
	lsl	r4, r7, #3
	b	.L361
.L374:
	ldrh	r1, [r2]
	orr	r1, r1, #512
	strh	r1, [r2]	@ movhi
.L359:
	add	r0, r0, #1
	cmp	r0, #6
	add	r3, r3, #64
	add	r2, r2, r4
	beq	.L373
.L361:
	ldr	r1, [r3, #168]
	cmp	r1, #0
	bne	.L374
	ldr	r1, [r3, #172]
	cmp	r1, #1
	ldr	r1, .L376+28
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
	b	.L359
.L373:
	ldr	r3, [r5, #552]
	cmp	r3, #0
	beq	.L362
	ldrh	r3, [r6, #160]
	orr	r3, r3, #512
	strh	r3, [r6, #160]	@ movhi
.L363:
	ldr	r3, [sp, #4]
	add	r7, r7, #1
	cmp	r3, r7
	add	r6, r6, #8
	add	r5, r5, #620
	bne	.L365
.L356:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L362:
	add	r2, r5, #508
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #108]
	sub	r3, r3, r9
	and	r3, r3, r8
	sub	r2, r2, r10
	cmp	r1, #0
	orr	r3, r3, #16384
	and	r2, r2, #255
	beq	.L364
	ldr	r1, [r5, #56]
	cmp	r1, #1
	beq	.L375
.L364:
	strh	r3, [r6, #162]	@ movhi
	ldr	r3, .L376+32
	strh	r2, [r6, #160]	@ movhi
	strh	r3, [r6, #164]	@ movhi
	b	.L363
.L375:
	strh	r3, [r6, #162]	@ movhi
	mov	r3, #4352	@ movhi
	strh	r2, [r6, #160]	@ movhi
	strh	r3, [r6, #164]	@ movhi
	b	.L363
.L377:
	.align	2
.L376:
	.word	totalEnemies
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	enemies
	.word	511
	.word	shadowOAM+360
	.word	4418
	.word	4354
	.size	drawBattleViewHostileArrows, .-drawBattleViewHostileArrows
	.align	2
	.global	drawBattleViewArrows
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBattleViewArrows, %function
drawBattleViewArrows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #0
	mov	r8, #4416
	ldr	r6, .L388
	ldr	r7, .L388+4
	ldr	r3, .L388+8
	ldrh	r4, [r6]
	ldrh	lr, [r7]
	ldr	r2, .L388+12
	ldr	ip, .L388+16
	ldr	r5, .L388+20
	add	r0, r3, #32
.L382:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	beq	.L379
	ldrh	r1, [r3]
	orr	r1, r1, #512
	strh	r1, [r3]	@ movhi
.L380:
	add	r3, r3, #8
	cmp	r0, r3
	add	r2, r2, #64
	bne	.L382
	ldr	r2, .L388+24
	ldr	r3, [r2, #44]
	cmp	r3, #0
	eor	r10, r10, #1
	movne	r10, #1
	andeq	r10, r10, #1
	cmp	r10, #0
	beq	.L383
	ldr	r2, .L388+28
	ldrh	r3, [r2, #72]
	orr	r3, r3, #512
	strh	r3, [r2, #72]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L379:
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
	b	.L380
.L383:
	ldr	r1, .L388+32
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
	ldreq	r1, .L388+28
	ldrne	r1, .L388+28
	ldrne	r0, .L388+36
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
.L389:
	.align	2
.L388:
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
	.size	drawBattleViewArrows, .-drawBattleViewArrows
	.align	2
	.global	drawBattleView
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBattleView, %function
drawBattleView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L397
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	bne	.L391
	ldr	r3, .L397+4
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	.L396
	bl	drawBattleViewPlayer.part.0
.L393:
	bl	drawBattleViewVillagers
	ldr	r4, .L397+8
	bl	drawBattleViewArrows
	bl	drawBattleViewHostileArrows
	ldr	r3, .L397+12
	ldr	r0, [r4]
	ldr	r1, [r3]
	ldr	r3, .L397+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L397+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L397+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L397+28
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L397+32
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
.L396:
	ldr	r2, .L397+32
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	b	.L393
.L391:
	ldr	r3, .L397+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L398:
	.align	2
.L397:
	.word	enemiesDefeated
	.word	player
	.word	hOff
	.word	vOff
	.word	drawButtons
	.word	drawGlobal
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	drawBattleView, .-drawBattleView
	.comm	bow,64,4
	.comm	arrows,256,4
	.comm	player,64,4
	.comm	enemies,2480,4
	.comm	totalEnemies,4,4
	.comm	buffer,20,4
	.comm	inMode4,4,4
	.comm	randomSeed,4,4
	.comm	battleValue,4,4
	.comm	enemiesDefeated,4,4
	.comm	playerShootCooldown,4,4
	.comm	playerIsMoving,4,4
	.comm	damageTimer,4,4
	.comm	playerTookDamage,4,4
	.comm	savedhOff,4,4
	.comm	savedvOff,4,4
	.comm	savedWorldCol,4,4
	.comm	savedWorldRow,4,4
	.global	floorRow
	.comm	shadowOAM,1024,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	floorRow, %object
	.size	floorRow, 4
floorRow:
	.word	16
	.ident	"GCC: (devkitARM release 53) 9.1.0"
