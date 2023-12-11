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
	.file	"initGame.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L6
	ldr	r3, [r3]
	cmp	r3, #1
	push	{r4, r5, r6, r7, r8, lr}
	mov	r2, #0
	moveq	r7, #24
	movne	r7, #216
	mov	r8, #8
	mov	r5, #20
	mov	r4, #10
	mov	lr, #3
	mov	ip, #16
	mov	r0, #4
	mov	r1, #1
	ldr	r3, .L6+4
	ldr	r6, [r3, #4]
	str	r8, [r3, #12]
	str	r7, [r3, #4]
	str	r6, [r3, #64]
	str	r5, [r3]
	str	r4, [r3, #32]
	str	lr, [r3, #40]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #24]
	str	r2, [r3, #52]
	str	r2, [r3, #68]
	str	r2, [r3, #80]
	str	r1, [r3, #76]
	str	r1, [r3, #72]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	currLvl
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initGate
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGate, %function
initGate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #24
	ldr	r2, .L18
	ldr	r3, .L18+4
	ldr	r2, [r2]
	push	{r4, r5, r6, lr}
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L8
.L11:
	.word	.L14
	.word	.L13
	.word	.L12
	.word	.L10
.L10:
	mov	r6, #144
	mov	r5, #80
	mov	r4, #1
	mov	ip, #688
	mov	r1, #720
	mov	lr, #752
	mov	r0, #17
	mov	r2, #10
.L17:
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #52]
	ldr	r3, .L18+8
	str	ip, [r3]
	ldr	r3, .L18+12
	ldr	ip, .L18+16
	str	r1, [r3]
	ldr	r1, .L18+20
	ldr	r3, .L18+24
	str	lr, [ip]
	str	r0, [r1]
	str	r2, [r3]
.L8:
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	mov	r5, #216
	mov	r4, #208
	mov	r1, #2
	mov	r0, #304
	mov	lr, #336
	mov	ip, #368
.L16:
	mov	r2, #26
	str	r5, [r3]
	str	r4, [r3, #4]
	str	r1, [r3, #52]
	ldr	r1, .L18+8
	ldr	r3, .L18+12
	str	r0, [r1]
	str	lr, [r3]
	ldr	r0, .L18+16
	ldr	r1, .L18+20
	ldr	r3, .L18+24
	str	ip, [r0]
	str	r2, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	mov	r5, #216
	mov	r4, #208
	mov	r1, #3
	mov	r0, #432
	mov	lr, #464
	mov	ip, #496
	b	.L16
.L12:
	mov	r6, #216
	mov	r5, #16
	mov	r4, #6
	mov	ip, #560
	mov	r1, #592
	mov	lr, #624
	mov	r0, #26
	mov	r2, #1
	b	.L17
.L19:
	.align	2
.L18:
	.word	currLvl
	.word	gate
	.word	TID1
	.word	TID2
	.word	TID3
	.word	tilemodX
	.word	tilemodY
	.size	initGate, .-initGate
	.align	2
	.global	initInksLvl1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInksLvl1, %function
initInksLvl1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #8
	mov	r1, #1
	mov	fp, #0
	mov	r10, #200
	mov	r9, #220
	mov	r8, #2
	mov	r7, #75
	mov	r6, #155
	mov	r5, #3
	mov	r4, #152
	mov	lr, #57
	mov	ip, #128
	mov	r0, #216
	ldr	r3, .L22
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
	str	r2, [r3, #184]
	str	r2, [r3, #188]
	str	r2, [r3, #268]
	str	r2, [r3, #272]
	str	fp, [r3, #52]
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #136]
	str	r7, [r3, #84]
	str	r6, [r3, #88]
	str	r5, [r3, #220]
	str	r4, [r3, #168]
	str	lr, [r3, #172]
	str	ip, [r3, #252]
	str	r0, [r3, #256]
	str	r1, [r3, #44]
	str	r1, [r3, #128]
	str	r1, [r3, #212]
	str	r1, [r3, #296]
	str	r1, [r3, #304]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	ink
	.size	initInksLvl1, .-initInksLvl1
	.align	2
	.global	initPlatformsLvl1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlatformsLvl1, %function
initPlatformsLvl1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #0
	mov	r5, #8
	mov	r8, #32
	ldr	r4, .L50
	ldr	r7, .L50+4
	ldr	r6, .L50+8
.L41:
	mov	r3, #0
	str	r5, [r4, #20]
	str	r3, [r4, #44]
	str	r8, [r4, #16]
	mov	lr, pc
	bx	r7
	smull	r2, r3, r6, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3
	cmp	r3, #1
	beq	.L25
	cmp	r3, #2
	beq	.L26
	cmp	r3, #0
	moveq	r3, #4
	streq	r3, [r4, #52]
.L27:
	cmp	r9, #1
	strle	r5, [r4]
	ble	.L29
	cmp	r9, #3
	movle	r3, #64
	strle	r3, [r4]
	ble	.L31
	cmp	r9, #5
	bgt	.L32
	mov	r3, #120
	tst	r9, #1
	str	r3, [r4]
	bne	.L49
.L33:
	mov	r3, #72
	str	r3, [r4, #4]
.L36:
	add	r9, r9, #1
	cmp	r9, #12
	add	r4, r4, #84
	bne	.L41
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L32:
	cmp	r9, #8
	bgt	.L35
	mov	r3, #160
	str	r3, [r4]
.L29:
	bic	r3, r9, #4
	cmp	r3, #0
	cmpne	r9, #6
	beq	.L33
	cmp	r9, #7
	cmpne	r9, #1
	moveq	r3, #136
	streq	r3, [r4, #4]
	beq	.L36
.L49:
	bic	r3, r9, #8
.L34:
	cmp	r3, #3
	moveq	r3, #168
	streq	r3, [r4, #4]
	beq	.L36
	cmp	r9, #8
	cmpne	r9, #5
	moveq	r3, #200
	movne	r3, #40
	str	r3, [r4, #4]
	b	.L36
.L35:
	mov	r3, #216
	str	r3, [r4]
.L31:
	bic	r3, r9, #8
	cmp	r3, #2
	bne	.L34
	mov	r3, #104
	add	r9, r9, #1
	str	r3, [r4, #4]
	add	r4, r4, #84
	b	.L41
.L26:
	mov	r3, #3
	str	r3, [r4, #52]
	b	.L27
.L25:
	mov	r3, #2
	str	r3, [r4, #52]
	b	.L27
.L51:
	.align	2
.L50:
	.word	platform
	.word	rand
	.word	1431655766
	.size	initPlatformsLvl1, .-initPlatformsLvl1
	.align	2
	.global	initInksLvl2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInksLvl2, %function
initInksLvl2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #8
	mov	r1, #1
	mov	fp, #3
	mov	r10, #228
	mov	r9, #24
	mov	r8, #2
	mov	r7, #16
	mov	r6, #84
	mov	r5, #0
	mov	r4, #200
	mov	lr, #180
	mov	ip, #116
	mov	r0, #133
	ldr	r3, .L54
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
	str	r2, [r3, #184]
	str	r2, [r3, #188]
	str	r2, [r3, #268]
	str	r2, [r3, #272]
	str	fp, [r3, #52]
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #136]
	str	r7, [r3, #84]
	str	r6, [r3, #88]
	str	r5, [r3, #220]
	str	r4, [r3, #168]
	str	lr, [r3, #172]
	str	ip, [r3, #252]
	str	r0, [r3, #256]
	str	r1, [r3, #44]
	str	r1, [r3, #128]
	str	r1, [r3, #212]
	str	r1, [r3, #296]
	str	r1, [r3, #304]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L55:
	.align	2
.L54:
	.word	ink
	.size	initInksLvl2, .-initInksLvl2
	.align	2
	.global	initPlatformsLvl2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlatformsLvl2, %function
initPlatformsLvl2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r9, #0
	mov	r8, #8
	mov	r7, r9
	mov	r6, #32
	ldr	r4, .L99
	ldr	r5, .L99+4
.L73:
	str	r8, [r4, #20]
	str	r6, [r4, #16]
	str	r7, [r4, #44]
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L57
.L59:
	.word	.L62
	.word	.L61
	.word	.L60
	.word	.L58
.L58:
	mov	r3, #6
	str	r3, [r4, #52]
.L57:
	cmp	r9, #2
	ble	.L97
.L63:
	cmp	r9, #5
	movle	r3, #104
	strle	r3, [r4]
	ble	.L67
	cmp	r9, #8
	bgt	.L68
	mov	r3, #160
	cmp	r9, #6
	str	r3, [r4]
	beq	.L64
.L69:
	cmp	r9, #7
	beq	.L76
	cmp	r9, #11
	cmpne	r9, #5
	bne	.L72
	mov	r3, #168
	add	r9, r9, #1
	cmp	r9, #12
	str	r3, [r4, #4]
	add	r4, r4, #84
	bne	.L73
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L60:
	mov	r3, #3
	cmp	r9, #2
	str	r3, [r4, #52]
	bgt	.L63
.L97:
	mov	r3, #48
	cmp	r9, #0
	str	r3, [r4]
	beq	.L64
	cmp	r9, #1
	bne	.L72
.L76:
	mov	r3, #136
	str	r3, [r4, #4]
	b	.L70
.L62:
	mov	r3, #1
	str	r3, [r4, #52]
	b	.L57
.L61:
	mov	r3, #2
	str	r3, [r4, #52]
	b	.L57
.L68:
	mov	r3, #216
	str	r3, [r4]
.L67:
	cmp	r9, #3
	cmpne	r9, #9
	moveq	r3, #40
	streq	r3, [r4, #4]
	bne	.L98
.L70:
	add	r9, r9, #1
	cmp	r9, #12
	add	r4, r4, #84
	bne	.L73
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L64:
	mov	r3, #72
	str	r3, [r4, #4]
	b	.L70
.L98:
	cmp	r9, #10
	cmpne	r9, #4
	bne	.L69
	mov	r3, #104
	str	r3, [r4, #4]
	b	.L70
.L72:
	mov	r3, #200
	str	r3, [r4, #4]
	b	.L70
.L100:
	.align	2
.L99:
	.word	platform
	.word	rand
	.size	initPlatformsLvl2, .-initPlatformsLvl2
	.align	2
	.global	initGuardsLvl2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGuardsLvl2, %function
initGuardsLvl2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	ldr	r3, .L103
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, #8
	mov	r1, #3
	mov	lr, #16
	mov	ip, #10
	mov	r8, #32
	mov	r7, #56
	mov	r6, #2
	mov	fp, #5
	mov	r10, #104
	str	r2, [r3, #44]
	str	r2, [r3, #8]
	str	r2, [r3, #128]
	str	r2, [r3, #92]
	str	r2, [r3, #212]
	str	r2, [r3, #176]
	str	r2, [r3, #296]
	str	r2, [r3, #260]
	mov	r2, #4
	str	fp, [r3, #52]
	str	r10, [r3, #60]
	str	lr, [r3, #20]
	str	lr, [r3, #104]
	str	lr, [r3, #188]
	str	lr, [r3, #272]
	str	r8, [r3]
	str	r8, [r3, #84]
	str	r7, [r3, #4]
	str	r0, [r3, #16]
	str	r0, [r3, #100]
	str	r0, [r3, #184]
	str	r0, [r3, #268]
	str	r0, [r3, #56]
	str	ip, [r3, #32]
	str	ip, [r3, #116]
	str	ip, [r3, #200]
	str	ip, [r3, #284]
	str	r1, [r3, #40]
	str	r1, [r3, #124]
	str	r1, [r3, #208]
	str	r1, [r3, #292]
	str	r1, [r3, #136]
	str	r6, [r3, #24]
	str	r2, [r3, #220]
	mov	r2, #184
	str	r2, [r3, #172]
	mov	r2, #128
	mov	r4, #216
	mov	r5, #240
	mov	r9, #88
	str	r2, [r3, #224]
	mov	r2, #6
	str	r9, [r3, #88]
	str	r7, [r3, #144]
	str	r6, [r3, #192]
	str	r4, [r3, #168]
	str	r4, [r3, #252]
	str	r4, [r3, #256]
	str	r5, [r3, #228]
	str	r5, [r3, #312]
	str	r0, [r3, #140]
	str	r1, [r3, #108]
	str	r0, [r3, #308]
	str	r1, [r3, #276]
	str	r2, [r3, #304]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	guard
	.size	initGuardsLvl2, .-initGuardsLvl2
	.align	2
	.global	initInksLvl3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInksLvl3, %function
initInksLvl3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r2, #8
	mov	r1, #1
	mov	fp, #3
	mov	r10, #92
	mov	r9, #24
	mov	r8, #2
	mov	r7, #176
	mov	r6, #88
	mov	r5, #36
	mov	r4, #152
	mov	lr, #0
	mov	ip, #204
	mov	r0, #216
	ldr	r3, .L107
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
	str	r2, [r3, #184]
	str	r2, [r3, #188]
	str	r2, [r3, #268]
	str	r2, [r3, #272]
	str	fp, [r3, #52]
	str	r10, [r3]
	str	r9, [r3, #4]
	str	r8, [r3, #136]
	str	r7, [r3, #84]
	str	r6, [r3, #88]
	str	r5, [r3, #168]
	str	r4, [r3, #172]
	str	lr, [r3, #304]
	str	ip, [r3, #252]
	str	r0, [r3, #256]
	str	r1, [r3, #44]
	str	r1, [r3, #128]
	str	r1, [r3, #212]
	str	r1, [r3, #296]
	str	r1, [r3, #220]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L108:
	.align	2
.L107:
	.word	ink
	.size	initInksLvl3, .-initInksLvl3
	.align	2
	.global	initPlatformsLvl3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlatformsLvl3, %function
initPlatformsLvl3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #0
	mov	r8, #8
	mov	r7, r4
	mov	r6, #32
	ldr	r9, .L137
	ldr	r5, .L137+4
.L125:
	str	r8, [r9, #20]
	str	r6, [r9, #16]
	str	r7, [r9, #44]
	mov	lr, pc
	bx	r5
	rsbs	r3, r0, #0
	and	r3, r3, #3
	and	r0, r0, #3
	rsbpl	r0, r3, #0
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L110
.L112:
	.word	.L115
	.word	.L114
	.word	.L113
	.word	.L111
.L111:
	mov	r3, #6
	str	r3, [r9, #52]
.L110:
	cmp	r4, #2
	movle	r3, #24
	strle	r3, [r9]
	ble	.L117
	cmp	r4, #5
	movle	r3, #80
	strle	r3, [r9]
	ble	.L119
	cmp	r4, #8
	bgt	.L120
	mov	r3, #136
	str	r3, [r9]
.L117:
	cmp	r4, #0
	cmpne	r4, #6
	moveq	r3, #40
	streq	r3, [r9, #4]
	bne	.L136
.L121:
	add	r4, r4, #1
	cmp	r4, #12
	add	r9, r9, #84
	bne	.L125
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L113:
	mov	r3, #5
	str	r3, [r9, #52]
	b	.L110
.L115:
	mov	r3, #1
	str	r3, [r9, #52]
	b	.L110
.L114:
	mov	r3, #2
	str	r3, [r9, #52]
	b	.L110
.L120:
	mov	r3, #192
	str	r3, [r9]
.L119:
	cmp	r4, #9
	cmpne	r4, #3
	moveq	r3, #72
	streq	r3, [r9, #4]
	beq	.L121
.L122:
	cmp	r4, #10
	cmpne	r4, #4
	moveq	r3, #136
	streq	r3, [r9, #4]
	beq	.L121
	cmp	r4, #8
	cmpne	r4, #2
	moveq	r3, #168
	movne	r3, #200
	str	r3, [r9, #4]
	b	.L121
.L136:
	cmp	r4, #7
	cmpne	r4, #1
	bne	.L122
	mov	r3, #104
	str	r3, [r9, #4]
	b	.L121
.L138:
	.align	2
.L137:
	.word	platform
	.word	rand
	.size	initPlatformsLvl3, .-initPlatformsLvl3
	.align	2
	.global	initObstaclesLvl3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObstaclesLvl3, %function
initObstaclesLvl3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #8
	mov	r1, #4
	mov	ip, #10
	mov	r0, #3
	mov	lr, #120
	mov	r6, #1
	mov	r5, #224
	mov	r4, #0
	mov	r10, #64
	mov	r9, #56
	mov	r8, #2
	mov	r7, #176
	ldr	r3, .L141
	str	r10, [r3]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
	str	r2, [r3, #184]
	str	r2, [r3, #188]
	str	r2, [r3, #268]
	str	r2, [r3, #272]
	str	r2, [r3, #352]
	str	r2, [r3, #356]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #92]
	str	r1, [r3, #96]
	str	r1, [r3, #176]
	str	r1, [r3, #180]
	str	r1, [r3, #260]
	str	r1, [r3, #264]
	str	r1, [r3, #344]
	str	r1, [r3, #348]
	str	ip, [r3, #32]
	str	ip, [r3, #116]
	str	ip, [r3, #200]
	str	ip, [r3, #284]
	str	ip, [r3, #368]
	str	r0, [r3, #40]
	str	r0, [r3, #124]
	str	r0, [r3, #208]
	str	r0, [r3, #292]
	str	r0, [r3, #376]
	str	lr, [r3, #4]
	str	r6, [r3, #24]
	str	lr, [r3, #84]
	str	lr, [r3, #168]
	str	r6, [r3, #192]
	str	r9, [r3, #256]
	str	r8, [r3, #276]
	str	r7, [r3, #336]
	str	r5, [r3, #88]
	str	r5, [r3, #340]
	str	r4, [r3, #108]
	str	r4, [r3, #360]
	str	r2, [r3, #172]
	str	r2, [r3, #252]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L142:
	.align	2
.L141:
	.word	obstacle
	.size	initObstaclesLvl3, .-initObstaclesLvl3
	.align	2
	.global	initInksLvl4
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInksLvl4, %function
initInksLvl4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r2, #8
	mov	r1, #1
	mov	r9, #0
	mov	r8, #104
	mov	r7, #2
	mov	r6, #232
	mov	r5, #16
	mov	r4, #3
	mov	lr, #144
	mov	ip, #216
	mov	r0, #24
	ldr	r3, .L145
	str	r9, [r3, #52]
	str	r8, [r3]
	str	r7, [r3, #136]
	str	r6, [r3, #84]
	str	r5, [r3, #168]
	str	r4, [r3, #304]
	str	lr, [r3, #252]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
	str	r2, [r3, #184]
	str	r2, [r3, #188]
	str	r2, [r3, #268]
	str	r2, [r3, #272]
	str	r1, [r3, #44]
	str	r1, [r3, #128]
	str	r1, [r3, #212]
	str	r1, [r3, #296]
	str	r1, [r3, #220]
	str	ip, [r3, #4]
	str	ip, [r3, #256]
	str	r0, [r3, #88]
	str	r0, [r3, #172]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	ink
	.size	initInksLvl4, .-initInksLvl4
	.align	2
	.global	initPlatformsLvl4
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlatformsLvl4, %function
initPlatformsLvl4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L193
	mov	r10, #0
	mov	r9, r8
	mov	r4, #8
	mov	r7, #32
	ldr	r6, .L193+4
	ldr	r5, .L193+8
.L172:
	mov	r3, #0
	str	r4, [r9, #20]
	str	r3, [r9, #44]
	str	r7, [r9, #16]
	mov	lr, pc
	bx	r6
	smull	r2, r3, r5, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3, lsl #1
	cmp	r0, #5
	ldrls	pc, [pc, r0, asl #2]
	b	.L148
.L150:
	.word	.L155
	.word	.L154
	.word	.L153
	.word	.L152
	.word	.L151
	.word	.L149
.L149:
	mov	r3, #6
	str	r3, [r9, #52]
.L148:
	cmp	r10, #1
	bls	.L188
.L156:
	cmp	r10, #3
	ble	.L189
	cmp	r10, #4
	moveq	r3, #64
	streq	r3, [r8, #336]
	beq	.L163
	cmp	r10, #7
	bgt	.L164
	mov	r3, #88
	str	r3, [r9]
.L165:
	cmp	r10, #10
	cmpne	r10, #5
	bne	.L190
.L157:
	mov	r3, #72
	str	r3, [r9, #4]
.L168:
	cmp	r10, #11
	beq	.L147
.L169:
	add	r10, r10, #1
	add	r9, r9, #84
	b	.L172
.L151:
	mov	r3, #2
	cmp	r10, #1
	str	r3, [r9, #52]
	bhi	.L156
.L188:
	tst	r10, #1
	str	r4, [r9]
	beq	.L157
	mov	r3, #136
	str	r3, [r9, #4]
.L192:
	cmp	r10, #11
	bne	.L169
.L147:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L152:
	mov	r3, #4
	str	r3, [r9, #52]
	b	.L148
.L153:
	mov	r3, #3
	str	r3, [r9, #52]
	b	.L148
.L155:
	mov	r3, #1
	str	r3, [r9, #52]
	b	.L148
.L154:
	mov	r3, #5
	str	r3, [r9, #52]
	b	.L148
.L164:
	cmp	r10, #9
	bgt	.L166
	mov	r3, #160
	cmp	r10, #8
	str	r3, [r9]
	bne	.L167
.L163:
	mov	r3, #40
	str	r3, [r9, #4]
	b	.L168
.L189:
	mov	r3, #48
	cmp	r10, #2
	str	r3, [r9]
	beq	.L191
.L167:
	cmp	r10, #9
	cmpne	r10, #3
	moveq	r3, #168
	movne	r3, #200
	str	r3, [r9, #4]
	b	.L168
.L191:
	mov	r3, #104
	str	r3, [r8, #172]
	b	.L169
.L190:
	cmp	r10, #6
	bne	.L167
	mov	r3, #136
	str	r3, [r9, #4]
	b	.L192
.L166:
	mov	r3, #216
	str	r3, [r9]
	b	.L165
.L194:
	.align	2
.L193:
	.word	platform
	.word	rand
	.word	715827883
	.size	initPlatformsLvl4, .-initPlatformsLvl4
	.align	2
	.global	initGuardsLvl4
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGuardsLvl4, %function
initGuardsLvl4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	ldr	r3, .L197
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, #3
	mov	lr, #8
	mov	ip, #16
	mov	r0, #10
	mov	r4, #184
	mov	r5, #88
	mov	r9, #64
	mov	r8, #2
	mov	fp, #6
	mov	r10, #24
	str	r2, [r3, #44]
	str	r2, [r3, #8]
	str	r2, [r3, #128]
	str	r2, [r3, #92]
	str	r2, [r3, #212]
	str	r2, [r3, #176]
	str	r2, [r3, #296]
	str	r2, [r3, #260]
	str	r2, [r3, #136]
	mov	r2, #120
	str	lr, [r3, #16]
	str	lr, [r3, #100]
	str	lr, [r3, #184]
	str	lr, [r3, #268]
	str	fp, [r3, #52]
	str	r10, [r3, #4]
	str	r9, [r3]
	str	r9, [r3, #56]
	str	r4, [r3, #60]
	str	r8, [r3, #24]
	str	ip, [r3, #20]
	str	ip, [r3, #104]
	str	ip, [r3, #188]
	str	ip, [r3, #272]
	str	r0, [r3, #32]
	str	r0, [r3, #116]
	str	r0, [r3, #200]
	str	r0, [r3, #284]
	str	r1, [r3, #40]
	str	r1, [r3, #124]
	str	r1, [r3, #208]
	str	r1, [r3, #292]
	str	r5, [r3, #84]
	str	r2, [r3, #88]
	mov	r2, #128
	str	r2, [r3, #144]
	mov	r2, #4
	str	r2, [r3, #220]
	mov	r2, #216
	mov	r7, #240
	mov	r6, #136
	str	r2, [r3, #172]
	mov	r2, #5
	str	r5, [r3, #140]
	str	r8, [r3, #108]
	str	r4, [r3, #252]
	str	r5, [r3, #256]
	str	r4, [r3, #312]
	str	r7, [r3, #168]
	str	r7, [r3, #228]
	str	r6, [r3, #224]
	str	r6, [r3, #308]
	str	r1, [r3, #192]
	str	r1, [r3, #276]
	str	r2, [r3, #304]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	guard
	.size	initGuardsLvl4, .-initGuardsLvl4
	.align	2
	.global	initObstaclesLvl4
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObstaclesLvl4, %function
initObstaclesLvl4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #8
	mov	r1, #4
	mov	ip, #10
	mov	r0, #3
	mov	lr, #0
	mov	r6, #40
	mov	r5, #80
	mov	r4, #224
	mov	r10, #1
	mov	r9, #48
	mov	r8, #16
	mov	r7, #2
	ldr	r3, .L201
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
	str	r2, [r3, #184]
	str	r2, [r3, #188]
	str	r2, [r3, #268]
	str	r2, [r3, #272]
	str	r2, [r3, #352]
	str	r2, [r3, #356]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #92]
	str	r1, [r3, #96]
	str	r1, [r3, #176]
	str	r1, [r3, #180]
	str	r1, [r3, #260]
	str	r1, [r3, #264]
	str	r1, [r3, #344]
	str	r1, [r3, #348]
	str	ip, [r3, #32]
	str	ip, [r3, #116]
	str	ip, [r3, #200]
	str	ip, [r3, #284]
	str	ip, [r3, #368]
	str	r0, [r3, #40]
	str	r0, [r3, #124]
	str	r0, [r3, #208]
	str	r0, [r3, #292]
	str	r0, [r3, #376]
	str	r6, [r3]
	str	r10, [r3, #24]
	str	r6, [r3, #168]
	str	r9, [r3, #256]
	str	r8, [r3, #340]
	str	r7, [r3, #360]
	str	r5, [r3, #84]
	str	r5, [r3, #252]
	str	r4, [r3, #88]
	str	r4, [r3, #172]
	str	lr, [r3, #108]
	str	lr, [r3, #192]
	str	lr, [r3, #276]
	str	r2, [r3, #336]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L202:
	.align	2
.L201:
	.word	obstacle
	.size	initObstaclesLvl4, .-initObstaclesLvl4
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L211
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L211+4
	ldr	r3, [r3]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L204
.L206:
	.word	.L209
	.word	.L208
	.word	.L207
	.word	.L205
.L205:
	ldr	r3, .L211+8
	ldr	r2, .L211+12
	str	r2, [r3]
	bl	initPlatformsLvl4
	bl	initInksLvl4
	bl	initGuardsLvl4
	bl	initObstaclesLvl4
	mov	r2, #130
	ldr	r3, .L211+16
	str	r2, [r3]
.L204:
	bl	initPlayer
	bl	initGate
	mov	r3, #0
	mov	ip, #1
	mov	r1, #2
	ldr	r0, .L211+20
	ldr	r2, .L211+24
	ldr	lr, .L211+28
	str	r3, [r0]
	str	r3, [r2]
	ldr	r0, .L211+32
	ldr	r2, .L211+36
	str	r3, [lr]
	ldr	r3, .L211+40
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r2, .L211+44
	ldr	r3, .L211+48
	ldr	r1, [r2]
	ldr	r0, [r3]
	ldr	r2, .L211+52
	ldr	r3, .L211+56
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L209:
	ldr	r3, .L211+8
	ldr	r2, .L211+60
	str	r2, [r3]
	bl	initInksLvl1
	bl	initPlatformsLvl1
	mov	r2, #80
	ldr	r3, .L211+16
	str	r2, [r3]
	b	.L204
.L208:
	ldr	r3, .L211+8
	ldr	r2, .L211+64
	str	r2, [r3]
	bl	initPlatformsLvl2
	bl	initInksLvl2
	bl	initGuardsLvl2
	mov	r2, #80
	ldr	r3, .L211+16
	str	r2, [r3]
	b	.L204
.L207:
	ldr	r3, .L211+8
	ldr	r2, .L211+68
	str	r2, [r3]
	bl	initPlatformsLvl3
	bl	initInksLvl3
	bl	initObstaclesLvl3
	mov	r2, #90
	ldr	r3, .L211+16
	str	r2, [r3]
	b	.L204
.L212:
	.align	2
.L211:
	.word	hideSprites
	.word	currLvl
	.word	collisionMap
	.word	lvl4CollMapBitmap
	.word	score
	.word	gateOpen
	.word	paintedPlatforms
	.word	lvlComplete
	.word	totalPlatformsNum1
	.word	totalPlatformsNum2
	.word	stopSounds
	.word	bitsong_length
	.word	bitsong_sampleRate
	.word	bitsong_data
	.word	playSong
	.word	lvl1ColMapBitmap
	.word	lvl2CollMapBitmap
	.word	lvl3CollMapBitmap
	.size	initGame, .-initGame
	.comm	gateOpen,4,4
	.comm	tilemodY,4,4
	.comm	tilemodX,4,4
	.comm	TID3,4,4
	.comm	TID2,4,4
	.comm	TID1,4,4
	.comm	totalPlatformsNum2,4,4
	.comm	totalPlatformsNum1,4,4
	.comm	score,4,4
	.comm	lvlComplete,4,4
	.comm	paintedPlatforms,4,4
	.comm	collisionMap,4,4
	.comm	gate,84,4
	.comm	guard,336,4
	.comm	obstacle,420,4
	.comm	ink,336,4
	.comm	platform,1008,4
	.comm	player,84,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	song,12,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
