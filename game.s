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
	.file	"game.c"
	.text
	.global	__aeabi_idivmod
	.align	2
	.global	updatePlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L48
	ldr	r3, .L48+4
	ldr	r2, [r4, #32]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	ldr	r8, [r4]
	ldr	r7, [r4, #16]
	ldr	r5, [r4, #4]
	ldr	r6, [r4, #20]
	bne	.L2
	ldr	r0, [r4, #36]
	ldr	r3, .L48+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L2:
	mov	r3, #10
	ldr	r2, [r4, #80]
	cmp	r2, #0
	str	r3, [r4, #32]
	bne	.L3
	ldr	r3, .L48+12
	ldrh	r0, [r3]
	ldr	r2, .L48+16
	add	r3, r7, r8
	tst	r0, #64
	ldrh	r1, [r2]
	sub	r2, r3, #1
	bne	.L40
.L4:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	movne	r3, r5
	beq	.L5
.L6:
	tst	r0, #128
	add	r0, r6, r5
	sub	ip, r0, #1
	beq	.L8
.L46:
	tst	r1, #128
	bne	.L8
	mov	r0, #1
	str	r3, [r4, #64]
	str	r0, [r4, #76]
	str	r0, [r4, #24]
	str	r0, [r4, #68]
.L9:
	ldr	r0, .L48+20
	ldr	r9, [r4, #12]
	ldr	r0, [r0]
	add	lr, r9, ip
	add	r10, r0, r8
	ldrb	r10, [r10, lr, lsl #8]	@ zero_extendqisi2
	cmp	r10, #0
	beq	.L13
	add	r0, r0, r2
	ldrb	r0, [r0, lr, lsl #8]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L13
	ldr	r0, [r4, #64]
	add	r0, r0, #15
	cmp	r0, r3
	blt	.L13
.L37:
	add	r3, r3, r9
	str	r3, [r4, #4]
.L11:
	tst	r1, #32
	bne	.L14
	ldr	lr, .L48+20
	ldr	r0, [r4, #8]
	ldr	lr, [lr]
	sub	r0, r8, r0
	add	r9, lr, r5, lsl #8
	ldrb	r9, [r9, r0]	@ zero_extendqisi2
	cmp	r9, #1
	beq	.L41
.L14:
	tst	r1, #16
	bne	.L23
	ldr	r1, .L48+20
	ldr	r1, [r1]
	ldr	r0, [r4, #8]
	add	r5, r1, r5, lsl #8
	add	r5, r5, r0
	ldrb	lr, [r5, r2]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L42
.L23:
	mov	r5, r3
.L3:
	rsb	r3, r7, #240
	add	r2, r3, r3, lsr #31
	rsb	r3, r6, #160
	sub	r2, r8, r2, asr #1
	ldr	r0, .L48+24
	ldr	r1, .L48+28
	add	r3, r3, r3, lsr #31
	sub	r5, r5, r3, asr #1
	cmp	r2, #0
	str	r2, [r0]
	str	r5, [r1]
	blt	.L43
	cmp	r5, #0
	blt	.L44
	cmp	r2, #16
	movgt	r3, #16
	strgt	r3, [r0]
.L16:
	cmp	r5, #96
	ble	.L1
	mov	r3, #96
.L38:
	str	r3, [r1]
.L1:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L40:
	ands	r3, r1, #64
	bne	.L4
	ldr	ip, [r4, #72]
	cmp	ip, #1
	bne	.L4
	ldr	lr, .L48+32
	ldr	ip, [lr]
	sub	ip, ip, #1
	str	r3, [r4, #76]
	str	r3, [r4, #24]
	str	r5, [r4, #64]
	str	r3, [r4, #72]
	str	ip, [lr]
.L5:
	ldr	ip, .L48+20
	ldr	r3, [r4, #12]
	ldr	ip, [ip]
	sub	r3, r5, r3
	add	lr, ip, r8
	ldrb	lr, [lr, r3, lsl #8]	@ zero_extendqisi2
	cmp	lr, #1
	beq	.L45
.L7:
	mov	r3, #1
	tst	r0, #128
	add	r0, r6, r5
	str	r3, [r4, #76]
	str	r3, [r4, #24]
	sub	ip, r0, #1
	mov	r3, r5
	bne	.L46
.L8:
	ldr	r0, [r4, #68]
	cmp	r0, #0
	bne	.L10
	ldr	r0, [r4, #76]
	cmp	r0, #1
	bne	.L11
	ldr	r0, .L48+20
	ldr	r9, [r4, #12]
	ldr	r0, [r0]
	add	lr, r9, ip
	add	r10, r0, r8
	ldrb	r10, [r10, lr, lsl #8]	@ zero_extendqisi2
	cmp	r10, #1
	beq	.L47
.L12:
	mov	lr, #1
	mov	r0, #4
	str	lr, [r4, #72]
	str	r0, [r4, #24]
	b	.L11
.L44:
	mov	r3, #0
	cmp	r2, #16
	str	r3, [r1]
	ble	.L1
	mov	r3, #16
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	str	r3, [r0]
	bx	lr
.L43:
	mov	r3, #0
	cmp	r5, r3
	str	r3, [r0]
	bge	.L16
	b	.L38
.L45:
	add	ip, ip, r2
	ldrb	ip, [ip, r3, lsl #8]	@ zero_extendqisi2
	cmp	ip, #1
	bne	.L7
	ldr	ip, [r4, #64]
	sub	ip, ip, #44
	cmp	ip, r5
	strle	r3, [r4, #4]
	ble	.L6
	b	.L7
.L42:
	add	r1, r1, ip, lsl #8
	ldr	ip, [r4, #12]
	add	r2, r1, r2
	ldrb	r2, [r2, ip]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L23
	mov	r2, #2
	add	r8, r8, r0
	mov	r5, r3
	str	r8, [r4]
	str	r2, [r4, #24]
	b	.L3
.L41:
	ldr	r9, [r4, #12]
	add	lr, lr, ip, lsl #8
	sub	r9, r8, r9
	ldrb	lr, [lr, r9]	@ zero_extendqisi2
	cmp	lr, #1
	moveq	lr, #3
	moveq	r8, r0
	streq	r0, [r4]
	streq	lr, [r4, #24]
	b	.L14
.L10:
	cmp	r0, #1
	bne	.L11
	ldr	r0, [r4, #76]
	cmp	r0, #1
	bne	.L11
	b	.L9
.L13:
	mov	r0, #0
	str	r0, [r4, #68]
	b	.L11
.L47:
	add	r0, r0, r2
	ldrb	r0, [r0, lr, lsl #8]	@ zero_extendqisi2
	cmp	r0, #1
	bne	.L12
	b	.L37
.L49:
	.align	2
.L48:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	oldButtons
	.word	buttons
	.word	collisionMap
	.word	hOff
	.word	vOff
	.word	score
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	animate
	.syntax unified
	.arm
	.fpu softvfp
	.type	animate, %function
animate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #32]
	ldr	r3, .L53
	push	{r4, lr}
	mov	r4, r0
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L51
	ldr	r0, [r4, #36]
	ldr	r3, .L53+4
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L51:
	mov	r3, #10
	str	r3, [r4, #32]
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animate, .-animate
	.align	2
	.global	resetInks
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetInks, %function
resetInks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L57
	ldr	r2, .L57+4
	ldr	r1, .L57+8
	ldr	r3, [r3]
	mla	r3, r1, r3, r2
	ldr	r2, .L57+12
	cmp	r2, r3, ror #2
	movcs	r3, #1
	strcs	r3, [r0, #44]
	bx	lr
.L58:
	.align	2
.L57:
	.word	time
	.word	85899344
	.word	-1030792151
	.word	42949672
	.size	resetInks, .-resetInks
	.align	2
	.global	changeColor
	.syntax unified
	.arm
	.fpu softvfp
	.type	changeColor, %function
changeColor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #52]
	cmp	r3, #0
	bne	.L60
	ldr	r2, .L82
	str	r3, [r2, #52]
	bx	lr
.L60:
	ldr	r1, .L82
	ldr	r2, [r1, #52]
	cmp	r2, #0
	beq	.L78
	cmp	r2, #2
	beq	.L79
	cmp	r2, #3
	beq	.L80
	cmp	r2, #1
	bxne	lr
	cmp	r3, #2
	beq	.L67
	cmp	r3, #3
	bxne	lr
	b	.L68
.L80:
	cmp	r3, #2
	bne	.L81
.L66:
	mov	r3, #4
.L78:
	str	r3, [r1, #52]
	bx	lr
.L79:
	cmp	r3, #3
	beq	.L66
	cmp	r3, #1
	bxne	lr
.L67:
	mov	r3, #6
	str	r3, [r1, #52]
	bx	lr
.L81:
	cmp	r3, #1
	bxne	lr
.L68:
	mov	r3, #5
	str	r3, [r1, #52]
	bx	lr
.L83:
	.align	2
.L82:
	.word	player
	.size	changeColor, .-changeColor
	.align	2
	.global	updateInks
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInks, %function
updateInks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	add	r1, r4, #16
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #20
	ldr	r0, .L91
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #16
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L91+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L90
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L90:
	mov	r0, r4
	bl	changeColor
	mov	r2, #0
	ldr	r3, .L91+8
	str	r2, [r4, #44]
	ldr	r1, [r3]
	ldr	r0, .L91+12
	ldr	r3, .L91+16
	mov	lr, pc
	bx	r3
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	player
	.word	collision
	.word	dyesound_length
	.word	dyesound_data
	.word	playSoundA
	.size	updateInks, .-updateInks
	.align	2
	.global	changeColorCheat
	.syntax unified
	.arm
	.fpu softvfp
	.type	changeColorCheat, %function
changeColorCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L103
	ldr	r3, [r2, #52]
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L93
.L96:
	.word	.L102
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L95
.L95:
	mov	r3, #0
	str	r3, [r2, #52]
.L93:
	bx	lr
.L102:
	mov	r3, #1
	str	r3, [r2, #52]
	bx	lr
.L101:
	mov	r3, #5
	str	r3, [r2, #52]
	bx	lr
.L100:
	mov	r3, #6
	str	r3, [r2, #52]
	bx	lr
.L99:
	mov	r3, #4
	str	r3, [r2, #52]
	bx	lr
.L98:
	mov	r3, #2
	str	r3, [r2, #52]
	bx	lr
.L97:
	mov	r3, #3
	str	r3, [r2, #52]
	bx	lr
.L104:
	.align	2
.L103:
	.word	player
	.size	changeColorCheat, .-changeColorCheat
	.align	2
	.global	updatePlatforms
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlatforms, %function
updatePlatforms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r6, #1
	ldr	r3, [r0, #4]
	ldr	r2, [r0]
	ldr	r1, [r0, #16]
	sub	sp, sp, #20
	ldr	r5, .L109
	sub	r3, r3, #1
	str	r1, [sp, #8]
	str	r2, [sp]
	str	r3, [sp, #4]
	str	r6, [sp, #12]
	add	r2, r5, #16
	mov	r4, r0
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	r7, .L109+4
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L106
	ldr	r3, .L109+8
	ldr	r3, [r3]
.L107:
	ldr	r2, .L109+12
	smull	r0, r1, r2, r3
	asr	r2, r3, #31
	rsb	r2, r2, r1, asr #2
	ldr	r0, .L109+16
	ldr	r1, .L109+20
	add	ip, r2, r2, lsl #2
	sub	r3, r3, ip, lsl #1
	str	r2, [r0]
	str	r3, [r1]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L106:
	ldr	r3, [r4, #44]
	ldr	r2, .L109+8
	cmp	r3, #0
	ldr	r3, [r2]
	bne	.L107
	ldr	r0, [r5, #52]
	ldr	r1, [r4, #52]
	cmp	r0, r1
	addeq	r3, r3, #1
	streq	r3, [r2]
	streq	r6, [r4, #44]
	b	.L107
.L110:
	.align	2
.L109:
	.word	player
	.word	collision
	.word	paintedPlatforms
	.word	1717986919
	.word	platformNum1
	.word	platformNum2
	.size	updatePlatforms, .-updatePlatforms
	.align	2
	.global	openGate
	.syntax unified
	.arm
	.fpu softvfp
	.type	openGate, %function
openGate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	lr, #0
	ldr	r9, .L120
	ldr	r0, .L120+4
	ldr	r1, .L120+8
	ldr	r2, .L120+12
	ldr	r3, .L120+16
	ldr	r6, [r9]
	ldr	ip, [r0]
	ldr	r10, [r1]
	ldr	r8, [r2]
	ldr	r7, [r3]
	ldr	r5, .L120+20
	ldr	r4, .L120+24
	add	ip, ip, r6, lsl #5
.L114:
	cmp	lr, #1
	moveq	r0, r10
	beq	.L112
	cmp	lr, #2
	moveq	r0, r7
	movne	r0, r8
.L112:
	mov	r3, #0
	lsl	r0, r0, #16
	lsr	r0, r0, #16
.L113:
	add	r2, r3, ip
	add	r1, r0, r3
	add	r3, r3, #1
	lsl	r2, r2, #1
	and	r1, r1, r4
	cmp	r3, #4
	strh	r1, [r5, r2]	@ movhi
	bne	.L113
	add	lr, lr, #1
	cmp	lr, #3
	add	ip, ip, #32
	bne	.L114
	add	r6, r6, #3
	str	r6, [r9]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L121:
	.align	2
.L120:
	.word	tilemodY
	.word	tilemodX
	.word	TID2
	.word	TID1
	.word	TID3
	.word	100726784
	.word	1023
	.size	openGate, .-openGate
	.align	2
	.global	enterGate
	.syntax unified
	.arm
	.fpu softvfp
	.type	enterGate, %function
enterGate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L129
	ldr	r0, [r4, #20]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	sub	sp, sp, #16
	ldr	r5, .L129+4
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r5, {r0, r1}
	ldr	r6, .L129+8
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L122
	ldr	r3, .L129+12
	ldr	r3, [r3]
	cmp	r3, #12
	beq	.L128
.L122:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L128:
	ldr	r2, [r5, #52]
	ldr	r3, [r4, #52]
	cmp	r2, r3
	moveq	r2, #1
	ldreq	r3, .L129+16
	streq	r2, [r3]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L130:
	.align	2
.L129:
	.word	gate
	.word	player
	.word	collision
	.word	paintedPlatforms
	.word	lvlComplete
	.size	enterGate, .-enterGate
	.align	2
	.global	updateObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObstacles, %function
updateObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, r0
	ldr	r2, [r0, #32]
	ldr	r3, .L156
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	ldr	r5, [r4, #4]
	ldr	r6, [r4]
	ldr	r7, [r4, #16]
	ldr	r8, [r4, #20]
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	add	r2, r7, r6
	add	r3, r8, r5
	mov	fp, r5
	sub	sp, sp, #20
	sub	r10, r2, #1
	sub	r9, r3, #1
	bne	.L132
	ldr	r0, [r4, #36]
	ldr	r3, .L156+4
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L132:
	mov	r2, #10
	ldr	r3, [r4, #24]
	cmp	r3, #0
	str	r2, [r4, #32]
	bne	.L133
	ldr	r3, .L156+8
	ldr	r2, [r4, #12]
	ldr	r3, [r3]
	sub	r0, r5, r2
	add	r1, r3, r6
	ldrb	ip, [r1, r0, lsl #8]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L150
.L134:
	mov	r0, #1
	str	r0, [r4, #24]
.L136:
	add	r0, r9, r2
	ldrb	r1, [r1, r0, lsl #8]	@ zero_extendqisi2
	cmp	r1, #1
	beq	.L151
.L138:
	mov	r3, #0
	str	r3, [r4, #24]
	b	.L135
.L133:
	cmp	r3, #1
	beq	.L152
	cmp	r3, #2
	bne	.L139
	ldr	r2, .L156+8
	ldr	r3, [r4, #8]
	ldr	r1, [r2]
	add	r2, r1, r3
	add	r2, r2, r10
	ldrb	r2, [r2, r5, lsl #8]	@ zero_extendqisi2
	cmp	r2, #1
	lsl	fp, r5, #8
	beq	.L153
.L140:
	mov	r2, #3
	str	r2, [r4, #24]
.L141:
	sub	r3, r6, r3
	add	r2, r1, r3
	ldrb	r2, [r2, fp]	@ zero_extendqisi2
	cmp	r2, #1
	beq	.L154
.L142:
	mov	r3, #2
	str	r3, [r4, #24]
.L135:
	stmib	sp, {r5, r7, r8}
	ldr	r4, .L156+12
	str	r6, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	ldr	r5, .L156+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L155
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L151:
	add	r3, r3, r10
	ldrb	r3, [r3, r0, lsl #8]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L138
	add	r5, r5, r2
	str	r5, [r4, #4]
	ldr	r3, [r4, #24]
.L139:
	cmp	r3, #3
	bne	.L135
	ldr	r2, .L156+8
	ldr	r3, [r4, #8]
	ldr	r1, [r2]
	lsl	fp, fp, #8
	b	.L141
.L155:
	ldr	r3, .L156+20
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L156+24
	ldr	r3, .L156+28
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r3, #216
	mov	r0, #20
	ldr	r1, .L156+32
	ldr	r5, .L156+36
	ldr	r2, [r1]
	ldr	r5, [r5]
	sub	r2, r2, #5
	cmp	r5, ip
	stm	r4, {r0, r3}
	mov	lr, #4
	moveq	r3, #24
	str	r2, [r1]
	mov	r2, #1
	str	lr, [r4, #24]
	str	ip, [r4, #72]
	streq	r3, [r4, #4]
	str	r3, [r4, #64]
	str	r2, [r4, #80]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L150:
	add	ip, r3, r10
	ldrb	ip, [ip, r0, lsl #8]	@ zero_extendqisi2
	cmp	ip, #1
	moveq	r5, r0
	streq	r0, [r4, #4]
	bne	.L134
	b	.L135
.L154:
	ldr	r2, [r4, #12]
	add	r9, r1, r9, lsl #8
	sub	r2, r6, r2
	ldrb	r2, [r9, r2]	@ zero_extendqisi2
	cmp	r2, #1
	moveq	r6, r3
	streq	r3, [r4]
	bne	.L142
	b	.L135
.L153:
	ldr	r0, [r4, #12]
	add	r2, r1, r9, lsl #8
	add	r2, r2, r10
	ldrb	r2, [r2, r0]	@ zero_extendqisi2
	cmp	r2, #1
	addeq	r6, r6, r3
	streq	r6, [r4]
	bne	.L140
	b	.L135
.L152:
	ldr	r3, .L156+8
	ldr	r3, [r3]
	ldr	r2, [r4, #12]
	add	r1, r3, r6
	b	.L136
.L157:
	.align	2
.L156:
	.word	1717986919
	.word	__aeabi_idivmod
	.word	collisionMap
	.word	player
	.word	collision
	.word	hitsound_length
	.word	hitsound_data
	.word	playSoundA
	.word	score
	.word	currLvl
	.size	updateObstacles, .-updateObstacles
	.align	2
	.global	resetPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	resetPlayer, %function
resetPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	mov	r2, #216
	mov	r1, #20
	ldr	r3, .L162
	str	lr, [sp, #-4]!
	ldr	lr, [r3]
	ldr	r3, .L162+4
	cmp	lr, r0
	stm	r3, {r1, r2}
	mov	ip, #4
	moveq	r2, #24
	mov	r1, #1
	str	ip, [r3, #24]
	str	r0, [r3, #72]
	streq	r2, [r3, #4]
	str	r2, [r3, #64]
	str	r1, [r3, #80]
	ldr	lr, [sp], #4
	bx	lr
.L163:
	.align	2
.L162:
	.word	currLvl
	.word	player
	.size	resetPlayer, .-resetPlayer
	.align	2
	.global	updateEnergy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnergy, %function
updateEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L166
	ldr	r1, .L166+4
	ldr	r2, [r3]
	smull	r0, r3, r1, r2
	asr	r0, r2, #31
	rsb	r3, r0, r3, asr #2
	push	{r4, lr}
	smull	lr, ip, r1, r3
	ldr	lr, .L166+8
	smull	r1, lr, r2, lr
	asr	r1, r3, #31
	rsb	r1, r1, ip, asr #2
	add	r1, r1, r1, lsl #2
	add	ip, r3, r3, lsl #2
	ldr	r4, .L166+12
	sub	r3, r3, r1, lsl #1
	sub	r2, r2, ip, lsl #1
	ldr	r1, .L166+16
	ldr	ip, .L166+20
	rsb	r0, r0, lr, asr #5
	str	r3, [r4]
	str	r2, [ip]
	str	r0, [r1]
	pop	{r4, lr}
	bx	lr
.L167:
	.align	2
.L166:
	.word	score
	.word	1717986919
	.word	1374389535
	.word	energyNum2
	.word	energyNum1
	.word	energyNum3
	.size	updateEnergy, .-updateEnergy
	.align	2
	.global	updateGuards
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGuards, %function
updateGuards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, .L194
	ldr	r6, [r0, #4]
	ldr	r7, [r5, #4]
	cmp	r7, r6
	mov	r4, r0
	sub	sp, sp, #20
	beq	.L189
	mov	r2, #1
	ldr	r3, [r0, #24]
	cmp	r3, #2
	str	r2, [r0, #8]
	beq	.L190
	cmp	r3, #3
	beq	.L191
.L172:
	ldr	r2, [r4, #32]
	ldr	r3, .L194+4
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bne	.L178
	ldr	r0, [r4, #36]
	ldr	r3, .L194+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L178:
	mov	r3, #10
	ldr	r2, [r4, #44]
	cmp	r2, #1
	str	r3, [r4, #32]
	beq	.L192
.L168:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L190:
	ldr	r3, [r0]
	ldr	r2, [r0, #60]
	cmp	r2, r3
	movle	r2, #3
	addgt	r3, r3, #1
	strgt	r3, [r0]
	strle	r2, [r0, #24]
	bgt	.L172
.L176:
	ldr	r2, [r4, #56]
	cmp	r2, r3
	movge	r3, #2
	sublt	r3, r3, #1
	strlt	r3, [r4]
	strge	r3, [r4, #24]
	b	.L172
.L189:
	mov	r2, #2
	ldr	r1, [r5]
	ldr	r3, [r0]
	cmp	r1, r3
	str	r2, [r0, #8]
	ble	.L170
	ldr	r1, [r0, #60]
	cmp	r3, r1
	addlt	r3, r3, r2
	strlt	r3, [r0]
	strlt	r2, [r0, #24]
	b	.L172
.L192:
	ldr	r0, [r5, #20]
	ldr	r2, [r5, #16]
	ldr	r3, [r5]
	str	r2, [sp, #8]
	str	r7, [sp, #4]
	str	r0, [sp, #12]
	str	r3, [sp]
	add	r2, r4, #16
	mov	r1, r6
	ldm	r2, {r2, r3}
	ldr	r0, [r4]
	ldr	r6, .L194+12
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L168
	ldr	r3, [r5, #24]
	cmp	r3, #1
	bne	.L182
	ldr	r2, [r5, #52]
	ldr	r3, [r4, #52]
	cmp	r2, r3
	beq	.L193
.L182:
	ldr	r3, .L194+16
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L194+20
	ldr	r3, .L194+24
	mov	lr, pc
	bx	r3
	mov	ip, #1
	mov	r3, #216
	mov	r0, #20
	ldr	r1, .L194+28
	ldr	r4, .L194+32
	ldr	r2, [r1]
	ldr	r4, [r4]
	sub	r2, r2, #5
	cmp	r4, ip
	stm	r5, {r0, r3}
	mov	lr, #4
	moveq	r3, #24
	str	r2, [r1]
	mov	r2, #1
	str	lr, [r5, #24]
	str	ip, [r5, #72]
	streq	r3, [r5, #4]
	str	r3, [r5, #64]
	str	r2, [r5, #80]
	b	.L168
.L170:
	bge	.L172
	ldr	r2, [r0, #56]
	cmp	r3, r2
	movgt	r2, #3
	subgt	r3, r3, #2
	strgt	r3, [r0]
	strgt	r2, [r0, #24]
	b	.L172
.L191:
	ldr	r3, [r0]
	b	.L176
.L193:
	ldr	r3, .L194+36
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L194+40
	ldr	r3, .L194+24
	mov	lr, pc
	bx	r3
	mov	r3, #0
	str	r3, [r4, #44]
	b	.L168
.L195:
	.align	2
.L194:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	collision
	.word	hitsound_length
	.word	hitsound_data
	.word	playSoundA
	.word	score
	.word	currLvl
	.word	damagesound_length
	.word	damagesound_data
	.size	updateGuards, .-updateGuards
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r6, .L218
	ldr	r3, [r6]
	add	r3, r3, #1
	str	r3, [r6]
	bl	updatePlayer
	ldr	r4, .L218+4
	ldr	r9, .L218+8
	ldr	r8, .L218+12
	ldr	r7, .L218+16
	add	r5, r4, #336
.L199:
	ldr	r3, [r4, #44]
	cmp	r3, #1
	beq	.L214
	ldr	r3, [r6]
	mla	r3, r9, r3, r8
	cmp	r7, r3, ror #2
	movcs	r3, #1
	strcs	r3, [r4, #44]
.L198:
	add	r4, r4, #84
	cmp	r5, r4
	bne	.L199
	ldr	r4, .L218+20
	add	r5, r4, #1008
.L200:
	mov	r0, r4
	add	r4, r4, #84
	bl	updatePlatforms
	cmp	r4, r5
	bne	.L200
	ldr	r4, .L218+24
	ldr	r3, [r4]
	bic	r2, r3, #2
	cmp	r2, #1
	beq	.L215
.L201:
	sub	r3, r3, #2
	cmp	r3, #1
	bhi	.L205
	ldr	r0, .L218+28
	bl	updateObstacles
	ldr	r0, .L218+32
	bl	updateObstacles
	ldr	r0, .L218+36
	bl	updateObstacles
	ldr	r0, .L218+40
	bl	updateObstacles
	ldr	r0, .L218+44
	bl	updateObstacles
.L205:
	ldr	r1, .L218+48
	ldr	r3, [r1, #80]
	cmp	r3, #1
	bne	.L204
	ldr	r2, [r6]
	ldr	r3, .L218+52
	smull	ip, r0, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r0, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	streq	r3, [r1, #80]
.L204:
	ldr	r3, .L218+56
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L206
	ldr	r3, .L218+60
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L206
	ldr	r3, .L218+64
	ldr	r3, [r3]
	cmp	r3, #14
	beq	.L216
.L206:
	ldr	r3, .L218+68
	ldr	r2, .L218+52
	ldr	r1, [r3]
	smull	r0, r3, r2, r1
	asr	r0, r1, #31
	rsb	r3, r0, r3, asr #2
	smull	lr, ip, r2, r3
	ldr	lr, .L218+72
	smull	r2, lr, r1, lr
	asr	r2, r3, #31
	rsb	r2, r2, ip, asr #2
	ldr	ip, .L218+76
	add	r2, r2, r2, lsl #2
	ldr	r5, [ip]
	sub	r2, r3, r2, lsl #1
	add	r3, r3, r3, lsl #2
	sub	r3, r1, r3, lsl #1
	ldr	r4, .L218+80
	ldr	ip, .L218+84
	ldr	r1, .L218+88
	rsb	r0, r0, lr, asr #5
	cmp	r5, #12
	str	r2, [r4]
	str	r3, [ip]
	str	r0, [r1]
	beq	.L217
.L207:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	enterGate
.L214:
	mov	r0, r4
	bl	updateInks
	b	.L198
.L215:
	ldr	r0, .L218+92
	bl	updateGuards
	ldr	r0, .L218+96
	bl	updateGuards
	ldr	r0, .L218+100
	bl	updateGuards
	ldr	r0, .L218+104
	bl	updateGuards
	ldr	r3, [r4]
	b	.L201
.L217:
	ldr	r4, .L218+108
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L207
	bl	openGate
	mov	r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	enterGate
.L216:
	bl	changeColorCheat
	b	.L206
.L219:
	.align	2
.L218:
	.word	time
	.word	ink
	.word	-1030792151
	.word	85899344
	.word	42949672
	.word	platform
	.word	currLvl
	.word	obstacle
	.word	obstacle+84
	.word	obstacle+168
	.word	obstacle+252
	.word	obstacle+336
	.word	player
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	cheat
	.word	score
	.word	1374389535
	.word	paintedPlatforms
	.word	energyNum2
	.word	energyNum3
	.word	energyNum1
	.word	guard
	.word	guard+84
	.word	guard+168
	.word	guard+252
	.word	gateOpen
	.size	updateGame, .-updateGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L226
	ldr	r1, .L226+4
	ldr	r0, [r1]
	ldr	r1, [r2, #80]
	ldr	r3, [r2, #4]
	cmp	r1, #1
	moveq	r1, #67108864
	sub	r3, r3, r0
	moveq	r0, #4352
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldreq	ip, .L226+8
	ldrne	ip, .L226+8
	andeq	r3, r3, #255
	str	lr, [sp, #-4]!
	strheq	r0, [r1, #76]	@ movhi
	ldr	r1, .L226+12
	orreq	r3, r3, #4096
	andne	r3, r3, #255
	ldr	r1, [r1]
	strh	r3, [ip, #80]	@ movhi
	ldr	r3, [r2]
	ldr	r0, [r2, #24]
	ldr	lr, [r2, #36]
	sub	r3, r3, r1
	ldr	r1, .L226+16
	cmp	r0, #3
	lsl	r3, r3, #23
	add	r0, r0, lr, lsl #5
	ldr	lr, [r2, #52]
	lsr	r3, r3, #23
	and	r2, r1, r0, lsl #1
	orr	r2, r2, lr, lsl #12
	orreq	r3, r3, #20480
	orrne	r3, r3, #16384
	strh	r3, [ip, #82]	@ movhi
	strh	r2, [ip, #84]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L227:
	.align	2
.L226:
	.word	player
	.word	vOff
	.word	shadowOAM
	.word	hOff
	.word	1022
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGuards
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGuards, %function
drawGuards:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, #512
	ldr	r2, .L237
	ldr	r3, .L237+4
	ldr	r6, [r2]
	ldr	r7, [r3]
	ldr	r3, .L237+8
	lsl	r5, r6, #16
	lsl	r4, r7, #16
	ldr	r2, .L237+12
	ldr	r8, .L237+16
	ldr	r10, .L237+20
	ldr	r9, .L237+24
	lsr	r5, r5, #16
	lsr	r4, r4, #16
	add	ip, r3, #336
.L234:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	beq	.L229
	ldr	r1, [r3, #4]
	sub	r0, r1, r6
	sub	r0, r0, #1
	cmp	r0, #158
	bhi	.L229
	ldr	r0, [r3]
	sub	fp, r0, r7
	sub	r1, r1, r5
	sub	fp, fp, #1
	and	r1, r1, #255
	sub	r0, r0, r4
	cmp	fp, #238
	orr	r1, r1, r8
	lsl	r0, r0, #16
	bhi	.L229
	strh	r1, [r2, #88]	@ movhi
	ldr	r1, [r3, #36]
	ldr	fp, [r3, #24]
	lsl	r1, r1, #6
	cmp	fp, #3
	lsr	r0, r0, #16
	ldr	fp, [r3, #52]
	add	r1, r1, #10
	and	r0, r0, r9
	and	r1, r1, r10
	orreq	r0, r0, #4096
	orr	r1, r1, fp, lsl #12
	strh	r0, [r2, #90]	@ movhi
	strh	r1, [r2, #92]	@ movhi
.L233:
	add	r3, r3, #84
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L234
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L229:
	strh	lr, [r2, #88]	@ movhi
	b	.L233
.L238:
	.align	2
.L237:
	.word	vOff
	.word	hOff
	.word	guard
	.word	shadowOAM
	.word	-32768
	.word	1023
	.word	511
	.size	drawGuards, .-drawGuards
	.align	2
	.global	drawInks
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawInks, %function
drawInks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, #512
	mov	r8, #67108864
	mov	r10, #320
	ldr	r2, .L248
	ldr	r3, .L248+4
	ldr	ip, [r2]
	ldr	r6, [r3]
	ldr	r2, .L248+8
	lsl	r4, ip, #16
	lsl	r5, r6, #16
	ldr	r1, .L248+12
	ldr	r9, .L248+16
	lsr	r4, r4, #16
	lsr	r5, r5, #16
	add	lr, r2, #336
.L244:
	ldr	r3, [r2, #4]
	sub	r0, r3, ip
	sub	r0, r0, #1
	cmp	r0, #158
	bhi	.L240
	ldr	r0, [r2]
	sub	fp, r0, r6
	sub	fp, fp, #1
	sub	r3, r3, r4
	cmp	fp, #238
	lsl	r3, r3, #16
	bhi	.L240
	ldr	fp, [r2, #44]
	lsr	r3, r3, #16
	cmp	fp, #1
	and	r3, r3, #255
	ldrne	fp, .L248+20
	orrne	r3, r3, #1024
	strhne	r10, [r8, #80]	@ movhi
	strhne	fp, [r8, #82]	@ movhi
	strh	r3, [r1]	@ movhi
	ldr	r3, [r2, #52]
	sub	r0, r0, r5
	lsl	r3, r3, #12
	and	r0, r0, r9
	orr	r3, r3, #107
	strh	r0, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
.L243:
	add	r2, r2, #84
	cmp	lr, r2
	add	r1, r1, #8
	bne	.L244
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L240:
	strh	r7, [r1]	@ movhi
	b	.L243
.L249:
	.align	2
.L248:
	.word	vOff
	.word	hOff
	.word	ink
	.word	shadowOAM+256
	.word	511
	.word	2566
	.size	drawInks, .-drawInks
	.align	2
	.global	drawPlatforms
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlatforms, %function
drawPlatforms:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r7, #512
	ldr	r2, .L257
	ldr	r3, .L257+4
	ldr	lr, [r2]
	ldr	r2, .L257+8
	lsl	ip, lr, #16
	ldrh	r6, [r3]
	ldr	r0, .L257+12
	ldr	r5, .L257+16
	lsr	ip, ip, #16
	add	r4, r2, #1008
.L254:
	ldr	r3, [r2, #4]
	sub	r1, r3, lr
	sub	r1, r1, #1
	sub	r3, r3, ip
	and	r3, r3, #255
	cmp	r1, #158
	strhhi	r7, [r0, #120]	@ movhi
	orr	r3, r3, #16384
	bhi	.L253
	ldr	r8, [r2]
	ldr	r1, [r2, #52]
	ldr	r9, [r2, #44]
	lsl	r1, r1, #28
	sub	r8, r8, r6
	strh	r3, [r0, #120]	@ movhi
	and	r8, r8, r5
	asr	r3, r1, #16
	cmp	r9, #0
	orr	r1, r3, #16
	orr	r8, r8, #16384
	orr	r3, r3, #48
	strh	r8, [r0, #122]	@ movhi
	strheq	r1, [r0, #124]	@ movhi
	strhne	r3, [r0, #124]	@ movhi
.L253:
	add	r2, r2, #84
	cmp	r4, r2
	add	r0, r0, #8
	bne	.L254
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L258:
	.align	2
.L257:
	.word	vOff
	.word	hOff
	.word	platform
	.word	shadowOAM
	.word	511
	.size	drawPlatforms, .-drawPlatforms
	.align	2
	.global	drawObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObstacles, %function
drawObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #512
	ldr	r3, .L265
	ldr	r2, .L265+4
	ldr	r7, [r3]
	ldr	ip, [r2]
	ldr	r3, .L265+8
	lsl	r5, ip, #16
	lsl	r4, r7, #16
	ldr	r0, .L265+12
	ldr	r8, .L265+16
	ldr	r9, .L265+20
	lsr	r5, r5, #16
	lsr	r4, r4, #16
	add	lr, r3, #420
.L262:
	ldr	r2, [r3, #4]
	sub	r1, r2, ip
	sub	r1, r1, #1
	cmp	r1, #158
	bhi	.L260
	ldr	r1, [r3]
	sub	r10, r1, r7
	sub	r10, r10, #1
	sub	r2, r2, r5
	sub	r1, r1, r4
	cmp	r10, #238
	and	r2, r2, #255
	and	r1, r1, r8
	bhi	.L260
	ldr	r10, [r3, #36]
	lsl	r10, r10, #5
	add	r10, r10, #11
	and	r10, r10, r9
	strh	r2, [r0, #216]	@ movhi
	strh	r1, [r0, #218]	@ movhi
	strh	r10, [r0, #220]	@ movhi
.L261:
	add	r3, r3, #84
	cmp	r3, lr
	add	r0, r0, #8
	bne	.L262
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L260:
	strh	r6, [r0, #216]	@ movhi
	b	.L261
.L266:
	.align	2
.L265:
	.word	hOff
	.word	vOff
	.word	obstacle
	.word	shadowOAM
	.word	511
	.word	1023
	.size	drawObstacles, .-drawObstacles
	.align	2
	.global	drawEnergy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnergy, %function
drawEnergy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	ip, #145
	mov	r6, #236
	mov	r5, #194
	mov	r4, #199
	mov	lr, #204
	ldr	r3, .L269
	ldr	r0, [r3]
	ldr	r3, .L269+4
	ldr	r7, .L269+8
	ldr	r1, [r3]
	ldr	r2, .L269+12
	ldr	r3, .L269+16
	add	r0, r0, #192
	and	r0, r0, r7
	ldr	r2, [r2]
	strh	r0, [r3, #20]	@ movhi
	ldr	r0, .L269+20
	add	r1, r1, #192
	strh	r0, [r3, #24]	@ movhi
	add	r2, r2, #192
	ldr	r0, .L269+24
	and	r1, r1, r7
	and	r2, r2, r7
	strh	r6, [r3, #28]	@ movhi
	strh	r5, [r3, #18]	@ movhi
	strh	r4, [r3, #10]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	strh	r0, [r3, #26]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	strh	ip, [r3, #16]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L270:
	.align	2
.L269:
	.word	energyNum1
	.word	energyNum2
	.word	1023
	.word	energyNum3
	.word	shadowOAM
	.word	16524
	.word	-16234
	.size	drawEnergy, .-drawEnergy
	.align	2
	.global	drawPlatformCnt
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlatformCnt, %function
drawPlatformCnt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #232
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #224
	mov	lr, #36
	mov	r0, #145
	mov	r5, #22
	mov	r4, #27
	mov	ip, #42
	ldr	r3, .L273
	ldr	r1, [r3]
	ldr	r6, .L273+4
	ldr	r3, .L273+8
	add	r1, r1, #192
	and	r1, r1, r6
	strh	r1, [r3, #60]	@ movhi
	strh	r2, [r3, #68]	@ movhi
	ldr	r1, .L273+12
	ldr	r2, .L273+16
	strh	r7, [r3, #76]	@ movhi
	strh	r1, [r3, #74]	@ movhi
	ldr	r7, .L273+20
	ldr	r1, [r2]
	ldr	r2, .L273+24
	ldr	r7, [r7]
	ldr	r2, [r2]
	ldr	r8, .L273+28
	strh	lr, [r3, #42]	@ movhi
	add	r7, r7, #192
	ldr	lr, .L273+32
	add	r1, r1, #192
	add	r2, r2, #192
	and	r7, r7, r6
	and	r1, r1, r6
	and	r2, r2, r6
	strh	r8, [r3, #66]	@ movhi
	strh	r5, [r3, #58]	@ movhi
	strh	r4, [r3, #50]	@ movhi
	strh	r7, [r3, #52]	@ movhi
	strh	lr, [r3, #72]	@ movhi
	strh	lr, [r3, #64]	@ movhi
	strh	r1, [r3, #44]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	strh	ip, [r3, #34]	@ movhi
	strh	r0, [r3, #56]	@ movhi
	strh	r0, [r3, #48]	@ movhi
	strh	r0, [r3, #40]	@ movhi
	strh	r0, [r3, #32]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L274:
	.align	2
.L273:
	.word	platformNum1
	.word	1023
	.word	shadowOAM
	.word	-16364
	.word	totalPlatformsNum1
	.word	platformNum2
	.word	totalPlatformsNum2
	.word	-32684
	.word	16524
	.size	drawPlatformCnt, .-drawPlatformCnt
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L281
	bl	drawPlayer
	bl	drawInks
	bl	drawPlatforms
	ldr	r3, [r4]
	bic	r2, r3, #2
	cmp	r2, #1
	beq	.L279
	sub	r3, r3, #2
	cmp	r3, #1
	bls	.L280
.L277:
	bl	drawEnergy
	bl	drawPlatformCnt
	ldr	r3, .L281+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L281+8
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L281+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L281+16
	ldrh	r1, [r2]
	ldr	r2, .L281+20
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L279:
	bl	drawGuards
	ldr	r3, [r4]
	sub	r3, r3, #2
	cmp	r3, #1
	bhi	.L277
.L280:
	bl	drawObstacles
	b	.L277
.L282:
	.align	2
.L281:
	.word	currLvl
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	platformNum2,4,4
	.comm	platformNum1,4,4
	.comm	energyNum3,4,4
	.comm	energyNum2,4,4
	.comm	energyNum1,4,4
	.comm	time,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	song,12,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
