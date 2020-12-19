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
	.file	"mapView.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMapViewPlayer.part.0, %function
drawMapViewPlayer.part.0:
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
	.size	drawMapViewPlayer.part.0, .-drawMapViewPlayer.part.0
	.align	2
	.global	initMapViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMapViewPlayer, %function
initMapViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	lr, #16
	mov	r4, #3
	mov	ip, #1
	ldr	r1, .L8
	ldr	r3, .L8+4
	ldr	r0, [r1]
	ldr	r1, [r3]
	ldr	r3, .L8+8
	add	r0, r0, #72
	add	r1, r1, #112
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
.L9:
	.align	2
.L8:
	.word	vOff
	.word	hOff
	.word	player
	.size	initMapViewPlayer, .-initMapViewPlayer
	.align	2
	.global	initMapViewButtons
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMapViewButtons, %function
initMapViewButtons:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	mov	r0, #16
	ldr	r3, .L12
	str	lr, [sp, #-4]!
	ldm	r3, {ip, lr}
	ldr	r2, .L12+4
	ldr	r3, .L12+8
	add	ip, ip, #20
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
.L13:
	.align	2
.L12:
	.word	player
	.word	aButton
	.word	bButton
	.size	initMapViewButtons, .-initMapViewButtons
	.align	2
	.global	initMapView
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMapView, %function
initMapView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r4, #16
	mvn	lr, #0
	mov	r5, #67108864
	mov	r6, #3
	mov	r0, #0
	ldr	r1, .L16+4
	ldr	r3, .L16+8
	str	ip, [r1]
	ldr	r3, [r3]
	ldr	r1, .L16+12
	lsl	r2, r3, r4
	str	lr, [r1]
	ldr	r1, .L16+16
	lsr	r2, r2, r4
	strh	r2, [r5, #18]	@ movhi
	ldr	r2, [r1]
	add	r1, r3, #72
	lsl	lr, r2, r4
	ldr	r3, .L16+20
	lsr	lr, lr, r4
	strh	lr, [r5, #16]	@ movhi
	add	r2, r2, #112
	str	r6, [r3, #40]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	pop	{r4, r5, r6, lr}
	stm	r3, {r1, r2, ip}
	str	ip, [r3, #12]
	str	r0, [r3, #24]
	str	r0, [r3, #36]
	str	r0, [r3, #28]
	b	initMapViewButtons
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	randomEncounterCounter
	.word	vOff
	.word	textViewChoice
	.word	hOff
	.word	player
	.size	initMapView, .-initMapView
	.align	2
	.global	resetMapView
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetMapView, %function
resetMapView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	mov	r2, #67108864
	mov	r4, #120
	mov	r0, #80
	ldr	lr, .L20
	ldr	r1, .L20+4
	ldr	ip, .L20+8
	strh	r3, [r2, #18]	@ movhi
	str	r4, [r1, #4]
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #22]	@ movhi
	strh	r3, [r2, #20]	@ movhi
	str	r3, [lr]
	str	r3, [ip]
	str	r0, [r1]
	pop	{r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	hOff
	.word	player
	.word	vOff
	.size	resetMapView, .-resetMapView
	.align	2
	.global	resumeMapView
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeMapView, %function
resumeMapView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L24
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	ldr	r3, .L24+4
	ldr	r2, .L24+8
	ldr	r3, [r3]
	ldr	r0, [r2]
	ldr	lr, .L24+12
	lsl	r2, r3, #16
	ldr	ip, .L24+16
	lsr	r2, r2, #16
	str	r3, [lr]
	str	r0, [ip]
	lsl	r3, r0, #16
	strh	r2, [r1, #18]	@ movhi
	ldr	r0, .L24+20
	ldr	r2, .L24+24
	lsr	r3, r3, #16
	strh	r3, [r1, #16]	@ movhi
	ldr	r2, [r2]
	ldr	r3, .L24+28
	ldr	r1, [r0]
	pop	{r4, lr}
	stm	r3, {r1, r2}
	b	initMapViewButtons
.L25:
	.align	2
.L24:
	.word	waitForVBlank
	.word	savedvOff
	.word	savedhOff
	.word	vOff
	.word	hOff
	.word	savedRow
	.word	savedCol
	.word	player
	.size	resumeMapView, .-resumeMapView
	.global	__aeabi_idivmod
	.align	2
	.global	animateMapViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateMapViewPlayer, %function
animateMapViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L39
	ldr	r3, .L39+4
	ldr	r5, [r4, #24]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #28]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bne	.L27
	ldr	r0, [r4, #36]
	ldr	r3, .L39+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L27:
	ldr	r3, .L39+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #28]
	ldr	r3, .L39+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #28]
	ldr	r3, .L39+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L30
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L32
.L33:
	mov	r3, #2
	str	r3, [r4, #28]
.L32:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L30:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L33
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L32
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animateMapViewPlayer, .-animateMapViewPlayer
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Battle\000"
	.align	2
.LC1:
	.ascii	"\000"
	.align	2
.LC2:
	.ascii	"A group of goblin raiders approach.\000"
	.align	2
.LC3:
	.ascii	"Flee\000"
	.align	2
.LC4:
	.ascii	"You could not escape!\000"
	.align	2
.LC5:
	.ascii	"Are you sure you want to leave?\000"
	.align	2
.LC6:
	.ascii	"It's dangerous without a weapon!\000"
	.align	2
.LC7:
	.ascii	"Hint: go to town\000"
	.align	2
.LC8:
	.ascii	"Back\000"
	.text
	.align	2
	.global	updateMapViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMapViewPlayer, %function
updateMapViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L135
	ldr	r5, .L135+4
	ldrh	r3, [r3, #48]
	str	r2, [r5]
	ldr	r4, .L135+8
	ldr	r1, .L135+12
	ldr	r2, .L135+16
	tst	r3, #64
	ldr	ip, [r1]
	ldm	r4, {r0, r3}
	ldr	lr, [r2]
	sub	sp, sp, #12
	bne	.L121
	mov	r6, #1
	sub	r7, r0, ip
	cmp	r7, #0
	str	r6, [r5]
	ble	.L121
	ldr	r8, [r4, #8]
	sub	r0, r0, r8
	ldr	r7, .L135+20
	add	r6, r3, r0, lsl #9
	lsl	r6, r6, #1
	ldrh	r6, [r7, r6]
	cmp	r6, #0
	lsl	r9, r0, #9
	beq	.L124
	ldr	r6, [r4, #16]
	ldr	r10, [r4, #12]
	add	r6, r3, r6
	sub	r6, r6, r10
	add	r6, r6, r9
	lsl	r6, r6, #1
	ldrh	r6, [r7, r6]
	cmp	r6, #0
	ldr	r6, .L135+24
	beq	.L43
	ldr	r10, .L135+28
	ldr	r9, [r6]
	ldr	fp, [r10]
	sub	r9, r9, r8
	cmp	ip, #0
	sub	r8, fp, r8
	str	r0, [r4]
	str	r9, [r6]
	str	r8, [r10]
	ble	.L43
	sub	r0, r0, ip
	cmp	r0, #79
	suble	ip, ip, #1
	strle	ip, [r1]
	b	.L43
.L121:
	ldr	r7, .L135+20
	ldr	r6, .L135+24
.L43:
	ldr	r0, .L135
	ldrh	r0, [r0, #48]
	tst	r0, #128
	bne	.L46
	mov	r10, #1
	ldr	r8, [r4]
	ldr	r9, [r1]
	ldr	r0, [r4, #20]
	sub	ip, r8, r9
	add	ip, ip, r0
	cmp	ip, #159
	str	r10, [r5]
	ble	.L125
.L46:
	ldr	r1, .L135
	ldrh	r1, [r1, #48]
	tst	r1, #32
	bne	.L49
	mov	r1, #1
	sub	r0, r3, lr
	cmp	r0, #0
	str	r1, [r5]
	ble	.L49
	ldr	ip, [r4, #12]
	ldr	r1, [r4]
	sub	r3, r3, ip
	add	r0, r3, r1, lsl #9
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	beq	.L49
	ldr	r8, [r4, #20]
	ldr	r0, [r4, #8]
	add	r1, r1, r8
	sub	r1, r1, r0
	add	r1, r3, r1, lsl #9
	lsl	r1, r1, #1
	ldrh	r1, [r7, r1]
	cmp	r1, #0
	beq	.L49
	ldr	r8, .L135+28
	ldr	r1, [r6, #4]
	ldr	r0, [r8, #4]
	cmp	lr, #0
	sub	r0, r0, ip
	sub	ip, r1, ip
	str	r3, [r4, #4]
	str	r0, [r8, #4]
	str	ip, [r6, #4]
	ble	.L49
	sub	r3, r3, lr
	cmp	r3, #119
	suble	lr, lr, #1
	strle	lr, [r2]
.L49:
	ldr	r3, .L135
	ldrh	r1, [r3, #48]
	ldr	r3, .L135+32
	tst	r1, #16
	ldr	r0, [r3, #12]
	bne	.L51
	mov	r8, #1
	ldr	lr, [r4, #4]
	ldr	ip, [r2]
	ldr	r1, [r4, #16]
	sub	r3, lr, ip
	add	r3, r3, r1
	cmp	r3, #239
	str	r8, [r5]
	bgt	.L53
	ldr	r3, [r4]
	add	r1, lr, r1
	add	r8, r1, r3, lsl #9
	lsl	r8, r8, #1
	ldrh	r8, [r7, r8]
	cmp	r8, #0
	beq	.L53
	ldr	r9, [r4, #20]
	ldr	r8, [r4, #8]
	add	r3, r3, r9
	sub	r3, r3, r8
	add	r1, r1, r3, lsl #9
	lsl	r1, r1, #1
	ldrh	r3, [r7, r1]
	cmp	r3, #0
	beq	.L53
	ldr	r9, .L135+28
	ldr	r10, [r4, #12]
	ldr	r8, [r9, #4]
	ldr	r1, [r6, #4]
	add	r8, r8, r10
	add	r3, lr, r10
	add	r1, r1, r10
	cmp	ip, #272
	str	r8, [r9, #4]
	str	r3, [r4, #4]
	str	r1, [r6, #4]
	bge	.L53
	sub	r3, r3, ip
	cmp	r3, #119
	addgt	r3, ip, #1
	strgt	r3, [r2]
.L53:
	cmp	r0, #0
	beq	.L55
.L58:
	add	r1, r4, #12
	ldm	r1, {r1, r2}
	ldr	r3, [r4, #4]
	ldr	ip, [r4]
	add	r3, r3, r2
	ldr	r2, [r4, #8]
	sub	r3, r3, r1
	sub	r2, ip, r2
	add	r3, r3, r2, lsl #9
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #31744
	beq	.L126
	cmp	r3, #30720
	beq	.L127
	cmp	r3, #29696
	beq	.L128
	cmp	r3, #992
	beq	.L129
	cmp	r3, #960
	beq	.L130
	ldr	r2, .L135+36
	cmp	r3, r2
	beq	.L131
	sub	r2, r3, #31
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	ldr	r2, .L135+40
	ldr	r2, [r2]
	cmp	r2, #0
	moveq	r3, #0
	cmp	r3, #0
	bne	.L132
	mov	r1, #1
	ldr	r2, .L135+44
	ldr	r2, [r2]
	cmp	r2, #0
	ldr	r2, .L135+48
	str	r1, [r6, #44]
	str	r3, [r2]
	beq	.L68
	ldr	r8, .L135+52
	ldr	r1, .L135+56
	ldr	r0, .L135+60
	ldr	r2, [r8]
	mla	r2, r0, r2, r1
	ldr	r1, .L135+64
	cmp	r1, r2, ror #3
	ldr	r7, .L135+68
	bcs	.L118
.L69:
	ldr	r3, [r7]
	cmp	r3, #0
	ldr	r6, .L135+72
	bne	.L70
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L133
.L71:
	cmp	r3, #0
	beq	.L134
.L70:
	mvn	r3, #0
	ldr	ip, [r4]
	str	r3, [r6]
	b	.L61
.L125:
	add	r0, r8, r0
	add	ip, r3, r0, lsl #9
	lsl	ip, ip, r10
	ldrh	ip, [r7, ip]
	cmp	ip, #0
	lsl	r0, r0, #9
	beq	.L46
	add	r10, r4, #12
	ldm	r10, {r10, ip}
	add	ip, r3, ip
	sub	ip, ip, r10
	add	r0, ip, r0
	lsl	r0, r0, #1
	ldrh	r0, [r7, r0]
	cmp	r0, #0
	beq	.L46
	ldr	fp, .L135+28
	ldr	r10, [r4, #8]
	ldr	ip, [fp]
	ldr	r0, [r6]
	add	ip, ip, r10
	add	r8, r8, r10
	add	r0, r0, r10
	cmp	r9, #352
	str	ip, [fp]
	str	r8, [r4]
	str	r0, [r6]
	bge	.L46
	sub	r8, r8, r9
	cmp	r8, #79
	addgt	r9, r9, #1
	strgt	r9, [r1]
	b	.L46
.L127:
	mov	r8, #0
	mov	r7, #2
	ldr	r4, .L135+76
.L122:
	ldmia	r4!, {r0, r1, r2, r3}
	ldr	lr, .L135+80
	stmia	lr!, {r0, r1, r2, r3}
	ldm	r4, {r0, r1, r2, r3}
	stm	lr, {r0, r1, r2, r3}
	ldr	r4, .L135+48
	str	r8, [r6, #44]
	str	r7, [r4]
.L61:
	cmp	ip, #119
	ble	.L73
	ldr	r3, .L135+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L76
.L78:
	ldr	r2, .L135+52
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
.L76:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateMapViewPlayer
.L68:
	cmp	ip, #119
	ble	.L73
.L79:
	ldr	r2, .L135+84
	ldr	r3, .L135+88
	str	r2, [sp]
	ldr	r1, .L135+92
	ldr	r2, .L135+96
	ldr	r0, .L135+100
	ldr	r4, .L135+104
	mov	lr, pc
	bx	r4
.L73:
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L76
	ldr	r3, .L135+44
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L78
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	animateMapViewPlayer
.L51:
	cmp	r0, #0
	ldr	r2, [r5]
	bne	.L54
	cmp	r2, #0
	bne	.L55
.L59:
	ldr	r2, [r3]
	ldr	r3, .L135+108
	cmp	r2, r3
	bne	.L58
	ldr	r3, .L135+112
	mov	lr, pc
	bx	r3
	b	.L58
.L126:
	mov	r8, #0
	mov	r7, #1
	ldr	r4, .L135+116
	b	.L122
.L55:
	ldr	r3, .L135+120
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L135+108
	ldr	r3, .L135+124
	mov	lr, pc
	bx	r3
	b	.L58
.L124:
	ldr	r6, .L135+24
	b	.L43
.L129:
	mov	r8, #0
	mov	r7, #4
	ldr	r4, .L135+128
	b	.L122
.L54:
	cmp	r2, #0
	bne	.L58
	b	.L59
.L128:
	mov	r8, #0
	mov	r7, #3
	ldr	r4, .L135+132
	b	.L122
.L130:
	mov	r8, #0
	mov	r7, #5
	ldr	r4, .L135+136
	b	.L122
.L131:
	mov	r3, #0
	mvn	r0, #0
	mov	r2, #69
	str	r3, [r6, #44]
	ldr	r1, .L135+72
	ldr	r3, .L135+48
	str	r0, [r1]
	str	r2, [r3]
	b	.L61
.L132:
	mov	r7, #6
	mov	r8, #0
	ldr	r4, .L135+140
	b	.L122
.L118:
	ldr	r1, .L135+144
	ldr	r2, .L135+148
	str	r3, [r7]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	ldr	r3, .L135+152
	ldr	r2, .L135+88
	str	r3, [sp]
	mov	r0, r2
	ldr	r3, .L135+156
	ldr	r1, .L135+160
	ldr	r6, .L135+104
	mov	lr, pc
	bx	r6
	b	.L69
.L134:
	ldr	r3, .L135+164
	mov	lr, pc
	bx	r3
	tst	r0, #1
	bne	.L70
	ldr	r2, .L135+88
	ldr	r3, .L135+156
	mov	r0, r2
	str	r2, [sp]
	ldr	r1, .L135+168
	ldr	r6, .L135+104
	mov	lr, pc
	bx	r6
	ldr	ip, [r4]
	b	.L61
.L133:
	ldr	r2, .L135+172
	str	r3, [r8]
	mov	lr, pc
	bx	r2
	ldr	r3, .L135+176
	mov	lr, pc
	bx	r3
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L70
	ldr	r3, [r6]
	b	.L71
.L136:
	.align	2
.L135:
	.word	67109120
	.word	playerIsMoving
	.word	player
	.word	vOff
	.word	hOff
	.word	collisionmapBitmap
	.word	aButton
	.word	bButton
	.word	soundB
	.word	31775
	.word	canTravelDungeon
	.word	playerHasBow
	.word	canTravel
	.word	randomEncounterCounter
	.word	28633112
	.word	-1775253149
	.word	7158278
	.word	battleViewDefeated
	.word	textViewChoice
	.word	towns+32
	.word	currentTown
	.word	.LC8
	.word	.LC1
	.word	.LC6
	.word	.LC5
	.word	.LC7
	.word	goToTextView
	.word	walking_data
	.word	pauseSoundB
	.word	towns
	.word	walking_length
	.word	playSoundB
	.word	towns+96
	.word	towns+64
	.word	towns+128
	.word	towns+160
	.word	battleViewChoice
	.word	pauseSound
	.word	.LC3
	.word	.LC0
	.word	.LC2
	.word	rand
	.word	.LC4
	.word	initBattleView
	.word	goToBattleView
	.size	updateMapViewPlayer, .-updateMapViewPlayer
	.section	.rodata.str1.4
	.align	2
.LC9:
	.ascii	"A rumble appears from the dungeon..\000"
	.text
	.align	2
	.global	updateMapView
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMapView, %function
updateMapView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r1, .L146
	ldr	r2, .L146+4
	ldr	r4, [r1]
	ldr	r3, .L146+8
	ldr	r1, .L146+12
	ldr	lr, [r2]
	str	r4, [r1]
	ldm	r3, {r0, r2}
	ldr	r1, .L146+16
	ldr	r3, .L146+20
	ldr	ip, .L146+24
	sub	sp, sp, #8
	str	r2, [r3]
	str	r0, [r1]
	str	lr, [ip]
	bl	updateMapViewPlayer
	ldr	r2, .L146+28
	ldr	r1, .L146+32
	ldr	r3, [r2]
	ldr	r1, [r1]
	add	r3, r3, #1
	cmp	r1, #2
	str	r3, [r2]
	ble	.L138
	mov	r2, #1
	ldr	r3, .L146+36
	str	r2, [r3]
.L139:
	ldr	ip, .L146+40
	ldr	r3, [ip]
	cmp	r3, #0
	bne	.L137
	ldr	r3, .L146+44
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L137
	mov	lr, #1
	ldr	r3, .L146+48
	ldr	r2, .L146+52
	mov	r0, r3
	str	r2, [sp]
	ldr	r1, .L146+56
	mov	r2, r3
	str	lr, [ip]
	ldr	r4, .L146+60
	mov	lr, pc
	bx	r4
	b	.L137
.L138:
	ldr	r3, .L146+36
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L139
.L137:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L147:
	.align	2
.L146:
	.word	vOff
	.word	hOff
	.word	player
	.word	savedvOff
	.word	savedRow
	.word	savedCol
	.word	savedhOff
	.word	randomEncounterCounter
	.word	dungeonKeys
	.word	canTravelDungeon
	.word	messageShown
	.word	playerHasBow
	.word	.LC1
	.word	.LC8
	.word	.LC9
	.word	goToTextView
	.size	updateMapView, .-updateMapView
	.align	2
	.global	drawMapView
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMapView, %function
drawMapView:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L152
	ldr	r3, [r3, #44]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	beq	.L149
	ldr	r2, .L152+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
.L150:
	ldr	r4, .L152+8
	ldr	r5, .L152+12
	ldr	r1, [r4]
	ldr	r0, [r5]
	ldr	r3, .L152+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L152+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L152+24
	mov	lr, pc
	bx	r3
	ldr	r6, .L152+28
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L152+4
	mov	lr, pc
	bx	r6
	mov	r3, #67108864
	ldrh	r2, [r5]
	strh	r2, [r3, #16]	@ movhi
	ldrh	r2, [r4]
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L149:
	bl	drawMapViewPlayer.part.0
	b	.L150
.L153:
	.align	2
.L152:
	.word	player
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.word	drawButtons
	.word	drawGlobal
	.word	waitForVBlank
	.word	DMANow
	.size	drawMapView, .-drawMapView
	.align	2
	.global	drawMapViewPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMapViewPlayer, %function
drawMapViewPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L158
	ldr	r3, [r3, #44]
	cmp	r3, #0
	beq	.L155
	ldr	r2, .L158+4
	ldrh	r3, [r2]
	orr	r3, r3, #512
	strh	r3, [r2]	@ movhi
	bx	lr
.L155:
	b	drawMapViewPlayer.part.0
.L159:
	.align	2
.L158:
	.word	player
	.word	shadowOAM
	.size	drawMapViewPlayer, .-drawMapViewPlayer
	.comm	player,64,4
	.comm	shadowOAM,1024,4
	.comm	randomEncounterCounter,4,4
	.comm	messageShown,4,4
	.comm	canTravelDungeon,4,4
	.comm	playerIsMoving,4,4
	.comm	canTravel,4,4
	.comm	savedCol,4,4
	.comm	savedRow,4,4
	.comm	savedvOff,4,4
	.comm	savedhOff,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
