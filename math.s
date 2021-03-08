	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 15
	.intel_syntax noprefix
	.globl	_forward_propagation    ## -- Begin function forward_propagation
	.p2align	4, 0x90
_forward_propagation:                   ## @forward_propagation
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	lea	rax, [rbp + 16]
	xorps	xmm0, xmm0
	movsd	qword ptr [rbp - 32], xmm0
	mov	dword ptr [rbp - 4], 0
	mov	qword ptr [rbp - 40], rax ## 8-byte Spill
LBB0_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
                                        ##       Child Loop BB0_5 Depth 3
	mov	eax, dword ptr [rbp - 4]
	mov	rcx, qword ptr [rbp - 40] ## 8-byte Reload
	mov	edx, dword ptr [rcx]
	sub	edx, 1
	cmp	eax, edx
	jge	LBB0_12
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	dword ptr [rbp - 8], 0
LBB0_3:                                 ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_5 Depth 3
	mov	eax, dword ptr [rbp - 8]
	mov	rcx, qword ptr [rbp - 40] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 8]
	mov	esi, dword ptr [rbp - 4]
	add	esi, 1
	movsxd	rdi, esi
	cmp	eax, dword ptr [rdx + 4*rdi]
	jge	LBB0_10
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=2
	mov	eax, dword ptr [rbp - 8]
	mov	rcx, qword ptr [rbp - 40] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 8]
	movsxd	rsi, dword ptr [rbp - 4]
	imul	eax, dword ptr [rdx + 4*rsi]
	mov	dword ptr [rbp - 16], eax
	mov	eax, dword ptr [rbp - 16]
	mov	rdx, qword ptr [rcx + 8]
	movsxd	rsi, dword ptr [rbp - 4]
	add	eax, dword ptr [rdx + 4*rsi]
	mov	dword ptr [rbp - 20], eax
	mov	eax, dword ptr [rbp - 16]
	mov	dword ptr [rbp - 12], eax
LBB0_5:                                 ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	mov	eax, dword ptr [rbp - 12]
	cmp	eax, dword ptr [rbp - 20]
	jge	LBB0_8
## %bb.6:                               ##   in Loop: Header=BB0_5 Depth=3
	mov	eax, dword ptr [rbp - 12]
	mov	rcx, qword ptr [rbp - 40] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 8]
	movsxd	rsi, dword ptr [rbp - 4]
	mov	qword ptr [rbp - 48], rdx ## 8-byte Spill
	cdq
	mov	rdi, qword ptr [rbp - 48] ## 8-byte Reload
	idiv	dword ptr [rdi + 4*rsi]
	mov	dword ptr [rbp - 24], edx
	mov	rsi, qword ptr [rcx + 16]
	movsxd	r8, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rsi + 8*r8]
	movsxd	r8, dword ptr [rbp - 24]
	shl	r8, 4
	add	rsi, r8
	movsd	xmm0, qword ptr [rsi]   ## xmm0 = mem[0],zero
	mov	rsi, qword ptr [rcx + 24]
	movsxd	r8, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rsi + 8*r8]
	movsxd	r8, dword ptr [rbp - 12]
	mulsd	xmm0, qword ptr [rsi + 8*r8]
	addsd	xmm0, qword ptr [rbp - 32]
	movsd	qword ptr [rbp - 32], xmm0
## %bb.7:                               ##   in Loop: Header=BB0_5 Depth=3
	mov	eax, dword ptr [rbp - 12]
	add	eax, 1
	mov	dword ptr [rbp - 12], eax
	jmp	LBB0_5
LBB0_8:                                 ##   in Loop: Header=BB0_3 Depth=2
	mov	rax, qword ptr [rbp - 40] ## 8-byte Reload
	mov	rcx, qword ptr [rax + 16]
	mov	edx, dword ptr [rbp - 4]
	add	edx, 1
	movsxd	rsi, edx
	mov	rcx, qword ptr [rcx + 8*rsi]
	movsxd	rsi, dword ptr [rbp - 8]
	shl	rsi, 4
	add	rcx, rsi
	movsd	xmm0, qword ptr [rcx + 8] ## xmm0 = mem[0],zero
	addsd	xmm0, qword ptr [rbp - 32]
	movsd	qword ptr [rbp - 32], xmm0
	movsd	xmm0, qword ptr [rbp - 32] ## xmm0 = mem[0],zero
	call	_sigmoid_function
	mov	rax, qword ptr [rbp - 40] ## 8-byte Reload
	mov	rcx, qword ptr [rax + 16]
	mov	edx, dword ptr [rbp - 4]
	add	edx, 1
	movsxd	rsi, edx
	mov	rcx, qword ptr [rcx + 8*rsi]
	movsxd	rsi, dword ptr [rbp - 8]
	shl	rsi, 4
	add	rcx, rsi
	movsd	qword ptr [rcx], xmm0
## %bb.9:                               ##   in Loop: Header=BB0_3 Depth=2
	mov	eax, dword ptr [rbp - 8]
	add	eax, 1
	mov	dword ptr [rbp - 8], eax
	jmp	LBB0_3
LBB0_10:                                ##   in Loop: Header=BB0_1 Depth=1
	jmp	LBB0_11
LBB0_11:                                ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 4]
	add	eax, 1
	mov	dword ptr [rbp - 4], eax
	jmp	LBB0_1
LBB0_12:
	add	rsp, 48
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function sigmoid_function
LCPI1_0:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sigmoid_function
	.p2align	4, 0x90
_sigmoid_function:                      ## @sigmoid_function
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	movsd	xmm1, qword ptr [rip + LCPI1_0] ## xmm1 = mem[0],zero
	movsd	qword ptr [rbp - 8], xmm0
	movsd	xmm0, qword ptr [rbp - 8] ## xmm0 = mem[0],zero
	movq	rax, xmm0
	movabs	rcx, -9223372036854775808
	xor	rax, rcx
	movq	xmm0, rax
	movsd	qword ptr [rbp - 16], xmm1 ## 8-byte Spill
	call	_exp
	movsd	xmm1, qword ptr [rbp - 16] ## 8-byte Reload
                                        ## xmm1 = mem[0],zero
	addsd	xmm1, xmm0
	movsd	xmm0, qword ptr [rbp - 16] ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	divsd	xmm0, xmm1
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_backward_propagation   ## -- Begin function backward_propagation
	.p2align	4, 0x90
_backward_propagation:                  ## @backward_propagation
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function sigmoid_derivative
LCPI3_0:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_sigmoid_derivative
	.p2align	4, 0x90
_sigmoid_derivative:                    ## @sigmoid_derivative
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	movsd	qword ptr [rbp - 8], xmm0
	movsd	xmm0, qword ptr [rbp - 8] ## xmm0 = mem[0],zero
	call	_sigmoid_function
	movsd	xmm1, qword ptr [rbp - 8] ## xmm1 = mem[0],zero
	movsd	qword ptr [rbp - 16], xmm0 ## 8-byte Spill
	movaps	xmm0, xmm1
	call	_sigmoid_function
	movsd	xmm1, qword ptr [rip + LCPI3_0] ## xmm1 = mem[0],zero
	subsd	xmm1, xmm0
	movsd	xmm0, qword ptr [rbp - 16] ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	mulsd	xmm0, xmm1
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function

.subsections_via_symbols
