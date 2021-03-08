	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 15
	.intel_syntax noprefix
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function load_random_inputs
LCPI0_0:
	.quad	4746794007244308480     ## double 2147483647
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_load_random_inputs
	.p2align	4, 0x90
_load_random_inputs:                    ## @load_random_inputs
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	lea	rax, [rbp + 16]
	mov	dword ptr [rbp - 4], 0
	mov	qword ptr [rbp - 16], rax ## 8-byte Spill
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 4]
	mov	rcx, qword ptr [rbp - 16] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 8]
	cmp	eax, dword ptr [rdx]
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	call	_rand
	movsd	xmm0, qword ptr [rip + LCPI0_0] ## xmm0 = mem[0],zero
	cvtsi2sd	xmm1, eax
	divsd	xmm1, xmm0
	mov	rcx, qword ptr [rbp - 16] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 16]
	mov	rdx, qword ptr [rdx]
	movsxd	rsi, dword ptr [rbp - 4]
	shl	rsi, 4
	add	rdx, rsi
	movsd	qword ptr [rdx], xmm1
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 4]
	add	eax, 1
	mov	dword ptr [rbp - 4], eax
	jmp	LBB0_1
LBB0_4:
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_print_output_layer     ## -- Begin function print_output_layer
	.p2align	4, 0x90
_print_output_layer:                    ## @print_output_layer
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	lea	rax, [rbp + 16]
	lea	rdi, [rip + L_.str]
	mov	qword ptr [rbp - 16], rax ## 8-byte Spill
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 4], 0
	mov	dword ptr [rbp - 20], eax ## 4-byte Spill
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 4]
	mov	rcx, qword ptr [rbp - 16] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 8]
	mov	esi, dword ptr [rcx]
	sub	esi, 1
	movsxd	rdi, esi
	cmp	eax, dword ptr [rdx + 4*rdi]
	jge	LBB1_4
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	mov	rax, qword ptr [rbp - 16] ## 8-byte Reload
	mov	ecx, dword ptr [rax]
	sub	ecx, 1
	mov	edx, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rax + 16]
	mov	edi, dword ptr [rax]
	sub	edi, 1
	movsxd	r8, edi
	mov	rsi, qword ptr [rsi + 8*r8]
	movsxd	r8, dword ptr [rbp - 4]
	shl	r8, 4
	add	rsi, r8
	movsd	xmm0, qword ptr [rsi]   ## xmm0 = mem[0],zero
	mov	rsi, qword ptr [rax + 16]
	mov	edi, dword ptr [rax]
	sub	edi, 1
	movsxd	r8, edi
	mov	rsi, qword ptr [rsi + 8*r8]
	movsxd	r8, dword ptr [rbp - 4]
	shl	r8, 4
	add	rsi, r8
	movsd	xmm1, qword ptr [rsi + 8] ## xmm1 = mem[0],zero
	lea	rdi, [rip + L_.str.1]
	mov	esi, ecx
	mov	al, 2
	call	_printf
	mov	dword ptr [rbp - 24], eax ## 4-byte Spill
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	mov	eax, dword ptr [rbp - 4]
	add	eax, 1
	mov	dword ptr [rbp - 4], eax
	jmp	LBB1_1
LBB1_4:
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_print_entire_network   ## -- Begin function print_entire_network
	.p2align	4, 0x90
_print_entire_network:                  ## @print_entire_network
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	lea	rax, [rbp + 16]
	lea	rdi, [rip + L_.str.2]
	mov	qword ptr [rbp - 24], rax ## 8-byte Spill
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 4], 0
	mov	dword ptr [rbp - 28], eax ## 4-byte Spill
LBB2_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
	mov	eax, dword ptr [rbp - 4]
	mov	rcx, qword ptr [rbp - 24] ## 8-byte Reload
	cmp	eax, dword ptr [rcx]
	jge	LBB2_8
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	mov	dword ptr [rbp - 8], 0
LBB2_3:                                 ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rbp - 8]
	mov	rcx, qword ptr [rbp - 24] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 8]
	movsxd	rsi, dword ptr [rbp - 4]
	cmp	eax, dword ptr [rdx + 4*rsi]
	jge	LBB2_6
