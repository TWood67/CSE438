	.cpu cortex-a8
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"printf.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	strnlen
	.type	strnlen, %function
strnlen:
.LFB0:
	.file 1 "../Console/printf.c"
	.loc 1 26 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI0:
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	str	r1, [sp, #0]
	.loc 1 29 0
	ldr	r3, [sp, #4]
	str	r3, [sp, #12]
	b	.L2
.L4:
	.loc 1 29 0 is_stmt 0 discriminator 1
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
.L2:
	ldr	r3, [sp, #0]
	cmp	r3, #0
	moveq	r3, #0
	movne	r3, #1
	uxtb	r3, r3
	ldr	r2, [sp, #0]
	sub	r2, r2, #1
	str	r2, [sp, #0]
	cmp	r3, #0
	beq	.L3
	.loc 1 29 0 discriminator 2
	ldr	r3, [sp, #12]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L4
.L3:
	.loc 1 31 0 is_stmt 1
	ldr	r2, [sp, #12]
	ldr	r3, [sp, #4]
	rsb	r3, r3, r2
	.loc 1 32 0
	mov	r0, r3
	add	sp, sp, #16
	bx	lr
	.cfi_endproc
.LFE0:
	.size	strnlen, .-strnlen
	.align	2
	.type	skip_atoi, %function
skip_atoi:
.LFB1:
	.loc 1 35 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	sub	sp, sp, #16
.LCFI1:
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 36 0
	mov	r3, #0
	str	r3, [sp, #12]
	.loc 1 38 0
	b	.L7
.L9:
	.loc 1 39 0
	ldr	r2, [sp, #12]
	mov	r3, r2
	mov	r3, r3, asl #2
	add	r3, r3, r2
	mov	r3, r3, asl #1
	mov	r1, r3
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #0]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	add	r2, r1, r2
	sub	r2, r2, #48
	str	r2, [sp, #12]
	add	r2, r3, #1
	ldr	r3, [sp, #4]
	str	r2, [r3, #0]
.L7:
	.loc 1 38 0 discriminator 1
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L8
	.loc 1 38 0 is_stmt 0 discriminator 2
	ldr	r3, [sp, #4]
	ldr	r3, [r3, #0]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bls	.L9
.L8:
	.loc 1 40 0 is_stmt 1
	ldr	r3, [sp, #12]
	.loc 1 41 0
	mov	r0, r3
	add	sp, sp, #16
	bx	lr
	.cfi_endproc
.LFE1:
	.size	skip_atoi, .-skip_atoi
	.section	.rodata
	.align	2
.LC0:
	.ascii	"0123456789abcdefghijklmnopqrstuvwxyz\000"
	.align	2
.LC1:
	.ascii	"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ\000"
	.global	__aeabi_uidivmod
	.global	__aeabi_uidiv
	.text
	.align	2
	.type	number, %function
number:
.LFB2:
	.loc 1 58 0
	.cfi_startproc
	@ args = 8, pretend = 0, frame = 104
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
.LCFI2:
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #108
.LCFI3:
	.cfi_def_cfa_offset 112
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp, #0]
	.loc 1 61 0
	movw	r3, #:lower16:.LC0
	movt	r3, #:upper16:.LC0
	str	r3, [sp, #96]
	.loc 1 64 0
	ldr	r3, [sp, #116]
	and	r3, r3, #64
	cmp	r3, #0
	beq	.L12
	.loc 1 65 0
	movw	r3, #:lower16:.LC1
	movt	r3, #:upper16:.LC1
	str	r3, [sp, #96]
.L12:
	.loc 1 67 0
	ldr	r3, [sp, #116]
	and	r3, r3, #16
	cmp	r3, #0
	beq	.L13
	.loc 1 68 0
	ldr	r3, [sp, #116]
	bic	r3, r3, #1
	str	r3, [sp, #116]
.L13:
	.loc 1 70 0
	ldr	r3, [sp, #4]
	cmp	r3, #1
	ble	.L14
	.loc 1 70 0 is_stmt 0 discriminator 1
	ldr	r3, [sp, #4]
	cmp	r3, #36
	ble	.L15
.L14:
	.loc 1 71 0 is_stmt 1
	mov	r3, #0
	b	.L44
.L15:
	.loc 1 73 0
	ldr	r3, [sp, #116]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L17
	.loc 1 73 0 is_stmt 0 discriminator 1
	mov	r3, #48
	b	.L18
.L17:
	.loc 1 73 0 discriminator 2
	mov	r3, #32
.L18:
	.loc 1 73 0 discriminator 3
	strb	r3, [sp, #91]
	.loc 1 74 0 is_stmt 1 discriminator 3
	mov	r3, #0
	strb	r3, [sp, #103]
	.loc 1 76 0 discriminator 3
	ldr	r3, [sp, #116]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L19
	.loc 1 78 0
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bge	.L20
	.loc 1 80 0
	mov	r3, #45
	strb	r3, [sp, #103]
	.loc 1 81 0
	ldr	r3, [sp, #8]
	rsb	r3, r3, #0
	str	r3, [sp, #8]
	.loc 1 82 0
	ldr	r3, [sp, #0]
	sub	r3, r3, #1
	str	r3, [sp, #0]
	b	.L19
.L20:
	.loc 1 84 0
	ldr	r3, [sp, #116]
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L21
	.loc 1 86 0
	mov	r3, #43
	strb	r3, [sp, #103]
	.loc 1 87 0
	ldr	r3, [sp, #0]
	sub	r3, r3, #1
	str	r3, [sp, #0]
	b	.L19
.L21:
	.loc 1 89 0
	ldr	r3, [sp, #116]
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L19
	.loc 1 91 0
	mov	r3, #32
	strb	r3, [sp, #103]
	.loc 1 92 0
	ldr	r3, [sp, #0]
	sub	r3, r3, #1
	str	r3, [sp, #0]
.L19:
	.loc 1 96 0
	ldr	r3, [sp, #116]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L22
	.loc 1 98 0
	ldr	r3, [sp, #4]
	cmp	r3, #16
	bne	.L23
	.loc 1 99 0
	ldr	r3, [sp, #0]
	sub	r3, r3, #2
	str	r3, [sp, #0]
	b	.L22
.L23:
	.loc 1 100 0
	ldr	r3, [sp, #4]
	cmp	r3, #8
	bne	.L22
	.loc 1 101 0
	ldr	r3, [sp, #0]
	sub	r3, r3, #1
	str	r3, [sp, #0]
.L22:
	.loc 1 104 0
	mov	r3, #0
	str	r3, [sp, #92]
	.loc 1 105 0
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L26
	.loc 1 107 0
	mvn	r3, #87
	ldr	r2, [sp, #92]
	add	r0, sp, #104
	add	r2, r0, r2
	add	r3, r2, r3
	mov	r2, #48
	strb	r2, [r3, #0]
	ldr	r3, [sp, #92]
	add	r3, r3, #1
	str	r3, [sp, #92]
	b	.L25
.L27:
.LBB2:
	.loc 1 112 0
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #4]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [sp, #84]
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #4]
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_uidiv
	mov	r3, r0
	str	r3, [sp, #8]
	ldr	r3, [sp, #84]
.LBE2:
	ldr	r2, [sp, #96]
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	mvn	r3, #87
	ldr	r1, [sp, #92]
	add	r0, sp, #104
	add	r1, r0, r1
	add	r3, r1, r3
	strb	r2, [r3, #0]
	ldr	r3, [sp, #92]
	add	r3, r3, #1
	str	r3, [sp, #92]
.L26:
	.loc 1 111 0 discriminator 1
	ldr	r3, [sp, #8]
	cmp	r3, #0
	bne	.L27
.L25:
	.loc 1 115 0
	ldr	r2, [sp, #92]
	ldr	r3, [sp, #112]
	cmp	r2, r3
	ble	.L28
	.loc 1 116 0
	ldr	r3, [sp, #92]
	str	r3, [sp, #112]
.L28:
	.loc 1 118 0
	ldr	r2, [sp, #0]
	ldr	r3, [sp, #112]
	rsb	r3, r3, r2
	str	r3, [sp, #0]
	.loc 1 120 0
	ldr	r3, [sp, #116]
	and	r3, r3, #17
	cmp	r3, #0
	bne	.L29
	.loc 1 121 0
	b	.L30
.L31:
	.loc 1 122 0
	ldr	r3, [sp, #12]
	mov	r2, #32
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
.L30:
	.loc 1 121 0 discriminator 1
	ldr	r3, [sp, #0]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	ldr	r2, [sp, #0]
	sub	r2, r2, #1
	str	r2, [sp, #0]
	cmp	r3, #0
	bne	.L31
.L29:
	.loc 1 124 0
	ldrb	r3, [sp, #103]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L32
	.loc 1 125 0
	ldr	r3, [sp, #12]
	ldrb	r2, [sp, #103]
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
.L32:
	.loc 1 127 0
	ldr	r3, [sp, #116]
	and	r3, r3, #32
	cmp	r3, #0
	beq	.L33
	.loc 1 129 0
	ldr	r3, [sp, #4]
	cmp	r3, #8
	bne	.L34
	.loc 1 130 0
	ldr	r3, [sp, #12]
	mov	r2, #48
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
	b	.L33
.L34:
	.loc 1 131 0
	ldr	r3, [sp, #4]
	cmp	r3, #16
	bne	.L33
	.loc 1 133 0
	ldr	r3, [sp, #12]
	mov	r2, #48
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
	.loc 1 134 0
	ldr	r3, [sp, #96]
	ldrb	r2, [r3, #33]	@ zero_extendqisi2
	ldr	r3, [sp, #12]
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
.L33:
	.loc 1 137 0
	ldr	r3, [sp, #116]
	and	r3, r3, #16
	cmp	r3, #0
	bne	.L45
	.loc 1 138 0
	b	.L36
.L37:
	.loc 1 139 0
	ldr	r3, [sp, #12]
	ldrb	r2, [sp, #91]
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
.L36:
	.loc 1 138 0 discriminator 1
	ldr	r3, [sp, #0]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	ldr	r2, [sp, #0]
	sub	r2, r2, #1
	str	r2, [sp, #0]
	cmp	r3, #0
	bne	.L37
	.loc 1 141 0
	b	.L45
.L39:
	.loc 1 142 0
	ldr	r3, [sp, #12]
	mov	r2, #48
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
	b	.L38
.L45:
	.loc 1 141 0
	mov	r0, r0	@ nop
.L38:
	.loc 1 141 0 is_stmt 0 discriminator 1
	ldr	r2, [sp, #112]
	ldr	r3, [sp, #92]
	cmp	r2, r3
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	ldr	r2, [sp, #112]
	sub	r2, r2, #1
	str	r2, [sp, #112]
	cmp	r3, #0
	bne	.L39
	.loc 1 144 0 is_stmt 1
	b	.L40
.L41:
	.loc 1 145 0
	mvn	r3, #87
	ldr	r2, [sp, #92]
	add	r1, sp, #104
	add	r2, r1, r2
	add	r3, r2, r3
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [sp, #12]
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
.L40:
	.loc 1 144 0 discriminator 1
	ldr	r3, [sp, #92]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	ldr	r2, [sp, #92]
	sub	r2, r2, #1
	str	r2, [sp, #92]
	cmp	r3, #0
	bne	.L41
	.loc 1 147 0
	b	.L42
.L43:
	.loc 1 148 0
	ldr	r3, [sp, #12]
	mov	r2, #32
	strb	r2, [r3, #0]
	ldr	r3, [sp, #12]
	add	r3, r3, #1
	str	r3, [sp, #12]
.L42:
	.loc 1 147 0 discriminator 1
	ldr	r3, [sp, #0]
	cmp	r3, #0
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	ldr	r2, [sp, #0]
	sub	r2, r2, #1
	str	r2, [sp, #0]
	cmp	r3, #0
	bne	.L43
	.loc 1 150 0
	ldr	r3, [sp, #12]
.L44:
	.loc 1 151 0
	mov	r0, r3
	add	sp, sp, #108
	ldmfd	sp!, {pc}
	.cfi_endproc
.LFE2:
	.size	number, .-number
	.section	.rodata
	.align	2
.LC2:
	.ascii	"<NULL>\000"
	.text
	.align	2
	.type	vsprintf_1, %function
vsprintf_1:
.LFB3:
	.loc 1 155 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
.LCFI4:
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #76
.LCFI5:
	.cfi_def_cfa_offset 80
	str	r0, [sp, #20]
	str	r1, [sp, #16]
	str	r2, [sp, #12]
	.loc 1 169 0
	ldr	r3, [sp, #20]
	str	r3, [sp, #56]
	b	.L47
.L100:
	.loc 1 170 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #37
	beq	.L48
	.loc 1 171 0
	ldr	r3, [sp, #16]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [sp, #56]
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
	.loc 1 172 0
	b	.L49
.L48:
	.loc 1 176 0
	mov	r3, #0
	str	r3, [sp, #48]
.L50:
	.loc 1 178 0
	ldr	r3, [sp, #16]
	add	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 179 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #32
	cmp	r3, #16
	ldrls	pc, [pc, r3, asl #2]
	b	.L51
.L57:
	.word	.L52
	.word	.L51
	.word	.L51
	.word	.L53
	.word	.L51
	.word	.L51
	.word	.L51
	.word	.L51
	.word	.L51
	.word	.L51
	.word	.L51
	.word	.L54
	.word	.L51
	.word	.L55
	.word	.L51
	.word	.L51
	.word	.L56
.L55:
	.loc 1 180 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #16
	str	r3, [sp, #48]
	b	.L50
.L54:
	.loc 1 181 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #4
	str	r3, [sp, #48]
	b	.L50
.L52:
	.loc 1 182 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #8
	str	r3, [sp, #48]
	b	.L50
.L53:
	.loc 1 183 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #32
	str	r3, [sp, #48]
	b	.L50
.L56:
	.loc 1 184 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #1
	str	r3, [sp, #48]
	b	.L50
.L51:
	.loc 1 188 0
	mvn	r3, #0
	str	r3, [sp, #44]
	.loc 1 189 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L58
	.loc 1 189 0 is_stmt 0 discriminator 1
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L58
	.loc 1 190 0 is_stmt 1
	add	r3, sp, #16
	mov	r0, r3
	bl	skip_atoi
	str	r0, [sp, #44]
	b	.L59
.L58:
	.loc 1 191 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #42
	bne	.L59
	.loc 1 192 0
	ldr	r3, [sp, #16]
	add	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 194 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	str	r3, [sp, #44]
	.loc 1 195 0
	ldr	r3, [sp, #44]
	cmp	r3, #0
	bge	.L59
	.loc 1 196 0
	ldr	r3, [sp, #44]
	rsb	r3, r3, #0
	str	r3, [sp, #44]
	.loc 1 197 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #16
	str	r3, [sp, #48]
.L59:
	.loc 1 202 0
	mvn	r3, #0
	str	r3, [sp, #40]
	.loc 1 203 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L60
	.loc 1 204 0
	ldr	r3, [sp, #16]
	add	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 205 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #47
	bls	.L61
	.loc 1 205 0 is_stmt 0 discriminator 1
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #57
	bhi	.L61
	.loc 1 206 0 is_stmt 1
	add	r3, sp, #16
	mov	r0, r3
	bl	skip_atoi
	str	r0, [sp, #40]
	b	.L62
.L61:
	.loc 1 207 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #42
	bne	.L62
	.loc 1 208 0
	ldr	r3, [sp, #16]
	add	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 210 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	str	r3, [sp, #40]
.L62:
	.loc 1 212 0
	ldr	r3, [sp, #40]
	cmp	r3, #0
	bge	.L60
	.loc 1 213 0
	mov	r3, #0
	str	r3, [sp, #40]
.L60:
	.loc 1 217 0
	mvn	r3, #0
	str	r3, [sp, #36]
	.loc 1 218 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #104
	beq	.L63
	.loc 1 218 0 is_stmt 0 discriminator 1
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #108
	beq	.L63
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #76
	bne	.L64
.L63:
	.loc 1 219 0 is_stmt 1
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	str	r3, [sp, #36]
	.loc 1 220 0
	ldr	r3, [sp, #16]
	add	r3, r3, #1
	str	r3, [sp, #16]
.L64:
	.loc 1 224 0
	mov	r3, #10
	str	r3, [sp, #60]
	.loc 1 226 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	sub	r3, r3, #37
	cmp	r3, #83
	ldrls	pc, [pc, r3, asl #2]
	b	.L65
.L76:
	.word	.L66
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L67
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L68
	.word	.L69
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L69
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L65
	.word	.L70
	.word	.L71
	.word	.L72
	.word	.L65
	.word	.L65
	.word	.L73
	.word	.L65
	.word	.L102
	.word	.L65
	.word	.L65
	.word	.L75
.L68:
	.loc 1 228 0
	ldr	r3, [sp, #48]
	and	r3, r3, #16
	cmp	r3, #0
	bne	.L77
	.loc 1 229 0
	b	.L78
.L79:
	.loc 1 230 0
	ldr	r3, [sp, #56]
	mov	r2, #32
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
.L78:
	.loc 1 229 0 discriminator 1
	ldr	r3, [sp, #44]
	sub	r3, r3, #1
	str	r3, [sp, #44]
	ldr	r3, [sp, #44]
	cmp	r3, #0
	bgt	.L79
.L77:
	.loc 1 231 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	uxtb	r2, r3
	ldr	r3, [sp, #56]
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
	.loc 1 232 0
	b	.L80
.L81:
	.loc 1 233 0
	ldr	r3, [sp, #56]
	mov	r2, #32
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
.L80:
	.loc 1 232 0 discriminator 1
	ldr	r3, [sp, #44]
	sub	r3, r3, #1
	str	r3, [sp, #44]
	ldr	r3, [sp, #44]
	cmp	r3, #0
	bgt	.L81
	.loc 1 234 0
	b	.L49
.L73:
	.loc 1 237 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	str	r3, [sp, #52]
	.loc 1 238 0
	ldr	r3, [sp, #52]
	cmp	r3, #0
	bne	.L82
	.loc 1 239 0
	movw	r3, #:lower16:.LC2
	movt	r3, #:upper16:.LC2
	str	r3, [sp, #52]
.L82:
	.loc 1 241 0
	ldr	r3, [sp, #40]
	ldr	r0, [sp, #52]
	mov	r1, r3
	bl	strnlen
	mov	r3, r0
	str	r3, [sp, #32]
	.loc 1 243 0
	ldr	r3, [sp, #48]
	and	r3, r3, #16
	cmp	r3, #0
	bne	.L83
	.loc 1 244 0
	b	.L84
.L85:
	.loc 1 245 0
	ldr	r3, [sp, #56]
	mov	r2, #32
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
.L84:
	.loc 1 244 0 discriminator 1
	ldr	r2, [sp, #44]
	ldr	r3, [sp, #32]
	cmp	r2, r3
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	ldr	r2, [sp, #44]
	sub	r2, r2, #1
	str	r2, [sp, #44]
	cmp	r3, #0
	bne	.L85
.L83:
	.loc 1 246 0
	mov	r3, #0
	str	r3, [sp, #64]
	b	.L86
.L87:
	.loc 1 247 0 discriminator 2
	ldr	r3, [sp, #52]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [sp, #56]
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
	ldr	r3, [sp, #52]
	add	r3, r3, #1
	str	r3, [sp, #52]
	.loc 1 246 0 discriminator 2
	ldr	r3, [sp, #64]
	add	r3, r3, #1
	str	r3, [sp, #64]
.L86:
	.loc 1 246 0 is_stmt 0 discriminator 1
	ldr	r2, [sp, #64]
	ldr	r3, [sp, #32]
	cmp	r2, r3
	blt	.L87
	.loc 1 248 0 is_stmt 1
	b	.L88
.L89:
	.loc 1 249 0
	ldr	r3, [sp, #56]
	mov	r2, #32
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
.L88:
	.loc 1 248 0 discriminator 1
	ldr	r2, [sp, #44]
	ldr	r3, [sp, #32]
	cmp	r2, r3
	movle	r3, #0
	movgt	r3, #1
	uxtb	r3, r3
	ldr	r2, [sp, #44]
	sub	r2, r2, #1
	str	r2, [sp, #44]
	cmp	r3, #0
	bne	.L89
	.loc 1 250 0
	b	.L49
.L72:
	.loc 1 253 0
	ldr	r3, [sp, #44]
	cmn	r3, #1
	bne	.L90
	.loc 1 254 0
	mov	r3, #8
	str	r3, [sp, #44]
	.loc 1 255 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #1
	str	r3, [sp, #48]
.L90:
	.loc 1 258 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	.loc 1 257 0
	ldr	r2, [sp, #40]
	str	r2, [sp, #0]
	ldr	r2, [sp, #48]
	str	r2, [sp, #4]
	ldr	r0, [sp, #56]
	mov	r1, r3
	mov	r2, #16
	ldr	r3, [sp, #44]
	bl	number
	str	r0, [sp, #56]
	.loc 1 260 0
	b	.L49
.L70:
	.loc 1 264 0
	ldr	r3, [sp, #36]
	cmp	r3, #108
	bne	.L91
.LBB3:
	.loc 1 265 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	str	r3, [sp, #28]
	.loc 1 266 0
	ldr	r2, [sp, #56]
	ldr	r3, [sp, #20]
	rsb	r2, r3, r2
	ldr	r3, [sp, #28]
	str	r2, [r3, #0]
.LBE3:
	.loc 1 271 0
	b	.L49
.L91:
.LBB4:
	.loc 1 268 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	str	r3, [sp, #24]
	.loc 1 269 0
	ldr	r2, [sp, #56]
	ldr	r3, [sp, #20]
	rsb	r2, r3, r2
	ldr	r3, [sp, #24]
	str	r2, [r3, #0]
.LBE4:
	.loc 1 271 0
	b	.L49
.L66:
	.loc 1 274 0
	ldr	r3, [sp, #56]
	mov	r2, #37
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
	.loc 1 275 0
	b	.L49
.L71:
	.loc 1 279 0
	mov	r3, #8
	str	r3, [sp, #60]
	.loc 1 280 0
	b	.L93
.L67:
	.loc 1 283 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #64
	str	r3, [sp, #48]
.L75:
	.loc 1 285 0
	mov	r3, #16
	str	r3, [sp, #60]
	.loc 1 286 0
	b	.L93
.L69:
	.loc 1 290 0
	ldr	r3, [sp, #48]
	orr	r3, r3, #2
	str	r3, [sp, #48]
	.loc 1 292 0
	b	.L102
.L65:
	.loc 1 295 0
	ldr	r3, [sp, #56]
	mov	r2, #37
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
	.loc 1 296 0
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L94
	.loc 1 297 0
	ldr	r3, [sp, #16]
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [sp, #56]
	strb	r2, [r3, #0]
	ldr	r3, [sp, #56]
	add	r3, r3, #1
	str	r3, [sp, #56]
	.loc 1 300 0
	b	.L49
.L94:
	.loc 1 299 0
	ldr	r3, [sp, #16]
	sub	r3, r3, #1
	str	r3, [sp, #16]
	.loc 1 300 0
	b	.L49
.L102:
	.loc 1 292 0
	mov	r0, r0	@ nop
.L93:
	.loc 1 302 0
	ldr	r3, [sp, #36]
	cmp	r3, #108
	bne	.L96
	.loc 1 303 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	str	r3, [sp, #68]
	b	.L97
.L96:
	.loc 1 304 0
	ldr	r3, [sp, #36]
	cmp	r3, #104
	bne	.L98
	.loc 1 305 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	uxth	r3, r3
	str	r3, [sp, #68]
	.loc 1 306 0
	ldr	r3, [sp, #48]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L97
	.loc 1 307 0
	ldr	r3, [sp, #68]
	uxth	r3, r3
	sxth	r3, r3
	str	r3, [sp, #68]
	b	.L97
.L98:
	.loc 1 308 0
	ldr	r3, [sp, #48]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L99
	.loc 1 309 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	str	r3, [sp, #68]
	b	.L97
.L99:
	.loc 1 311 0
	ldr	r3, [sp, #12]
	add	r2, r3, #4
	str	r2, [sp, #12]
	ldr	r3, [r3, #0]
	str	r3, [sp, #68]
.L97:
	.loc 1 312 0
	ldr	r3, [sp, #68]
	ldr	r2, [sp, #40]
	str	r2, [sp, #0]
	ldr	r2, [sp, #48]
	str	r2, [sp, #4]
	ldr	r0, [sp, #56]
	mov	r1, r3
	ldr	r2, [sp, #60]
	ldr	r3, [sp, #44]
	bl	number
	str	r0, [sp, #56]
.L49:
	.loc 1 169 0
	ldr	r3, [sp, #16]
	add	r3, r3, #1
	str	r3, [sp, #16]
.L47:
	.loc 1 169 0 is_stmt 0 discriminator 1
	ldr	r3, [sp, #16]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L100
	.loc 1 314 0 is_stmt 1
	ldr	r3, [sp, #56]
	mov	r2, #0
	strb	r2, [r3, #0]
	.loc 1 315 0
	ldr	r2, [sp, #56]
	ldr	r3, [sp, #20]
	rsb	r3, r3, r2
	.loc 1 316 0
	mov	r0, r3
	add	sp, sp, #76
	ldmfd	sp!, {pc}
	.cfi_endproc
.LFE3:
	.size	vsprintf_1, .-vsprintf_1
	.align	2
	.global	serial_printf
	.type	serial_printf, %function
serial_printf:
.LFB4:
	.loc 1 319 0
	.cfi_startproc
	@ args = 4, pretend = 16, frame = 264
	@ frame_needed = 0, uses_anonymous_args = 1
	stmfd	sp!, {r0, r1, r2, r3}
.LCFI6:
	.cfi_def_cfa_offset 16
	.cfi_offset 0, -16
	.cfi_offset 1, -12
	.cfi_offset 2, -8
	.cfi_offset 3, -4
	str	lr, [sp, #-4]!
.LCFI7:
	.cfi_def_cfa_offset 20
	.cfi_offset 14, -20
	sub	sp, sp, #268
.LCFI8:
	.cfi_def_cfa_offset 288
	.loc 1 324 0
	add	r3, sp, #276
	str	r3, [sp, #256]
	.loc 1 329 0
	mov	r3, sp
	mov	r0, r3
	ldr	r1, [sp, #272]
	ldr	r2, [sp, #256]
	bl	vsprintf_1
	str	r0, [sp, #260]
	.loc 1 333 0
	mov	r3, sp
	mov	r0, r3
	bl	serial_puts
	.loc 1 334 0
	add	sp, sp, #268
	ldr	lr, [sp], #4
	add	sp, sp, #16
	bx	lr
	.cfi_endproc
.LFE4:
	.size	serial_printf, .-serial_printf
	.section	.rodata
	.align	2
.LC3:
	.ascii	"dump memory at 0x%08x, totally %d byte(s), with off"
	.ascii	"set of %lu byte(s)\012\000"
	.align	2
.LC4:
	.ascii	"0x%08x:\011%02x %02x %02x %02x\011%02x %02x %02x %0"
	.ascii	"2x\011%02x %02x %02x %02x\011%02x %02x %02x %02x\012"
	.ascii	"\000"
	.text
	.align	2
	.global	memdump_32
	.type	memdump_32, %function
memdump_32:
.LFB5:
	.loc 1 337 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
.LCFI9:
	.cfi_def_cfa_offset 36
	.cfi_offset 4, -36
	.cfi_offset 5, -32
	.cfi_offset 6, -28
	.cfi_offset 7, -24
	.cfi_offset 8, -20
	.cfi_offset 9, -16
	.cfi_offset 10, -12
	.cfi_offset 11, -8
	.cfi_offset 14, -4
	sub	sp, sp, #108
.LCFI10:
	.cfi_def_cfa_offset 144
	str	r0, [sp, #76]
	str	r1, [sp, #72]
	.loc 1 339 0
	ldr	r3, [sp, #72]
	add	r2, r3, #15
	cmp	r3, #0
	movlt	r3, r2
	mov	r3, r3, asr #4
	str	r3, [sp, #96]
	.loc 1 341 0
	ldr	r3, [sp, #76]
	str	r3, [sp, #92]
	.loc 1 342 0
	ldr	r3, [sp, #92]
	and	r3, r3, #15
	str	r3, [sp, #88]
	.loc 1 343 0
	ldr	r2, [sp, #92]
	ldr	r3, [sp, #88]
	rsb	r3, r3, r2
	str	r3, [sp, #92]
	.loc 1 344 0
	ldr	r3, [sp, #92]
	str	r3, [sp, #84]
	.loc 1 345 0
	ldr	r3, [sp, #76]
	movw	r0, #:lower16:.LC3
	movt	r0, #:upper16:.LC3
	mov	r1, r3
	ldr	r2, [sp, #72]
	ldr	r3, [sp, #88]
	bl	serial_printf
	.loc 1 347 0
	mov	r3, #0
	str	r3, [sp, #100]
	b	.L105
.L106:
	.loc 1 351 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	.loc 1 349 0 discriminator 2
	mov	r2, r3
	ldr	r3, [sp, #92]
	add	r7, r2, r3
	.loc 1 352 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	r6, r3
	.loc 1 352 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #1
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	r5, r3
	.loc 1 352 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #2
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	ip, r3
	.loc 1 352 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #3
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	r4, r3
	.loc 1 353 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #4
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	str	r3, [sp, #68]
	.loc 1 353 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #5
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	str	r3, [sp, #64]
	.loc 1 353 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #6
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	str	r3, [sp, #60]
	.loc 1 353 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #7
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	str	r3, [sp, #56]
	.loc 1 354 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #8
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	fp, r3
	.loc 1 354 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #9
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	r9, r3
	.loc 1 354 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #10
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	sl, r3
	.loc 1 354 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #11
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	r8, r3
	.loc 1 355 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r3, r3, #12
	ldr	r2, [sp, #84]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	lr, r3
	.loc 1 355 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r2, r3, #13
	ldr	r3, [sp, #84]
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	r0, r3
	.loc 1 355 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r2, r3, #14
	ldr	r3, [sp, #84]
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	mov	r1, r3
	.loc 1 355 0 discriminator 2
	ldr	r3, [sp, #100]
	mov	r3, r3, asl #4
	add	r2, r3, #15
	ldr	r3, [sp, #84]
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	.loc 1 349 0 discriminator 2
	str	ip, [sp, #0]
	str	r4, [sp, #4]
	ldr	r2, [sp, #68]
	str	r2, [sp, #8]
	ldr	r2, [sp, #64]
	str	r2, [sp, #12]
	ldr	r2, [sp, #60]
	str	r2, [sp, #16]
	ldr	r2, [sp, #56]
	str	r2, [sp, #20]
	str	fp, [sp, #24]
	str	r9, [sp, #28]
	str	sl, [sp, #32]
	str	r8, [sp, #36]
	str	lr, [sp, #40]
	str	r0, [sp, #44]
	str	r1, [sp, #48]
	str	r3, [sp, #52]
	movw	r0, #:lower16:.LC4
	movt	r0, #:upper16:.LC4
	mov	r1, r7
	mov	r2, r6
	mov	r3, r5
	bl	serial_printf
	.loc 1 347 0 discriminator 2
	ldr	r3, [sp, #100]
	add	r3, r3, #1
	str	r3, [sp, #100]
.L105:
	.loc 1 347 0 is_stmt 0 discriminator 1
	ldr	r2, [sp, #100]
	ldr	r3, [sp, #96]
	cmp	r2, r3
	blt	.L106
	.loc 1 357 0 is_stmt 1
	add	sp, sp, #108
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
	.cfi_endproc
.LFE5:
	.size	memdump_32, .-memdump_32
.Letext0:
	.file 2 "/home/yoda/CodeSourcery/Sourcery_CodeBench_Lite_for_ARM_EABI/bin/../lib/gcc/arm-none-eabi/4.7.3/include/stdarg.h"
	.file 3 "<built-in>"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x40c
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x1
	.4byte	.LASF30
	.4byte	.LASF31
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x28
	.4byte	0x34
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x4
	.byte	0x3
	.byte	0
	.4byte	0x4e
	.uleb128 0x4
	.4byte	.LASF33
	.4byte	0x4e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x66
	.4byte	0x29
	.uleb128 0x6
	.byte	0x1
	.4byte	.LASF34
	.byte	0x1
	.byte	0x19
	.byte	0x1
	.4byte	0xa1
	.4byte	.LFB0
	.4byte	.LFE0
	.4byte	.LLST0
	.byte	0x1
	.4byte	0xa1
	.uleb128 0x7
	.ascii	"s\000"
	.byte	0x1
	.byte	0x19
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x8
	.4byte	.LASF2
	.byte	0x1
	.byte	0x19
	.4byte	0xa1
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.ascii	"sc\000"
	.byte	0x1
	.byte	0x1b
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0xb
	.byte	0x4
	.4byte	0xae
	.uleb128 0xc
	.4byte	0xb3
	.uleb128 0xa
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0xd
	.4byte	.LASF5
	.byte	0x1
	.byte	0x22
	.byte	0x1
	.4byte	0xf0
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LLST1
	.byte	0x1
	.4byte	0xf0
	.uleb128 0x7
	.ascii	"s\000"
	.byte	0x1
	.byte	0x22
	.4byte	0xf7
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x24
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0xb
	.byte	0x4
	.4byte	0xa8
	.uleb128 0xf
	.4byte	.LASF6
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.4byte	0x1ce
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST2
	.byte	0x1
	.4byte	0x1ce
	.uleb128 0x7
	.ascii	"str\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x1ce
	.byte	0x3
	.byte	0x91
	.sleb128 -100
	.uleb128 0x7
	.ascii	"num\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x1d4
	.byte	0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x8
	.4byte	.LASF7
	.byte	0x1
	.byte	0x39
	.4byte	0xf0
	.byte	0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x8
	.4byte	.LASF8
	.byte	0x1
	.byte	0x39
	.4byte	0xf0
	.byte	0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x8
	.4byte	.LASF9
	.byte	0x1
	.byte	0x39
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x39
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x9
	.ascii	"c\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0xb3
	.byte	0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x10
	.4byte	.LASF11
	.byte	0x1
	.byte	0x3c
	.4byte	0xb3
	.byte	0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x9
	.ascii	"tmp\000"
	.byte	0x1
	.byte	0x3c
	.4byte	0x1db
	.byte	0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x10
	.4byte	.LASF12
	.byte	0x1
	.byte	0x3d
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x3e
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x11
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x10
	.4byte	.LASF13
	.byte	0x1
	.byte	0x70
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xb3
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x12
	.4byte	0xb3
	.4byte	0x1eb
	.uleb128 0x13
	.4byte	0x1eb
	.byte	0x41
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0xf
	.4byte	.LASF16
	.byte	0x1
	.byte	0x9a
	.byte	0x1
	.4byte	0xf0
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LLST3
	.byte	0x1
	.4byte	0x302
	.uleb128 0x7
	.ascii	"buf\000"
	.byte	0x1
	.byte	0x9a
	.4byte	0x1ce
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x7
	.ascii	"fmt\000"
	.byte	0x1
	.byte	0x9a
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x1
	.byte	0x9a
	.4byte	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x9
	.ascii	"len\000"
	.byte	0x1
	.byte	0x9c
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x9
	.ascii	"num\000"
	.byte	0x1
	.byte	0x9d
	.4byte	0x302
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9e
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x10
	.4byte	.LASF7
	.byte	0x1
	.byte	0x9e
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"str\000"
	.byte	0x1
	.byte	0x9f
	.4byte	0x1ce
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"s\000"
	.byte	0x1
	.byte	0xa0
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x1
	.byte	0xa2
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x10
	.4byte	.LASF19
	.byte	0x1
	.byte	0xa4
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x10
	.4byte	.LASF9
	.byte	0x1
	.byte	0xa5
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x10
	.4byte	.LASF20
	.byte	0x1
	.byte	0xa7
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	.LASF35
	.byte	0x1
	.byte	0xb1
	.4byte	.L50
	.uleb128 0x15
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	0x2e9
	.uleb128 0x16
	.ascii	"ip\000"
	.byte	0x1
	.2byte	0x109
	.4byte	0x309
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x11
	.4byte	.LBB4
	.4byte	.LBE4
	.uleb128 0x16
	.ascii	"ip\000"
	.byte	0x1
	.2byte	0x10c
	.4byte	0x30f
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF21
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1d4
	.uleb128 0xb
	.byte	0x4
	.4byte	0xf0
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF23
	.byte	0x1
	.2byte	0x13e
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LLST4
	.byte	0x1
	.4byte	0x36d
	.uleb128 0x18
	.ascii	"fmt\000"
	.byte	0x1
	.2byte	0x13e
	.4byte	0xa8
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x19
	.uleb128 0x1a
	.4byte	.LASF17
	.byte	0x1
	.2byte	0x140
	.4byte	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x141
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1a
	.4byte	.LASF22
	.byte	0x1
	.2byte	0x142
	.4byte	0x36d
	.byte	0x3
	.byte	0x91
	.sleb128 -288
	.byte	0
	.uleb128 0x12
	.4byte	0xb3
	.4byte	0x37d
	.uleb128 0x13
	.4byte	0x1eb
	.byte	0xff
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.4byte	.LASF24
	.byte	0x1
	.2byte	0x150
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LLST5
	.byte	0x1
	.4byte	0x402
	.uleb128 0x18
	.ascii	"mem\000"
	.byte	0x1
	.2byte	0x150
	.4byte	0x4e
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1b
	.4byte	.LASF8
	.byte	0x1
	.2byte	0x150
	.4byte	0xf0
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x16
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x152
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x1a
	.4byte	.LASF25
	.byte	0x1
	.2byte	0x153
	.4byte	0xf0
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.ascii	"ptr\000"
	.byte	0x1
	.2byte	0x154
	.4byte	0x402
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x1a
	.4byte	.LASF26
	.byte	0x1
	.2byte	0x155
	.4byte	0x302
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1a
	.4byte	.LASF27
	.byte	0x1
	.2byte	0x156
	.4byte	0x302
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x408
	.uleb128 0xa
	.byte	0x1
	.byte	0x8
	.4byte	.LASF28
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x2119
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.uleb128 0x34
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB0-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI0-.Ltext0
	.4byte	.LFE0-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LFB1-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI1-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LFB2-.Ltext0
	.4byte	.LCFI2-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI2-.Ltext0
	.4byte	.LCFI3-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 4
	.4byte	.LCFI3-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 112
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LFB3-.Ltext0
	.4byte	.LCFI4-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI4-.Ltext0
	.4byte	.LCFI5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 4
	.4byte	.LCFI5-.Ltext0
	.4byte	.LFE3-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 80
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LFB4-.Ltext0
	.4byte	.LCFI6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI6-.Ltext0
	.4byte	.LCFI7-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	.LCFI7-.Ltext0
	.4byte	.LCFI8-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 20
	.4byte	.LCFI8-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 288
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LFB5-.Ltext0
	.4byte	.LCFI9-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI9-.Ltext0
	.4byte	.LCFI10-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 36
	.4byte	.LCFI10-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x3
	.byte	0x7d
	.sleb128 144
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_macro,"",%progbits
.Ldebug_macro0:
	.2byte	0x4
	.byte	0x2
	.4byte	.Ldebug_line0
	.byte	0x7
	.4byte	.Ldebug_macro1
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x2
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.file 4 "../Console/include/bbconsole.h"
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF44
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.1.7d8db4a0b8d2a7544d284f36ea7bdab6,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF82
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF87
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF89
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF90
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF91
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF95
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF97
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF99
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF107
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF109
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF110
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF111
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF113
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF114
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF115
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF116
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF117
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF118
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF119
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF120
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF121
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF122
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF124
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF125
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF126
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF127
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF128
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF129
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF130
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF131
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF132
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF133
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF134
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF135
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF136
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF137
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF138
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF139
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF140
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF141
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF142
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF143
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF144
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF145
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF146
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF147
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF148
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF149
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF150
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF151
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF152
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF153
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF154
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF155
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF156
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF157
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF158
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF159
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF160
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF161
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF162
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF163
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF164
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF165
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF166
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF167
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF168
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF169
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF170
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF171
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF172
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF173
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF174
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF175
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF176
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF177
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF178
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF179
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF180
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF181
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF182
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF183
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF184
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF185
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF186
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF187
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF188
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF189
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF190
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF191
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF192
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF193
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF194
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF195
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF196
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF197
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF198
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF199
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF200
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF201
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF202
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF203
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF204
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF205
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF206
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF207
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF208
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF209
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF210
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF211
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF212
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF213
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF214
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF215
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF216
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF217
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF218
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF219
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF220
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF221
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF222
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF223
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF224
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF225
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF226
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF227
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF228
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF229
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF230
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF231
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF232
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF233
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF234
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF235
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF236
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF237
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF238
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF239
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF240
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF241
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF242
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF243
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF244
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF245
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF246
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF247
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF248
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF249
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF250
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF251
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF252
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF253
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF254
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF255
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF256
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF257
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF258
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF259
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF260
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF261
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF262
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF263
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF264
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF265
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF266
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF267
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF268
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF269
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF270
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF271
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF272
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF273
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF274
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF275
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF276
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF277
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF278
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF279
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF280
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF281
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF282
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF283
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF284
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF285
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF286
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF287
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF288
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF289
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF290
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF291
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF292
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF293
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF294
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF295
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF296
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF297
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF298
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF299
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF300
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF301
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF302
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF303
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF304
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF305
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF306
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF307
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF308
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF309
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF310
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF311
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF312
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF313
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF314
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF315
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF316
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF317
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF318
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF319
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF320
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF321
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF322
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF323
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF324
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF325
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF326
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF327
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF328
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF329
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF330
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF331
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF332
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF333
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF334
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF335
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF336
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF337
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF338
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF339
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF340
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF341
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF342
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF343
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF344
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF345
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF346
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF347
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF348
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF349
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF350
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF351
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF352
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF353
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0
	.4byte	.LASF387
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stdarg.h.31.b70f21342353634f7b44d85f85f13832,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF389
	.byte	0x6
	.uleb128 0x22
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF401
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.bbconsole.h.28.7449ccf8ddab819fc93c6e4504c0fe24,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF412
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF416
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF214:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF119:
	.ascii	"__PTRDIFF_MAX__ 2147483647\000"
.LASF114:
	.ascii	"__LONG_LONG_MAX__ 9223372036854775807LL\000"
.LASF219:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF115:
	.ascii	"__WCHAR_MAX__ 4294967295U\000"
.LASF161:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF218:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF135:
	.ascii	"__INT_LEAST8_MAX__ 127\000"
.LASF127:
	.ascii	"__INT8_MAX__ 127\000"
.LASF144:
	.ascii	"__UINT8_C(c) c\000"
.LASF129:
	.ascii	"__INT32_MAX__ 2147483647L\000"
.LASF308:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF324:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF398:
	.ascii	"_VA_LIST \000"
.LASF171:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF180:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF141:
	.ascii	"__INT_LEAST64_MAX__ 9223372036854775807LL\000"
.LASF18:
	.ascii	"flags\000"
.LASF366:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF29:
	.ascii	"GNU C 4.7.3\000"
.LASF185:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF234:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF30:
	.ascii	"../Console/printf.c\000"
.LASF40:
	.ascii	"SPACE 8\000"
.LASF48:
	.ascii	"__GNUC_MINOR__ 7\000"
.LASF3:
	.ascii	"unsigned int\000"
.LASF36:
	.ascii	"is_digit(c) ((c) >= '0' && (c) <= '9')\000"
.LASF146:
	.ascii	"__UINT16_C(c) c\000"
.LASF20:
	.ascii	"qualifier\000"
.LASF65:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF80:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF34:
	.ascii	"strnlen\000"
.LASF64:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF47:
	.ascii	"__GNUC__ 4\000"
.LASF69:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF265:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF223:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF368:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF341:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF178:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF98:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF25:
	.ascii	"line\000"
.LASF54:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF400:
	.ascii	"_VA_LIST_T_H \000"
.LASF75:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF347:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF84:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF211:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF193:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF298:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF52:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF138:
	.ascii	"__INT16_C(c) c\000"
.LASF61:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF343:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF124:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF17:
	.ascii	"args\000"
.LASF71:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF143:
	.ascii	"__UINT_LEAST8_MAX__ 255\000"
.LASF248:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF384:
	.ascii	"GCC_OMAP3_BeagleBoard 1\000"
.LASF95:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF160:
	.ascii	"__UINTPTR_MAX__ 4294967295U\000"
.LASF226:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF263:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF51:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF289:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF305:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF294:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF372:
	.ascii	"__ARMEL__ 1\000"
.LASF155:
	.ascii	"__UINT_FAST8_MAX__ 4294967295U\000"
.LASF340:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF134:
	.ascii	"__UINT64_MAX__ 18446744073709551615ULL\000"
.LASF102:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF136:
	.ascii	"__INT8_C(c) c\000"
.LASF37:
	.ascii	"ZEROPAD 1\000"
.LASF120:
	.ascii	"__SIZE_MAX__ 4294967295U\000"
.LASF304:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF108:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF348:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF330:
	.ascii	"__SA_IBIT__ 16\000"
.LASF260:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF165:
	.ascii	"__FLT_DIG__ 6\000"
.LASF187:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF405:
	.ascii	"OMAP34XX_UART3 (DM3730_L4_PERIPHERAL+0x20000)\000"
.LASF331:
	.ascii	"__DA_FBIT__ 31\000"
.LASF397:
	.ascii	"_VA_LIST_ \000"
.LASF381:
	.ascii	"__USES_INITFINI__ 1\000"
.LASF7:
	.ascii	"base\000"
.LASF2:
	.ascii	"count\000"
.LASF209:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF276:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF295:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF245:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF230:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF378:
	.ascii	"__ARM_EABI__ 1\000"
.LASF221:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF386:
	.ascii	"__CS_SOURCERYGXX_MIN__ 5\000"
.LASF256:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF93:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF153:
	.ascii	"__INT_FAST32_MAX__ 2147483647\000"
.LASF253:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF326:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF174:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF414:
	.ascii	"CFG_PBSIZE 256\000"
.LASF264:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF191:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF284:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF251:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF99:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF104:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF12:
	.ascii	"digits\000"
.LASF267:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF186:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF217:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF239:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF358:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF286:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF278:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF202:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF387:
	.ascii	"__CS_SOURCERYGXX_REV__ 23\000"
.LASF272:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF68:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF367:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF229:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF338:
	.ascii	"__USA_IBIT__ 16\000"
.LASF258:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF220:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF369:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF0:
	.ascii	"__gnuc_va_list\000"
.LASF388:
	.ascii	"_STDARG_H \000"
.LASF62:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF148:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF208:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF11:
	.ascii	"sign\000"
.LASF379:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF27:
	.ascii	"offset\000"
.LASF332:
	.ascii	"__DA_IBIT__ 32\000"
.LASF67:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF288:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF137:
	.ascii	"__INT_LEAST16_MAX__ 32767\000"
.LASF235:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF410:
	.ascii	"CFG_NS16550_COM3 OMAP34XX_UART3\000"
.LASF299:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF109:
	.ascii	"__GXX_ABI_VERSION 1002\000"
.LASF407:
	.ascii	"CFG_NS16550_SERIAL \000"
.LASF43:
	.ascii	"LARGE 64\000"
.LASF271:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF38:
	.ascii	"SIGN 2\000"
.LASF100:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF88:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF353:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF320:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF91:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF399:
	.ascii	"_VA_LIST_DEFINED \000"
.LASF86:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF169:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF94:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF300:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF409:
	.ascii	"CFG_NS16550_CLK 48000000\000"
.LASF16:
	.ascii	"vsprintf_1\000"
.LASF301:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF346:
	.ascii	"__NO_INLINE__ 1\000"
.LASF254:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF164:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF322:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF350:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF283:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF162:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF181:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF273:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF133:
	.ascii	"__UINT32_MAX__ 4294967295UL\000"
.LASF375:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF237:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF103:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF277:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF356:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF293:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF257:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF35:
	.ascii	"repeat\000"
.LASF337:
	.ascii	"__USA_FBIT__ 16\000"
.LASF53:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF76:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF382:
	.ascii	"DEBUG 1\000"
.LASF139:
	.ascii	"__INT_LEAST32_MAX__ 2147483647L\000"
.LASF210:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF247:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF92:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF149:
	.ascii	"__UINT_LEAST64_MAX__ 18446744073709551615ULL\000"
.LASF179:
	.ascii	"__DBL_DIG__ 15\000"
.LASF354:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF287:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF246:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF172:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF359:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF281:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF1:
	.ascii	"va_list\000"
.LASF325:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF128:
	.ascii	"__INT16_MAX__ 32767\000"
.LASF66:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF352:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF199:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF57:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF270:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF370:
	.ascii	"__arm__ 1\000"
.LASF192:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF316:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF335:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF111:
	.ascii	"__SHRT_MAX__ 32767\000"
.LASF147:
	.ascii	"__UINT_LEAST32_MAX__ 4294967295UL\000"
.LASF380:
	.ascii	"__ELF__ 1\000"
.LASF361:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF363:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF242:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF212:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF33:
	.ascii	"__ap\000"
.LASF176:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF45:
	.ascii	"__STDC__ 1\000"
.LASF59:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF345:
	.ascii	"__GNUC_GNU_INLINE__ 1\000"
.LASF56:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF394:
	.ascii	"va_arg(v,l) __builtin_va_arg(v,l)\000"
.LASF77:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF159:
	.ascii	"__INTPTR_MAX__ 2147483647\000"
.LASF408:
	.ascii	"CFG_NS16550_REG_SIZE -4\000"
.LASF395:
	.ascii	"va_copy(d,s) __builtin_va_copy(d,s)\000"
.LASF252:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF8:
	.ascii	"size\000"
.LASF396:
	.ascii	"__va_copy(d,s) __builtin_va_copy(d,s)\000"
.LASF279:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF39:
	.ascii	"PLUS 4\000"
.LASF63:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF49:
	.ascii	"__GNUC_PATCHLEVEL__ 3\000"
.LASF240:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF118:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF292:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF244:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF238:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF200:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF333:
	.ascii	"__TA_FBIT__ 63\000"
.LASF204:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF106:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF44:
	.ascii	"do_div(n,base) ({ int __res; __res = ((unsigned lon"
	.ascii	"g) n) % (unsigned) base; n = ((unsigned long) n) / "
	.ascii	"(unsigned) base; __res; })\000"
.LASF194:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF262:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF365:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF72:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF349:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF243:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF206:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF13:
	.ascii	"__res\000"
.LASF126:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF261:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF390:
	.ascii	"__need___va_list\000"
.LASF197:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF227:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF81:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF377:
	.ascii	"__ARM_PCS 1\000"
.LASF310:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF413:
	.ascii	"CONFIG_BAUDRATE 115200\000"
.LASF97:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF313:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF275:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF296:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF131:
	.ascii	"__UINT8_MAX__ 255\000"
.LASF290:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF9:
	.ascii	"precision\000"
.LASF70:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF312:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF4:
	.ascii	"char\000"
.LASF170:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF385:
	.ascii	"__CS_SOURCERYGXX_MAJ__ 2013\000"
.LASF225:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF391:
	.ascii	"__GNUC_VA_LIST \000"
.LASF117:
	.ascii	"__WINT_MAX__ 4294967295U\000"
.LASF317:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF110:
	.ascii	"__SCHAR_MAX__ 127\000"
.LASF157:
	.ascii	"__UINT_FAST32_MAX__ 4294967295U\000"
.LASF285:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF291:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF215:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF319:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF85:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF14:
	.ascii	"long int\000"
.LASF196:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF311:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF392:
	.ascii	"va_start(v,l) __builtin_va_start(v,l)\000"
.LASF249:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF222:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF41:
	.ascii	"LEFT 16\000"
.LASF205:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF83:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF344:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF23:
	.ascii	"serial_printf\000"
.LASF315:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF236:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF158:
	.ascii	"__UINT_FAST64_MAX__ 18446744073709551615ULL\000"
.LASF329:
	.ascii	"__SA_FBIT__ 15\000"
.LASF303:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF130:
	.ascii	"__INT64_MAX__ 9223372036854775807LL\000"
.LASF232:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF323:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF309:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF156:
	.ascii	"__UINT_FAST16_MAX__ 4294967295U\000"
.LASF336:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF228:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF60:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF318:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF87:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF31:
	.ascii	"/home/yoda/DS-5-Workspace/FreeRTOS2_Baseline/Demo/O"
	.ascii	"MAP3_BeagleBoard_GCC\000"
.LASF393:
	.ascii	"va_end(v) __builtin_va_end(v)\000"
.LASF142:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF173:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF145:
	.ascii	"__UINT_LEAST16_MAX__ 65535\000"
.LASF6:
	.ascii	"number\000"
.LASF89:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF195:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF402:
	.ascii	"__BBCONSOLE_H_ 1\000"
.LASF73:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF389:
	.ascii	"_ANSI_STDARG_H_ \000"
.LASF374:
	.ascii	"__VFP_FP__ 1\000"
.LASF255:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF327:
	.ascii	"__HA_FBIT__ 7\000"
.LASF416:
	.ascii	"getc() serial_getc()\000"
.LASF269:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF125:
	.ascii	"__SIG_ATOMIC_MAX__ 2147483647\000"
.LASF362:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF150:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF32:
	.ascii	"__va_list\000"
.LASF5:
	.ascii	"skip_atoi\000"
.LASF231:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF321:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF328:
	.ascii	"__HA_IBIT__ 8\000"
.LASF21:
	.ascii	"long unsigned int\000"
.LASF280:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF355:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF132:
	.ascii	"__UINT16_MAX__ 65535\000"
.LASF123:
	.ascii	"__UINTMAX_MAX__ 18446744073709551615ULL\000"
.LASF241:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF46:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF121:
	.ascii	"__INTMAX_MAX__ 9223372036854775807LL\000"
.LASF22:
	.ascii	"printbuffer\000"
.LASF411:
	.ascii	"CONFIG_SERIAL1 3\000"
.LASF364:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF373:
	.ascii	"__SOFTFP__ 1\000"
.LASF154:
	.ascii	"__INT_FAST64_MAX__ 9223372036854775807LL\000"
.LASF406:
	.ascii	"CFG_NS16550 \000"
.LASF404:
	.ascii	"DM3730_L4_PERIPHERAL 0x49000000\000"
.LASF360:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 2\000"
.LASF168:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF10:
	.ascii	"type\000"
.LASF152:
	.ascii	"__INT_FAST16_MAX__ 2147483647\000"
.LASF28:
	.ascii	"unsigned char\000"
.LASF207:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF79:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF201:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF107:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF274:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF233:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF403:
	.ascii	"CFG_PRINTF \000"
.LASF105:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF415:
	.ascii	"printf(fmt,args...) serial_printf (fmt , ##args)\000"
.LASF42:
	.ascii	"SPECIAL 32\000"
.LASF314:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF163:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF151:
	.ascii	"__INT_FAST8_MAX__ 2147483647\000"
.LASF74:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF302:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF26:
	.ascii	"addr\000"
.LASF182:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF113:
	.ascii	"__LONG_MAX__ 2147483647L\000"
.LASF357:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF167:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF116:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF190:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF101:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF268:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF177:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF58:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF78:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF122:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF371:
	.ascii	"__APCS_32__ 1\000"
.LASF50:
	.ascii	"__VERSION__ \"4.7.3\"\000"
.LASF188:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF90:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF183:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF24:
	.ascii	"memdump_32\000"
.LASF412:
	.ascii	"CONFIG_CONS_INDEX 3\000"
.LASF334:
	.ascii	"__TA_IBIT__ 64\000"
.LASF307:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF96:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF166:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF224:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF198:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF383:
	.ascii	"RUN_FROM_RAM 1\000"
.LASF140:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF189:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF401:
	.ascii	"__va_list__ \000"
.LASF342:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF250:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF55:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF339:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF19:
	.ascii	"field_width\000"
.LASF297:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF216:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF376:
	.ascii	"__ARM_ARCH_7A__ 1\000"
.LASF112:
	.ascii	"__INT_MAX__ 2147483647\000"
.LASF82:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF259:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF351:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1\000"
.LASF266:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF203:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF306:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF213:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF175:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF282:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF184:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
	.ident	"GCC: (Sourcery CodeBench Lite 2013.05-23) 4.7.3"
