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
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L13
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L3
	ldr	r3, .L13+4
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	bge	.L10
.L4:
	ldr	r3, .L13+8
	add	r1, r3, #16
	ldm	r1, {r1, r2}
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #20]
	blt	.L3
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L11
	ldr	r1, .L13+12
	ldr	r0, .L13+16
	ldr	r1, [r1]
	strh	r2, [r0, #6]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #32]
.L3:
	mov	r1, #1
	ldr	r3, .L13
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L10:
	ldr	r2, [r3, #12]
	cmp	r2, #0
	bne	.L12
	ldr	r1, .L13+12
	ldr	r0, .L13+16
	ldr	r1, [r1]
	strh	r2, [r0, #2]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r1, #20]
	b	.L4
.L12:
	ldm	r3, {r0, r1}
	ldr	r3, .L13+20
	mov	lr, pc
	bx	r3
	b	.L4
.L11:
	ldm	r3, {r0, r1}
	ldr	r3, .L13+24
	mov	lr, pc
	bx	r3
	b	.L3
.L14:
	.align	2
.L13:
	.word	67109376
	.word	soundA
	.word	soundB
	.word	dma
	.word	67109120
	.word	playSoundA
	.word	playSoundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r3, #5632
	ldr	r2, .L17+4
	ldr	r0, .L17+8
	strh	r3, [r1]	@ movhi
	ldr	r4, .L17+12
	strh	r2, [r1, #10]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #12]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	mov	r9, #12
	ldr	r1, .L17+16
	mov	lr, pc
	bx	r4
	mov	r3, #1600
	mov	r0, #3
	ldr	r2, .L17+20
	ldr	r1, .L17+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L17+28
	ldr	r1, .L17+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L17+36
	ldr	r1, .L17+40
	mov	lr, pc
	bx	r4
	mov	r1, #44
	mov	r8, #108
	mov	r7, #116
	mov	r0, #120
	mov	r6, #384
	mov	r5, #10
	mov	r4, #50
	mov	lr, #448
	ldr	r3, .L17+44
	mov	ip, #0
	ldr	r2, [r3]
	ldr	r3, .L17+48
	add	r2, r2, #64
	lsl	r2, r2, #22
	add	r10, r3, #324
	lsr	r2, r2, #22
	strh	r2, [r10]	@ movhi
	ldr	r10, .L17+52
	add	r2, r3, #288
	strh	r10, [r2]	@ movhi
	sub	r10, r10, #128
	strh	r10, [r2, #2]	@ movhi
	add	r2, r3, #292
	strh	r9, [r2]	@ movhi
	ldr	r9, .L17+56
	add	r2, r3, #296
	strh	r9, [r2]	@ movhi
	sub	r9, r9, #125
	strh	r9, [r2, #2]	@ movhi
	add	r2, r3, #300
	strh	r1, [r2]	@ movhi
	ldr	r1, .L17+60
	add	r2, r3, #304
	strh	r1, [r2, #2]	@ movhi
	ldr	r1, .L17+64
	strh	r1, [r2]	@ movhi
	add	r2, r3, #312
	strh	r1, [r2]	@ movhi
	ldr	r1, .L17+68
	strh	r1, [r2, #2]	@ movhi
	add	r2, r3, #308
	strh	r8, [r2]	@ movhi
	ldr	r1, .L17+72
	add	r2, r3, #316
	strh	r7, [r2]	@ movhi
	add	r2, r3, #320
	strh	r1, [r2]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	sub	r1, r1, #32
	add	r2, r3, #328
	strh	r1, [r2]	@ movhi
	ldr	r1, .L17+76
	strh	r1, [r2, #2]	@ movhi
	add	r2, r3, #332
	strh	r6, [r2]	@ movhi
	add	r2, r3, #336
	strh	r0, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	add	r2, r3, #344
	strh	r0, [r2]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	add	r2, r3, #340
	ldr	r4, .L17+80
	add	r3, r3, #348
	strh	lr, [r3]	@ movhi
	ldr	lr, .L17+84
	strh	r4, [r2]	@ movhi
	ldr	r3, .L17+88
	ldr	r2, .L17+92
	ldr	r1, .L17+96
	ldr	r0, .L17+100
	str	ip, [lr]
	ldr	r4, .L17+104
	ldr	lr, .L17+108
	str	ip, [r2]
	str	ip, [r3]
	ldr	r1, [r1]
	ldr	r0, [r0]
	ldr	r2, .L17+112
	ldr	r3, .L17+116
	str	ip, [r4]
	str	ip, [lr]
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	hideSprites
	.word	7684
	.word	23556
	.word	DMANow
	.word	startTilesetPal
	.word	100679680
	.word	startTilesetTiles
	.word	100724736
	.word	startBG_smMap
	.word	100720640
	.word	startBG_wideMap
	.word	cheat
	.word	shadowOAM
	.word	16520
	.word	16528
	.word	-16304
	.word	16509
	.word	-16240
	.word	16534
	.word	-32752
	.word	449
	.word	hOff2
	.word	totalScore
	.word	state
	.word	pixelsong_length
	.word	pixelsong_sampleRate
	.word	hOff1
	.word	currLvl
	.word	pixelsong_data
	.word	playSong
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
	push	{r4, lr}
	mov	lr, #12
	ldr	ip, .L21
	ldr	r4, .L21+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L21+8
	str	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L21+12
	ldr	r1, .L21+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L21+20
	ldr	r1, .L21+24
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L21+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+32
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r0, #8
	mov	r2, #0
	mov	ip, #97
	mov	lr, #1
	ldr	r3, .L21+36
	strh	r0, [r1, #4]	@ movhi
	add	r1, r1, #512
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L21+40
	strh	ip, [r1]	@ movhi
	ldr	ip, .L21+44
	strh	r2, [r3, #8]	@ movhi
	strh	lr, [r1, #8]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	pop	{r4, lr}
	str	ip, [r0, #4092]
	strh	r2, [r3, #8]	@ movhi
	b	goToStart
.L22:
	.align	2
.L21:
	.word	cheat
	.word	DMANow
	.word	shadowOAM
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	setupSounds
	.word	67109120
	.word	50360320
	.word	interruptHandler
	.size	initialize, .-initialize
	.align	2
	.global	goToGame1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame1, %function
goToGame1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L25
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7936
	strh	r3, [r2]	@ movhi
	ldr	r4, .L25+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L25+16
	mov	r0, #3
	ldr	r1, .L25+20
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L25+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	hideSprites
	.word	DMANow
	.word	tilesetPal
	.word	tilesetTiles
	.word	100726784
	.word	lvl1TilemapMap
	.word	state
	.size	goToGame1, .-goToGame1
	.align	2
	.global	goToGame2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame2, %function
goToGame2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L29
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7936
	strh	r3, [r2]	@ movhi
	ldr	r4, .L29+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L29+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L29+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L29+16
	mov	r0, #3
	ldr	r1, .L29+20
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L29+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L30:
	.align	2
.L29:
	.word	hideSprites
	.word	DMANow
	.word	tilesetPal
	.word	tilesetTiles
	.word	100726784
	.word	lvl2TilemapMap
	.word	state
	.size	goToGame2, .-goToGame2
	.align	2
	.global	goToGame3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame3, %function
goToGame3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L33
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7936
	strh	r3, [r2]	@ movhi
	ldr	r4, .L33+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L33+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L33+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L33+16
	mov	r0, #3
	ldr	r1, .L33+20
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L33+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L34:
	.align	2
.L33:
	.word	hideSprites
	.word	DMANow
	.word	tilesetPal
	.word	tilesetTiles
	.word	100726784
	.word	lvl3TilemapMap
	.word	state
	.size	goToGame3, .-goToGame3
	.align	2
	.global	goToGame4
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame4, %function
goToGame4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L37
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r3, #4352
	mov	r1, #7936
	strh	r3, [r2]	@ movhi
	ldr	r4, .L37+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L37+8
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L37+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L37+16
	mov	r0, #3
	ldr	r1, .L37+20
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L37+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L38:
	.align	2
.L37:
	.word	hideSprites
	.word	DMANow
	.word	tilesetPal
	.word	tilesetTiles
	.word	100726784
	.word	lvl4TilemapMap
	.word	state
	.size	goToGame4, .-goToGame4
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
	mov	r2, #67108864
	mov	r1, #512
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L41
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L41+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L41+8
	ldr	r2, .L41+12
	ldr	r1, .L41+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L41+20
	ldr	r1, .L41+24
	mov	lr, pc
	bx	r4
	mov	r1, #0
	ldr	r2, .L41+28
	ldr	r3, .L41+32
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r2, #5
	ldr	r3, .L41+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L42:
	.align	2
.L41:
	.word	DMANow
	.word	pauseBGPal
	.word	4512
	.word	100679680
	.word	pauseBGTiles
	.word	100724736
	.word	pauseBGMap
	.word	hOff1
	.word	pauseSounds
	.word	state
	.size	goToPause, .-goToPause
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
	push	{r4, lr}
	ldr	r4, .L62
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L44
	ldr	r2, .L62+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L60
.L44:
	tst	r3, #4
	beq	.L51
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L61
.L51:
	ldr	r3, .L62+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L62+12
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L61:
	bl	goToStart
	b	.L51
.L60:
	ldr	r3, .L62+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L62+20
	ldr	r3, [r3]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L59
.L47:
	.word	.L50
	.word	.L49
	.word	.L48
	.word	.L46
.L46:
	bl	goToGame4
.L59:
	ldrh	r3, [r4]
	b	.L44
.L48:
	bl	goToGame3
	ldrh	r3, [r4]
	b	.L44
.L50:
	bl	goToGame1
	ldrh	r3, [r4]
	b	.L44
.L49:
	bl	goToGame2
	ldrh	r3, [r4]
	b	.L44
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff1
	.word	unpauseSounds
	.word	currLvl
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
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	mov	r1, #4608
	mov	r2, #67108864
	ldr	r3, .L66+4
	strh	r1, [r2]	@ movhi
	ldr	r0, .L66+8
	ldr	r2, [r3]
	smull	r1, r3, r0, r2
	asr	r1, r2, #31
	rsb	r3, r1, r3, asr #2
	smull	lr, ip, r0, r3
	ldr	lr, .L66+12
	smull	r0, lr, r2, lr
	asr	r0, r3, #31
	rsb	r0, r0, ip, asr #2
	ldr	r5, .L66+16
	add	r0, r0, r0, lsl #2
	ldr	r4, .L66+20
	sub	r0, r3, r0, lsl #1
	ldr	r6, .L66+24
	add	ip, r3, r3, lsl #2
	sub	ip, r2, ip, lsl #1
	rsb	lr, r1, lr, asr #5
	ldr	r7, .L66+28
	str	r0, [r5]
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L66+32
	str	ip, [r4]
	str	lr, [r6]
	mov	lr, pc
	bx	r7
	mov	r3, #2384
	mov	r0, #3
	ldr	r2, .L66+36
	ldr	r1, .L66+40
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L66+44
	ldr	r1, .L66+48
	mov	lr, pc
	bx	r7
	mov	r9, #136
	mov	r0, #128
	mov	r8, #144
	mov	r7, #20
	mov	lr, #0
	mov	ip, #6
	ldr	r1, [r5]
	ldr	r2, [r4]
	ldr	r6, [r6]
	ldr	r3, .L66+52
	add	r4, r6, #192
	add	r1, r1, #192
	add	r2, r2, #192
	and	r4, r4, r3
	and	r1, r1, r3
	and	r2, r2, r3
	ldr	r3, .L66+56
	ldr	r5, .L66+60
	strh	r1, [r3, #12]	@ movhi
	ldr	r1, .L66+64
	strh	r2, [r3, #4]	@ movhi
	add	r2, r3, #336
	strh	r1, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r4, [r3, #20]	@ movhi
	add	r5, r3, #340
	ldr	r4, .L66+68
	ldr	r1, .L66+72
	strh	r9, [r3, #10]	@ movhi
	strh	r8, [r3, #2]	@ movhi
	strh	r7, [r5]	@ movhi
	ldr	r2, .L66+76
	strh	r0, [r3, #16]	@ movhi
	strh	r0, [r3, #18]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r0, [r3]	@ movhi
	str	lr, [r4]
	str	ip, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L67:
	.align	2
.L66:
	.word	hideSprites
	.word	totalScore
	.word	1717986919
	.word	1374389535
	.word	scoreNum2
	.word	scoreNum3
	.word	scoreNum1
	.word	DMANow
	.word	winBGPal
	.word	100679680
	.word	winBGTiles
	.word	100724736
	.word	winBGMap
	.word	1023
	.word	shadowOAM
	.word	-16296
	.word	16512
	.word	hOff1
	.word	state
	.word	stopSounds
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L77
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L69
	ldr	r3, .L77+4
	ldrh	r3, [r3]
	tst	r3, #8
	bne	.L69
	ldr	r4, .L77+8
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L70
	cmp	r3, #2
	beq	.L71
	cmp	r3, #0
	beq	.L76
.L69:
	ldr	r3, .L77+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L77+16
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L77+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L77+24
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L76:
	bl	goToGame2
	mov	r2, #1
	ldr	r3, .L77+28
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	b	.L69
.L71:
	bl	goToGame4
	mov	r2, #3
	ldr	r3, .L77+28
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	b	.L69
.L70:
	bl	goToGame3
	mov	r2, #2
	ldr	r3, .L77+28
	str	r2, [r4]
	mov	lr, pc
	bx	r3
	b	.L69
.L78:
	.align	2
.L77:
	.word	oldButtons
	.word	buttons
	.word	currLvl
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff1
	.word	initGame
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
	mov	r2, #67108864
	mov	r1, #512
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L81
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L81+4
	mov	lr, pc
	bx	r4
	mov	r3, #1904
	mov	r0, #3
	ldr	r2, .L81+8
	ldr	r1, .L81+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L81+16
	ldr	r1, .L81+20
	mov	lr, pc
	bx	r4
	mov	ip, #0
	mov	r1, #7
	ldr	r0, .L81+24
	ldr	r2, .L81+28
	ldr	r3, .L81+32
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	DMANow
	.word	loseBGPal
	.word	100679680
	.word	loseBGTiles
	.word	100724736
	.word	loseBGMap
	.word	hOff1
	.word	state
	.word	stopSounds
	.size	goToLose, .-goToLose
	.align	2
	.global	game1
	.syntax unified
	.arm
	.fpu softvfp
	.type	game1, %function
game1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L94
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L94+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L84
	ldr	r3, .L94+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L91
.L84:
	ldr	r3, .L94+20
	ldr	r3, [r3]
	ldr	r4, .L94+24
	cmp	r3, #1
	ldr	r3, [r4]
	beq	.L92
.L85:
	cmp	r3, #0
	ble	.L93
	pop	{r4, lr}
	bx	lr
.L93:
	pop	{r4, lr}
	b	goToLose
.L92:
	ldr	r1, .L94+28
	ldr	r2, [r1]
	add	r3, r2, r3
	str	r3, [r1]
	bl	goToWin
	ldr	r3, [r4]
	b	.L85
.L91:
	bl	goToPause
	b	.L84
.L95:
	.align	2
.L94:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	lvlComplete
	.word	score
	.word	totalScore
	.size	game1, .-game1
	.align	2
	.global	game2
	.syntax unified
	.arm
	.fpu softvfp
	.type	game2, %function
game2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	game1
	.size	game2, .-game2
	.align	2
	.global	game3
	.syntax unified
	.arm
	.fpu softvfp
	.type	game3, %function
game3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	game1
	.size	game3, .-game3
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
	ldr	r3, .L105
	ldrh	r3, [r3]
	tst	r3, #4
	push	{r4, lr}
	beq	.L99
	ldr	r3, .L105+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L104
.L99:
	ldr	r3, .L105+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L105+12
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L104:
	bl	goToStart
	b	.L99
.L106:
	.align	2
.L105:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff1
	.size	lose, .-lose
	.align	2
	.global	goToInstr1
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstr1, %function
goToInstr1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #512
	ldr	r4, .L109+4
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L109+8
	mov	lr, pc
	bx	r4
	mov	r3, #3344
	mov	r0, #3
	ldr	r2, .L109+12
	ldr	r1, .L109+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L109+20
	ldr	r1, .L109+24
	mov	lr, pc
	bx	r4
	mov	ip, #0
	mov	r1, #8
	ldr	r0, .L109+28
	ldr	r2, .L109+32
	ldr	r3, .L109+36
	str	ip, [r0]
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	hideSprites
	.word	DMANow
	.word	instruction1BGPal
	.word	100679680
	.word	instruction1BGTiles
	.word	100724736
	.word	instruction1BGMap
	.word	hOff1
	.word	state
	.word	stopSounds
	.size	goToInstr1, .-goToInstr1
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L160
	ldrh	r3, [r4]
	tst	r3, #16
	beq	.L112
	ldr	r2, .L160+4
	ldrh	r2, [r2]
	tst	r2, #16
	beq	.L155
.L112:
	tst	r3, #32
	beq	.L119
	ldr	r2, .L160+4
	ldrh	r2, [r2]
	tst	r2, #32
	beq	.L156
.L119:
	tst	r3, #8
	beq	.L126
	ldr	r2, .L160+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L157
.L126:
	tst	r3, #2
	beq	.L133
	ldr	r2, .L160+4
	ldrh	r2, [r2]
	tst	r2, #2
	beq	.L158
.L133:
	tst	r3, #4
	beq	.L135
	ldr	r3, .L160+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L159
.L135:
	ldr	r5, .L160+8
	ldr	r4, .L160+12
	ldr	r2, [r5]
	ldr	r3, [r4]
	add	r2, r2, #1
	add	r3, r3, #3
	ldr	r1, .L160+16
	str	r2, [r5]
	str	r3, [r4]
	ldr	r6, .L160+20
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L160+24
	mov	lr, pc
	bx	r6
	mov	r3, #67108864
	ldrh	r2, [r5]
	strh	r2, [r3, #20]	@ movhi
	ldrh	r2, [r4]
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #24]	@ movhi
	bx	lr
.L158:
	ldr	r2, .L160+28
	ldr	r1, [r2]
	cmp	r1, #12
	moveq	ip, #14
	movne	ip, #12
	moveq	r0, #78
	movne	r0, #76
	ldr	r1, .L160+32
	str	ip, [r2]
	strh	r0, [r1]	@ movhi
	b	.L133
.L157:
	ldr	r3, .L160+36
	ldr	r3, [r3]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L127
.L129:
	.word	.L132
	.word	.L131
	.word	.L130
	.word	.L128
.L156:
	ldr	r2, .L160+36
	ldr	r1, [r2]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L137
.L122:
	.word	.L125
	.word	.L124
	.word	.L123
	.word	.L121
.L155:
	ldr	r2, .L160+36
	ldr	r1, [r2]
	cmp	r1, #3
	ldrls	pc, [pc, r1, asl #2]
	b	.L136
.L115:
	.word	.L118
	.word	.L117
	.word	.L116
	.word	.L114
.L128:
	bl	goToGame4
.L127:
	ldr	r3, .L160+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L126
.L159:
	bl	goToInstr1
	b	.L135
.L114:
	mov	r0, #0
	mov	r1, #384
	str	r0, [r2]
.L113:
	ldr	r2, .L160+44
	strh	r1, [r2]	@ movhi
	b	.L112
.L116:
	mov	r0, #3
	mov	r1, #396
	str	r0, [r2]
	b	.L113
.L117:
	mov	r0, #2
	mov	r1, #392
	str	r0, [r2]
	b	.L113
.L118:
	mov	r0, #1
	mov	r1, #388
	str	r0, [r2]
	b	.L113
.L121:
	mov	r0, #2
	mov	r1, #392
	str	r0, [r2]
.L120:
	ldr	r2, .L160+44
	strh	r1, [r2]	@ movhi
	b	.L119
.L123:
	mov	r0, #1
	mov	r1, #388
	str	r0, [r2]
	b	.L120
.L124:
	mov	r0, #0
	mov	r1, #384
	str	r0, [r2]
	b	.L120
.L125:
	mov	r0, #3
	mov	r1, #396
	str	r0, [r2]
	b	.L120
.L130:
	bl	goToGame3
	b	.L127
.L131:
	bl	goToGame2
	b	.L127
.L132:
	bl	goToGame1
	b	.L127
.L136:
	mov	r1, #384
	b	.L113
.L137:
	mov	r1, #384
	b	.L120
.L161:
	.align	2
.L160:
	.word	oldButtons
	.word	buttons
	.word	hOff1
	.word	hOff2
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	cheat
	.word	shadowOAM+324
	.word	currLvl
	.word	initGame
	.word	shadowOAM+332
	.size	start, .-start
	.align	2
	.global	goToInstr2
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstr2, %function
goToInstr2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #512
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L164
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L164+4
	mov	lr, pc
	bx	r4
	mov	r3, #3776
	mov	r0, #3
	ldr	r2, .L164+8
	ldr	r1, .L164+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L164+16
	ldr	r1, .L164+20
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r2, #9
	ldr	r1, .L164+24
	ldr	r3, .L164+28
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L165:
	.align	2
.L164:
	.word	DMANow
	.word	instruction2BGPal
	.word	100679680
	.word	instruction2BGTiles
	.word	100724736
	.word	instruction2BGMap
	.word	hOff1
	.word	state
	.size	goToInstr2, .-goToInstr2
	.align	2
	.global	instr1
	.syntax unified
	.arm
	.fpu softvfp
	.type	instr1, %function
instr1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L178
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L167
	ldr	r2, .L178+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L176
.L167:
	tst	r3, #8
	beq	.L168
	ldr	r3, .L178+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L177
.L168:
	ldr	r3, .L178+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L178+12
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L177:
	bl	goToInstr2
	b	.L168
.L176:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L167
.L179:
	.align	2
.L178:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff1
	.size	instr1, .-instr1
	.align	2
	.global	goToInstr3
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstr3, %function
goToInstr3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #512
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L182
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L182+4
	mov	lr, pc
	bx	r4
	mov	r3, #5184
	mov	r0, #3
	ldr	r2, .L182+8
	ldr	r1, .L182+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L182+16
	ldr	r1, .L182+20
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r2, #10
	ldr	r1, .L182+24
	ldr	r3, .L182+28
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L183:
	.align	2
.L182:
	.word	DMANow
	.word	instruction3BGPal
	.word	100679680
	.word	instruction3BGTiles
	.word	100724736
	.word	instruction3BGMap
	.word	hOff1
	.word	state
	.size	goToInstr3, .-goToInstr3
	.align	2
	.global	instr2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instr2, %function
instr2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L196
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L185
	ldr	r2, .L196+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L194
.L185:
	tst	r3, #8
	beq	.L186
	ldr	r3, .L196+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L195
.L186:
	ldr	r3, .L196+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L196+12
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L195:
	bl	goToInstr3
	b	.L186
.L194:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L185
.L197:
	.align	2
.L196:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff1
	.size	instr2, .-instr2
	.align	2
	.global	goToInstr4
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstr4, %function
goToInstr4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #512
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L200
	strh	r1, [r2]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L200+4
	mov	lr, pc
	bx	r4
	mov	r3, #3584
	mov	r0, #3
	ldr	r2, .L200+8
	ldr	r1, .L200+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L200+16
	ldr	r1, .L200+20
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r2, #11
	ldr	r1, .L200+24
	ldr	r3, .L200+28
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L201:
	.align	2
.L200:
	.word	DMANow
	.word	instruction4BGPal
	.word	100679680
	.word	instruction4BGTiles
	.word	100724736
	.word	instruction4BGMap
	.word	hOff1
	.word	state
	.size	goToInstr4, .-goToInstr4
	.align	2
	.global	instr3
	.syntax unified
	.arm
	.fpu softvfp
	.type	instr3, %function
instr3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L214
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L203
	ldr	r2, .L214+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L212
.L203:
	tst	r3, #8
	beq	.L204
	ldr	r3, .L214+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L213
.L204:
	ldr	r3, .L214+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L214+12
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L213:
	bl	goToInstr4
	b	.L204
.L212:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L203
.L215:
	.align	2
.L214:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff1
	.size	instr3, .-instr3
	.align	2
	.global	goToInstr5
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstr5, %function
goToInstr5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L218
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #512
	ldr	r4, .L218+4
	strh	r1, [r2]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L218+8
	mov	lr, pc
	bx	r4
	mov	r3, #3760
	mov	r0, #3
	ldr	r2, .L218+12
	ldr	r1, .L218+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L218+20
	ldr	r1, .L218+24
	mov	lr, pc
	bx	r4
	mov	r0, #0
	mov	r2, #12
	ldr	r1, .L218+28
	ldr	r3, .L218+32
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L219:
	.align	2
.L218:
	.word	hideSprites
	.word	DMANow
	.word	instruction5BGPal
	.word	100679680
	.word	instruction5BGTiles
	.word	100724736
	.word	instruction5BGMap
	.word	hOff1
	.word	state
	.size	goToInstr5, .-goToInstr5
	.align	2
	.global	instr4
	.syntax unified
	.arm
	.fpu softvfp
	.type	instr4, %function
instr4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L232
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L221
	ldr	r2, .L232+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L230
.L221:
	tst	r3, #8
	beq	.L222
	ldr	r3, .L232+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L231
.L222:
	ldr	r3, .L232+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L232+12
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L231:
	bl	goToInstr5
	b	.L222
.L230:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L221
.L233:
	.align	2
.L232:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff1
	.size	instr4, .-instr4
	.align	2
	.global	instr5
	.syntax unified
	.arm
	.fpu softvfp
	.type	instr5, %function
instr5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L246
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L235
	ldr	r2, .L246+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L244
.L235:
	tst	r3, #8
	beq	.L236
	ldr	r3, .L246+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L245
.L236:
	ldr	r3, .L246+8
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L246+12
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L245:
	bl	goToInstr1
	b	.L236
.L244:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L235
.L247:
	.align	2
.L246:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	hOff1
	.size	instr5, .-instr5
	.align	2
	.global	goToFinalWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToFinalWin, %function
goToFinalWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L250
	mov	lr, pc
	bx	r3
	mov	r1, #4608
	mov	r2, #67108864
	ldr	r3, .L250+4
	strh	r1, [r2]	@ movhi
	ldr	r0, .L250+8
	ldr	r2, [r3]
	smull	r1, r3, r0, r2
	asr	r1, r2, #31
	rsb	r3, r1, r3, asr #2
	smull	lr, ip, r0, r3
	ldr	lr, .L250+12
	smull	r0, lr, r2, lr
	asr	r0, r3, #31
	rsb	r0, r0, ip, asr #2
	ldr	r5, .L250+16
	add	r0, r0, r0, lsl #2
	ldr	r4, .L250+20
	sub	r0, r3, r0, lsl #1
	ldr	r6, .L250+24
	add	ip, r3, r3, lsl #2
	sub	ip, r2, ip, lsl #1
	rsb	lr, r1, lr, asr #5
	ldr	r7, .L250+28
	str	r0, [r5]
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L250+32
	str	ip, [r4]
	str	lr, [r6]
	mov	lr, pc
	bx	r7
	mov	r3, #2400
	mov	r0, #3
	ldr	r2, .L250+36
	ldr	r1, .L250+40
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L250+44
	ldr	r1, .L250+48
	mov	lr, pc
	bx	r7
	mov	r9, #136
	mov	r0, #128
	mov	r8, #144
	mov	r7, #20
	mov	lr, #0
	mov	ip, #13
	ldr	r1, [r5]
	ldr	r2, [r4]
	ldr	r6, [r6]
	ldr	r3, .L250+52
	add	r4, r6, #192
	add	r1, r1, #192
	add	r2, r2, #192
	and	r4, r4, r3
	and	r1, r1, r3
	and	r2, r2, r3
	ldr	r3, .L250+56
	ldr	r5, .L250+60
	strh	r1, [r3, #12]	@ movhi
	ldr	r1, .L250+64
	strh	r2, [r3, #4]	@ movhi
	add	r2, r3, #336
	strh	r1, [r2]	@ movhi
	strh	r5, [r2, #2]	@ movhi
	strh	r4, [r3, #20]	@ movhi
	add	r5, r3, #340
	ldr	r4, .L250+68
	ldr	r1, .L250+72
	strh	r9, [r3, #10]	@ movhi
	strh	r8, [r3, #2]	@ movhi
	strh	r7, [r5]	@ movhi
	ldr	r2, .L250+76
	strh	r0, [r3, #16]	@ movhi
	strh	r0, [r3, #18]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r0, [r3]	@ movhi
	str	lr, [r4]
	str	ip, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L251:
	.align	2
.L250:
	.word	hideSprites
	.word	totalScore
	.word	1717986919
	.word	1374389535
	.word	scoreNum2
	.word	scoreNum3
	.word	scoreNum1
	.word	DMANow
	.word	finalWinBGPal
	.word	100679680
	.word	finalWinBGTiles
	.word	100724736
	.word	finalWinBGMap
	.word	1023
	.word	shadowOAM
	.word	-16296
	.word	16512
	.word	hOff1
	.word	state
	.word	stopSounds
	.size	goToFinalWin, .-goToFinalWin
	.align	2
	.global	game4
	.syntax unified
	.arm
	.fpu softvfp
	.type	game4, %function
game4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L263
	mov	lr, pc
	bx	r3
	ldr	r3, .L263+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L263+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L263+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L253
	ldr	r3, .L263+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L260
.L253:
	ldr	r3, .L263+20
	ldr	r3, [r3]
	ldr	r4, .L263+24
	cmp	r3, #1
	ldr	r3, [r4]
	beq	.L261
.L254:
	cmp	r3, #0
	ble	.L262
	pop	{r4, lr}
	bx	lr
.L262:
	pop	{r4, lr}
	b	goToLose
.L261:
	ldr	r1, .L263+28
	ldr	r2, [r1]
	add	r3, r2, r3
	str	r3, [r1]
	bl	goToFinalWin
	ldr	r3, [r4]
	b	.L254
.L260:
	bl	goToPause
	b	.L253
.L264:
	.align	2
.L263:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	lvlComplete
	.word	score
	.word	totalScore
	.size	game4, .-game4
	.align	2
	.global	finalWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	finalWin, %function
finalWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L272
	ldrh	r3, [r3]
	tst	r3, #8
	push	{r4, lr}
	beq	.L266
	ldr	r3, .L272+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L271
.L266:
	ldr	r3, .L272+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L272+12
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L272+16
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L272+20
	ldrh	r2, [r2]
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L271:
	bl	goToStart
	b	.L266
.L273:
	.align	2
.L272:
	.word	oldButtons
	.word	buttons
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff1
	.size	finalWin, .-finalWin
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
	ldr	r3, .L291
	mov	lr, pc
	bx	r3
	ldr	r3, .L291+4
	mov	lr, pc
	bx	r3
	ldr	r10, .L291+8
	ldr	r4, .L291+12
	ldr	r9, .L291+16
	ldr	fp, .L291+20
	ldr	r7, .L291+24
	ldr	r6, .L291+28
	ldr	r8, .L291+32
	ldr	r5, .L291+36
.L289:
	ldrh	r3, [r4]
	strh	r3, [r10]	@ movhi
	ldr	r3, [r9]
	ldrh	r2, [r8, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #13
	ldrls	pc, [pc, r3, asl #2]
	b	.L275
.L277:
	.word	.L288
	.word	.L287
	.word	.L287
	.word	.L287
	.word	.L286
	.word	.L285
	.word	.L284
	.word	.L283
	.word	.L282
	.word	.L281
	.word	.L280
	.word	.L279
	.word	.L278
	.word	.L276
.L287:
	mov	lr, pc
	bx	fp
.L275:
	mov	lr, pc
	bx	r7
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L289
.L288:
	ldr	r3, .L291+40
	mov	lr, pc
	bx	r3
	b	.L275
.L276:
	ldr	r3, .L291+44
	mov	lr, pc
	bx	r3
	b	.L275
.L278:
	ldr	r3, .L291+48
	mov	lr, pc
	bx	r3
	b	.L275
.L279:
	ldr	r3, .L291+52
	mov	lr, pc
	bx	r3
	b	.L275
.L280:
	ldr	r3, .L291+56
	mov	lr, pc
	bx	r3
	b	.L275
.L281:
	ldr	r3, .L291+60
	mov	lr, pc
	bx	r3
	b	.L275
.L282:
	ldr	r3, .L291+64
	mov	lr, pc
	bx	r3
	b	.L275
.L283:
	ldr	r3, .L291+68
	mov	lr, pc
	bx	r3
	b	.L275
.L284:
	ldr	r3, .L291+72
	mov	lr, pc
	bx	r3
	b	.L275
.L285:
	ldr	r3, .L291+76
	mov	lr, pc
	bx	r3
	b	.L275
.L286:
	ldr	r3, .L291+80
	mov	lr, pc
	bx	r3
	b	.L275
.L292:
	.align	2
.L291:
	.word	mgba_open
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	game1
	.word	waitForVBlank
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	start
	.word	finalWin
	.word	instr5
	.word	instr4
	.word	instr3
	.word	instr2
	.word	instr1
	.word	lose
	.word	win
	.word	pause
	.word	game4
	.size	main, .-main
	.text
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #97
	str	lr, [sp, #-4]!
	mov	r0, #67108864
	mov	lr, #1
	mov	ip, #8
	ldr	r3, .L295
	ldr	r2, .L295+4
	strh	r1, [r3]	@ movhi
	ldr	r1, .L295+8
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [r2, #4092]
	bx	lr
.L296:
	.align	2
.L295:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	updateScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScore, %function
updateScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L299
	ldr	r1, .L299+4
	ldr	r2, [r3]
	smull	r0, r3, r1, r2
	asr	r0, r2, #31
	rsb	r3, r0, r3, asr #2
	push	{r4, lr}
	smull	lr, ip, r1, r3
	ldr	lr, .L299+8
	smull	r1, lr, r2, lr
	asr	r1, r3, #31
	rsb	r1, r1, ip, asr #2
	add	r1, r1, r1, lsl #2
	add	ip, r3, r3, lsl #2
	ldr	r4, .L299+12
	sub	r3, r3, r1, lsl #1
	sub	r2, r2, ip, lsl #1
	ldr	r1, .L299+16
	ldr	ip, .L299+20
	rsb	r0, r0, lr, asr #5
	str	r3, [r4]
	str	r2, [ip]
	str	r0, [r1]
	pop	{r4, lr}
	bx	lr
.L300:
	.align	2
.L299:
	.word	totalScore
	.word	1717986919
	.word	1374389535
	.word	scoreNum2
	.word	scoreNum1
	.word	scoreNum3
	.size	updateScore, .-updateScore
	.comm	scoreNum3,4,4
	.comm	scoreNum2,4,4
	.comm	scoreNum1,4,4
	.comm	hOff2,4,4
	.comm	hOff1,4,4
	.comm	cheat,4,4
	.comm	totalScore,4,4
	.comm	currLvl,4,4
	.comm	buttons,2,2
	.comm	oldButtons,2,2
	.comm	state,4,4
	.comm	soundB,24,4
	.comm	soundA,24,4
	.comm	song,12,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