## %bb.4:                               ##   in Loop: Header=BB2_3 Depth=2
	mov	esi, dword ptr [rbp - 4]
	mov	edx, dword ptr [rbp - 8]
	mov	rax, qword ptr [rbp - 24] ## 8-byte Reload
	mov	rcx, qword ptr [rax + 16]
	movsxd	rdi, dword ptr [rbp - 4]
	mov	rcx, qword ptr [rcx + 8*rdi]
	movsxd	rdi, dword ptr [rbp - 8]
	shl	rdi, 4
	add	rcx, rdi
	movsd	xmm0, qword ptr [rcx]   ## xmm0 = mem[0],zero
	mov	rcx, qword ptr [rax + 16]
	movsxd	rdi, dword ptr [rbp - 4]
	mov	rcx, qword ptr [rcx + 8*rdi]
	movsxd	rdi, dword ptr [rbp - 8]
	shl	rdi, 4
	add	rcx, rdi
	movsd	xmm1, qword ptr [rcx + 8] ## xmm1 = mem[0],zero
	lea	rdi, [rip + L_.str.1]
	mov	al, 2
	call	_printf
	mov	dword ptr [rbp - 32], eax ## 4-byte Spill
## %bb.5:                               ##   in Loop: Header=BB2_3 Depth=2
	mov	eax, dword ptr [rbp - 8]
	add	eax, 1
	mov	dword ptr [rbp - 8], eax
	jmp	LBB2_3
LBB2_6:                                 ##   in Loop: Header=BB2_1 Depth=1
	lea	rdi, [rip + L_.str.3]
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 36], eax ## 4-byte Spill
## %bb.7:                               ##   in Loop: Header=BB2_1 Depth=1
	mov	eax, dword ptr [rbp - 4]
	add	eax, 1
	mov	dword ptr [rbp - 4], eax
	jmp	LBB2_1
LBB2_8:
	lea	rdi, [rip + L_.str.4]
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 4], 0
	mov	dword ptr [rbp - 40], eax ## 4-byte Spill
LBB2_9:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_11 Depth 2
	mov	eax, dword ptr [rbp - 4]
	mov	rcx, qword ptr [rbp - 24] ## 8-byte Reload
	mov	edx, dword ptr [rcx]
	sub	edx, 1
	cmp	eax, edx
	jge	LBB2_19
## %bb.10:                              ##   in Loop: Header=BB2_9 Depth=1
	mov	dword ptr [rbp - 8], 0
LBB2_11:                                ##   Parent Loop BB2_9 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rbp - 8]
	mov	rcx, qword ptr [rbp - 24] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 8]
	movsxd	rsi, dword ptr [rbp - 4]
	mov	edi, dword ptr [rdx + 4*rsi]
	mov	rdx, qword ptr [rcx + 8]
	mov	r8d, dword ptr [rbp - 4]
	add	r8d, 1
	movsxd	rsi, r8d
	imul	edi, dword ptr [rdx + 4*rsi]
	cmp	eax, edi
	jge	LBB2_17
## %bb.12:                              ##   in Loop: Header=BB2_11 Depth=2
	mov	eax, dword ptr [rbp - 8]
	mov	rcx, qword ptr [rbp - 24] ## 8-byte Reload
	mov	rdx, qword ptr [rcx + 8]
	mov	esi, dword ptr [rbp - 4]
	add	esi, 1
	movsxd	rdi, esi
	mov	qword ptr [rbp - 48], rdx ## 8-byte Spill
	cdq
	mov	r8, qword ptr [rbp - 48] ## 8-byte Reload
	idiv	dword ptr [r8 + 4*rdi]
	mov	dword ptr [rbp - 12], eax
	mov	eax, dword ptr [rbp - 8]
	mov	rdi, qword ptr [rcx + 8]
	mov	esi, dword ptr [rbp - 4]
	add	esi, 1
	movsxd	r9, esi
	cdq
	idiv	dword ptr [rdi + 4*r9]
	mov	dword ptr [rbp - 16], edx
	cmp	dword ptr [rbp - 8], 0
	jle	LBB2_15
