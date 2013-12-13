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
	.file	"portISR.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	ulCriticalNesting
	.data
	.align	2
	.type	ulCriticalNesting, %object
	.size	ulCriticalNesting, 4
ulCriticalNesting:
	.word	9999
	.text
	.align	2
	.global	vPortISRStartFirstTask
	.type	vPortISRStartFirstTask, %function
vPortISRStartFirstTask:
.LFB0:
	.file 1 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c"
	.loc 1 89 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
.LBB2:
	.loc 1 92 0
@ 92 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	LDR		R0, =pxCurrentTCB								
	LDR		R0, [R0]										
	LDR		LR, [R0]										
	LDR		R0, =ulCriticalNesting							
	LDMFD	LR!, {R1}											
	STR		R1, [R0]										
	LDMFD	LR!, {R0}											
	MSR		SPSR, R0										
	LDMFD	LR, {R0-R14}^										
	NOP														
	LDR		LR, [LR, #+60]									
	SUBS	PC, LR, #4											
	
@ 0 "" 2
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	movw	r3, #:lower16:pxCurrentTCB
	movt	r3, #:upper16:pxCurrentTCB
	ldr	r3, [r3, #0]
.LBE2:
	.loc 1 93 0
	bx	lr
	.cfi_endproc
.LFE0:
	.size	vPortISRStartFirstTask, .-vPortISRStartFirstTask
	.align	2
	.global	vIRQHandler
	.type	vIRQHandler, %function
vIRQHandler:
.LFB1:
	.loc 1 97 0
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
.LBB3:
	.loc 1 98 0
@ 98 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	STMDB	SP!, {R0}											
	STMDB	SP,{SP}^											
	NOP														
	SUB	SP, SP, #4											
	LDMIA	SP!,{R0}											
	STMDB	R0!, {LR}											
	MOV	LR, R0												
	LDMIA	SP!, {R0}											
	STMDB	LR,{R0-LR}^											
	NOP														
	SUB	LR, LR, #60											
	MRS	R0, SPSR											
	STMDB	LR!, {R0}											
	LDR	R0, =ulCriticalNesting								
	LDR	R0, [R0]											
	STMDB	LR!, {R0}											
	LDR	R0, =pxCurrentTCB									
	LDR	R0, [R0]											
	STR	LR, [R0]											
	
@ 0 "" 2
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	movw	r3, #:lower16:pxCurrentTCB
	movt	r3, #:upper16:pxCurrentTCB
	ldr	r3, [r3, #0]
.LBE3:
	.loc 1 103 0
	mov	r3, #64
	movt	r3, 18464
	ldr	r3, [r3, #0]
	cmp	r3, #37
	bne	.L3
	.loc 1 105 0
	bl	vTickISR
	b	.L4
.L3:
	.loc 1 109 0
	mov	r3, #64
	movt	r3, 18464
	ldr	r3, [r3, #0]
	cmp	r3, #74
	bne	.L4
	.loc 1 111 0
	bl	vUART_ISR_Handler
.L4:
.LBB4:
	.loc 1 116 0
@ 116 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	LDR		R0, =pxCurrentTCB								
	LDR		R0, [R0]										
	LDR		LR, [R0]										
	LDR		R0, =ulCriticalNesting							
	LDMFD	LR!, {R1}											
	STR		R1, [R0]										
	LDMFD	LR!, {R0}											
	MSR		SPSR, R0										
	LDMFD	LR, {R0-R14}^										
	NOP														
	LDR		LR, [LR, #+60]									
	SUBS	PC, LR, #4											
	
@ 0 "" 2
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	movw	r3, #:lower16:pxCurrentTCB
	movt	r3, #:upper16:pxCurrentTCB
	ldr	r3, [r3, #0]
.LBE4:
	.loc 1 118 0
	.cfi_endproc
.LFE1:
	.size	vIRQHandler, .-vIRQHandler
	.align	2
	.global	vPortYieldProcessor
	.type	vPortYieldProcessor, %function
vPortYieldProcessor:
.LFB2:
	.loc 1 130 0
	.cfi_startproc
	@ ARM Exception Handler.
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 134 0
@ 134 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	ADD		LR, LR, #4
@ 0 "" 2
.LBB5:
	.loc 1 137 0
@ 137 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	STMDB	SP!, {R0}											
	STMDB	SP,{SP}^											
	NOP														
	SUB	SP, SP, #4											
	LDMIA	SP!,{R0}											
	STMDB	R0!, {LR}											
	MOV	LR, R0												
	LDMIA	SP!, {R0}											
	STMDB	LR,{R0-LR}^											
	NOP														
	SUB	LR, LR, #60											
	MRS	R0, SPSR											
	STMDB	LR!, {R0}											
	LDR	R0, =ulCriticalNesting								
	LDR	R0, [R0]											
	STMDB	LR!, {R0}											
	LDR	R0, =pxCurrentTCB									
	LDR	R0, [R0]											
	STR	LR, [R0]											
	
@ 0 "" 2
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	movw	r3, #:lower16:pxCurrentTCB
	movt	r3, #:upper16:pxCurrentTCB
	ldr	r3, [r3, #0]
.LBE5:
	.loc 1 140 0
	bl	vTaskSwitchContext
.LBB6:
	.loc 1 143 0
@ 143 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	LDR		R0, =pxCurrentTCB								
	LDR		R0, [R0]										
	LDR		LR, [R0]										
	LDR		R0, =ulCriticalNesting							
	LDMFD	LR!, {R1}											
	STR		R1, [R0]										
	LDMFD	LR!, {R0}											
	MSR		SPSR, R0										
	LDMFD	LR, {R0-R14}^										
	NOP														
	LDR		LR, [LR, #+60]									
	SUBS	PC, LR, #4											
	
@ 0 "" 2
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	movw	r3, #:lower16:pxCurrentTCB
	movt	r3, #:upper16:pxCurrentTCB
	ldr	r3, [r3, #0]
.LBE6:
	.loc 1 144 0
	.cfi_endproc
.LFE2:
	.size	vPortYieldProcessor, .-vPortYieldProcessor
	.align	2
	.global	vTickISR
	.type	vTickISR, %function
vTickISR:
.LFB3:
	.loc 1 151 0
	.cfi_startproc
	@ Naked Function: prologue and epilogue provided by programmer.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	.loc 1 155 0
@ 155 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	push {lr}	
	
@ 0 "" 2
	.loc 1 161 0
	bl	vTaskIncrementTick
	.loc 1 164 0
	bl	vTaskSwitchContext
	.loc 1 177 0
	movw	r3, #32792
	movt	r3, 18481
	mov	r2, #1
	str	r2, [r3, #0]
	.loc 1 178 0
	movw	r3, #32816
	movt	r3, 18481
	mov	r2, #255
	str	r2, [r3, #0]
	.loc 1 179 0
	mov	r3, #72
	movt	r3, 18464
	mov	r2, #1
	str	r2, [r3, #0]
	.loc 1 183 0
@ 183 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	pop {lr}	
	
@ 0 "" 2
	.loc 1 185 0
	.cfi_endproc
.LFE3:
	.size	vTickISR, .-vTickISR
	.align	2
	.global	vPortEnterCritical
	.type	vPortEnterCritical, %function
vPortEnterCritical:
.LFB4:
	.loc 1 228 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 230 0
@ 230 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	STMDB	SP!, {R0}			
	MRS	R0, CPSR			
	ORR	R0, R0, #0xC0		
	MSR	CPSR, R0			
	LDMIA	SP!, {R0}
@ 0 "" 2
	.loc 1 240 0
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	add	r2, r3, #1
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	str	r2, [r3, #0]
	.loc 1 241 0
	bx	lr
	.cfi_endproc
.LFE4:
	.size	vPortEnterCritical, .-vPortEnterCritical
	.align	2
	.global	vPortExitCritical
	.type	vPortExitCritical, %function
vPortExitCritical:
.LFB5:
	.loc 1 244 0
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 245 0
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L8
	.loc 1 248 0
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	sub	r2, r3, #1
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	str	r2, [r3, #0]
	.loc 1 252 0
	movw	r3, #:lower16:ulCriticalNesting
	movt	r3, #:upper16:ulCriticalNesting
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L8
	.loc 1 255 0
@ 255 "../../Source/portable/GCC/OMAP3_BeagleBoard/portISR.c" 1
	STMDB	SP!, {R0}		
	MRS	R0, CPSR		
	BIC	R0, R0, #0xC0	
	MSR	CPSR, R0		
	LDMIA	SP!, {R0}
@ 0 "" 2
.L8:
	.loc 1 263 0
	bx	lr
	.cfi_endproc
.LFE5:
	.size	vPortExitCritical, .-vPortExitCritical
.Letext0:
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1bb
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF11
	.byte	0x1
	.4byte	.LASF12
	.4byte	.LASF13
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x4
	.byte	0x1
	.4byte	.LASF5
	.byte	0x1
	.byte	0x58
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.4byte	0x83
	.uleb128 0x5
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x5c
	.4byte	0x83
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x5c
	.4byte	0x8f
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	0x88
	.uleb128 0x8
	.byte	0x4
	.4byte	0x8e
	.uleb128 0x9
	.uleb128 0x7
	.4byte	0x37
	.uleb128 0xa
	.byte	0x1
	.4byte	.LASF6
	.byte	0x1
	.byte	0x61
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.4byte	0xfa
	.uleb128 0xb
	.4byte	.LBB3
	.4byte	.LBE3
	.4byte	0xd5
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x62
	.4byte	0x83
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x62
	.4byte	0x8f
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	.LBB4
	.4byte	.LBE4
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x74
	.4byte	0x83
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x74
	.4byte	0x8f
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.4byte	.LASF7
	.byte	0x1
	.byte	0x81
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.4byte	0x160
	.uleb128 0xb
	.4byte	.LBB5
	.4byte	.LBE5
	.4byte	0x13b
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x89
	.4byte	0x83
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x89
	.4byte	0x8f
	.byte	0x1
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	.LBB6
	.4byte	.LBE6
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x8f
	.4byte	0x83
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.4byte	.LASF4
	.byte	0x1
	.byte	0x8f
	.4byte	0x8f
	.byte	0x1
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.4byte	.LASF8
	.byte	0x1
	.byte	0x96
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF9
	.byte	0x1
	.byte	0xe3
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.uleb128 0xd
	.byte	0x1
	.4byte	.LASF10
	.byte	0x1
	.byte	0xf3
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x2
	.byte	0x7d
	.sleb128 0
	.byte	0x1
	.uleb128 0xe
	.4byte	.LASF4
	.byte	0x1
	.byte	0x43
	.4byte	0x8f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	ulCriticalNesting
	.uleb128 0x6
	.4byte	.LASF3
	.byte	0x1
	.byte	0x8f
	.4byte	0x83
	.byte	0x1
	.byte	0x1
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xa
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2116
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
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
	.file 2 "../../Source/include/FreeRTOS.h"
	.byte	0x3
	.uleb128 0x3e
	.uleb128 0x2
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF14
	.file 3 "/home/tdwood/CodeSourcery/Sourcery_CodeBench_Lite_for_ARM_EABI/bin/../lib/gcc/arm-none-eabi/4.7.3/include/stddef.h"
	.byte	0x3
	.uleb128 0x43
	.uleb128 0x3
	.byte	0x7
	.4byte	.Ldebug_macro2
	.byte	0x4
	.file 4 "../../Source/include/projdefs.h"
	.byte	0x3
	.uleb128 0x46
	.uleb128 0x4
	.byte	0x7
	.4byte	.Ldebug_macro3
	.byte	0x4
	.file 5 "./FreeRTOSConfig.h"
	.byte	0x3
	.uleb128 0x49
	.uleb128 0x5
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF15
	.file 6 "./omap3.h"
	.byte	0x3
	.uleb128 0x39
	.uleb128 0x6
	.byte	0x7
	.4byte	.Ldebug_macro4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro5
	.byte	0x4
	.file 7 "../../Source/include/portable.h"
	.byte	0x3
	.uleb128 0x4c
	.uleb128 0x7
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF16
	.file 8 "../../Source/include/../../Source/portable/GCC/OMAP3_BeagleBoard/portmacro.h"
	.byte	0x3
	.uleb128 0xf0
	.uleb128 0x8
	.byte	0x7
	.4byte	.Ldebug_macro6
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro7
	.file 9 "../../Source/include/mpu_wrappers.h"
	.byte	0x3
	.uleb128 0x15c
	.uleb128 0x9
	.byte	0x7
	.4byte	.Ldebug_macro8
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.4byte	.Ldebug_macro9
	.byte	0x4
	.file 10 "../Console/include/bbconsole.h"
	.byte	0x3
	.uleb128 0x3f
	.uleb128 0xa
	.byte	0x7
	.4byte	.Ldebug_macro10
	.byte	0x4
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF17
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.1.7d8db4a0b8d2a7544d284f36ea7bdab6,comdat
.Ldebug_macro1:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x5
	.uleb128 0x1
	.4byte	.LASF23
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
	.uleb128 0
	.4byte	.LASF354
	.byte	0x5
	.uleb128 0
	.4byte	.LASF355
	.byte	0x5
	.uleb128 0
	.4byte	.LASF356
	.byte	0x5
	.uleb128 0
	.4byte	.LASF357
	.byte	0x5
	.uleb128 0
	.4byte	.LASF358
	.byte	0x5
	.uleb128 0
	.4byte	.LASF359
	.byte	0x5
	.uleb128 0
	.4byte	.LASF360
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.stddef.h.40.50cf36416e06376af8a9dca28536f2e4,comdat
.Ldebug_macro2:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF361
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF362
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF363
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF364
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF365
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF366
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF367
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF368
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF369
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF370
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF371
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF372
	.byte	0x6
	.uleb128 0xa1
	.4byte	.LASF373
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF374
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF375
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF376
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF377
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF378
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF379
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF380
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF381
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF382
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF383
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF384
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF385
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF386
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF387
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF388
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF389
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF390
	.byte	0x6
	.uleb128 0xeb
	.4byte	.LASF391
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF392
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF393
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF394
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF395
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF396
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF397
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF398
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF399
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF400
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF401
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF402
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF403
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF404
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF405
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF406
	.byte	0x6
	.uleb128 0x123
	.4byte	.LASF407
	.byte	0x6
	.uleb128 0x158
	.4byte	.LASF408
	.byte	0x6
	.uleb128 0x18e
	.4byte	.LASF409
	.byte	0x5
	.uleb128 0x193
	.4byte	.LASF410
	.byte	0x6
	.uleb128 0x199
	.4byte	.LASF411
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF412
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.projdefs.h.61.8f66fea8217234ac3113721e48021e08,comdat
.Ldebug_macro3:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF413
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF414
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF415
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF416
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF417
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF418
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF419
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF420
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF421
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF422
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF423
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.omap3.h.2.fbcf1b6ead181d7318c117f27a76551d,comdat
.Ldebug_macro4:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF424
	.byte	0x5
	.uleb128 0x15
	.4byte	.LASF425
	.byte	0x5
	.uleb128 0x16
	.4byte	.LASF426
	.byte	0x5
	.uleb128 0x17
	.4byte	.LASF427
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF428
	.byte	0x5
	.uleb128 0x1f
	.4byte	.LASF429
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF430
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF431
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF432
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF433
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF434
	.byte	0x5
	.uleb128 0x30
	.4byte	.LASF435
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF436
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF437
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF438
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF439
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF440
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF441
	.byte	0x5
	.uleb128 0x3c
	.4byte	.LASF442
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF443
	.byte	0x5
	.uleb128 0x3e
	.4byte	.LASF444
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF445
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF446
	.byte	0x5
	.uleb128 0x41
	.4byte	.LASF447
	.byte	0x5
	.uleb128 0x42
	.4byte	.LASF448
	.byte	0x5
	.uleb128 0x43
	.4byte	.LASF449
	.byte	0x5
	.uleb128 0x44
	.4byte	.LASF450
	.byte	0x5
	.uleb128 0x45
	.4byte	.LASF451
	.byte	0x5
	.uleb128 0x46
	.4byte	.LASF452
	.byte	0x5
	.uleb128 0x47
	.4byte	.LASF453
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF454
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF455
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF456
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF457
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF458
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF459
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF460
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF461
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF462
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF463
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF464
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF465
	.byte	0x5
	.uleb128 0x58
	.4byte	.LASF466
	.byte	0x5
	.uleb128 0x59
	.4byte	.LASF467
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF468
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF469
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF470
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF471
	.byte	0x5
	.uleb128 0x5e
	.4byte	.LASF472
	.byte	0x5
	.uleb128 0x5f
	.4byte	.LASF473
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF474
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF475
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF476
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF477
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF478
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF479
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF480
	.byte	0x5
	.uleb128 0x67
	.4byte	.LASF481
	.byte	0x5
	.uleb128 0x68
	.4byte	.LASF482
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF483
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF484
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF485
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF486
	.byte	0x5
	.uleb128 0x6d
	.4byte	.LASF487
	.byte	0x5
	.uleb128 0x6e
	.4byte	.LASF488
	.byte	0x5
	.uleb128 0x6f
	.4byte	.LASF489
	.byte	0x5
	.uleb128 0x70
	.4byte	.LASF490
	.byte	0x5
	.uleb128 0x71
	.4byte	.LASF491
	.byte	0x5
	.uleb128 0x72
	.4byte	.LASF492
	.byte	0x5
	.uleb128 0x73
	.4byte	.LASF493
	.byte	0x5
	.uleb128 0x74
	.4byte	.LASF494
	.byte	0x5
	.uleb128 0x75
	.4byte	.LASF495
	.byte	0x5
	.uleb128 0x76
	.4byte	.LASF496
	.byte	0x5
	.uleb128 0x77
	.4byte	.LASF497
	.byte	0x5
	.uleb128 0x78
	.4byte	.LASF498
	.byte	0x5
	.uleb128 0x79
	.4byte	.LASF499
	.byte	0x5
	.uleb128 0x7a
	.4byte	.LASF500
	.byte	0x5
	.uleb128 0x7b
	.4byte	.LASF501
	.byte	0x5
	.uleb128 0x7c
	.4byte	.LASF502
	.byte	0x5
	.uleb128 0x7d
	.4byte	.LASF503
	.byte	0x5
	.uleb128 0x7e
	.4byte	.LASF504
	.byte	0x5
	.uleb128 0x7f
	.4byte	.LASF505
	.byte	0x5
	.uleb128 0x80
	.4byte	.LASF506
	.byte	0x5
	.uleb128 0x81
	.4byte	.LASF507
	.byte	0x5
	.uleb128 0x82
	.4byte	.LASF508
	.byte	0x5
	.uleb128 0x83
	.4byte	.LASF509
	.byte	0x5
	.uleb128 0x84
	.4byte	.LASF510
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF511
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF512
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF513
	.byte	0x5
	.uleb128 0x88
	.4byte	.LASF514
	.byte	0x5
	.uleb128 0x89
	.4byte	.LASF515
	.byte	0x5
	.uleb128 0x8a
	.4byte	.LASF516
	.byte	0x5
	.uleb128 0x8b
	.4byte	.LASF517
	.byte	0x5
	.uleb128 0x8c
	.4byte	.LASF518
	.byte	0x5
	.uleb128 0x8d
	.4byte	.LASF519
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF520
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF521
	.byte	0x5
	.uleb128 0x90
	.4byte	.LASF522
	.byte	0x5
	.uleb128 0x91
	.4byte	.LASF523
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF524
	.byte	0x5
	.uleb128 0x93
	.4byte	.LASF525
	.byte	0x5
	.uleb128 0x94
	.4byte	.LASF526
	.byte	0x5
	.uleb128 0x95
	.4byte	.LASF527
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF528
	.byte	0x5
	.uleb128 0x97
	.4byte	.LASF529
	.byte	0x5
	.uleb128 0x98
	.4byte	.LASF530
	.byte	0x5
	.uleb128 0x99
	.4byte	.LASF531
	.byte	0x5
	.uleb128 0x9a
	.4byte	.LASF532
	.byte	0x5
	.uleb128 0x9b
	.4byte	.LASF533
	.byte	0x5
	.uleb128 0x9c
	.4byte	.LASF534
	.byte	0x5
	.uleb128 0x9d
	.4byte	.LASF535
	.byte	0x5
	.uleb128 0x9e
	.4byte	.LASF536
	.byte	0x5
	.uleb128 0x9f
	.4byte	.LASF537
	.byte	0x5
	.uleb128 0xa0
	.4byte	.LASF538
	.byte	0x5
	.uleb128 0xa1
	.4byte	.LASF539
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF540
	.byte	0x5
	.uleb128 0xa3
	.4byte	.LASF541
	.byte	0x5
	.uleb128 0xa4
	.4byte	.LASF542
	.byte	0x5
	.uleb128 0xa5
	.4byte	.LASF543
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF544
	.byte	0x5
	.uleb128 0xa7
	.4byte	.LASF545
	.byte	0x5
	.uleb128 0xa8
	.4byte	.LASF546
	.byte	0x5
	.uleb128 0xa9
	.4byte	.LASF547
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF548
	.byte	0x5
	.uleb128 0xab
	.4byte	.LASF549
	.byte	0x5
	.uleb128 0xac
	.4byte	.LASF550
	.byte	0x5
	.uleb128 0xad
	.4byte	.LASF551
	.byte	0x5
	.uleb128 0xae
	.4byte	.LASF552
	.byte	0x5
	.uleb128 0xaf
	.4byte	.LASF553
	.byte	0x5
	.uleb128 0xb0
	.4byte	.LASF554
	.byte	0x5
	.uleb128 0xb1
	.4byte	.LASF555
	.byte	0x5
	.uleb128 0xb2
	.4byte	.LASF556
	.byte	0x5
	.uleb128 0xb3
	.4byte	.LASF557
	.byte	0x5
	.uleb128 0xb4
	.4byte	.LASF558
	.byte	0x5
	.uleb128 0xb5
	.4byte	.LASF559
	.byte	0x5
	.uleb128 0xb6
	.4byte	.LASF560
	.byte	0x5
	.uleb128 0xb7
	.4byte	.LASF561
	.byte	0x5
	.uleb128 0xb8
	.4byte	.LASF562
	.byte	0x5
	.uleb128 0xb9
	.4byte	.LASF563
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF564
	.byte	0x5
	.uleb128 0xbb
	.4byte	.LASF565
	.byte	0x5
	.uleb128 0xbc
	.4byte	.LASF566
	.byte	0x5
	.uleb128 0xbd
	.4byte	.LASF567
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF568
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF569
	.byte	0x5
	.uleb128 0xc0
	.4byte	.LASF570
	.byte	0x5
	.uleb128 0xc1
	.4byte	.LASF571
	.byte	0x5
	.uleb128 0xc2
	.4byte	.LASF572
	.byte	0x5
	.uleb128 0xc3
	.4byte	.LASF573
	.byte	0x5
	.uleb128 0xc4
	.4byte	.LASF574
	.byte	0x5
	.uleb128 0xc5
	.4byte	.LASF575
	.byte	0x5
	.uleb128 0xc6
	.4byte	.LASF576
	.byte	0x5
	.uleb128 0xc7
	.4byte	.LASF577
	.byte	0x5
	.uleb128 0xc8
	.4byte	.LASF578
	.byte	0x5
	.uleb128 0xc9
	.4byte	.LASF579
	.byte	0x5
	.uleb128 0xca
	.4byte	.LASF580
	.byte	0x5
	.uleb128 0xcb
	.4byte	.LASF581
	.byte	0x5
	.uleb128 0xcc
	.4byte	.LASF582
	.byte	0x5
	.uleb128 0xcd
	.4byte	.LASF583
	.byte	0x5
	.uleb128 0xce
	.4byte	.LASF584
	.byte	0x5
	.uleb128 0xcf
	.4byte	.LASF585
	.byte	0x5
	.uleb128 0xd0
	.4byte	.LASF586
	.byte	0x5
	.uleb128 0xd1
	.4byte	.LASF587
	.byte	0x5
	.uleb128 0xd2
	.4byte	.LASF588
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF589
	.byte	0x5
	.uleb128 0xd4
	.4byte	.LASF590
	.byte	0x5
	.uleb128 0xd5
	.4byte	.LASF591
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF592
	.byte	0x5
	.uleb128 0xda
	.4byte	.LASF593
	.byte	0x5
	.uleb128 0xdb
	.4byte	.LASF594
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF595
	.byte	0x5
	.uleb128 0xdf
	.4byte	.LASF596
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF597
	.byte	0x5
	.uleb128 0xe1
	.4byte	.LASF598
	.byte	0x5
	.uleb128 0xe2
	.4byte	.LASF599
	.byte	0x5
	.uleb128 0xe3
	.4byte	.LASF600
	.byte	0x5
	.uleb128 0xe4
	.4byte	.LASF601
	.byte	0x5
	.uleb128 0xe5
	.4byte	.LASF602
	.byte	0x5
	.uleb128 0xe6
	.4byte	.LASF603
	.byte	0x5
	.uleb128 0xe7
	.4byte	.LASF604
	.byte	0x5
	.uleb128 0xe8
	.4byte	.LASF605
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF606
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF607
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF608
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF609
	.byte	0x5
	.uleb128 0xed
	.4byte	.LASF610
	.byte	0x5
	.uleb128 0xee
	.4byte	.LASF611
	.byte	0x5
	.uleb128 0xef
	.4byte	.LASF612
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF613
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF614
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF615
	.byte	0x5
	.uleb128 0xf3
	.4byte	.LASF616
	.byte	0x5
	.uleb128 0xf4
	.4byte	.LASF617
	.byte	0x5
	.uleb128 0xf5
	.4byte	.LASF618
	.byte	0x5
	.uleb128 0xf6
	.4byte	.LASF619
	.byte	0x5
	.uleb128 0xf7
	.4byte	.LASF620
	.byte	0x5
	.uleb128 0xfc
	.4byte	.LASF621
	.byte	0x5
	.uleb128 0xfd
	.4byte	.LASF622
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF623
	.byte	0x5
	.uleb128 0xff
	.4byte	.LASF624
	.byte	0x5
	.uleb128 0x100
	.4byte	.LASF625
	.byte	0x5
	.uleb128 0x101
	.4byte	.LASF626
	.byte	0x5
	.uleb128 0x102
	.4byte	.LASF627
	.byte	0x5
	.uleb128 0x103
	.4byte	.LASF628
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF629
	.byte	0x5
	.uleb128 0x105
	.4byte	.LASF630
	.byte	0x5
	.uleb128 0x106
	.4byte	.LASF631
	.byte	0x5
	.uleb128 0x107
	.4byte	.LASF632
	.byte	0x5
	.uleb128 0x108
	.4byte	.LASF633
	.byte	0x5
	.uleb128 0x109
	.4byte	.LASF634
	.byte	0x5
	.uleb128 0x10a
	.4byte	.LASF635
	.byte	0x5
	.uleb128 0x10b
	.4byte	.LASF636
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF637
	.byte	0x5
	.uleb128 0x10d
	.4byte	.LASF638
	.byte	0x5
	.uleb128 0x10e
	.4byte	.LASF639
	.byte	0x5
	.uleb128 0x10f
	.4byte	.LASF640
	.byte	0x5
	.uleb128 0x110
	.4byte	.LASF641
	.byte	0x5
	.uleb128 0x111
	.4byte	.LASF642
	.byte	0x5
	.uleb128 0x112
	.4byte	.LASF643
	.byte	0x5
	.uleb128 0x113
	.4byte	.LASF644
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF645
	.byte	0x5
	.uleb128 0x115
	.4byte	.LASF646
	.byte	0x5
	.uleb128 0x116
	.4byte	.LASF647
	.byte	0x5
	.uleb128 0x117
	.4byte	.LASF648
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF649
	.byte	0x5
	.uleb128 0x119
	.4byte	.LASF650
	.byte	0x5
	.uleb128 0x11a
	.4byte	.LASF651
	.byte	0x5
	.uleb128 0x11b
	.4byte	.LASF652
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF653
	.byte	0x5
	.uleb128 0x121
	.4byte	.LASF654
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF655
	.byte	0x5
	.uleb128 0x123
	.4byte	.LASF656
	.byte	0x5
	.uleb128 0x124
	.4byte	.LASF657
	.byte	0x5
	.uleb128 0x125
	.4byte	.LASF658
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF659
	.byte	0x5
	.uleb128 0x127
	.4byte	.LASF660
	.byte	0x5
	.uleb128 0x128
	.4byte	.LASF661
	.byte	0x5
	.uleb128 0x129
	.4byte	.LASF662
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF663
	.byte	0x5
	.uleb128 0x12b
	.4byte	.LASF664
	.byte	0x5
	.uleb128 0x12c
	.4byte	.LASF665
	.byte	0x5
	.uleb128 0x12d
	.4byte	.LASF666
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF667
	.byte	0x5
	.uleb128 0x12f
	.4byte	.LASF668
	.byte	0x5
	.uleb128 0x130
	.4byte	.LASF669
	.byte	0x5
	.uleb128 0x131
	.4byte	.LASF670
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF671
	.byte	0x5
	.uleb128 0x133
	.4byte	.LASF672
	.byte	0x5
	.uleb128 0x134
	.4byte	.LASF673
	.byte	0x5
	.uleb128 0x135
	.4byte	.LASF674
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF675
	.byte	0x5
	.uleb128 0x137
	.4byte	.LASF676
	.byte	0x5
	.uleb128 0x138
	.4byte	.LASF677
	.byte	0x5
	.uleb128 0x139
	.4byte	.LASF678
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF679
	.byte	0x5
	.uleb128 0x13b
	.4byte	.LASF680
	.byte	0x5
	.uleb128 0x13c
	.4byte	.LASF681
	.byte	0x5
	.uleb128 0x13d
	.4byte	.LASF682
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF683
	.byte	0x5
	.uleb128 0x13f
	.4byte	.LASF684
	.byte	0x5
	.uleb128 0x140
	.4byte	.LASF685
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF686
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF687
	.byte	0x5
	.uleb128 0x143
	.4byte	.LASF688
	.byte	0x5
	.uleb128 0x144
	.4byte	.LASF689
	.byte	0x5
	.uleb128 0x145
	.4byte	.LASF690
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF691
	.byte	0x5
	.uleb128 0x147
	.4byte	.LASF692
	.byte	0x5
	.uleb128 0x148
	.4byte	.LASF693
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.FreeRTOSConfig.h.72.509533afe6f89d2238eef5805bf80015,comdat
.Ldebug_macro5:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF694
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF695
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF696
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF697
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF698
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF699
	.byte	0x5
	.uleb128 0x4f
	.4byte	.LASF700
	.byte	0x5
	.uleb128 0x50
	.4byte	.LASF701
	.byte	0x5
	.uleb128 0x51
	.4byte	.LASF702
	.byte	0x5
	.uleb128 0x52
	.4byte	.LASF703
	.byte	0x5
	.uleb128 0x53
	.4byte	.LASF704
	.byte	0x5
	.uleb128 0x54
	.4byte	.LASF705
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF706
	.byte	0x5
	.uleb128 0x56
	.4byte	.LASF707
	.byte	0x5
	.uleb128 0x57
	.4byte	.LASF708
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF709
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF710
	.byte	0x5
	.uleb128 0x60
	.4byte	.LASF711
	.byte	0x5
	.uleb128 0x61
	.4byte	.LASF712
	.byte	0x5
	.uleb128 0x62
	.4byte	.LASF713
	.byte	0x5
	.uleb128 0x63
	.4byte	.LASF714
	.byte	0x5
	.uleb128 0x64
	.4byte	.LASF715
	.byte	0x5
	.uleb128 0x65
	.4byte	.LASF716
	.byte	0x5
	.uleb128 0x66
	.4byte	.LASF717
	.byte	0x5
	.uleb128 0x69
	.4byte	.LASF718
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF719
	.byte	0x5
	.uleb128 0x6b
	.4byte	.LASF720
	.byte	0x5
	.uleb128 0x6c
	.4byte	.LASF721
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.portmacro.h.55.d1073d6eae7cf3b987697703c07334df,comdat
.Ldebug_macro6:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF722
	.byte	0x5
	.uleb128 0x48
	.4byte	.LASF723
	.byte	0x5
	.uleb128 0x49
	.4byte	.LASF724
	.byte	0x5
	.uleb128 0x4a
	.4byte	.LASF725
	.byte	0x5
	.uleb128 0x4b
	.4byte	.LASF726
	.byte	0x5
	.uleb128 0x4c
	.4byte	.LASF727
	.byte	0x5
	.uleb128 0x4d
	.4byte	.LASF728
	.byte	0x5
	.uleb128 0x4e
	.4byte	.LASF729
	.byte	0x5
	.uleb128 0x55
	.4byte	.LASF730
	.byte	0x5
	.uleb128 0x5a
	.4byte	.LASF731
	.byte	0x5
	.uleb128 0x5b
	.4byte	.LASF732
	.byte	0x5
	.uleb128 0x5c
	.4byte	.LASF733
	.byte	0x5
	.uleb128 0x5d
	.4byte	.LASF734
	.byte	0x5
	.uleb128 0x6a
	.4byte	.LASF735
	.byte	0x5
	.uleb128 0x8f
	.4byte	.LASF736
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF737
	.byte	0x5
	.uleb128 0xbf
	.4byte	.LASF738
	.byte	0x5
	.uleb128 0xd6
	.4byte	.LASF739
	.byte	0x5
	.uleb128 0xde
	.4byte	.LASF740
	.byte	0x5
	.uleb128 0xeb
	.4byte	.LASF741
	.byte	0x5
	.uleb128 0xec
	.4byte	.LASF742
	.byte	0x5
	.uleb128 0xf0
	.4byte	.LASF743
	.byte	0x5
	.uleb128 0xf1
	.4byte	.LASF744
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.portable.h.321.4113c3afd01c927750b6dfda694756a0,comdat
.Ldebug_macro7:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x141
	.4byte	.LASF745
	.byte	0x5
	.uleb128 0x155
	.4byte	.LASF746
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.mpu_wrappers.h.61.7b277c2336cf8882fb5ab1790f87e650,comdat
.Ldebug_macro8:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF747
	.byte	0x5
	.uleb128 0x85
	.4byte	.LASF748
	.byte	0x5
	.uleb128 0x86
	.4byte	.LASF749
	.byte	0x5
	.uleb128 0x87
	.4byte	.LASF750
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.FreeRTOS.h.142.c946cd46d46aa7b3a7f846346f105e2c,comdat
.Ldebug_macro9:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x8e
	.4byte	.LASF751
	.byte	0x5
	.uleb128 0x92
	.4byte	.LASF752
	.byte	0x5
	.uleb128 0x96
	.4byte	.LASF753
	.byte	0x5
	.uleb128 0xa2
	.4byte	.LASF754
	.byte	0x5
	.uleb128 0xa6
	.4byte	.LASF755
	.byte	0x5
	.uleb128 0xaa
	.4byte	.LASF756
	.byte	0x5
	.uleb128 0xba
	.4byte	.LASF757
	.byte	0x5
	.uleb128 0xbe
	.4byte	.LASF758
	.byte	0x5
	.uleb128 0xd3
	.4byte	.LASF759
	.byte	0x5
	.uleb128 0xd7
	.4byte	.LASF760
	.byte	0x5
	.uleb128 0xdc
	.4byte	.LASF761
	.byte	0x5
	.uleb128 0xe0
	.4byte	.LASF762
	.byte	0x5
	.uleb128 0xe9
	.4byte	.LASF763
	.byte	0x5
	.uleb128 0xea
	.4byte	.LASF764
	.byte	0x5
	.uleb128 0xf2
	.4byte	.LASF765
	.byte	0x5
	.uleb128 0xf8
	.4byte	.LASF766
	.byte	0x5
	.uleb128 0xfe
	.4byte	.LASF767
	.byte	0x5
	.uleb128 0x104
	.4byte	.LASF768
	.byte	0x5
	.uleb128 0x10c
	.4byte	.LASF769
	.byte	0x5
	.uleb128 0x114
	.4byte	.LASF770
	.byte	0x5
	.uleb128 0x118
	.4byte	.LASF771
	.byte	0x5
	.uleb128 0x11e
	.4byte	.LASF772
	.byte	0x5
	.uleb128 0x122
	.4byte	.LASF773
	.byte	0x5
	.uleb128 0x126
	.4byte	.LASF774
	.byte	0x5
	.uleb128 0x12a
	.4byte	.LASF775
	.byte	0x5
	.uleb128 0x12e
	.4byte	.LASF776
	.byte	0x5
	.uleb128 0x132
	.4byte	.LASF777
	.byte	0x5
	.uleb128 0x136
	.4byte	.LASF778
	.byte	0x5
	.uleb128 0x13a
	.4byte	.LASF779
	.byte	0x5
	.uleb128 0x13e
	.4byte	.LASF780
	.byte	0x5
	.uleb128 0x142
	.4byte	.LASF781
	.byte	0x5
	.uleb128 0x146
	.4byte	.LASF782
	.byte	0x5
	.uleb128 0x14a
	.4byte	.LASF783
	.byte	0x5
	.uleb128 0x14e
	.4byte	.LASF784
	.byte	0x5
	.uleb128 0x152
	.4byte	.LASF785
	.byte	0x5
	.uleb128 0x156
	.4byte	.LASF786
	.byte	0x5
	.uleb128 0x15a
	.4byte	.LASF787
	.byte	0x5
	.uleb128 0x15e
	.4byte	.LASF788
	.byte	0x5
	.uleb128 0x162
	.4byte	.LASF789
	.byte	0x5
	.uleb128 0x166
	.4byte	.LASF790
	.byte	0x5
	.uleb128 0x16a
	.4byte	.LASF791
	.byte	0x5
	.uleb128 0x16e
	.4byte	.LASF792
	.byte	0x5
	.uleb128 0x172
	.4byte	.LASF793
	.byte	0x5
	.uleb128 0x176
	.4byte	.LASF794
	.byte	0x5
	.uleb128 0x17a
	.4byte	.LASF795
	.byte	0x5
	.uleb128 0x17e
	.4byte	.LASF796
	.byte	0x5
	.uleb128 0x182
	.4byte	.LASF797
	.byte	0x5
	.uleb128 0x186
	.4byte	.LASF798
	.byte	0x5
	.uleb128 0x18a
	.4byte	.LASF799
	.byte	0x5
	.uleb128 0x18e
	.4byte	.LASF800
	.byte	0x5
	.uleb128 0x192
	.4byte	.LASF801
	.byte	0x5
	.uleb128 0x196
	.4byte	.LASF802
	.byte	0x5
	.uleb128 0x19a
	.4byte	.LASF803
	.byte	0x5
	.uleb128 0x19e
	.4byte	.LASF804
	.byte	0x5
	.uleb128 0x1a2
	.4byte	.LASF805
	.byte	0x5
	.uleb128 0x1a6
	.4byte	.LASF806
	.byte	0x5
	.uleb128 0x1aa
	.4byte	.LASF807
	.byte	0x5
	.uleb128 0x1bc
	.4byte	.LASF808
	.byte	0x5
	.uleb128 0x1c0
	.4byte	.LASF809
	.byte	0x5
	.uleb128 0x1c4
	.4byte	.LASF810
	.byte	0x5
	.uleb128 0x1c8
	.4byte	.LASF811
	.byte	0x5
	.uleb128 0x1cc
	.4byte	.LASF812
	.byte	0x5
	.uleb128 0x1d0
	.4byte	.LASF813
	.byte	0
	.section	.debug_macro,"G",%progbits,wm4.bbconsole.h.28.182cbcc177a768a650b06cb60c6c5dc1,comdat
.Ldebug_macro10:
	.2byte	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.4byte	.LASF814
	.byte	0x5
	.uleb128 0x1e
	.4byte	.LASF815
	.byte	0x5
	.uleb128 0x20
	.4byte	.LASF816
	.byte	0x5
	.uleb128 0x21
	.4byte	.LASF817
	.byte	0x5
	.uleb128 0x25
	.4byte	.LASF818
	.byte	0x5
	.uleb128 0x26
	.4byte	.LASF819
	.byte	0x5
	.uleb128 0x28
	.4byte	.LASF820
	.byte	0x5
	.uleb128 0x29
	.4byte	.LASF821
	.byte	0x5
	.uleb128 0x2a
	.4byte	.LASF822
	.byte	0x5
	.uleb128 0x2b
	.4byte	.LASF823
	.byte	0x5
	.uleb128 0x2c
	.4byte	.LASF824
	.byte	0x5
	.uleb128 0x2d
	.4byte	.LASF825
	.byte	0x5
	.uleb128 0x2e
	.4byte	.LASF826
	.byte	0x5
	.uleb128 0x2f
	.4byte	.LASF827
	.byte	0x5
	.uleb128 0x31
	.4byte	.LASF828
	.byte	0x5
	.uleb128 0x32
	.4byte	.LASF829
	.byte	0x5
	.uleb128 0x33
	.4byte	.LASF830
	.byte	0x5
	.uleb128 0x34
	.4byte	.LASF831
	.byte	0x5
	.uleb128 0x35
	.4byte	.LASF832
	.byte	0x5
	.uleb128 0x37
	.4byte	.LASF833
	.byte	0x5
	.uleb128 0x38
	.4byte	.LASF834
	.byte	0x5
	.uleb128 0x3a
	.4byte	.LASF835
	.byte	0x5
	.uleb128 0x3b
	.4byte	.LASF836
	.byte	0x5
	.uleb128 0x3d
	.4byte	.LASF837
	.byte	0x5
	.uleb128 0x3f
	.4byte	.LASF838
	.byte	0x5
	.uleb128 0x40
	.4byte	.LASF839
	.byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF818:
	.ascii	"KERN_SOH \"\\001\"\000"
.LASF815:
	.ascii	"CFG_PRINTK \000"
.LASF171:
	.ascii	"__DECIMAL_DIG__ 17\000"
.LASF501:
	.ascii	"INTCPS_ILSR4 0x110\000"
.LASF308:
	.ascii	"__UHA_FBIT__ 8\000"
.LASF701:
	.ascii	"configTOTAL_HEAP_SIZE ( ( size_t ) ( 24 * 1024 ) )\000"
.LASF839:
	.ascii	"PRINTKBUFSIZE 1000\000"
.LASF825:
	.ascii	"KERN_NOTICE KERN_SOH \"5\"\000"
.LASF126:
	.ascii	"__INT_FAST32_MAX__ 2147483647\000"
.LASF817:
	.ascii	"OMAP34XX_UART3 (DM3730_L4_PERIPHERAL+0x20000)\000"
.LASF427:
	.ascii	"TRUE 1\000"
.LASF329:
	.ascii	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2\000"
.LASF320:
	.ascii	"__CHAR_UNSIGNED__ 1\000"
.LASF548:
	.ascii	"INTCPS_ILSR51 0x1CC\000"
.LASF767:
	.ascii	"traceTASK_SWITCHED_IN() \000"
.LASF200:
	.ascii	"__SFRACT_FBIT__ 7\000"
.LASF675:
	.ascii	"SFLSR_REG 0x028\000"
.LASF87:
	.ascii	"__LONG_LONG_MAX__ 9223372036854775807LL\000"
.LASF706:
	.ascii	"configIDLE_SHOULD_YIELD 1\000"
.LASF660:
	.ascii	"FCR_REG 0x008\000"
.LASF272:
	.ascii	"__LLACCUM_MIN__ (-0X1P31LLK-0X1P31LLK)\000"
.LASF264:
	.ascii	"__LACCUM_EPSILON__ 0x1P-31LK\000"
.LASF197:
	.ascii	"__DEC128_MAX__ 9.999999999999999999999999999999999E"
	.ascii	"6144DL\000"
.LASF462:
	.ascii	"INTCPS_REVISION 0x0\000"
.LASF95:
	.ascii	"__INTMAX_C(c) c ## LL\000"
.LASF91:
	.ascii	"__WINT_MIN__ 0U\000"
.LASF752:
	.ascii	"INCLUDE_uxTaskGetStackHighWaterMark 0\000"
.LASF258:
	.ascii	"__UACCUM_MAX__ 0XFFFFFFFFP-16UK\000"
.LASF185:
	.ascii	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF\000"
.LASF289:
	.ascii	"__TQ_IBIT__ 0\000"
.LASF647:
	.ascii	"PIN26 (0x1 << 26)\000"
.LASF755:
	.ascii	"configUSE_ALTERNATIVE_API 0\000"
.LASF29:
	.ascii	"__ATOMIC_CONSUME 1\000"
.LASF265:
	.ascii	"__ULACCUM_FBIT__ 32\000"
.LASF252:
	.ascii	"__ACCUM_MIN__ (-0X1P15K-0X1P15K)\000"
.LASF33:
	.ascii	"__SIZEOF_LONG_LONG__ 8\000"
.LASF156:
	.ascii	"__DBL_MAX_10_EXP__ 308\000"
.LASF212:
	.ascii	"__FRACT_MIN__ (-0.5R-0.5R)\000"
.LASF4:
	.ascii	"ulCriticalNesting\000"
.LASF278:
	.ascii	"__ULLACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULLK\000"
.LASF248:
	.ascii	"__USACCUM_MAX__ 0XFFFFP-8UHK\000"
.LASF182:
	.ascii	"__DEC32_MIN__ 1E-95DF\000"
.LASF285:
	.ascii	"__SQ_IBIT__ 0\000"
.LASF43:
	.ascii	"__ORDER_PDP_ENDIAN__ 3412\000"
.LASF47:
	.ascii	"__SIZE_TYPE__ unsigned int\000"
.LASF188:
	.ascii	"__DEC64_MAX_EXP__ 385\000"
.LASF148:
	.ascii	"__FLT_HAS_DENORM__ 1\000"
.LASF56:
	.ascii	"__INT8_TYPE__ signed char\000"
.LASF689:
	.ascii	"MVR_REG 0x050\000"
.LASF664:
	.ascii	"XON1_ADDR1_REG 0x010\000"
.LASF247:
	.ascii	"__USACCUM_MIN__ 0.0UHK\000"
.LASF715:
	.ascii	"INCLUDE_vTaskSuspend 1\000"
.LASF167:
	.ascii	"__LDBL_MIN_EXP__ (-1021)\000"
.LASF830:
	.ascii	"CFG_NS16550_REG_SIZE -4\000"
.LASF165:
	.ascii	"__LDBL_MANT_DIG__ 53\000"
.LASF438:
	.ascii	"E_FIQ (*(REG32 (0x4020FFFC)))\000"
.LASF502:
	.ascii	"INTCPS_ILSR5 0x114\000"
.LASF750:
	.ascii	"portUSING_MPU_WRAPPERS 0\000"
.LASF117:
	.ascii	"__UINT8_C(c) c\000"
.LASF57:
	.ascii	"__INT16_TYPE__ short int\000"
.LASF644:
	.ascii	"PIN23 (0x1 << 23)\000"
.LASF697:
	.ascii	"configCPU_CLOCK_HZ ( ( unsigned long ) 8000000 )\000"
.LASF765:
	.ascii	"traceSTART() \000"
.LASF804:
	.ascii	"traceTIMER_COMMAND_SEND(xTimer,xMessageID,xMessageV"
	.ascii	"alueValue,xReturn) \000"
.LASF321:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1\000"
.LASF23:
	.ascii	"__VERSION__ \"4.7.3\"\000"
.LASF19:
	.ascii	"__STDC_HOSTED__ 1\000"
.LASF235:
	.ascii	"__ULLFRACT_FBIT__ 64\000"
.LASF571:
	.ascii	"INTCPS_ILSR74 0x228\000"
.LASF75:
	.ascii	"__INT_FAST64_TYPE__ long long int\000"
.LASF50:
	.ascii	"__WINT_TYPE__ unsigned int\000"
.LASF567:
	.ascii	"INTCPS_ILSR70 0x218\000"
.LASF720:
	.ascii	"configTIMER_QUEUE_LENGTH 5\000"
.LASF782:
	.ascii	"traceQUEUE_SEND(pxQueue) \000"
.LASF375:
	.ascii	"__SIZE_T__ \000"
.LASF107:
	.ascii	"__UINT64_MAX__ 18446744073709551615ULL\000"
.LASF748:
	.ascii	"PRIVILEGED_FUNCTION \000"
.LASF208:
	.ascii	"__USFRACT_MAX__ 0XFFP-8UHR\000"
.LASF549:
	.ascii	"INTCPS_ILSR52 0x1D0\000"
.LASF408:
	.ascii	"__need_wchar_t\000"
.LASF634:
	.ascii	"PIN13 (0x1 << 13)\000"
.LASF781:
	.ascii	"traceCREATE_COUNTING_SEMAPHORE_FAILED() \000"
.LASF801:
	.ascii	"traceTASK_INCREMENT_TICK(xTickCount) \000"
.LASF370:
	.ascii	"_BSD_PTRDIFF_T_ \000"
.LASF471:
	.ascii	"INTCPS_FIQ_PRIORITY 0x64\000"
.LASF691:
	.ascii	"SYSS_REG 0x058\000"
.LASF11:
	.ascii	"GNU C 4.7.3\000"
.LASF225:
	.ascii	"__ULFRACT_FBIT__ 32\000"
.LASF390:
	.ascii	"__size_t \000"
.LASF692:
	.ascii	"WER_REG 0x05C\000"
.LASF355:
	.ascii	"DEBUG 1\000"
.LASF805:
	.ascii	"traceTIMER_EXPIRED(pxTimer) \000"
.LASF526:
	.ascii	"INTCPS_ILSR29 0x174\000"
.LASF204:
	.ascii	"__SFRACT_EPSILON__ 0x1P-7HR\000"
.LASF379:
	.ascii	"_T_SIZE \000"
.LASF154:
	.ascii	"__DBL_MIN_10_EXP__ (-307)\000"
.LASF294:
	.ascii	"__USQ_FBIT__ 32\000"
.LASF42:
	.ascii	"__ORDER_BIG_ENDIAN__ 4321\000"
.LASF481:
	.ascii	"INTCPS_ITR1 0xA0\000"
.LASF636:
	.ascii	"PIN15 (0x1 << 15)\000"
.LASF503:
	.ascii	"INTCPS_ILSR6 0x118\000"
.LASF811:
	.ascii	"portYIELD_WITHIN_API portYIELD\000"
.LASF292:
	.ascii	"__UHQ_FBIT__ 16\000"
.LASF414:
	.ascii	"pdTRUE ( 1 )\000"
.LASF83:
	.ascii	"__SCHAR_MAX__ 127\000"
.LASF184:
	.ascii	"__DEC32_EPSILON__ 1E-6DF\000"
.LASF409:
	.ascii	"NULL\000"
.LASF585:
	.ascii	"INTCPS_ILSR88 0x260\000"
.LASF261:
	.ascii	"__LACCUM_IBIT__ 32\000"
.LASF710:
	.ascii	"configMAX_CO_ROUTINE_PRIORITIES ( 2 )\000"
.LASF301:
	.ascii	"__HA_IBIT__ 8\000"
.LASF416:
	.ascii	"pdPASS ( 1 )\000"
.LASF101:
	.ascii	"__INT16_MAX__ 32767\000"
.LASF572:
	.ascii	"INTCPS_ILSR75 0x22C\000"
.LASF759:
	.ascii	"INCLUDE_xTaskGetSchedulerState 0\000"
.LASF232:
	.ascii	"__LLFRACT_MIN__ (-0.5LLR-0.5LLR)\000"
.LASF94:
	.ascii	"__INTMAX_MAX__ 9223372036854775807LL\000"
.LASF246:
	.ascii	"__USACCUM_IBIT__ 8\000"
.LASF421:
	.ascii	"errNO_TASK_TO_RUN ( -2 )\000"
.LASF550:
	.ascii	"INTCPS_ILSR53 0x1D4\000"
.LASF217:
	.ascii	"__UFRACT_MIN__ 0.0UR\000"
.LASF178:
	.ascii	"__LDBL_HAS_QUIET_NAN__ 1\000"
.LASF512:
	.ascii	"INTCPS_ILSR15 0x13C\000"
.LASF377:
	.ascii	"_SYS_SIZE_T_H \000"
.LASF757:
	.ascii	"INCLUDE_xTaskResumeFromISR 1\000"
.LASF68:
	.ascii	"__UINT_LEAST8_TYPE__ unsigned char\000"
.LASF665:
	.ascii	"LSR_REG 0x014\000"
.LASF606:
	.ascii	"GPIO_DATAOUT 0x3C\000"
.LASF488:
	.ascii	"INTCPS_PENDING_FIQ1 0xBC\000"
.LASF256:
	.ascii	"__UACCUM_IBIT__ 16\000"
.LASF2:
	.ascii	"long int\000"
.LASF131:
	.ascii	"__UINT_FAST64_MAX__ 18446744073709551615ULL\000"
.LASF3:
	.ascii	"pxCurrentTCB\000"
.LASF159:
	.ascii	"__DBL_MIN__ ((double)2.2250738585072014e-308L)\000"
.LASF718:
	.ascii	"configUSE_TIMERS 1\000"
.LASF88:
	.ascii	"__WCHAR_MAX__ 4294967295U\000"
.LASF194:
	.ascii	"__DEC128_MIN_EXP__ (-6142)\000"
.LASF437:
	.ascii	"E_IRQ (*(REG32 (0x4020FFF8)))\000"
.LASF72:
	.ascii	"__INT_FAST8_TYPE__ int\000"
.LASF312:
	.ascii	"__UDA_FBIT__ 32\000"
.LASF374:
	.ascii	"__size_t__ \000"
.LASF655:
	.ascii	"RHR_REG 0x000\000"
.LASF97:
	.ascii	"__UINTMAX_C(c) c ## ULL\000"
.LASF46:
	.ascii	"__SIZEOF_POINTER__ 4\000"
.LASF64:
	.ascii	"__INT_LEAST8_TYPE__ signed char\000"
.LASF504:
	.ascii	"INTCPS_ILSR7 0x11C\000"
.LASF425:
	.ascii	"REG32 (volatile unsigned int*)\000"
.LASF764:
	.ascii	"vQueueUnregisterQueue(xQueue) \000"
.LASF325:
	.ascii	"__GCC_ATOMIC_BOOL_LOCK_FREE 2\000"
.LASF284:
	.ascii	"__SQ_FBIT__ 31\000"
.LASF624:
	.ascii	"PIN3 (0x1 << 3)\000"
.LASF125:
	.ascii	"__INT_FAST16_MAX__ 2147483647\000"
.LASF629:
	.ascii	"PIN8 (0x1 << 8)\000"
.LASF348:
	.ascii	"__THUMB_INTERWORK__ 1\000"
.LASF238:
	.ascii	"__ULLFRACT_MAX__ 0XFFFFFFFFFFFFFFFFP-64ULLR\000"
.LASF100:
	.ascii	"__INT8_MAX__ 127\000"
.LASF371:
	.ascii	"___int_ptrdiff_t_h \000"
.LASF386:
	.ascii	"_SIZE_T_DECLARED \000"
.LASF54:
	.ascii	"__CHAR32_TYPE__ long unsigned int\000"
.LASF662:
	.ascii	"LCR_REG 0x00C\000"
.LASF485:
	.ascii	"INTCPS_ISR_SET1 0xB0\000"
.LASF141:
	.ascii	"__FLT_MAX_EXP__ 128\000"
.LASF32:
	.ascii	"__SIZEOF_LONG__ 4\000"
.LASF493:
	.ascii	"INTCPS_ISR_SET2 0xD0\000"
.LASF596:
	.ascii	"GPIO_SYSCONFIG 0x10\000"
.LASF419:
	.ascii	"errQUEUE_FULL ( 0 )\000"
.LASF740:
	.ascii	"portENABLE_INTERRUPTS() __asm volatile ( \"STMDB\011"
	.ascii	"SP!, {R0}\011\011\\n\\t\" \"MRS\011R0, CPSR\011\011"
	.ascii	"\\n\\t\" \"BIC\011R0, R0, #0xC0\011\\n\\t\" \"MSR\011"
	.ascii	"CPSR, R0\011\011\\n\\t\" \"LDMIA\011SP!, {R0}\011\011"
	.ascii	"\011\" )\000"
.LASF802:
	.ascii	"traceTIMER_CREATE(pxNewTimer) \000"
.LASF36:
	.ascii	"__SIZEOF_DOUBLE__ 8\000"
.LASF551:
	.ascii	"INTCPS_ILSR54 0x1D8\000"
.LASF835:
	.ascii	"CONFIG_BAUDRATE 115200\000"
.LASF749:
	.ascii	"PRIVILEGED_DATA \000"
.LASF779:
	.ascii	"traceTAKE_MUTEX_RECURSIVE_FAILED(pxMutex) \000"
.LASF470:
	.ascii	"INTCPS_IRQ_PRIORITY 0x60\000"
.LASF686:
	.ascii	"SCR_REG 0x040\000"
.LASF190:
	.ascii	"__DEC64_MAX__ 9.999999999999999E384DD\000"
.LASF423:
	.ascii	"errQUEUE_YIELD ( -5 )\000"
.LASF633:
	.ascii	"PIN12 (0x1 << 12)\000"
.LASF314:
	.ascii	"__UTA_FBIT__ 64\000"
.LASF573:
	.ascii	"INTCPS_ILSR76 0x230\000"
.LASF143:
	.ascii	"__FLT_DECIMAL_DIG__ 9\000"
.LASF798:
	.ascii	"traceTASK_SUSPEND(pxTaskToSuspend) \000"
.LASF63:
	.ascii	"__UINT64_TYPE__ long long unsigned int\000"
.LASF583:
	.ascii	"INTCPS_ILSR86 0x258\000"
.LASF358:
	.ascii	"__CS_SOURCERYGXX_MAJ__ 2013\000"
.LASF812:
	.ascii	"pvPortMallocAligned(x,puxStackBuffer) ( ( ( puxStac"
	.ascii	"kBuffer ) == NULL ) ? ( pvPortMalloc( ( x ) ) ) : ("
	.ascii	" puxStackBuffer ) )\000"
.LASF210:
	.ascii	"__FRACT_FBIT__ 15\000"
.LASF274:
	.ascii	"__LLACCUM_EPSILON__ 0x1P-31LLK\000"
.LASF513:
	.ascii	"INTCPS_ILSR16 0x140\000"
.LASF28:
	.ascii	"__ATOMIC_ACQ_REL 4\000"
.LASF328:
	.ascii	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2\000"
.LASF22:
	.ascii	"__GNUC_PATCHLEVEL__ 3\000"
.LASF161:
	.ascii	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324"
	.ascii	"L)\000"
.LASF727:
	.ascii	"portSHORT short\000"
.LASF744:
	.ascii	"portTASK_FUNCTION(vFunction,pvParameters) void vFun"
	.ascii	"ction( void *pvParameters )\000"
.LASF794:
	.ascii	"traceTASK_DELETE(pxTaskToDelete) \000"
.LASF831:
	.ascii	"CFG_NS16550_CLK 48000000\000"
.LASF357:
	.ascii	"GCC_OMAP3_BeagleBoard 1\000"
.LASF822:
	.ascii	"KERN_CRIT KERN_SOH \"2\"\000"
.LASF525:
	.ascii	"INTCPS_ILSR28 0x170\000"
.LASF385:
	.ascii	"_BSD_SIZE_T_DEFINED_ \000"
.LASF6:
	.ascii	"vIRQHandler\000"
.LASF387:
	.ascii	"___int_size_t_h \000"
.LASF433:
	.ascii	"E_SWI (*(REG32 (0x4020FFE8)))\000"
.LASF35:
	.ascii	"__SIZEOF_FLOAT__ 4\000"
.LASF241:
	.ascii	"__SACCUM_IBIT__ 8\000"
.LASF7:
	.ascii	"vPortYieldProcessor\000"
.LASF142:
	.ascii	"__FLT_MAX_10_EXP__ 38\000"
.LASF213:
	.ascii	"__FRACT_MAX__ 0X7FFFP-15R\000"
.LASF776:
	.ascii	"traceGIVE_MUTEX_RECURSIVE(pxMutex) \000"
.LASF25:
	.ascii	"__ATOMIC_SEQ_CST 5\000"
.LASF505:
	.ascii	"INTCPS_ILSR8 0x120\000"
.LASF450:
	.ascii	"GPTI_TTGR 0x30\000"
.LASF622:
	.ascii	"PIN1 (0x1 << 1)\000"
.LASF627:
	.ascii	"PIN6 (0x1 << 6)\000"
.LASF610:
	.ascii	"GPIO_FALLINGDETECT 0x4C\000"
.LASF552:
	.ascii	"INTCPS_ILSR55 0x1DC\000"
.LASF128:
	.ascii	"__UINT_FAST8_MAX__ 4294967295U\000"
.LASF460:
	.ascii	"GPTI_TOWR 0x58\000"
.LASF537:
	.ascii	"INTCPS_ILSR40 0x1A0\000"
.LASF34:
	.ascii	"__SIZEOF_SHORT__ 2\000"
.LASF275:
	.ascii	"__ULLACCUM_FBIT__ 32\000"
.LASF461:
	.ascii	"MPU_INTC 0x48200000\000"
.LASF383:
	.ascii	"_SIZE_T_DEFINED_ \000"
.LASF575:
	.ascii	"INTCPS_ILSR78 0x238\000"
.LASF517:
	.ascii	"INTCPS_ILSR20 0x150\000"
.LASF813:
	.ascii	"vPortFreeAligned(pvBlockToFree) vPortFree( pvBlockT"
	.ascii	"oFree )\000"
.LASF37:
	.ascii	"__SIZEOF_LONG_DOUBLE__ 8\000"
.LASF514:
	.ascii	"INTCPS_ILSR17 0x144\000"
.LASF337:
	.ascii	"__PRAGMA_REDEFINE_EXTNAME 1\000"
.LASF49:
	.ascii	"__WCHAR_TYPE__ unsigned int\000"
.LASF477:
	.ascii	"INTCPS_ISR_SET0 0x90\000"
.LASF593:
	.ascii	"GPIO5_BASE 0x49056000\000"
.LASF311:
	.ascii	"__USA_IBIT__ 16\000"
.LASF322:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1\000"
.LASF82:
	.ascii	"__GXX_ABI_VERSION 1002\000"
.LASF79:
	.ascii	"__UINT_FAST64_TYPE__ long long unsigned int\000"
.LASF746:
	.ascii	"portNUM_CONFIGURABLE_REGIONS 1\000"
.LASF816:
	.ascii	"DM3730_L4_PERIPHERAL 0x49000000\000"
.LASF587:
	.ascii	"INTCPS_ILSR90 0x268\000"
.LASF145:
	.ascii	"__FLT_MIN__ 1.1754943508222875e-38F\000"
.LASF766:
	.ascii	"traceEND() \000"
.LASF300:
	.ascii	"__HA_FBIT__ 7\000"
.LASF814:
	.ascii	"__BBCONSOLE_H_ 1\000"
.LASF534:
	.ascii	"INTCPS_ILSR37 0x194\000"
.LASF333:
	.ascii	"__GCC_ATOMIC_LLONG_LOCK_FREE 2\000"
.LASF250:
	.ascii	"__ACCUM_FBIT__ 15\000"
.LASF646:
	.ascii	"PIN25 (0x1 << 25)\000"
.LASF206:
	.ascii	"__USFRACT_IBIT__ 0\000"
.LASF113:
	.ascii	"__INT32_C(c) c ## L\000"
.LASF174:
	.ascii	"__LDBL_EPSILON__ 2.2204460492503131e-16L\000"
.LASF506:
	.ascii	"INTCPS_ILSR9 0x124\000"
.LASF207:
	.ascii	"__USFRACT_MIN__ 0.0UHR\000"
.LASF832:
	.ascii	"CFG_NS16550_COM3 OMAP34XX_UART3\000"
.LASF169:
	.ascii	"__LDBL_MAX_EXP__ 1024\000"
.LASF451:
	.ascii	"GPTI_TWPS 0x34\000"
.LASF618:
	.ascii	"GPIO_SETWKUENA 0x84\000"
.LASF162:
	.ascii	"__DBL_HAS_DENORM__ 1\000"
.LASF538:
	.ascii	"INTCPS_ILSR41 0x1A4\000"
.LASF599:
	.ascii	"GPIO_IRQ_ENABLE1 0x1C\000"
.LASF304:
	.ascii	"__DA_FBIT__ 31\000"
.LASF455:
	.ascii	"GPTI_TCAR2 0x44\000"
.LASF147:
	.ascii	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F\000"
.LASF288:
	.ascii	"__TQ_FBIT__ 127\000"
.LASF625:
	.ascii	"PIN4 (0x1 << 4)\000"
.LASF110:
	.ascii	"__INT_LEAST16_MAX__ 32767\000"
.LASF468:
	.ascii	"INTCPS_PROTECTION 0x4C\000"
.LASF518:
	.ascii	"INTCPS_ILSR21 0x154\000"
.LASF666:
	.ascii	"XON2_ADDR2_REG 0x014\000"
.LASF121:
	.ascii	"__UINT32_C(c) c ## UL\000"
.LASF716:
	.ascii	"INCLUDE_vTaskDelayUntil 1\000"
.LASF553:
	.ascii	"INTCPS_ILSR56 0x1E0\000"
.LASF656:
	.ascii	"THR_REG 0x000\000"
.LASF103:
	.ascii	"__INT64_MAX__ 9223372036854775807LL\000"
.LASF146:
	.ascii	"__FLT_EPSILON__ 1.1920928955078125e-7F\000"
.LASF330:
	.ascii	"__GCC_ATOMIC_SHORT_LOCK_FREE 2\000"
.LASF584:
	.ascii	"INTCPS_ILSR87 0x25C\000"
.LASF614:
	.ascii	"GPIO_SETIRQENABLE1 0x64\000"
.LASF799:
	.ascii	"traceTASK_RESUME(pxTaskToResume) \000"
.LASF657:
	.ascii	"DLH_REG 0x004\000"
.LASF60:
	.ascii	"__UINT8_TYPE__ unsigned char\000"
.LASF588:
	.ascii	"INTCPS_ILSR91 0x26C\000"
.LASF452:
	.ascii	"GPTI_TMAR 0x38\000"
.LASF245:
	.ascii	"__USACCUM_FBIT__ 8\000"
.LASF334:
	.ascii	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1\000"
.LASF353:
	.ascii	"__ELF__ 1\000"
.LASF688:
	.ascii	"EBLR_REG 0x048\000"
.LASF673:
	.ascii	"MDR1_REG 0x020\000"
.LASF838:
	.ascii	"PRINTKKERNLOG '7'\000"
.LASF430:
	.ascii	"PRINTABLE_START 0x20\000"
.LASF528:
	.ascii	"INTCPS_ILSR31 0x17C\000"
.LASF177:
	.ascii	"__LDBL_HAS_INFINITY__ 1\000"
.LASF15:
	.ascii	"FREERTOS_CONFIG_H \000"
.LASF306:
	.ascii	"__TA_FBIT__ 63\000"
.LASF482:
	.ascii	"INTCPS_MIR1 0xA4\000"
.LASF350:
	.ascii	"__ARM_PCS 1\000"
.LASF490:
	.ascii	"INTCPS_MIR2 0xC4\000"
.LASF420:
	.ascii	"errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY ( -1 )\000"
.LASF539:
	.ascii	"INTCPS_ILSR42 0x1A8\000"
.LASF99:
	.ascii	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)\000"
.LASF651:
	.ascii	"PIN30 (0x1 << 30)\000"
.LASF257:
	.ascii	"__UACCUM_MIN__ 0.0UK\000"
.LASF399:
	.ascii	"_BSD_WCHAR_T_ \000"
.LASF684:
	.ascii	"BLR_REG 0x038\000"
.LASF783:
	.ascii	"traceQUEUE_SEND_FAILED(pxQueue) \000"
.LASF519:
	.ascii	"INTCPS_ILSR22 0x158\000"
.LASF561:
	.ascii	"INTCPS_ILSR64 0x200\000"
.LASF554:
	.ascii	"INTCPS_ILSR57 0x1E4\000"
.LASF694:
	.ascii	"configUSE_PREEMPTION 1\000"
.LASF516:
	.ascii	"INTCPS_ILSR19 0x14C\000"
.LASF713:
	.ascii	"INCLUDE_vTaskDelete 1\000"
.LASF127:
	.ascii	"__INT_FAST64_MAX__ 9223372036854775807LL\000"
.LASF413:
	.ascii	"PROJDEFS_H \000"
.LASF192:
	.ascii	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD\000"
.LASF209:
	.ascii	"__USFRACT_EPSILON__ 0x1P-8UHR\000"
.LASF410:
	.ascii	"NULL ((void *)0)\000"
.LASF687:
	.ascii	"SSR_REG 0x044\000"
.LASF730:
	.ascii	"portMAX_DELAY ( portTickType ) 0xffffffff\000"
.LASF205:
	.ascii	"__USFRACT_FBIT__ 8\000"
.LASF273:
	.ascii	"__LLACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LLK\000"
.LASF411:
	.ascii	"__need_NULL\000"
.LASF641:
	.ascii	"PIN20 (0x1 << 20)\000"
.LASF134:
	.ascii	"__FLT_EVAL_METHOD__ 0\000"
.LASF317:
	.ascii	"__USER_LABEL_PREFIX__ \000"
.LASF714:
	.ascii	"INCLUDE_vTaskCleanUpResources 0\000"
.LASF721:
	.ascii	"configTIMER_TASK_STACK_DEPTH ( configMINIMAL_STACK_"
	.ascii	"SIZE * 2 )\000"
.LASF696:
	.ascii	"configUSE_TICK_HOOK 0\000"
.LASF454:
	.ascii	"GPTI_TSICR 0x40\000"
.LASF771:
	.ascii	"configCHECK_FOR_STACK_OVERFLOW 0\000"
.LASF695:
	.ascii	"configUSE_IDLE_HOOK 0\000"
.LASF685:
	.ascii	"ACREG_REG 0x03C\000"
.LASF335:
	.ascii	"__GCC_ATOMIC_POINTER_LOCK_FREE 2\000"
.LASF680:
	.ascii	"RXFLL_REG 0x030\000"
.LASF26:
	.ascii	"__ATOMIC_ACQUIRE 2\000"
.LASF834:
	.ascii	"CONFIG_CONS_INDEX 3\000"
.LASF774:
	.ascii	"traceCREATE_MUTEX(pxNewQueue) \000"
.LASF363:
	.ascii	"_ANSI_STDDEF_H \000"
.LASF761:
	.ascii	"portSET_INTERRUPT_MASK_FROM_ISR() 0\000"
.LASF795:
	.ascii	"traceTASK_DELAY_UNTIL() \000"
.LASF653:
	.ascii	"SERIAL_BASE 0x49020000\000"
.LASF160:
	.ascii	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)\000"
.LASF589:
	.ascii	"INTCPS_ILSR92 0x270\000"
.LASF222:
	.ascii	"__LFRACT_MIN__ (-0.5LR-0.5LR)\000"
.LASF149:
	.ascii	"__FLT_HAS_INFINITY__ 1\000"
.LASF540:
	.ascii	"INTCPS_ILSR43 0x1AC\000"
.LASF586:
	.ascii	"INTCPS_ILSR89 0x264\000"
.LASF253:
	.ascii	"__ACCUM_MAX__ 0X7FFFFFFFP-15K\000"
.LASF631:
	.ascii	"PIN10 (0x1 << 10)\000"
.LASF465:
	.ascii	"INTCPS_SIR_IRQ 0x40\000"
.LASF650:
	.ascii	"PIN29 (0x1 << 29)\000"
.LASF73:
	.ascii	"__INT_FAST16_TYPE__ int\000"
.LASF336:
	.ascii	"__GCC_HAVE_DWARF2_CFI_ASM 1\000"
.LASF202:
	.ascii	"__SFRACT_MIN__ (-0.5HR-0.5HR)\000"
.LASF1:
	.ascii	"long unsigned int\000"
.LASF303:
	.ascii	"__SA_IBIT__ 16\000"
.LASF16:
	.ascii	"PORTABLE_H \000"
.LASF20:
	.ascii	"__GNUC__ 4\000"
.LASF529:
	.ascii	"INTCPS_ILSR32 0x180\000"
.LASF562:
	.ascii	"INTCPS_ILSR65 0x204\000"
.LASF61:
	.ascii	"__UINT16_TYPE__ short unsigned int\000"
.LASF807:
	.ascii	"configGENERATE_RUN_TIME_STATS 0\000"
.LASF555:
	.ascii	"INTCPS_ILSR58 0x1E8\000"
.LASF346:
	.ascii	"__SOFTFP__ 1\000"
.LASF181:
	.ascii	"__DEC32_MAX_EXP__ 97\000"
.LASF378:
	.ascii	"_T_SIZE_ \000"
.LASF428:
	.ascii	"LINE_FEED 0xA\000"
.LASF603:
	.ascii	"GPIO_CTRL 0x30\000"
.LASF707:
	.ascii	"configQUEUE_REGISTRY_SIZE 0\000"
.LASF76:
	.ascii	"__UINT_FAST8_TYPE__ unsigned int\000"
.LASF271:
	.ascii	"__LLACCUM_IBIT__ 32\000"
.LASF214:
	.ascii	"__FRACT_EPSILON__ 0x1P-15R\000"
.LASF478:
	.ascii	"INTCPS_ISR_CLEAR0 0x94\000"
.LASF762:
	.ascii	"portCLEAR_INTERRUPT_MASK_FROM_ISR(uxSavedStatusValu"
	.ascii	"e) ( void ) uxSavedStatusValue\000"
.LASF474:
	.ascii	"INTCPS_MIR0 0x84\000"
.LASF349:
	.ascii	"__ARM_ARCH_7A__ 1\000"
.LASF104:
	.ascii	"__UINT8_MAX__ 255\000"
.LASF344:
	.ascii	"__APCS_32__ 1\000"
.LASF640:
	.ascii	"PIN19 (0x1 << 19)\000"
.LASF577:
	.ascii	"INTCPS_ILSR80 0x240\000"
.LASF827:
	.ascii	"KERN_DEBUG KERN_SOH \"7\"\000"
.LASF85:
	.ascii	"__INT_MAX__ 2147483647\000"
.LASF412:
	.ascii	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEM"
	.ascii	"BER)\000"
.LASF123:
	.ascii	"__UINT64_C(c) c ## ULL\000"
.LASF71:
	.ascii	"__UINT_LEAST64_TYPE__ long long unsigned int\000"
.LASF442:
	.ascii	"GPTI_TIOCP_CFG 0x10\000"
.LASF725:
	.ascii	"portDOUBLE double\000"
.LASF327:
	.ascii	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2\000"
.LASF155:
	.ascii	"__DBL_MAX_EXP__ 1024\000"
.LASF27:
	.ascii	"__ATOMIC_RELEASE 3\000"
.LASF712:
	.ascii	"INCLUDE_uxTaskPriorityGet 1\000"
.LASF658:
	.ascii	"IER_REG 0x004\000"
.LASF137:
	.ascii	"__FLT_MANT_DIG__ 24\000"
.LASF590:
	.ascii	"INTCPS_ILSR93 0x274\000"
.LASF260:
	.ascii	"__LACCUM_FBIT__ 31\000"
.LASF331:
	.ascii	"__GCC_ATOMIC_INT_LOCK_FREE 2\000"
.LASF753:
	.ascii	"configUSE_RECURSIVE_MUTEXES 0\000"
.LASF467:
	.ascii	"INTCPS_CONTROL 0x48\000"
.LASF672:
	.ascii	"XOFF2_REG 0x01C\000"
.LASF366:
	.ascii	"_T_PTRDIFF_ \000"
.LASF175:
	.ascii	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L\000"
.LASF530:
	.ascii	"INTCPS_ILSR33 0x184\000"
.LASF563:
	.ascii	"INTCPS_ILSR66 0x208\000"
.LASF619:
	.ascii	"GPIO_CLEARDATAOUT 0x90\000"
.LASF236:
	.ascii	"__ULLFRACT_IBIT__ 0\000"
.LASF556:
	.ascii	"INTCPS_ILSR59 0x1EC\000"
.LASF708:
	.ascii	"configUSE_MUTEXES 0\000"
.LASF324:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1\000"
.LASF601:
	.ascii	"GPIO_IRQSTATUS2 0x28\000"
.LASF492:
	.ascii	"INTCPS_MIR_SET2 0xCC\000"
.LASF541:
	.ascii	"INTCPS_ILSR44 0x1B0\000"
.LASF144:
	.ascii	"__FLT_MAX__ 3.4028234663852886e+38F\000"
.LASF255:
	.ascii	"__UACCUM_FBIT__ 16\000"
.LASF615:
	.ascii	"GPIO_CLEARIRQENABLE2 0x70\000"
.LASF219:
	.ascii	"__UFRACT_EPSILON__ 0x1P-16UR\000"
.LASF89:
	.ascii	"__WCHAR_MIN__ 0U\000"
.LASF106:
	.ascii	"__UINT32_MAX__ 4294967295UL\000"
.LASF291:
	.ascii	"__UQQ_IBIT__ 0\000"
.LASF332:
	.ascii	"__GCC_ATOMIC_LONG_LOCK_FREE 2\000"
.LASF267:
	.ascii	"__ULACCUM_MIN__ 0.0ULK\000"
.LASF391:
	.ascii	"__need_size_t\000"
.LASF172:
	.ascii	"__LDBL_MAX__ 1.7976931348623157e+308L\000"
.LASF58:
	.ascii	"__INT32_TYPE__ long int\000"
.LASF426:
	.ascii	"FALSE 0\000"
.LASF381:
	.ascii	"_SIZE_T_ \000"
.LASF136:
	.ascii	"__FLT_RADIX__ 2\000"
.LASF648:
	.ascii	"PIN27 (0x1 << 27)\000"
.LASF617:
	.ascii	"GPIO_CLEARWKUENA 0x80\000"
.LASF120:
	.ascii	"__UINT_LEAST32_MAX__ 4294967295UL\000"
.LASF365:
	.ascii	"_PTRDIFF_T \000"
.LASF738:
	.ascii	"portYIELD() __asm volatile ( \"SWI 0\" )\000"
.LASF669:
	.ascii	"XOFF1_REG 0x018\000"
.LASF678:
	.ascii	"TXFLH_REG 0x02C\000"
.LASF591:
	.ascii	"INTCPS_ILSR94 0x278\000"
.LASF318:
	.ascii	"__GNUC_GNU_INLINE__ 1\000"
.LASF645:
	.ascii	"PIN24 (0x1 << 24)\000"
.LASF699:
	.ascii	"configMAX_PRIORITIES ( ( unsigned portBASE_TYPE ) 5"
	.ascii	" )\000"
.LASF613:
	.ascii	"GPIO_CLEARIRQENABLE1 0x60\000"
.LASF464:
	.ascii	"INTCPS_SYSSTATUS 0x14\000"
.LASF397:
	.ascii	"__WCHAR_T \000"
.LASF668:
	.ascii	"TCR_REG 0x018\000"
.LASF681:
	.ascii	"SFREGH_REG 0x034\000"
.LASF531:
	.ascii	"INTCPS_ILSR34 0x188\000"
.LASF59:
	.ascii	"__INT64_TYPE__ long long int\000"
.LASF220:
	.ascii	"__LFRACT_FBIT__ 31\000"
.LASF39:
	.ascii	"__CHAR_BIT__ 8\000"
.LASF338:
	.ascii	"__SIZEOF_WCHAR_T__ 4\000"
.LASF564:
	.ascii	"INTCPS_ILSR67 0x20C\000"
.LASF597:
	.ascii	"GPIO_SYSSTATUS 0x14\000"
.LASF443:
	.ascii	"GPTI_TISTAT 0x14\000"
.LASF790:
	.ascii	"traceQUEUE_RECEIVE_FROM_ISR_FAILED(pxQueue) \000"
.LASF736:
	.ascii	"portSAVE_CONTEXT() { extern volatile void * volatil"
	.ascii	"e pxCurrentTCB; extern volatile unsigned portLONG u"
	.ascii	"lCriticalNesting; __asm volatile ( \"STMDB\011SP!, "
	.ascii	"{R0}\011\011\011\011\011\011\011\011\011\011\011\\n"
	.ascii	"\\t\" \"STMDB\011SP,{SP}^\011\011\011\011\011\011\011"
	.ascii	"\011\011\011\011\\n\\t\" \"NOP\011\011\011\011\011\011"
	.ascii	"\011\011\011\011\011\011\011\011\\n\\t\" \"SUB\011S"
	.ascii	"P, SP, #4\011\011\011\011\011\011\011\011\011\011\011"
	.ascii	"\\n\\t\" \"LDMIA\011SP!,{R0}\011\011\011\011\011\011"
	.ascii	"\011\011\011\011\011\\n\\t\" \"STMDB\011R0!, {LR}\011"
	.ascii	"\011\011\011\011\011\011\011\011\011\011\\n\\t\" \""
	.ascii	"MOV\011LR, R0\011\011\011\011\011\011\011\011\011\011"
	.ascii	"\011\011\\n\\t\" \"LDMIA\011SP!, {R0}\011\011\011\011"
	.ascii	"\011\011\011\011\011\011\011\\n\\t\" \"STMDB\011LR,"
	.ascii	"{R0-LR}^\011\011\011\011\011\011\011\011\011\011\011"
	.ascii	"\\n\\t\" \"NOP\011\011\011\011\011\011\011\011\011\011"
	.ascii	"\011\011\011\011\\n\\t\" \"SUB\011LR, LR, #60\011\011"
	.ascii	"\011\011\011\011\011\011\011\011\011\\n\\t\" \"MRS\011"
	.ascii	"R0, SPSR\011\011\011\011\011\011\011\011\011\011\011"
	.ascii	"\\n\\t\" \"STMDB\011LR!, {R0}\011\011\011\011\011\011"
	.ascii	"\011\011\011\011\011\\n\\t\" \"LDR\011R0, =ulCritic"
	.ascii	"alNesting\011\011\011\011\011\011\011\011\\n\\t\" \""
	.ascii	"LDR\011R0, [R0]\011\011\011\011\011\011\011\011\011"
	.ascii	"\011\011\\n\\t\" \"STMDB\011LR!, {R0}\011\011\011\011"
	.ascii	"\011\011\011\011\011\011\011\\n\\t\" \"LDR\011R0, ="
	.ascii	"pxCurrentTCB\011\011\011\011\011\011\011\011\011\\n"
	.ascii	"\\t\" \"LDR\011R0, [R0]\011\011\011\011\011\011\011"
	.ascii	"\011\011\011\011\\n\\t\" \"STR\011LR, [R0]\011\011\011"
	.ascii	"\011\011\011\011\011\011\011\011\\n\\t\" ); ( void "
	.ascii	") ulCriticalNesting; ( void ) pxCurrentTCB; }\000"
.LASF507:
	.ascii	"INTCPS_ILSR10 0x128\000"
.LASF218:
	.ascii	"__UFRACT_MAX__ 0XFFFFP-16UR\000"
.LASF347:
	.ascii	"__VFP_FP__ 1\000"
.LASF542:
	.ascii	"INTCPS_ILSR45 0x1B4\000"
.LASF638:
	.ascii	"PIN17 (0x1 << 17)\000"
.LASF604:
	.ascii	"GPIO_OE 0x34\000"
.LASF44:
	.ascii	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF234:
	.ascii	"__LLFRACT_EPSILON__ 0x1P-63LLR\000"
.LASF731:
	.ascii	"portSTACK_GROWTH ( -1 )\000"
.LASF737:
	.ascii	"portYIELD_FROM_ISR() vTaskSwitchContext()\000"
.LASF215:
	.ascii	"__UFRACT_FBIT__ 16\000"
.LASF296:
	.ascii	"__UDQ_FBIT__ 64\000"
.LASF446:
	.ascii	"GPTI_TWER 0x20\000"
.LASF754:
	.ascii	"configUSE_COUNTING_SEMAPHORES 0\000"
.LASF732:
	.ascii	"portTICK_RATE_MS ( ( portTickType ) 1000 / configTI"
	.ascii	"CK_RATE_HZ )\000"
.LASF183:
	.ascii	"__DEC32_MAX__ 9.999999E96DF\000"
.LASF74:
	.ascii	"__INT_FAST32_TYPE__ int\000"
.LASF13:
	.ascii	"/home/tdwood/Documents/CSE438/Lab_05/Task1/FreeRTOS"
	.ascii	"2/Demo/OMAP3_BeagleBoard_GCC\000"
.LASF0:
	.ascii	"unsigned int\000"
.LASF457:
	.ascii	"GPTI_TNIR 0x4C\000"
.LASF594:
	.ascii	"GPIO6_BASE 0x49058000\000"
.LASF693:
	.ascii	"CFPS_REG 0x060\000"
.LASF139:
	.ascii	"__FLT_MIN_EXP__ (-125)\000"
.LASF135:
	.ascii	"__DEC_EVAL_METHOD__ 2\000"
.LASF592:
	.ascii	"INTCPS_ILSR95 0x27C\000"
.LASF667:
	.ascii	"MSR_REG 0x018\000"
.LASF476:
	.ascii	"INTCPS_MIR_SET0 0x8C\000"
.LASF133:
	.ascii	"__UINTPTR_MAX__ 4294967295U\000"
.LASF138:
	.ascii	"__FLT_DIG__ 6\000"
.LASF259:
	.ascii	"__UACCUM_EPSILON__ 0x1P-16UK\000"
.LASF661:
	.ascii	"EFR_REG 0x008\000"
.LASF406:
	.ascii	"_WCHAR_T_DECLARED \000"
.LASF496:
	.ascii	"INTCPS_PENDING_FIQ2 0xDc\000"
.LASF10:
	.ascii	"vPortExitCritical\000"
.LASF608:
	.ascii	"GPIO_LEVELDETECT1 0x44\000"
.LASF532:
	.ascii	"INTCPS_ILSR35 0x18C\000"
.LASF768:
	.ascii	"traceTASK_SWITCHED_OUT() \000"
.LASF132:
	.ascii	"__INTPTR_MAX__ 2147483647\000"
.LASF367:
	.ascii	"_T_PTRDIFF \000"
.LASF290:
	.ascii	"__UQQ_FBIT__ 8\000"
.LASF487:
	.ascii	"INTCPS_PENDING_IRQ1 0xB8\000"
.LASF187:
	.ascii	"__DEC64_MIN_EXP__ (-382)\000"
.LASF508:
	.ascii	"INTCPS_ILSR11 0x12C\000"
.LASF543:
	.ascii	"INTCPS_ILSR46 0x1B8\000"
.LASF495:
	.ascii	"INTCPS_PENDING_IRQ2 0xD8\000"
.LASF223:
	.ascii	"__LFRACT_MAX__ 0X7FFFFFFFP-31LR\000"
.LASF340:
	.ascii	"__SIZEOF_PTRDIFF_T__ 4\000"
.LASF18:
	.ascii	"__STDC__ 1\000"
.LASF8:
	.ascii	"vTickISR\000"
.LASF45:
	.ascii	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__\000"
.LASF700:
	.ascii	"configMINIMAL_STACK_SIZE ( ( unsigned short ) 256 )"
	.ascii	"\000"
.LASF405:
	.ascii	"_GCC_WCHAR_T \000"
.LASF436:
	.ascii	"E_UNUSED (*(REG32 (0x4020FFF4)))\000"
.LASF55:
	.ascii	"__SIG_ATOMIC_TYPE__ int\000"
.LASF565:
	.ascii	"INTCPS_ILSR68 0x210\000"
.LASF459:
	.ascii	"GPTI_TOCR 0x54\000"
.LASF193:
	.ascii	"__DEC128_MANT_DIG__ 34\000"
.LASF98:
	.ascii	"__SIG_ATOMIC_MAX__ 2147483647\000"
.LASF310:
	.ascii	"__USA_FBIT__ 16\000"
.LASF824:
	.ascii	"KERN_WARNING KERN_SOH \"4\"\000"
.LASF168:
	.ascii	"__LDBL_MIN_10_EXP__ (-307)\000"
.LASF643:
	.ascii	"PIN22 (0x1 << 22)\000"
.LASF150:
	.ascii	"__FLT_HAS_QUIET_NAN__ 1\000"
.LASF326:
	.ascii	"__GCC_ATOMIC_CHAR_LOCK_FREE 2\000"
.LASF224:
	.ascii	"__LFRACT_EPSILON__ 0x1P-31LR\000"
.LASF792:
	.ascii	"traceTASK_CREATE(pxNewTCB) \000"
.LASF448:
	.ascii	"GPTI_TCRR 0x28\000"
.LASF108:
	.ascii	"__INT_LEAST8_MAX__ 127\000"
.LASF789:
	.ascii	"traceQUEUE_RECEIVE_FROM_ISR(pxQueue) \000"
.LASF343:
	.ascii	"__arm__ 1\000"
.LASF828:
	.ascii	"CFG_NS16550 \000"
.LASF663:
	.ascii	"MCR_REG 0x010\000"
.LASF829:
	.ascii	"CFG_NS16550_SERIAL \000"
.LASF800:
	.ascii	"traceTASK_RESUME_FROM_ISR(pxTaskToResume) \000"
.LASF578:
	.ascii	"INTCPS_ILSR81 0x244\000"
.LASF394:
	.ascii	"_WCHAR_T \000"
.LASF359:
	.ascii	"__CS_SOURCERYGXX_MIN__ 5\000"
.LASF793:
	.ascii	"traceTASK_CREATE_FAILED() \000"
.LASF179:
	.ascii	"__DEC32_MANT_DIG__ 7\000"
.LASF418:
	.ascii	"errQUEUE_EMPTY ( 0 )\000"
.LASF440:
	.ascii	"GPTI2 0x49032000\000"
.LASF770:
	.ascii	"traceBLOCKING_ON_QUEUE_SEND(pxQueue) \000"
.LASF40:
	.ascii	"__BIGGEST_ALIGNMENT__ 8\000"
.LASF372:
	.ascii	"_GCC_PTRDIFF_T \000"
.LASF733:
	.ascii	"portBYTE_ALIGNMENT 8\000"
.LASF711:
	.ascii	"INCLUDE_vTaskPrioritySet 1\000"
.LASF307:
	.ascii	"__TA_IBIT__ 64\000"
.LASF717:
	.ascii	"INCLUDE_vTaskDelay 1\000"
.LASF607:
	.ascii	"GPIO_LEVELDETECT0 0x40\000"
.LASF129:
	.ascii	"__UINT_FAST16_MAX__ 4294967295U\000"
.LASF376:
	.ascii	"_SIZE_T \000"
.LASF402:
	.ascii	"_WCHAR_T_H \000"
.LASF544:
	.ascii	"INTCPS_ILSR47 0x1BC\000"
.LASF122:
	.ascii	"__UINT_LEAST64_MAX__ 18446744073709551615ULL\000"
.LASF674:
	.ascii	"MDR2_REG 0x024\000"
.LASF483:
	.ascii	"INTCPS_MIR_CLEAR1 0xA8\000"
.LASF677:
	.ascii	"RESUME_REG 0x02C\000"
.LASF124:
	.ascii	"__INT_FAST8_MAX__ 2147483647\000"
.LASF683:
	.ascii	"UASR_REG 0x038\000"
.LASF78:
	.ascii	"__UINT_FAST32_TYPE__ unsigned int\000"
.LASF491:
	.ascii	"INTCPS_MIR_CLEAR2 0xC8\000"
.LASF611:
	.ascii	"GPIO_DEBOUNCENABLE 0x50\000"
.LASF449:
	.ascii	"GPTI_TLDR 0x2C\000"
.LASF533:
	.ascii	"INTCPS_ILSR36 0x190\000"
.LASF566:
	.ascii	"INTCPS_ILSR69 0x214\000"
.LASF709:
	.ascii	"configUSE_CO_ROUTINES 0\000"
.LASF109:
	.ascii	"__INT8_C(c) c\000"
.LASF221:
	.ascii	"__LFRACT_IBIT__ 0\000"
.LASF362:
	.ascii	"_STDDEF_H_ \000"
.LASF153:
	.ascii	"__DBL_MIN_EXP__ (-1021)\000"
.LASF380:
	.ascii	"__SIZE_T \000"
.LASF509:
	.ascii	"INTCPS_ILSR12 0x130\000"
.LASF439:
	.ascii	"GPTI1 0x48318000\000"
.LASF833:
	.ascii	"CONFIG_SERIAL1 3\000"
.LASF102:
	.ascii	"__INT32_MAX__ 2147483647L\000"
.LASF808:
	.ascii	"portCONFIGURE_TIMER_FOR_RUN_TIME_STATS() \000"
.LASF189:
	.ascii	"__DEC64_MIN__ 1E-383DD\000"
.LASF494:
	.ascii	"INTCPS_ISR_CLEAR2 0xD4\000"
.LASF486:
	.ascii	"INTCPS_ISR_CLEAR1 0xB4\000"
.LASF435:
	.ascii	"E_DATA_ABRT (*(REG32 (0x4020FFF0)))\000"
.LASF791:
	.ascii	"traceQUEUE_DELETE(pxQueue) \000"
.LASF176:
	.ascii	"__LDBL_HAS_DENORM__ 1\000"
.LASF479:
	.ascii	"INTCPS_PENDING_IRQ0 0x98\000"
.LASF323:
	.ascii	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1\000"
.LASF784:
	.ascii	"traceQUEUE_RECEIVE(pxQueue) \000"
.LASF579:
	.ascii	"INTCPS_ILSR82 0x248\000"
.LASF360:
	.ascii	"__CS_SOURCERYGXX_REV__ 23\000"
.LASF823:
	.ascii	"KERN_ERR KERN_SOH \"3\"\000"
.LASF745:
	.ascii	"portBYTE_ALIGNMENT_MASK ( 0x0007 )\000"
.LASF66:
	.ascii	"__INT_LEAST32_TYPE__ long int\000"
.LASF92:
	.ascii	"__PTRDIFF_MAX__ 2147483647\000"
.LASF796:
	.ascii	"traceTASK_DELAY() \000"
.LASF803:
	.ascii	"traceTIMER_CREATE_FAILED() \000"
.LASF810:
	.ascii	"portPRIVILEGE_BIT ( ( unsigned portBASE_TYPE ) 0x00"
	.ascii	" )\000"
.LASF576:
	.ascii	"INTCPS_ILSR79 0x23C\000"
.LASF211:
	.ascii	"__FRACT_IBIT__ 0\000"
.LASF747:
	.ascii	"MPU_WRAPPERS_H \000"
.LASF557:
	.ascii	"INTCPS_ILSR60 0x1F0\000"
.LASF41:
	.ascii	"__ORDER_LITTLE_ENDIAN__ 1234\000"
.LASF463:
	.ascii	"INTCPS_SYSCONFIG 0x10\000"
.LASF186:
	.ascii	"__DEC64_MANT_DIG__ 16\000"
.LASF140:
	.ascii	"__FLT_MIN_10_EXP__ (-37)\000"
.LASF266:
	.ascii	"__ULACCUM_IBIT__ 32\000"
.LASF760:
	.ascii	"INCLUDE_xTaskGetCurrentTaskHandle 0\000"
.LASF9:
	.ascii	"vPortEnterCritical\000"
.LASF48:
	.ascii	"__PTRDIFF_TYPE__ int\000"
.LASF384:
	.ascii	"_SIZE_T_DEFINED \000"
.LASF286:
	.ascii	"__DQ_FBIT__ 63\000"
.LASF820:
	.ascii	"KERN_EMERG KERN_SOH \"\"\000"
.LASF368:
	.ascii	"__PTRDIFF_T \000"
.LASF293:
	.ascii	"__UHQ_IBIT__ 0\000"
.LASF756:
	.ascii	"portCRITICAL_NESTING_IN_TCB 0\000"
.LASF623:
	.ascii	"PIN2 (0x1 << 2)\000"
.LASF628:
	.ascii	"PIN7 (0x1 << 7)\000"
.LASF806:
	.ascii	"traceTIMER_COMMAND_RECEIVED(pxTimer,xMessageID,xMes"
	.ascii	"sageValue) \000"
.LASF356:
	.ascii	"RUN_FROM_RAM 1\000"
.LASF242:
	.ascii	"__SACCUM_MIN__ (-0X1P7HK-0X1P7HK)\000"
.LASF228:
	.ascii	"__ULFRACT_MAX__ 0XFFFFFFFFP-32ULR\000"
.LASF69:
	.ascii	"__UINT_LEAST16_TYPE__ short unsigned int\000"
.LASF263:
	.ascii	"__LACCUM_MAX__ 0X7FFFFFFFFFFFFFFFP-31LK\000"
.LASF53:
	.ascii	"__CHAR16_TYPE__ short unsigned int\000"
.LASF510:
	.ascii	"INTCPS_ILSR13 0x134\000"
.LASF118:
	.ascii	"__UINT_LEAST16_MAX__ 65535\000"
.LASF698:
	.ascii	"configTICK_RATE_HZ ( ( portTickType ) 1000 )\000"
.LASF417:
	.ascii	"pdFAIL ( 0 )\000"
.LASF545:
	.ascii	"INTCPS_ILSR48 0x1C0\000"
.LASF30:
	.ascii	"__FINITE_MATH_ONLY__ 0\000"
.LASF836:
	.ascii	"CFG_PBSIZE 256\000"
.LASF742:
	.ascii	"portEXIT_CRITICAL() vPortExitCritical();\000"
.LASF401:
	.ascii	"_WCHAR_T_DEFINED \000"
.LASF268:
	.ascii	"__ULACCUM_MAX__ 0XFFFFFFFFFFFFFFFFP-32ULK\000"
.LASF819:
	.ascii	"KERN_SOH_ASCII '\\001'\000"
.LASF580:
	.ascii	"INTCPS_ILSR83 0x24C\000"
.LASF723:
	.ascii	"portCHAR char\000"
.LASF466:
	.ascii	"INTCPS_SIR_FIQ 0x44\000"
.LASF287:
	.ascii	"__DQ_IBIT__ 0\000"
.LASF475:
	.ascii	"INTCPS_MIR_CLEAR0 0x88\000"
.LASF741:
	.ascii	"portENTER_CRITICAL() vPortEnterCritical();\000"
.LASF758:
	.ascii	"configASSERT(x) \000"
.LASF705:
	.ascii	"configUSE_16_BIT_TICKS 0\000"
.LASF382:
	.ascii	"_BSD_SIZE_T_ \000"
.LASF90:
	.ascii	"__WINT_MAX__ 4294967295U\000"
.LASF558:
	.ascii	"INTCPS_ILSR61 0x1F4\000"
.LASF434:
	.ascii	"E_PREFETCH (*(REG32 (0x4020FFEC)))\000"
.LASF398:
	.ascii	"_WCHAR_T_ \000"
.LASF114:
	.ascii	"__INT_LEAST64_MAX__ 9223372036854775807LL\000"
.LASF431:
	.ascii	"PRINTABLE_END 0x7E\000"
.LASF396:
	.ascii	"_T_WCHAR \000"
.LASF364:
	.ascii	"__STDDEF_H__ \000"
.LASF676:
	.ascii	"TXFLL_REG 0x028\000"
.LASF93:
	.ascii	"__SIZE_MAX__ 4294967295U\000"
.LASF299:
	.ascii	"__UTQ_IBIT__ 0\000"
.LASF302:
	.ascii	"__SA_FBIT__ 15\000"
.LASF404:
	.ascii	"__INT_WCHAR_T_H \000"
.LASF670:
	.ascii	"SPR_REG 0x01C\000"
.LASF535:
	.ascii	"INTCPS_ILSR38 0x198\000"
.LASF612:
	.ascii	"GPIO_DEBOUNCEINGTIME 0x54\000"
.LASF445:
	.ascii	"GPTI_TIER 0x1C\000"
.LASF341:
	.ascii	"__ARM_FEATURE_DSP 1\000"
.LASF679:
	.ascii	"SFREGL_REG 0x030\000"
.LASF281:
	.ascii	"__QQ_IBIT__ 0\000"
.LASF637:
	.ascii	"PIN16 (0x1 << 16)\000"
.LASF734:
	.ascii	"portNOP() __asm volatile ( \"NOP\" );\000"
.LASF473:
	.ascii	"INTCPS_ITR0 0x80\000"
.LASF671:
	.ascii	"TLR_REG 0x01C\000"
.LASF270:
	.ascii	"__LLACCUM_FBIT__ 31\000"
.LASF546:
	.ascii	"INTCPS_ILSR49 0x1C4\000"
.LASF96:
	.ascii	"__UINTMAX_MAX__ 18446744073709551615ULL\000"
.LASF52:
	.ascii	"__UINTMAX_TYPE__ long long unsigned int\000"
.LASF780:
	.ascii	"traceCREATE_COUNTING_SEMAPHORE() \000"
.LASF295:
	.ascii	"__USQ_IBIT__ 0\000"
.LASF497:
	.ascii	"INTCPS_ILSR0 0x100\000"
.LASF70:
	.ascii	"__UINT_LEAST32_TYPE__ long unsigned int\000"
.LASF21:
	.ascii	"__GNUC_MINOR__ 7\000"
.LASF444:
	.ascii	"GPTI_TISR 0x18\000"
.LASF51:
	.ascii	"__INTMAX_TYPE__ long long int\000"
.LASF621:
	.ascii	"PIN0 (0x1 << 0)\000"
.LASF626:
	.ascii	"PIN5 (0x1 << 5)\000"
.LASF769:
	.ascii	"traceBLOCKING_ON_QUEUE_RECEIVE(pxQueue) \000"
.LASF837:
	.ascii	"printk(fmt,args...) serial_printk (fmt , ##args)\000"
.LASF511:
	.ascii	"INTCPS_ILSR14 0x138\000"
.LASF389:
	.ascii	"_SIZET_ \000"
.LASF726:
	.ascii	"portLONG long\000"
.LASF249:
	.ascii	"__USACCUM_EPSILON__ 0x1P-8UHK\000"
.LASF164:
	.ascii	"__DBL_HAS_QUIET_NAN__ 1\000"
.LASF743:
	.ascii	"portTASK_FUNCTION_PROTO(vFunction,pvParameters) voi"
	.ascii	"d vFunction( void *pvParameters )\000"
.LASF233:
	.ascii	"__LLFRACT_MAX__ 0X7FFFFFFFFFFFFFFFP-63LLR\000"
.LASF195:
	.ascii	"__DEC128_MAX_EXP__ 6145\000"
.LASF489:
	.ascii	"INTCPS_ITR2 0xC0\000"
.LASF559:
	.ascii	"INTCPS_ILSR62 0x1F8\000"
.LASF243:
	.ascii	"__SACCUM_MAX__ 0X7FFFP-7HK\000"
.LASF80:
	.ascii	"__INTPTR_TYPE__ int\000"
.LASF81:
	.ascii	"__UINTPTR_TYPE__ unsigned int\000"
.LASF787:
	.ascii	"traceQUEUE_SEND_FROM_ISR(pxQueue) \000"
.LASF316:
	.ascii	"__REGISTER_PREFIX__ \000"
.LASF199:
	.ascii	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000"
	.ascii	"000000001E-6143DL\000"
.LASF152:
	.ascii	"__DBL_DIG__ 15\000"
.LASF229:
	.ascii	"__ULFRACT_EPSILON__ 0x1P-32ULR\000"
.LASF690:
	.ascii	"SYSC_REG 0x054\000"
.LASF809:
	.ascii	"configUSE_MALLOC_FAILED_HOOK 0\000"
.LASF484:
	.ascii	"INTCPS_MIR_SET1 0xAC\000"
.LASF38:
	.ascii	"__SIZEOF_SIZE_T__ 4\000"
.LASF196:
	.ascii	"__DEC128_MIN__ 1E-6143DL\000"
.LASF115:
	.ascii	"__INT64_C(c) c ## LL\000"
.LASF581:
	.ascii	"INTCPS_ILSR84 0x250\000"
.LASF739:
	.ascii	"portDISABLE_INTERRUPTS() __asm volatile ( \"STMDB\011"
	.ascii	"SP!, {R0}\011\011\\n\\t\" \"MRS\011R0, CPSR\011\011"
	.ascii	"\\n\\t\" \"ORR\011R0, R0, #0xC0\011\\n\\t\" \"MSR\011"
	.ascii	"CPSR, R0\011\011\\n\\t\" \"LDMIA\011SP!, {R0}\011\011"
	.ascii	"\011\" )\000"
.LASF652:
	.ascii	"PIN31 (0x1 << 31)\000"
.LASF173:
	.ascii	"__LDBL_MIN__ 2.2250738585072014e-308L\000"
.LASF536:
	.ascii	"INTCPS_ILSR39 0x19C\000"
.LASF251:
	.ascii	"__ACCUM_IBIT__ 16\000"
.LASF105:
	.ascii	"__UINT16_MAX__ 65535\000"
.LASF724:
	.ascii	"portFLOAT float\000"
.LASF609:
	.ascii	"GPIO_RISINGDETECT 0x48\000"
.LASF521:
	.ascii	"INTCPS_ILSR24 0x160\000"
.LASF797:
	.ascii	"traceTASK_PRIORITY_SET(pxTask,uxNewPriority) \000"
.LASF361:
	.ascii	"_STDDEF_H \000"
.LASF778:
	.ascii	"traceTAKE_MUTEX_RECURSIVE(pxMutex) \000"
.LASF119:
	.ascii	"__UINT16_C(c) c\000"
.LASF729:
	.ascii	"portBASE_TYPE portLONG\000"
.LASF313:
	.ascii	"__UDA_IBIT__ 32\000"
.LASF498:
	.ascii	"INTCPS_ILSR1 0x104\000"
.LASF785:
	.ascii	"traceQUEUE_PEEK(pxQueue) \000"
.LASF319:
	.ascii	"__NO_INLINE__ 1\000"
.LASF24:
	.ascii	"__ATOMIC_RELAXED 0\000"
.LASF456:
	.ascii	"GPTI_TPIR 0x48\000"
.LASF602:
	.ascii	"GPIO_IRQENABLE2 0x2C\000"
.LASF520:
	.ascii	"INTCPS_ILSR23 0x15C\000"
.LASF598:
	.ascii	"GPIO_IRQSTATUS1 0x18\000"
.LASF5:
	.ascii	"vPortISRStartFirstTask\000"
.LASF441:
	.ascii	"GPTI_TIDR 0x0\000"
.LASF682:
	.ascii	"RXFLH_REG 0x034\000"
.LASF415:
	.ascii	"pdFALSE ( 0 )\000"
.LASF722:
	.ascii	"PORTMACRO_H \000"
.LASF642:
	.ascii	"PIN21 (0x1 << 21)\000"
.LASF354:
	.ascii	"__USES_INITFINI__ 1\000"
.LASF763:
	.ascii	"vQueueAddToRegistry(xQueue,pcName) \000"
.LASF84:
	.ascii	"__SHRT_MAX__ 32767\000"
.LASF373:
	.ascii	"__need_ptrdiff_t\000"
.LASF469:
	.ascii	"INTCPS_IDLE 0x50\000"
.LASF157:
	.ascii	"__DBL_DECIMAL_DIG__ 17\000"
.LASF369:
	.ascii	"_PTRDIFF_T_ \000"
.LASF620:
	.ascii	"GPIO_SETDATAOUT 0x94\000"
.LASF703:
	.ascii	"configREAL_TIME_TASK 1\000"
.LASF560:
	.ascii	"INTCPS_ILSR63 0x1FC\000"
.LASF772:
	.ascii	"traceQUEUE_CREATE(pxNewQueue) \000"
.LASF728:
	.ascii	"portSTACK_TYPE unsigned portLONG\000"
.LASF393:
	.ascii	"__WCHAR_T__ \000"
.LASF775:
	.ascii	"traceCREATE_MUTEX_FAILED() \000"
.LASF86:
	.ascii	"__LONG_MAX__ 2147483647L\000"
.LASF582:
	.ascii	"INTCPS_ILSR85 0x254\000"
.LASF280:
	.ascii	"__QQ_FBIT__ 7\000"
.LASF227:
	.ascii	"__ULFRACT_MIN__ 0.0ULR\000"
.LASF515:
	.ascii	"INTCPS_ILSR18 0x148\000"
.LASF112:
	.ascii	"__INT_LEAST32_MAX__ 2147483647L\000"
.LASF635:
	.ascii	"PIN14 (0x1 << 14)\000"
.LASF527:
	.ascii	"INTCPS_ILSR30 0x178\000"
.LASF632:
	.ascii	"PIN11 (0x1 << 11)\000"
.LASF659:
	.ascii	"IIR_REG 0x008\000"
.LASF315:
	.ascii	"__UTA_IBIT__ 64\000"
.LASF276:
	.ascii	"__ULLACCUM_IBIT__ 32\000"
.LASF239:
	.ascii	"__ULLFRACT_EPSILON__ 0x1P-64ULLR\000"
.LASF522:
	.ascii	"INTCPS_ILSR25 0x164\000"
.LASF339:
	.ascii	"__SIZEOF_WINT_T__ 4\000"
.LASF342:
	.ascii	"__ARM_FEATURE_UNALIGNED 1\000"
.LASF352:
	.ascii	"__GXX_TYPEINFO_EQUALITY_INLINE 0\000"
.LASF216:
	.ascii	"__UFRACT_IBIT__ 0\000"
.LASF262:
	.ascii	"__LACCUM_MIN__ (-0X1P31LK-0X1P31LK)\000"
.LASF499:
	.ascii	"INTCPS_ILSR2 0x108\000"
.LASF351:
	.ascii	"__ARM_EABI__ 1\000"
.LASF180:
	.ascii	"__DEC32_MIN_EXP__ (-94)\000"
.LASF277:
	.ascii	"__ULLACCUM_MIN__ 0.0ULLK\000"
.LASF403:
	.ascii	"___int_wchar_t_h \000"
.LASF821:
	.ascii	"KERN_ALERT KERN_SOH \"1\"\000"
.LASF472:
	.ascii	"INTCPS_THRESHOLD 0x68\000"
.LASF198:
	.ascii	"__DEC128_EPSILON__ 1E-33DL\000"
.LASF62:
	.ascii	"__UINT32_TYPE__ long unsigned int\000"
.LASF735:
	.ascii	"portRESTORE_CONTEXT() { extern volatile void * vola"
	.ascii	"tile pxCurrentTCB; extern volatile unsigned portLON"
	.ascii	"G ulCriticalNesting; __asm volatile ( \"LDR\011\011"
	.ascii	"R0, =pxCurrentTCB\011\011\011\011\011\011\011\011\\"
	.ascii	"n\\t\" \"LDR\011\011R0, [R0]\011\011\011\011\011\011"
	.ascii	"\011\011\011\011\\n\\t\" \"LDR\011\011LR, [R0]\011\011"
	.ascii	"\011\011\011\011\011\011\011\011\\n\\t\" \"LDR\011\011"
	.ascii	"R0, =ulCriticalNesting\011\011\011\011\011\011\011\\"
	.ascii	"n\\t\" \"LDMFD\011LR!, {R1}\011\011\011\011\011\011"
	.ascii	"\011\011\011\011\011\\n\\t\" \"STR\011\011R1, [R0]\011"
	.ascii	"\011\011\011\011\011\011\011\011\011\\n\\t\" \"LDMF"
	.ascii	"D\011LR!, {R0}\011\011\011\011\011\011\011\011\011\011"
	.ascii	"\011\\n\\t\" \"MSR\011\011SPSR, R0\011\011\011\011\011"
	.ascii	"\011\011\011\011\011\\n\\t\" \"LDMFD\011LR, {R0-R14"
	.ascii	"}^\011\011\011\011\011\011\011\011\011\011\\n\\t\" "
	.ascii	"\"NOP\011\011\011\011\011\011\011\011\011\011\011\011"
	.ascii	"\011\011\\n\\t\" \"LDR\011\011LR, [LR, #+60]\011\011"
	.ascii	"\011\011\011\011\011\011\011\\n\\t\" \"SUBS\011PC, "
	.ascii	"LR, #4\011\011\011\011\011\011\011\011\011\011\011\\"
	.ascii	"n\\t\" ); ( void ) ulCriticalNesting; ( void ) pxCu"
	.ascii	"rrentTCB; }\000"
.LASF654:
	.ascii	"DLL_REG 0x000\000"
.LASF388:
	.ascii	"_GCC_SIZE_T \000"
.LASF568:
	.ascii	"INTCPS_ILSR71 0x21C\000"
.LASF237:
	.ascii	"__ULLFRACT_MIN__ 0.0ULLR\000"
.LASF395:
	.ascii	"_T_WCHAR_ \000"
.LASF14:
	.ascii	"INC_FREERTOS_H \000"
.LASF297:
	.ascii	"__UDQ_IBIT__ 0\000"
.LASF31:
	.ascii	"__SIZEOF_INT__ 4\000"
.LASF407:
	.ascii	"_BSD_WCHAR_T_\000"
.LASF231:
	.ascii	"__LLFRACT_IBIT__ 0\000"
.LASF826:
	.ascii	"KERN_INFO KERN_SOH \"6\"\000"
.LASF244:
	.ascii	"__SACCUM_EPSILON__ 0x1P-7HK\000"
.LASF570:
	.ascii	"INTCPS_ILSR73 0x224\000"
.LASF12:
	.ascii	"../../Source/portable/GCC/OMAP3_BeagleBoard/portISR"
	.ascii	".c\000"
.LASF458:
	.ascii	"GPTI_TCVR 0x50\000"
.LASF77:
	.ascii	"__UINT_FAST16_TYPE__ unsigned int\000"
.LASF630:
	.ascii	"PIN9 (0x1 << 9)\000"
.LASF309:
	.ascii	"__UHA_IBIT__ 8\000"
.LASF254:
	.ascii	"__ACCUM_EPSILON__ 0x1P-15K\000"
.LASF269:
	.ascii	"__ULACCUM_EPSILON__ 0x1P-32ULK\000"
.LASF166:
	.ascii	"__LDBL_DIG__ 15\000"
.LASF500:
	.ascii	"INTCPS_ILSR3 0x10C\000"
.LASF523:
	.ascii	"INTCPS_ILSR26 0x168\000"
.LASF524:
	.ascii	"INTCPS_ILSR27 0x16C\000"
.LASF605:
	.ascii	"GPIO_DATAIN 0x38\000"
.LASF191:
	.ascii	"__DEC64_EPSILON__ 1E-15DD\000"
.LASF751:
	.ascii	"configUSE_APPLICATION_TASK_TAG 0\000"
.LASF453:
	.ascii	"GPTI_TCAR1 0x3C\000"
.LASF65:
	.ascii	"__INT_LEAST16_TYPE__ short int\000"
.LASF279:
	.ascii	"__ULLACCUM_EPSILON__ 0x1P-32ULLK\000"
.LASF158:
	.ascii	"__DBL_MAX__ ((double)1.7976931348623157e+308L)\000"
.LASF230:
	.ascii	"__LLFRACT_FBIT__ 63\000"
.LASF392:
	.ascii	"__wchar_t__ \000"
.LASF170:
	.ascii	"__LDBL_MAX_10_EXP__ 308\000"
.LASF345:
	.ascii	"__ARMEL__ 1\000"
.LASF702:
	.ascii	"configMAX_TASK_NAME_LEN ( 16 )\000"
.LASF282:
	.ascii	"__HQ_FBIT__ 15\000"
.LASF201:
	.ascii	"__SFRACT_IBIT__ 0\000"
.LASF163:
	.ascii	"__DBL_HAS_INFINITY__ 1\000"
.LASF429:
	.ascii	"CARRIAGE_RETURN 0xD\000"
.LASF595:
	.ascii	"GPIO_REVISION 0x0\000"
.LASF786:
	.ascii	"traceQUEUE_RECEIVE_FAILED(pxQueue) \000"
.LASF547:
	.ascii	"INTCPS_ILSR50 0x1C8\000"
.LASF422:
	.ascii	"errQUEUE_BLOCKED ( -4 )\000"
.LASF649:
	.ascii	"PIN28 (0x1 << 28)\000"
.LASF203:
	.ascii	"__SFRACT_MAX__ 0X7FP-7HR\000"
.LASF480:
	.ascii	"INTCPS_PENDING_FIQ0 0x9C\000"
.LASF432:
	.ascii	"E_UNDEFINED (*(REG32 (0x4020FFE4)))\000"
.LASF777:
	.ascii	"traceGIVE_MUTEX_RECURSIVE_FAILED(pxMutex) \000"
.LASF111:
	.ascii	"__INT16_C(c) c\000"
.LASF569:
	.ascii	"INTCPS_ILSR72 0x220\000"
.LASF305:
	.ascii	"__DA_IBIT__ 32\000"
.LASF773:
	.ascii	"traceQUEUE_CREATE_FAILED() \000"
.LASF704:
	.ascii	"configUSE_TRACE_FACILITY 0\000"
.LASF424:
	.ascii	"omap3_h \000"
.LASF616:
	.ascii	"GPIO_SETIRQENABLE2 0x74\000"
.LASF283:
	.ascii	"__HQ_IBIT__ 0\000"
.LASF400:
	.ascii	"_WCHAR_T_DEFINED_ \000"
.LASF788:
	.ascii	"traceQUEUE_SEND_FROM_ISR_FAILED(pxQueue) \000"
.LASF130:
	.ascii	"__UINT_FAST32_MAX__ 4294967295U\000"
.LASF116:
	.ascii	"__UINT_LEAST8_MAX__ 255\000"
.LASF17:
	.ascii	"portNO_CRITICAL_NESTING ( ( unsigned long ) 0 )\000"
.LASF639:
	.ascii	"PIN18 (0x1 << 18)\000"
.LASF151:
	.ascii	"__DBL_MANT_DIG__ 53\000"
.LASF600:
	.ascii	"GPIO_WAKEUPENABLE 0x20\000"
.LASF226:
	.ascii	"__ULFRACT_IBIT__ 0\000"
.LASF447:
	.ascii	"GPTI_TCLR 0x24\000"
.LASF298:
	.ascii	"__UTQ_FBIT__ 128\000"
.LASF67:
	.ascii	"__INT_LEAST64_TYPE__ long long int\000"
.LASF240:
	.ascii	"__SACCUM_FBIT__ 7\000"
.LASF719:
	.ascii	"configTIMER_TASK_PRIORITY ( configMAX_PRIORITIES - "
	.ascii	"1 )\000"
.LASF574:
	.ascii	"INTCPS_ILSR77 0x234\000"
	.ident	"GCC: (Sourcery CodeBench Lite 2013.05-23) 4.7.3"
