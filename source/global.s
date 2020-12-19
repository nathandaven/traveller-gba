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
	.file	"global.c"
	.text
	.align	2
	.global	initializeGlobal
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initializeGlobal, %function
initializeGlobal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L4
	mov	r0, #0
	mov	lr, pc
	bx	r3
	mov	r4, #5
	ldr	r3, .L4+4
	lsr	r0, r0, #1
	mov	lr, pc
	bx	r3
	mov	r0, #2
	mov	r2, #0
	mov	lr, #4
	mov	ip, #3
	mov	r6, #6
	mov	r5, #1
	mov	r1, #16
	mov	r8, #13
	mov	r7, #14
	ldr	r3, .L4+8
	str	r4, [r3]
	ldr	r3, .L4+12
	str	r0, [r3, #68]
	str	r0, [r3, #88]
	str	r0, [r3, #108]
	ldr	r0, .L4+16
	str	r2, [r0]
	ldr	r0, .L4+20
	str	r4, [r3, #184]
	str	r4, [r3, #44]
	str	r8, [r3, #52]
	str	r7, [r3, #116]
	str	lr, [r3, #4]
	str	lr, [r3, #152]
	str	lr, [r3, #12]
	str	ip, [r3, #36]
	str	ip, [r3, #120]
	str	ip, [r3, #76]
	str	r6, [r3, #100]
	str	r6, [r3, #132]
	str	r2, [r3, #24]
	str	r2, [r3, #16]
	str	r2, [r3, #48]
	str	r2, [r3, #80]
	str	r2, [r3, #112]
	str	r2, [r3, #176]
	str	r2, [r3, #140]
	str	r5, [r3, #56]
	str	r2, [r0]
	str	r5, [r3, #144]
	str	r1, [r3, #20]
	str	r1, [r3, #84]
	str	r1, [r3, #148]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	time
	.word	srand
	.word	playerHealth
	.word	towns
	.word	playerMoney
	.word	playerHasBow
	.size	initializeGlobal, .-initializeGlobal
	.align	2
	.global	resetGlobal
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetGlobal, %function
resetGlobal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	sub	sp, sp, #36
	mov	r4, sp
	mov	ip, #0
	ldmia	r4!, {r0, r1, r2, r3}
	ldr	lr, .L8
	stmia	lr!, {r0, r1, r2, r3}
	ldr	r3, .L8+4
	ldr	r5, .L8+8
	str	ip, [r3]
	ldr	r0, .L8+12
	ldr	r1, .L8+16
	ldr	r2, .L8+20
	ldr	r3, .L8+24
	str	ip, [r5]
	str	ip, [r1]
	str	ip, [r0]
	str	ip, [r2]
	str	ip, [r3]
	ldr	r0, .L8+28
	ldr	r1, .L8+32
	ldr	r2, .L8+36
	ldr	r3, .L8+40
	str	ip, [r0]
	str	ip, [r1]
	str	ip, [r2]
	str	ip, [r3]
	ldr	r5, .L8+44
	ldr	r0, .L8+48
	ldr	r1, .L8+52
	ldr	r2, .L8+56
	ldr	r3, .L8+60
	str	ip, [r5]
	str	ip, [r0]
	str	ip, [r1]
	str	ip, [r2]
	str	ip, [r3]
	ldr	r5, .L8+64
	ldm	r4, {r0, r1, r2, r3}
	str	ip, [r5]
	ldr	r7, .L8+68
	stm	lr, {r0, r1, r2, r3}
	ldr	r6, .L8+72
	ldr	r5, .L8+76
	ldr	r0, .L8+80
	ldr	r1, .L8+84
	ldr	r2, .L8+88
	ldr	r3, .L8+92
	str	ip, [r7]
	str	ip, [r6]
	str	ip, [r5]
	str	ip, [r0]
	str	ip, [r1]
	str	ip, [r2]
	str	ip, [r3]
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	currentTown
	.word	playerHealth
	.word	playerMoney
	.word	playerArrows
	.word	textViewChoice
	.word	merchantViewChoice
	.word	battleViewChoice
	.word	randomSeed
	.word	playerShootSpeed
	.word	playerHasBow
	.word	bossDead
	.word	returnToMap
	.word	boughtKey
	.word	bountyStarted
	.word	bountyKilled
	.word	bountyCompleted
	.word	meadCollected
	.word	letterStarted
	.word	letterRecieved
	.word	letterCompleted
	.word	dungeonKeys
	.word	touchingMead
	.word	battleViewDefeated
	.word	cheatActive
	.size	resetGlobal, .-resetGlobal
	.align	2
	.global	updateGlobal
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGlobal, %function
updateGlobal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	pop	{r4, lr}
	str	r0, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	rand
	.word	randomSeed
	.size	updateGlobal, .-updateGlobal
	.align	2
	.global	drawButtons
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawButtons, %function
drawButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L21
	ldr	r2, [r3, #44]
	cmp	r2, #0
	str	lr, [sp, #-4]!
	beq	.L15
	ldr	r3, .L21+4
	ldrh	r2, [r3, #8]
	ldr	ip, .L21+8
	orr	r2, r2, #512
	strh	r2, [r3, #8]	@ movhi
	ldr	r2, [ip, #44]
	cmp	r2, #0
	beq	.L17
.L20:
	ldrh	r2, [r3, #16]
	orr	r2, r2, #512
	strh	r2, [r3, #16]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L15:
	mov	lr, #4288
	ldr	r2, [r3, #4]
	ldr	ip, [r3]
	sub	r2, r2, r0
	ldr	r3, .L21+4
	sub	ip, ip, r1
	and	ip, ip, #255
	lsl	r2, r2, #23
	strh	ip, [r3, #8]	@ movhi
	lsr	r2, r2, #23
	ldr	ip, .L21+8
	orr	r2, r2, #16384
	strh	r2, [r3, #10]	@ movhi
	ldr	r2, [ip, #44]
	cmp	r2, #0
	strh	lr, [r3, #12]	@ movhi
	bne	.L20
.L17:
	ldr	r2, [ip, #4]
	ldr	ip, [ip]
	sub	r0, r2, r0
	lsl	r0, r0, #23
	ldr	r2, .L21+12
	lsr	r0, r0, #23
	sub	r1, ip, r1
	orr	r0, r0, #16384
	and	r1, r1, #255
	strh	r0, [r3, #18]	@ movhi
	strh	r1, [r3, #16]	@ movhi
	strh	r2, [r3, #20]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	aButton
	.word	shadowOAM
	.word	bButton
	.word	4290
	.size	drawButtons, .-drawButtons
	.align	2
	.global	drawNumber
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawNumber, %function
drawNumber:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L29
	ldr	r6, .L29+4
	ldrh	ip, [r4]
	and	lr, r1, r6
	orr	ip, ip, #512
	subs	r3, r0, #0
	strh	ip, [r4]	@ movhi
	and	r2, r2, #255
	orr	lr, lr, #16384
	blt	.L27
	cmp	r3, #9
	bgt	.L25
	add	r3, r3, #480
	lsl	r3, r3, #17
	orr	r3, r3, #536870912
	lsr	r3, r3, #16
.L24:
	ldr	r1, .L29+8
	strh	lr, [r1, #2]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L25:
	mov	r5, r4
	ldr	ip, .L29+12
	smull	r7, r0, ip, r3
	asr	ip, r3, #31
	rsb	ip, ip, r0, asr #2
	add	r0, ip, ip, lsl #2
	sub	r3, r3, r0, lsl #1
	add	r1, r1, #10
	add	r3, r3, #480
	and	r1, r1, r6
	lsl	r3, r3, #1
	orr	r1, r1, #16384
	orr	r3, r3, #8192
	add	ip, ip, #480
	strh	r1, [r4, #2]	@ movhi
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	lsl	ip, ip, #1
	strh	r2, [r5, #8]!	@ movhi
	orr	ip, ip, #8192
	strh	lr, [r5, #2]	@ movhi
	strh	ip, [r4, #12]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L27:
	mov	r3, #9152
	b	.L24
.L30:
	.align	2
.L29:
	.word	shadowOAM+784
	.word	511
	.word	shadowOAM+792
	.word	1717986919
	.size	drawNumber, .-drawNumber
	.align	2
	.global	drawGlobal
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGlobal, %function
drawGlobal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L58
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	beq	.L49
	mov	r3, #0
	ldr	r1, .L58+4
.L33:
	ldrh	r2, [r3, r1]
	orr	r2, r2, #512
	strh	r2, [r3, r1]	@ movhi
	add	r3, r3, #8
	cmp	r3, #80
	bne	.L33
.L36:
	ldr	lr, .L58+8
	ldr	r3, [lr]
	cmp	r3, #0
	ble	.L35
	mov	r3, #4
	mov	r0, #1
	mov	r6, r3
	ldr	r2, .L58+4
	ldr	r5, .L58+12
	ldr	r4, .L58+16
.L39:
	ldr	ip, [lr]
	and	r1, r3, r5
	add	r0, r0, #1
	add	r3, r3, #9
	orr	r1, r1, #16384
	lsl	r3, r3, #16
	cmp	ip, r0
	strh	r6, [r2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	lsr	r3, r3, #16
	add	r2, r2, #8
	bge	.L39
.L35:
	mov	r5, #4
	ldr	r3, .L58+20
	ldr	r4, .L58+24
	ldr	r0, [r3]
	ldr	r1, .L58+28
	ldr	r3, .L58+32
	strh	r1, [r4, #2]	@ movhi
	strh	r3, [r4, #4]	@ movhi
	mov	r2, r5
	mov	r1, #206
	strh	r5, [r4]	@ movhi
	bl	drawNumber
	ldr	r3, .L58+36
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L57
	mov	r3, r4
	mov	r2, #4352
	strh	r5, [r3, #-8]!	@ movhi
	ldr	r1, .L58+40
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r4, #-4]	@ movhi
.L43:
	ldr	ip, .L58+44
	ldr	r3, [ip]
	cmp	r3, #9
	ble	.L47
	mov	r2, #0
	mov	r6, #4
	mov	r5, #4352
	ldr	r1, .L58+48
	ldr	r4, .L58+12
	ldr	lr, .L58+52
.L46:
	rsb	r3, r2, r2, lsl #13
	rsb	r3, r2, r3, lsl #2
	lsl	r3, r3, #1
	add	r3, r3, #168
	cmp	r0, #0
	and	r3, r3, r4
	orr	r3, r3, #16384
	ldrheq	r3, [r1]
	orreq	r3, r3, #512
	strhne	r3, [r1, #2]	@ movhi
	strheq	r3, [r1]	@ movhi
	ldr	r3, [ip]
	smull	r8, r7, lr, r3
	asr	r3, r3, #31
	add	r2, r2, #1
	rsb	r3, r3, r7, asr #2
	strhne	r6, [r1]	@ movhi
	strhne	r5, [r1, #4]	@ movhi
	cmp	r3, r2
	sub	r1, r1, #8
	bgt	.L46
.L47:
	ldr	r3, .L58+56
	ldr	ip, [r3]
	cmp	ip, #0
	ble	.L31
	mov	r3, #6
	mov	r0, #0
	mov	r5, #16
	ldr	r2, .L58+60
	ldr	r4, .L58+12
	ldr	lr, .L58+64
.L48:
	and	r1, r3, r4
	add	r0, r0, #1
	add	r3, r3, #15
	orr	r1, r1, #16384
	lsl	r3, r3, #16
	cmp	ip, r0
	strh	r5, [r2]	@ movhi
	strh	lr, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	lsr	r3, r3, #16
	add	r2, r2, #8
	bne	.L48
.L31:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L57:
	ldrh	r3, [r4, #-8]!
	orr	r3, r3, #512
	strh	r3, [r4]	@ movhi
	b	.L43
.L49:
	ldr	r1, .L58+4
.L32:
	ldrh	r2, [r3, r1]
	orr	r2, r2, #512
	strh	r2, [r3, r1]	@ movhi
	add	r3, r3, #8
	cmp	r3, #40
	bne	.L32
	b	.L36
.L59:
	.align	2
.L58:
	.word	cheatActive
	.word	shadowOAM+832
	.word	playerHealth
	.word	511
	.word	8388
	.word	playerMoney
	.word	shadowOAM+776
	.word	16578
	.word	8518
	.word	playerHasBow
	.word	16562
	.word	playerShootSpeed
	.word	shadowOAM+760
	.word	1717986919
	.word	dungeonKeys
	.word	shadowOAM+640
	.word	12486
	.size	drawGlobal, .-drawGlobal
	.comm	cheatActive,4,4
	.comm	cheatEnteredCode,1,4
	.global	cheatCode
	.comm	battleViewDefeated,4,4
	.comm	touchingMead,4,4
	.comm	dungeonKeys,4,4
	.comm	letterCompleted,4,4
	.comm	letterRecieved,4,4
	.comm	letterStarted,4,4
	.comm	bountyCompleted,4,4
	.comm	bountyKilled,4,4
	.comm	bountyStarted,4,4
	.comm	boughtKey,4,4
	.comm	meadCollected,4,4
	.comm	bossDead,4,4
	.comm	playerHasBow,4,4
	.comm	playerShootSpeed,4,4
	.comm	playerArrows,4,4
	.comm	playerMoney,4,4
	.comm	playerHealth,4,4
	.comm	randomSeed,4,4
	.comm	towns,192,4
	.comm	currentTown,32,4
	.comm	returnToMap,4,4
	.comm	battleViewChoice,4,4
	.comm	merchantViewChoice,4,4
	.comm	textViewChoice,4,4
	.comm	bButton,64,4
	.comm	aButton,64,4
	.data
	.align	2
	.type	cheatCode, %object
	.size	cheatCode, 4
cheatCode:
	.ascii	"MEAD"
	.ident	"GCC: (devkitARM release 53) 9.1.0"