## %bb.13:                              ##   in Loop: Header=BB2_11 Depth=2
	cmp	dword ptr [rbp - 16], 0
	jne	LBB2_15
## %bb.14:                              ##   in Loop: Header=BB2_11 Depth=2
	lea	rdi, [rip + L_.str.5]
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 52], eax ## 4-byte Spill
LBB2_15:                                ##   in Loop: Header=BB2_11 Depth=2
	mov	esi, dword ptr [rbp - 4]
	mov	edx, dword ptr [rbp - 12]
	mov	rax, qword ptr [rbp - 24] ## 8-byte Reload
	mov	rcx, qword ptr [rax + 24]
	movsxd	rdi, dword ptr [rbp - 4]
	mov	rcx, qword ptr [rcx + 8*rdi]
	movsxd	rdi, dword ptr [rbp - 8]
	movsd	xmm0, qword ptr [rcx + 8*rdi] ## xmm0 = mem[0],zero
	mov	r8d, dword ptr [rbp - 4]
	add	r8d, 1
	mov	r9d, dword ptr [rbp - 16]
	lea	rdi, [rip + L_.str.6]
	mov	ecx, r8d
	mov	r8d, r9d
	mov	al, 1
	call	_printf
	mov	dword ptr [rbp - 56], eax ## 4-byte Spill
## %bb.16:                              ##   in Loop: Header=BB2_11 Depth=2
	mov	eax, dword ptr [rbp - 8]
	add	eax, 1
	mov	dword ptr [rbp - 8], eax
	jmp	LBB2_11
LBB2_17:                                ##   in Loop: Header=BB2_9 Depth=1
	lea	rdi, [rip + L_.str.7]
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 60], eax ## 4-byte Spill
## %bb.18:                              ##   in Loop: Header=BB2_9 Depth=1
	mov	eax, dword ptr [rbp - 4]
	add	eax, 1
	mov	dword ptr [rbp - 4], eax
	jmp	LBB2_9
LBB2_19:
	add	rsp, 64
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_create_network         ## -- Begin function create_network
	.p2align	4, 0x90
_create_network:                        ## @create_network
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	rax, rdi
	lea	rcx, [rbp + 16]
	mov	dword ptr [rbp - 4], esi
	mov	qword ptr [rbp - 16], rdx
	mov	esi, dword ptr [rbp - 4]
	mov	dword ptr [rcx], esi
	mov	esi, dword ptr [rbp - 4]
	mov	rdx, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 24], rdi ## 8-byte Spill
	mov	edi, esi
	mov	rsi, rdx
	mov	qword ptr [rbp - 32], rax ## 8-byte Spill
	mov	qword ptr [rbp - 40], rcx ## 8-byte Spill
	call	_set_NPL_array
	mov	rcx, qword ptr [rbp - 40] ## 8-byte Reload
	mov	qword ptr [rcx + 8], rax
	mov	edi, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rbp - 16]
	call	_create_neurons
	mov	rcx, qword ptr [rbp - 40] ## 8-byte Reload
	mov	qword ptr [rcx + 16], rax
	mov	edi, dword ptr [rbp - 4]
	mov	rsi, qword ptr [rbp - 16]
	call	_create_weights
	mov	rcx, qword ptr [rbp - 40] ## 8-byte Reload
	mov	qword ptr [rcx + 24], rax
	mov	rax, qword ptr [rcx]
	mov	rdx, qword ptr [rbp - 24] ## 8-byte Reload
	mov	qword ptr [rdx], rax
	mov	rax, qword ptr [rcx + 8]
	mov	qword ptr [rdx + 8], rax
	mov	rax, qword ptr [rcx + 16]
	mov	qword ptr [rdx + 16], rax
	mov	rax, qword ptr [rcx + 24]
	mov	qword ptr [rdx + 24], rax
	mov	rax, qword ptr [rbp - 32] ## 8-byte Reload
	add	rsp, 48
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_set_NPL_array          ## -- Begin function set_NPL_array
	.p2align	4, 0x90
