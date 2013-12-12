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
	.file	"comport.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.data
	.align	2
	.type	console, %object
	.size	console, 4
console:
	.word	1224867840
	.text
	.align	2
	.type	calc_divisor, %function
calc_divisor:
.LFB0:
	.file 1 "../Console/comport.c"
	.loc 1 44 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 45 0
	mov	r3, #26
	.loc 1 46 0
	mov	r0, r3
	bx	lr
	.cfi_endproc
.LFE0:
	.size	calc_divisor, .-calc_divisor
	.align	2
	.global	serial_init
	.type	serial_init, %function
serial_init:
.LFB1:
	.loc 1 49 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
.LCFI0:
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
.LCFI1:
	.cfi_def_cfa_offset 16
	.loc 1 50 0
	bl	calc_divisor
	str	r0, [sp, #4]
	.loc 1 52 0
	movw	r3, #:lower16:console
	movt	r3, #:upper16:console
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r1, [sp, #4]
	bl	NS16550_init
	.loc 1 54 0
	mov	r3, #0
	.loc 1 55 0
	mov	r0, r3
	add	sp, sp, #12
	ldmfd	sp!, {pc}
	.cfi_endproc
.LFE1:
	.size	serial_init, .-serial_init
	.align	2
	.global	serial_putc
	.type	serial_putc, %function
serial_putc:
.LFB2:
	.loc 1 58 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
.LCFI2:
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
.LCFI3:
	.cfi_def_cfa_offset 16
	mov	r3, r0
	strb	r3, [sp, #7]
	.loc 1 59 0
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	cmp	r3, #10
	bne	.L6
	.loc 1 60 0
	movw	r3, #:lower16:console
	movt	r3, #:upper16:console
	ldr	r3, [r3, #0]
	mov	r0, r3
	mov	r1, #13
	bl	NS16550_putc
.L6:
	.loc 1 62 0
	movw	r3, #:lower16:console
	movt	r3, #:upper16:console
	ldr	r2, [r3, #0]
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	mov	r0, r2
	mov	r1, r3
	bl	NS16550_putc
	.loc 1 63 0
	add	sp, sp, #12
	ldmfd	sp!, {pc}
	.cfi_endproc
.LFE2:
	.size	serial_putc, .-serial_putc
	.align	2
	.global	serial_puts
	.type	serial_puts, %function
serial_puts:
.LFB3:
	.loc 1 66 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
.LCFI4:
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
.LCFI5:
	.cfi_def_cfa_offset 16
	str	r0, [sp, #4]
	.loc 1 67 0
	b	.L8
.L9:
	.loc 1 68 0
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	ldr	r2, [sp, #4]
	add	r2, r2, #1
	str	r2, [sp, #4]
	mov	r0, r3
	bl	serial_putc
.L8:
	.loc 1 67 0 discriminator 1
	ldr	r3, [sp, #4]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L9
	.loc 1 70 0
	add	sp, sp, #12
	ldmfd	sp!, {pc}
	.cfi_endproc
.LFE3:
	.size	serial_puts, .-serial_puts
	.align	2
	.global	serial_getc
	.type	serial_getc, %function
serial_getc:
.LFB4:
	.loc 1 74 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 75 0
	movw	r3, #:lower16:console
	movt	r3, #:upper16:console
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	NS16550_getc
	mov	r3, r0
	.loc 1 76 0
	mov	r0, r3
	ldmfd	sp!, {r3, pc}
	.cfi_endproc
.LFE4:
	.size	serial_getc, .-serial_getc
	.align	2
	.global	serial_tstc
	.type	serial_tstc, %function
serial_tstc:
.LFB5:
	.loc 1 79 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
.LCFI7:
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	.cfi_offset 14, -4
	.loc 1 80 0
	movw	r3, #:lower16:console
	movt	r3, #:upper16:console
	ldr	r3, [r3, #0]
	mov	r0, r3
	bl	NS16550_tstc
	mov	r3, r0
	.loc 1 81 0
	mov	r0, r3
	ldmfd	sp!, {r3, pc}
	.cfi_endproc
.LFE5:
	.size	serial_tstc, .-serial_tstc
	.align	2
	.global	serial_setbrg
	.type	serial_setbrg, %function
serial_setbrg:
.LFB6:
	.loc 1 84 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
.LCFI8:
	.cfi_def_cfa_offset 4
	.cfi_offset 14, -4
	sub	sp, sp, #12
.LCFI9:
	.cfi_def_cfa_offset 16
	.loc 1 87 0
	bl	calc_divisor
	str	r0, [sp, #4]
	.loc 1 88 0
	movw	r3, #:lower16:console
	movt	r3, #:upper16:console
	ldr	r3, [r3, #0]
	mov	r0, r3
	ldr	r1, [sp, #4]
	bl	NS16550_reinit
	.loc 1 89 0
	add	sp, sp, #12
	ldmfd	sp!, {pc}
	.cfi_endproc
.LFE6:
	.size	serial_setbrg, .-serial_setbrg
.Letext0:
	.file 2 "../Console/include/ns16550.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x262
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x1
	.4byte	.LASF18
	.4byte	.LASF19
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.4byte	.LASF20
	.byte	0x20
	.byte	0x2
	.byte	0x33
	.4byte	0x12e
	.uleb128 0x3
	.ascii	"rbr\000"
	.byte	0x2
	.byte	0x34
	.4byte	0x12e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.4byte	.LASF0
	.byte	0x2
	.byte	0x35
	.4byte	0x135
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x3
	.ascii	"ier\000"
	.byte	0x2
	.byte	0x36
	.4byte	0x12e
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x4
	.4byte	.LASF1
	.byte	0x2
	.byte	0x37
	.4byte	0x135
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x3
	.ascii	"fcr\000"
	.byte	0x2
	.byte	0x38
	.4byte	0x12e
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x4
	.4byte	.LASF2
	.byte	0x2
	.byte	0x39
	.4byte	0x135
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x3
	.ascii	"lcr\000"
	.byte	0x2
	.byte	0x3a
	.4byte	0x12e
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x3b
	.4byte	0x135
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x3
	.ascii	"mcr\000"
	.byte	0x2
	.byte	0x3c
	.4byte	0x12e
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x3d
	.4byte	0x135
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x3
	.ascii	"lsr\000"
	.byte	0x2
	.byte	0x3e
	.4byte	0x12e
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x2
	.byte	0x3f
	.4byte	0x135
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x3
	.ascii	"msr\000"
	.byte	0x2
	.byte	0x40
	.4byte	0x12e
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x2
	.byte	0x41
	.4byte	0x135
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x3
	.ascii	"scr\000"
	.byte	0x2
	.byte	0x42
	.4byte	0x12e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x4
	.4byte	.LASF7
	.byte	0x2
	.byte	0x43
	.4byte	0x135
	.byte	0x4
	.byte	0x18
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x2
	.byte	0x51
	.4byte	0x147
	.uleb128 0x8
	.byte	0x4
	.4byte	0x14d
	.uleb128 0x9
	.4byte	0x29
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x1
	.byte	0x2b
	.byte	0x1
	.4byte	0x135
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF23
	.byte	0x1
	.byte	0x30
	.byte	0x1
	.4byte	0x135
	.4byte	.LFB1
	.4byte	.LFE1
	.4byte	.LLST0
	.byte	0x1
	.4byte	0x197
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x1
	.byte	0x32
	.4byte	0x135
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF10
	.byte	0x1
	.byte	0x39
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.4byte	.LLST1
	.byte	0x1
	.4byte	0x1be
	.uleb128 0xe
	.ascii	"c\000"
	.byte	0x1
	.byte	0x39
	.4byte	0x1be
	.byte	0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xf
	.4byte	0x1c3
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF11
	.byte	0x1
	.byte	0x41
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.4byte	.LLST2
	.byte	0x1
	.4byte	0x1f1
	.uleb128 0xe
	.ascii	"s\000"
	.byte	0x1
	.byte	0x41
	.4byte	0x1f1
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x1be
	.uleb128 0x10
	.byte	0x1
	.4byte	.LASF12
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.4byte	0x135
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	.LLST3
	.byte	0x1
	.uleb128 0x10
	.byte	0x1
	.4byte	.LASF13
	.byte	0x1
	.byte	0x4e
	.byte	0x1
	.4byte	0x135
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LLST4
	.byte	0x1
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF14
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.4byte	.LLST5
	.byte	0x1
	.4byte	0x254
	.uleb128 0xc
	.4byte	.LASF15
	.byte	0x1
	.byte	0x55
	.4byte	0x135
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.4byte	.LASF16
	.byte	0x1
	.byte	0x24
	.4byte	0x13c
	.byte	0x5
	.byte	0x3
	.4byte	console
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
	.uleb128 0x3
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
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
	.uleb128 0x2116
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",%progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LFB1-.Ltext0
	.4byte	.LCFI0-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI0-.Ltext0
	.4byte	.LCFI1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 4
	.4byte	.LCFI1-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LLST1:
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
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LLST2:
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
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LFB4-.Ltext0
	.4byte	.LCFI6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI6-.Ltext0
	.4byte	.LFE4-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LFB5-.Ltext0
	.4byte	.LCFI7-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI7-.Ltext0
	.4byte	.LFE5-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 8
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LFB6-.Ltext0
	.4byte	.LCFI8-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 0
	.4byte	.LCFI8-.Ltext0
	.4byte	.LCFI9-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 4
	.4byte	.LCFI9-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x2
	.byte	0x7d
	.sleb128 16
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
	.file 3 "../Console/include/bbconsole.h"
	.byte	0x3
	.uleb128 0x18
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x2
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.1.7d8db4a0b8d2a7544d284f36ea7bdab6,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF44
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
	.uleb128 0
	.4byte	.LASF360
	.byte	0x5
	.uleb128 0
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0
	.4byte	.LASF366
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.bbconsole.h.28.7449ccf8ddab819fc93c6e4504c0fe24,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF372
	.byte	0x5
	.uleb128 0x27
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF381
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.ns16550.h.76.254caa7c8d45e59db0575066763ce288,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF390
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF406
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF407
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF408
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF410
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF412
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF260:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF98:
	.ascii	"__PTRDIFF_MAX__ 2147483647\000"
.LASF383:
	.ascii	"iir fcr\000"
.LASF93:
	.ascii	"__LONG_LONG_MAX__ 9223372036854775807LL\000"
.LASF198:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF94:
	.ascii	"__WCHAR_MAX__ 4294967295U\000"
.LASF163:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF410:
	.ascii	"LSR_TEMT 0x40\000"
.LASF197:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF114:
	.ascii	"__INT_LEAST8_MAX__ 127\000"
.LASF106:
	.ascii	"__INT8_MAX__ 127\000"
.LASF123:
	.ascii	"__UINT8_C(c) c\000"
.LASF108:
	.ascii	"__INT32_MAX__ 2147483647L\000"
.LASF92:
	.ascii	"__LONG_MAX__ 2147483647L\000"
.LASF303:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF150:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF159:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF120:
	.ascii	"__INT_LEAST64_MAX__ 9223372036854775807LL\000"
.LASF345:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF17:
	.ascii	"GNU C 4.7.3\000"
.LASF164:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF213:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF27:
	.ascii	"__GNUC_MINOR__ 7\000"
.LASF125:
	.ascii	"__UINT16_C(c) c\000"
.LASF44:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF59:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF43:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF26:
	.ascii	"__GNUC__ 4\000"
.LASF48:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF244:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF409:
	.ascii	"LSR_THRE 0x20\000"
.LASF202:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF347:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF320:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF157:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF77:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF16:
	.ascii	"console\000"
.LASF33:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF54:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF326:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF63:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF190:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF172:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF91:
	.ascii	"__INT_MAX__ 2147483647\000"
.LASF277:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF31:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF117:
	.ascii	"__INT16_C(c) c\000"
.LASF21:
	.ascii	"NS16550_t\000"
.LASF40:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF322:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF10:
	.ascii	"serial_putc\000"
.LASF103:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF50:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF122:
	.ascii	"__UINT_LEAST8_MAX__ 255\000"
.LASF3:
	.ascii	"pad4\000"
.LASF227:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF363:
	.ascii	"GCC_OMAP3_BeagleBoard 1\000"
.LASF74:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF139:
	.ascii	"__UINTPTR_MAX__ 4294967295U\000"
.LASF205:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF242:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF397:
	.ascii	"LCR_WLS_8 0x03\000"
.LASF30:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF268:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF284:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF273:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF155:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF351:
	.ascii	"__ARMEL__ 1\000"
.LASF134:
	.ascii	"__UINT_FAST8_MAX__ 4294967295U\000"
.LASF319:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF113:
	.ascii	"__UINT64_MAX__ 18446744073709551615ULL\000"
.LASF81:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF115:
	.ascii	"__INT8_C(c) c\000"
.LASF99:
	.ascii	"__SIZE_MAX__ 4294967295U\000"
.LASF283:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF406:
	.ascii	"LSR_PE 0x04\000"
.LASF12:
	.ascii	"serial_getc\000"
.LASF1:
	.ascii	"pad2\000"
.LASF388:
	.ascii	"FCR_TXSR 0x04\000"
.LASF87:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF132:
	.ascii	"__INT_FAST32_MAX__ 2147483647\000"
.LASF327:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF395:
	.ascii	"LCR_WLS_6 0x01\000"
.LASF309:
	.ascii	"__SA_IBIT__ 16\000"
.LASF239:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF144:
	.ascii	"__FLT_DIG__ 6\000"
.LASF23:
	.ascii	"serial_init\000"
.LASF384:
	.ascii	"dll rbr\000"
.LASF328:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF370:
	.ascii	"OMAP34XX_UART3 (DM3730_L4_PERIPHERAL+0x20000)\000"
.LASF310:
	.ascii	"__DA_FBIT__ 31\000"
.LASF360:
	.ascii	"__USES_INITFINI__ 1\000"
.LASF188:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF255:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF274:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF224:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF209:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF402:
	.ascii	"LCR_SBRK 0x40\000"
.LASF287:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF200:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF365:
	.ascii	"__CS_SOURCERYGXX_MIN__ 5\000"
.LASF235:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF72:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF13:
	.ascii	"serial_tstc\000"
.LASF232:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF305:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF153:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF379:
	.ascii	"CFG_PBSIZE 256\000"
.LASF243:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF170:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF263:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF0:
	.ascii	"pad1\000"
.LASF230:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF2:
	.ascii	"pad3\000"
.LASF78:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF4:
	.ascii	"pad5\000"
.LASF5:
	.ascii	"pad6\000"
.LASF6:
	.ascii	"pad7\000"
.LASF7:
	.ascii	"pad8\000"
.LASF246:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF165:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF196:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF218:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF337:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF265:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF257:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF181:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF18:
	.ascii	"../Console/comport.c\000"
.LASF251:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF47:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF346:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF404:
	.ascii	"LSR_DR 0x01\000"
.LASF208:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF317:
	.ascii	"__USA_IBIT__ 16\000"
.LASF237:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF199:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF348:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF378:
	.ascii	"CONFIG_BAUDRATE 115200\000"
.LASF41:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF398:
	.ascii	"LCR_STB 0x04\000"
.LASF127:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF187:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF408:
	.ascii	"LSR_BI 0x10\000"
.LASF311:
	.ascii	"__DA_IBIT__ 32\000"
.LASF46:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF267:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF116:
	.ascii	"__INT_LEAST16_MAX__ 32767\000"
.LASF214:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF375:
	.ascii	"CFG_NS16550_COM3 OMAP34XX_UART3\000"
.LASF278:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF88:
	.ascii	"__GXX_ABI_VERSION 1002\000"
.LASF372:
	.ascii	"CFG_NS16550_SERIAL \000"
.LASF308:
	.ascii	"__SA_FBIT__ 15\000"
.LASF392:
	.ascii	"MCR_TX_DFR 0x08\000"
.LASF250:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF79:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF67:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF332:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF299:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF70:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF65:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF15:
	.ascii	"clock_divisor\000"
.LASF279:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF374:
	.ascii	"CFG_NS16550_CLK 48000000\000"
.LASF280:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF325:
	.ascii	"__NO_INLINE__ 1\000"
.LASF233:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF143:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF301:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF329:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF262:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF141:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF83:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF400:
	.ascii	"LCR_EPS 0x10\000"
.LASF160:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF252:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF112:
	.ascii	"__UINT32_MAX__ 4294967295UL\000"
.LASF354:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF399:
	.ascii	"LCR_PEN 0x08\000"
.LASF216:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF140:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF82:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF138:
	.ascii	"__INTPTR_MAX__ 2147483647\000"
.LASF256:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF335:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF272:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF236:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF316:
	.ascii	"__USA_FBIT__ 16\000"
.LASF32:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF55:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF22:
	.ascii	"calc_divisor\000"
.LASF118:
	.ascii	"__INT_LEAST32_MAX__ 2147483647L\000"
.LASF394:
	.ascii	"LCR_WLS_5 0x00\000"
.LASF189:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF226:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF71:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF128:
	.ascii	"__UINT_LEAST64_MAX__ 18446744073709551615ULL\000"
.LASF158:
	.ascii	"__DBL_DIG__ 15\000"
.LASF333:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF266:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF225:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF151:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF338:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF124:
	.ascii	"__UINT_LEAST16_MAX__ 65535\000"
.LASF412:
	.ascii	"LCR_8N1 0x03\000"
.LASF304:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF107:
	.ascii	"__INT16_MAX__ 32767\000"
.LASF368:
	.ascii	"CFG_PRINTF \000"
.LASF385:
	.ascii	"dlm ier\000"
.LASF331:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF178:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF36:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF366:
	.ascii	"__CS_SOURCERYGXX_REV__ 23\000"
.LASF349:
	.ascii	"__arm__ 1\000"
.LASF171:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF361:
	.ascii	"DEBUG 1\000"
.LASF314:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF90:
	.ascii	"__SHRT_MAX__ 32767\000"
.LASF126:
	.ascii	"__UINT_LEAST32_MAX__ 4294967295UL\000"
.LASF359:
	.ascii	"__ELF__ 1\000"
.LASF340:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF342:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF221:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF191:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF291:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF24:
	.ascii	"__STDC__ 1\000"
.LASF38:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF393:
	.ascii	"LCR_WLS_MSK 0x03\000"
.LASF161:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF35:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF56:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF148:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF373:
	.ascii	"CFG_NS16550_REG_SIZE -4\000"
.LASF231:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF249:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF258:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF42:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF382:
	.ascii	"thr rbr\000"
.LASF28:
	.ascii	"__GNUC_PATCHLEVEL__ 3\000"
.LASF358:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF411:
	.ascii	"LSR_ERR 0x80\000"
.LASF219:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF97:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF271:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF223:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF217:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF179:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF312:
	.ascii	"__TA_FBIT__ 63\000"
.LASF183:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF85:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF390:
	.ascii	"MCR_RTS 0x02\000"
.LASF173:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF241:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF344:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF51:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF259:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF222:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF185:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF193:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF105:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF240:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF176:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF206:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF60:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF207:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF356:
	.ascii	"__ARM_PCS 1\000"
.LASF289:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF387:
	.ascii	"FCR_RXSR 0x02\000"
.LASF405:
	.ascii	"LSR_OE 0x02\000"
.LASF76:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF292:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF254:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF275:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF110:
	.ascii	"__UINT8_MAX__ 255\000"
.LASF269:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF49:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF9:
	.ascii	"char\000"
.LASF149:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF364:
	.ascii	"__CS_SOURCERYGXX_MAJ__ 2013\000"
.LASF204:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF96:
	.ascii	"__WINT_MAX__ 4294967295U\000"
.LASF296:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF89:
	.ascii	"__SCHAR_MAX__ 127\000"
.LASF136:
	.ascii	"__UINT_FAST32_MAX__ 4294967295U\000"
.LASF264:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF194:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF298:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF64:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF84:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF175:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF290:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF228:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF324:
	.ascii	"__GNUC_GNU_INLINE__ 1\000"
.LASF201:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF184:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF62:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF323:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF391:
	.ascii	"MCR_DMA_EN 0x04\000"
.LASF407:
	.ascii	"LSR_FE 0x08\000"
.LASF294:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF215:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF137:
	.ascii	"__UINT_FAST64_MAX__ 18446744073709551615ULL\000"
.LASF282:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF109:
	.ascii	"__INT64_MAX__ 9223372036854775807LL\000"
.LASF211:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF302:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF288:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF135:
	.ascii	"__UINT_FAST16_MAX__ 4294967295U\000"
.LASF315:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF396:
	.ascii	"LCR_WLS_7 0x02\000"
.LASF362:
	.ascii	"RUN_FROM_RAM 1\000"
.LASF39:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF66:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF386:
	.ascii	"FCR_FIFO_EN 0x01\000"
.LASF19:
	.ascii	"/home/yoda/DS-5-Workspace/FreeRTOS2_Baseline/Demo/O"
	.ascii	"MAP3_BeagleBoard_GCC\000"
.LASF121:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF152:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF73:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF68:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF174:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF11:
	.ascii	"serial_puts\000"
.LASF367:
	.ascii	"__BBCONSOLE_H_ 1\000"
.LASF52:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF353:
	.ascii	"__VFP_FP__ 1\000"
.LASF234:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF306:
	.ascii	"__HA_FBIT__ 7\000"
.LASF381:
	.ascii	"getc() serial_getc()\000"
.LASF248:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF104:
	.ascii	"__SIG_ATOMIC_MAX__ 2147483647\000"
.LASF341:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF129:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF270:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF210:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF297:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF300:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF307:
	.ascii	"__HA_IBIT__ 8\000"
.LASF357:
	.ascii	"__ARM_EABI__ 1\000"
.LASF334:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF111:
	.ascii	"__UINT16_MAX__ 65535\000"
.LASF45:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF102:
	.ascii	"__UINTMAX_MAX__ 18446744073709551615ULL\000"
.LASF220:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF25:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF100:
	.ascii	"__INTMAX_MAX__ 9223372036854775807LL\000"
.LASF376:
	.ascii	"CONFIG_SERIAL1 3\000"
.LASF352:
	.ascii	"__SOFTFP__ 1\000"
.LASF133:
	.ascii	"__INT_FAST64_MAX__ 9223372036854775807LL\000"
.LASF371:
	.ascii	"CFG_NS16550 \000"
.LASF369:
	.ascii	"DM3730_L4_PERIPHERAL 0x49000000\000"
.LASF339:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 2\000"
.LASF147:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF131:
	.ascii	"__INT_FAST16_MAX__ 2147483647\000"
.LASF8:
	.ascii	"unsigned char\000"
.LASF186:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF58:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF180:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF86:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF253:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF20:
	.ascii	"NS16550\000"
.LASF212:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF380:
	.ascii	"printf(fmt,args...) serial_printf (fmt , ##args)\000"
.LASF293:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF142:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF130:
	.ascii	"__INT_FAST8_MAX__ 2147483647\000"
.LASF53:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF281:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF336:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF146:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF95:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF169:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF80:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF247:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF156:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF37:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF57:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF166:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF101:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF350:
	.ascii	"__APCS_32__ 1\000"
.LASF29:
	.ascii	"__VERSION__ \"4.7.3\"\000"
.LASF167:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF69:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF162:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF389:
	.ascii	"MCR_DTR 0x01\000"
.LASF377:
	.ascii	"CONFIG_CONS_INDEX 3\000"
.LASF313:
	.ascii	"__TA_IBIT__ 64\000"
.LASF286:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF75:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF401:
	.ascii	"LCR_STKP 0x20\000"
.LASF145:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF203:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF177:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF119:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF168:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF321:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF229:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF34:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF318:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF14:
	.ascii	"serial_setbrg\000"
.LASF276:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF195:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF295:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF355:
	.ascii	"__ARM_ARCH_7A__ 1\000"
.LASF343:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF61:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF403:
	.ascii	"LCR_BKSE 0x80\000"
.LASF238:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF330:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1\000"
.LASF245:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF182:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF285:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF192:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF154:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF261:
	.ascii	"__UACCUM_FBIT__ 16\000"
	.ident	"GCC: (Sourcery CodeBench Lite 2013.05-23) 4.7.3"