_set_NPL_array:                         ## @set_NPL_array
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	movsxd	rsi, dword ptr [rbp - 4]
	shl	rsi, 2
	mov	rdi, rsi
	call	_malloc
	mov	qword ptr [rbp - 32], rax
	mov	dword ptr [rbp - 20], 0
LBB4_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 20]
	cmp	eax, dword ptr [rbp - 4]
	jge	LBB4_4
## %bb.2:                               ##   in Loop: Header=BB4_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	movsxd	rcx, dword ptr [rbp - 20]
	mov	edx, dword ptr [rax + 4*rcx]
	mov	rax, qword ptr [rbp - 32]
	movsxd	rcx, dword ptr [rbp - 20]
	mov	dword ptr [rax + 4*rcx], edx
## %bb.3:                               ##   in Loop: Header=BB4_1 Depth=1
	mov	eax, dword ptr [rbp - 20]
	add	eax, 1
	mov	dword ptr [rbp - 20], eax
	jmp	LBB4_1
LBB4_4:
	mov	rax, qword ptr [rbp - 32]
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_create_neurons         ## -- Begin function create_neurons
	.p2align	4, 0x90
_create_neurons:                        ## @create_neurons
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 32
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	movsxd	rsi, dword ptr [rbp - 4]
	shl	rsi, 3
	mov	rdi, rsi
	call	_malloc
	mov	qword ptr [rbp - 32], rax
	mov	dword ptr [rbp - 20], 0
LBB5_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 20]
	cmp	eax, dword ptr [rbp - 4]
	jge	LBB5_4
## %bb.2:                               ##   in Loop: Header=BB5_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	movsxd	rcx, dword ptr [rbp - 20]
	movsxd	rax, dword ptr [rax + 4*rcx]
	shl	rax, 4
	mov	rdi, rax
	call	_malloc
	mov	rcx, qword ptr [rbp - 32]
	movsxd	rdi, dword ptr [rbp - 20]
	mov	qword ptr [rcx + 8*rdi], rax
## %bb.3:                               ##   in Loop: Header=BB5_1 Depth=1
	mov	eax, dword ptr [rbp - 20]
	add	eax, 1
	mov	dword ptr [rbp - 20], eax
	jmp	LBB5_1
LBB5_4:
	mov	rax, qword ptr [rbp - 32]
	add	rsp, 32
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_create_weights         ## -- Begin function create_weights
	.p2align	4, 0x90
_create_weights:                        ## @create_weights
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 48
	mov	dword ptr [rbp - 4], edi
	mov	qword ptr [rbp - 16], rsi
	mov	edi, dword ptr [rbp - 4]
	sub	edi, 1
	movsxd	rsi, edi
	shl	rsi, 3
	mov	rdi, rsi
	call	_malloc
	mov	qword ptr [rbp - 32], rax
	mov	dword ptr [rbp - 20], 0
LBB6_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 20]
	mov	ecx, dword ptr [rbp - 4]
	sub	ecx, 1
	cmp	eax, ecx
	jge	LBB6_4
## %bb.2:                               ##   in Loop: Header=BB6_1 Depth=1
	mov	rax, qword ptr [rbp - 16]
	movsxd	rcx, dword ptr [rbp - 20]
	mov	edx, dword ptr [rax + 4*rcx]
	mov	rax, qword ptr [rbp - 16]
	mov	esi, dword ptr [rbp - 20]
	add	esi, 1
	movsxd	rcx, esi
	imul	edx, dword ptr [rax + 4*rcx]
	mov	dword ptr [rbp - 36], edx
	movsxd	rax, dword ptr [rbp - 36]
	shl	rax, 3
	mov	rdi, rax
	call	_malloc
	mov	rcx, qword ptr [rbp - 32]
	movsxd	rdi, dword ptr [rbp - 20]
	mov	qword ptr [rcx + 8*rdi], rax
## %bb.3:                               ##   in Loop: Header=BB6_1 Depth=1
	mov	eax, dword ptr [rbp - 20]
	add	eax, 1
	mov	dword ptr [rbp - 20], eax
	jmp	LBB6_1
LBB6_4:
	mov	rax, qword ptr [rbp - 32]
	add	rsp, 48
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_initialize_network_values ## -- Begin function initialize_network_values
	.p2align	4, 0x90
_initialize_network_values:             ## @initialize_network_values
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	lea	rax, [rbp + 16]
	mov	rdi, qword ptr [rax + 16]
	mov	esi, dword ptr [rax]
	mov	rdx, qword ptr [rax + 8]
	mov	qword ptr [rbp - 8], rax ## 8-byte Spill
	call	_initialize_neuron_values
	mov	rax, qword ptr [rbp - 8] ## 8-byte Reload
	mov	rdi, qword ptr [rax + 24]
	mov	esi, dword ptr [rax]
	mov	rdx, qword ptr [rax + 8]
	call	_initialize_weight_values
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_initialize_neuron_values ## -- Begin function initialize_neuron_values
	.p2align	4, 0x90
_initialize_neuron_values:              ## @initialize_neuron_values
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	qword ptr [rbp - 8], rdi
	mov	dword ptr [rbp - 12], esi
	mov	qword ptr [rbp - 24], rdx
	mov	dword ptr [rbp - 28], 0
LBB8_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_3 Depth 2
	mov	eax, dword ptr [rbp - 28]
	cmp	eax, dword ptr [rbp - 12]
	jge	LBB8_8
## %bb.2:                               ##   in Loop: Header=BB8_1 Depth=1
	mov	dword ptr [rbp - 32], 0
LBB8_3:                                 ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rbp - 32]
	mov	rcx, qword ptr [rbp - 24]
	movsxd	rdx, dword ptr [rbp - 28]
	cmp	eax, dword ptr [rcx + 4*rdx]
	jge	LBB8_6
## %bb.4:                               ##   in Loop: Header=BB8_3 Depth=2
	mov	rax, qword ptr [rbp - 8]
	movsxd	rcx, dword ptr [rbp - 28]
	mov	rax, qword ptr [rax + 8*rcx]
	movsxd	rcx, dword ptr [rbp - 32]
	shl	rcx, 4
	add	rax, rcx
	xorps	xmm0, xmm0
	movsd	qword ptr [rax], xmm0
	mov	rax, qword ptr [rbp - 8]
	movsxd	rcx, dword ptr [rbp - 28]
	mov	rax, qword ptr [rax + 8*rcx]
	movsxd	rcx, dword ptr [rbp - 32]
	shl	rcx, 4
	add	rax, rcx
	movsd	qword ptr [rax + 8], xmm0
## %bb.5:                               ##   in Loop: Header=BB8_3 Depth=2
	mov	eax, dword ptr [rbp - 32]
	add	eax, 1
	mov	dword ptr [rbp - 32], eax
	jmp	LBB8_3
LBB8_6:                                 ##   in Loop: Header=BB8_1 Depth=1
	jmp	LBB8_7
LBB8_7:                                 ##   in Loop: Header=BB8_1 Depth=1
	mov	eax, dword ptr [rbp - 28]
	add	eax, 1
	mov	dword ptr [rbp - 28], eax
	jmp	LBB8_1
LBB8_8:
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function initialize_weight_values
LCPI9_0:
	.quad	4618441417868443648     ## double 6
LCPI9_1:
	.quad	4746794007244308480     ## double 2147483647
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_initialize_weight_values
	.p2align	4, 0x90
_initialize_weight_values:              ## @initialize_weight_values
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 64
	mov	qword ptr [rbp - 8], rdi
	mov	dword ptr [rbp - 12], esi
	mov	qword ptr [rbp - 24], rdx
	mov	dword ptr [rbp - 28], 0
LBB9_1:                                 ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_6 Depth 2
	mov	eax, dword ptr [rbp - 28]
	mov	ecx, dword ptr [rbp - 12]
	sub	ecx, 1
	cmp	eax, ecx
	jge	LBB9_11
## %bb.2:                               ##   in Loop: Header=BB9_1 Depth=1
	mov	rax, qword ptr [rbp - 24]
	movsxd	rcx, dword ptr [rbp - 28]
	mov	edx, dword ptr [rax + 4*rcx]
	mov	rax, qword ptr [rbp - 24]
	mov	esi, dword ptr [rbp - 28]
	add	esi, 1
	movsxd	rcx, esi
	imul	edx, dword ptr [rax + 4*rcx]
	mov	dword ptr [rbp - 36], edx
	cmp	dword ptr [rbp - 28], 0
	jne	LBB9_4
## %bb.3:                               ##   in Loop: Header=BB9_1 Depth=1
	mov	dword ptr [rbp - 40], 0
	jmp	LBB9_5
LBB9_4:                                 ##   in Loop: Header=BB9_1 Depth=1
	mov	rax, qword ptr [rbp - 24]
	mov	ecx, dword ptr [rbp - 28]
	sub	ecx, 1
	movsxd	rdx, ecx
	mov	ecx, dword ptr [rax + 4*rdx]
	mov	rax, qword ptr [rbp - 24]
	movsxd	rdx, dword ptr [rbp - 28]
	imul	ecx, dword ptr [rax + 4*rdx]
	mov	dword ptr [rbp - 40], ecx
LBB9_5:                                 ##   in Loop: Header=BB9_1 Depth=1
	movsd	xmm0, qword ptr [rip + LCPI9_0] ## xmm0 = mem[0],zero
	sqrtsd	xmm0, xmm0
	mov	eax, dword ptr [rbp - 40]
	add	eax, dword ptr [rbp - 36]
	cvtsi2sd	xmm1, eax
	sqrtsd	xmm1, xmm1
	divsd	xmm0, xmm1
	movsd	qword ptr [rbp - 48], xmm0
	mov	esi, dword ptr [rbp - 28]
	mov	eax, dword ptr [rbp - 28]
	add	eax, 1
	movsd	xmm0, qword ptr [rbp - 48] ## xmm0 = mem[0],zero
	movq	rcx, xmm0
	movabs	rdx, -9223372036854775808
	xor	rcx, rdx
	movq	xmm0, rcx
	movsd	xmm1, qword ptr [rbp - 48] ## xmm1 = mem[0],zero
	lea	rdi, [rip + L_.str.8]
	mov	edx, eax
	mov	al, 2
	call	_printf
	mov	dword ptr [rbp - 32], 0
	mov	dword ptr [rbp - 52], eax ## 4-byte Spill
LBB9_6:                                 ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rbp - 32]
	mov	rcx, qword ptr [rbp - 24]
	movsxd	rdx, dword ptr [rbp - 28]
	mov	esi, dword ptr [rcx + 4*rdx]
	mov	rcx, qword ptr [rbp - 24]
	mov	edi, dword ptr [rbp - 28]
	add	edi, 1
	movsxd	rdx, edi
	imul	esi, dword ptr [rcx + 4*rdx]
	cmp	eax, esi
	jge	LBB9_9
## %bb.7:                               ##   in Loop: Header=BB9_6 Depth=2
	movsd	xmm0, qword ptr [rbp - 48] ## xmm0 = mem[0],zero
	addsd	xmm0, qword ptr [rbp - 48]
	movsd	qword ptr [rbp - 64], xmm0 ## 8-byte Spill
	call	_rand
	movsd	xmm0, qword ptr [rip + LCPI9_1] ## xmm0 = mem[0],zero
	cvtsi2sd	xmm1, eax
	divsd	xmm1, xmm0
	movsd	xmm0, qword ptr [rbp - 64] ## 8-byte Reload
                                        ## xmm0 = mem[0],zero
	mulsd	xmm0, xmm1
	subsd	xmm0, qword ptr [rbp - 48]
	mov	rcx, qword ptr [rbp - 8]
	movsxd	rdx, dword ptr [rbp - 28]
	mov	rcx, qword ptr [rcx + 8*rdx]
	movsxd	rdx, dword ptr [rbp - 32]
	movsd	qword ptr [rcx + 8*rdx], xmm0
## %bb.8:                               ##   in Loop: Header=BB9_6 Depth=2
	mov	eax, dword ptr [rbp - 32]
	add	eax, 1
	mov	dword ptr [rbp - 32], eax
	jmp	LBB9_6
LBB9_9:                                 ##   in Loop: Header=BB9_1 Depth=1
	jmp	LBB9_10
LBB9_10:                                ##   in Loop: Header=BB9_1 Depth=1
	mov	eax, dword ptr [rbp - 28]
	add	eax, 1
	mov	dword ptr [rbp - 28], eax
	jmp	LBB9_1
LBB9_11:
	add	rsp, 64
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_free_network           ## -- Begin function free_network
	.p2align	4, 0x90
_free_network:                          ## @free_network
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	lea	rax, [rbp + 16]
	mov	rdi, qword ptr [rax + 8]
	mov	qword ptr [rbp - 8], rax ## 8-byte Spill
	call	_free_NPL_array
	mov	rax, qword ptr [rbp - 8] ## 8-byte Reload
	mov	rdi, qword ptr [rax + 16]
	mov	esi, dword ptr [rax]
	call	_free_neurons
	mov	rax, qword ptr [rbp - 8] ## 8-byte Reload
	mov	rdi, qword ptr [rax + 24]
	mov	esi, dword ptr [rax]
	call	_free_weights
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_free_NPL_array         ## -- Begin function free_NPL_array
	.p2align	4, 0x90
_free_NPL_array:                        ## @free_NPL_array
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	rdi, qword ptr [rbp - 8]
	call	_free
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_free_neurons           ## -- Begin function free_neurons
	.p2align	4, 0x90
_free_neurons:                          ## @free_neurons
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	dword ptr [rbp - 12], esi
	mov	dword ptr [rbp - 16], 0
LBB12_1:                                ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 16]
	cmp	eax, dword ptr [rbp - 12]
	jge	LBB12_4
## %bb.2:                               ##   in Loop: Header=BB12_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	movsxd	rcx, dword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 8*rcx]
	mov	rdi, rax
	call	_free
## %bb.3:                               ##   in Loop: Header=BB12_1 Depth=1
	mov	eax, dword ptr [rbp - 16]
	add	eax, 1
	mov	dword ptr [rbp - 16], eax
	jmp	LBB12_1
LBB12_4:
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, rax
	call	_free
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.globl	_free_weights           ## -- Begin function free_weights
	.p2align	4, 0x90
_free_weights:                          ## @free_weights
	.cfi_startproc
## %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	qword ptr [rbp - 8], rdi
	mov	dword ptr [rbp - 12], esi
	mov	dword ptr [rbp - 16], 0
LBB13_1:                                ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 16]
	mov	ecx, dword ptr [rbp - 12]
	sub	ecx, 1
	cmp	eax, ecx
	jge	LBB13_4
## %bb.2:                               ##   in Loop: Header=BB13_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	movsxd	rcx, dword ptr [rbp - 16]
	mov	rax, qword ptr [rax + 8*rcx]
	mov	rdi, rax
	call	_free
## %bb.3:                               ##   in Loop: Header=BB13_1 Depth=1
	mov	eax, dword ptr [rbp - 16]
	add	eax, 1
	mov	dword ptr [rbp - 16], eax
	jmp	LBB13_1
LBB13_4:
	mov	rax, qword ptr [rbp - 8]
	mov	rdi, rax
	call	_free
	add	rsp, 16
	pop	rbp
	ret
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"\nOUTPUT:\n\n"

L_.str.1:                               ## @.str.1
	.asciz	"L:%d N:%-3d A:%-2lf B:%-2lf\n"

L_.str.2:                               ## @.str.2
	.asciz	"\nNEURONS:\n\n"

L_.str.3:                               ## @.str.3
	.asciz	"\n"

L_.str.4:                               ## @.str.4
	.asciz	"\nWEIGHTS:\n\n"

L_.str.5:                               ## @.str.5
	.asciz	"-\n"

L_.str.6:                               ## @.str.6
	.asciz	"( L:%d N:%-3d  --[W:%10lf]->  L:%d N:%-2d )\n"

L_.str.7:                               ## @.str.7
	.asciz	"***\n"

L_.str.8:                               ## @.str.8
	.asciz	"xavierInit LAYER[%d -> %d]: (%lf <=> %lf)\n"


.subsections_via_symbols
