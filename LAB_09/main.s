	.file	"main.c"
	.text
	.globl	mul_c
	.type	mul_c, @function
mul_c:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	movl	%edi, -84(%rbp)
	movl	%esi, -88(%rbp)
	movq	%rdx, -96(%rbp)
	movl	%ecx, -100(%rbp)
	movq	%r8, -112(%rbp)
	movq	%r9, -120(%rbp)
	movl	-88(%rbp), %edx
	movslq	%edx, %rax
	subq	$1, %rax
	movq	%rax, -56(%rbp)
	movslq	%edx, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movl	-100(%rbp), %ecx
	movslq	%ecx, %rax
	subq	$1, %rax
	movq	%rax, -64(%rbp)
	movslq	%ecx, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movl	-100(%rbp), %eax
	movslq	%eax, %rsi
	subq	$1, %rsi
	movq	%rsi, -72(%rbp)
	movslq	%eax, %rsi
	movq	%rsi, %r10
	movl	$0, %r11d
	movl	$0, -36(%rbp)
	jmp	.L2
.L7:
	movl	$0, -40(%rbp)
	jmp	.L3
.L6:
	movl	-36(%rbp), %esi
	movslq	%esi, %rdi
	movslq	%eax, %rsi
	imulq	%rdi, %rsi
	leaq	0(,%rsi,4), %rdi
	movq	-120(%rbp), %rsi
	addq	%rsi, %rdi
	movl	-40(%rbp), %esi
	movslq	%esi, %rsi
	movl	$0, (%rdi,%rsi,4)
	movl	$0, -44(%rbp)
	jmp	.L4
.L5:
	movl	-36(%rbp), %esi
	movslq	%esi, %rdi
	movslq	%edx, %rsi
	imulq	%rdi, %rsi
	leaq	0(,%rsi,4), %rdi
	movq	-96(%rbp), %rsi
	addq	%rsi, %rdi
	movl	-44(%rbp), %esi
	movslq	%esi, %rsi
	movl	(%rdi,%rsi,4), %edi
	movl	-44(%rbp), %esi
	movslq	%esi, %r8
	movslq	%ecx, %rsi
	imulq	%r8, %rsi
	leaq	0(,%rsi,4), %r8
	movq	-112(%rbp), %rsi
	addq	%rsi, %r8
	movl	-40(%rbp), %esi
	movslq	%esi, %rsi
	movl	(%r8,%rsi,4), %esi
	imull	%esi, %edi
	movl	%edi, %r9d
	movl	-36(%rbp), %esi
	movslq	%esi, %rdi
	movslq	%eax, %rsi
	imulq	%rdi, %rsi
	leaq	0(,%rsi,4), %rdi
	movq	-120(%rbp), %rsi
	addq	%rsi, %rdi
	movl	-40(%rbp), %esi
	movslq	%esi, %rsi
	movl	(%rdi,%rsi,4), %r8d
	movl	-36(%rbp), %esi
	movslq	%esi, %rdi
	movslq	%eax, %rsi
	imulq	%rdi, %rsi
	leaq	0(,%rsi,4), %rdi
	movq	-120(%rbp), %rsi
	addq	%rsi, %rdi
	addl	%r9d, %r8d
	movl	-40(%rbp), %esi
	movslq	%esi, %rsi
	movl	%r8d, (%rdi,%rsi,4)
	addl	$1, -44(%rbp)
.L4:
	movl	-44(%rbp), %esi
	cmpl	-88(%rbp), %esi
	jl	.L5
	addl	$1, -40(%rbp)
.L3:
	movl	-40(%rbp), %esi
	cmpl	-100(%rbp), %esi
	jl	.L6
	addl	$1, -36(%rbp)
.L2:
	movl	-36(%rbp), %esi
	cmpl	-84(%rbp), %esi
	jl	.L7
	nop
	nop
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	mul_c, .-mul_c
	.section	.rodata
.LC0:
	.string	"%d "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movq	%rdx, -48(%rbp)
	movl	-40(%rbp), %ebx
	movslq	%ebx, %rax
	subq	$1, %rax
	movq	%rax, -32(%rbp)
	movslq	%ebx, %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movl	$0, -20(%rbp)
	jmp	.L9
.L12:
	movl	$0, -24(%rbp)
	jmp	.L10
.L11:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movslq	%ebx, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	-24(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -24(%rbp)
.L10:
	movl	-24(%rbp), %eax
	cmpl	-40(%rbp), %eax
	jl	.L11
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -20(%rbp)
.L9:
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L12
	nop
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	print_matrix, .-print_matrix
	.globl	mul_asm
	.type	mul_asm, @function
mul_asm:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$216, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -132(%rbp)
	movl	%esi, -136(%rbp)
	movq	%rdx, -144(%rbp)
	movl	%ecx, -148(%rbp)
	movq	%r8, -160(%rbp)
	movq	%r9, -168(%rbp)
	movl	-136(%rbp), %ebx
	movl	%ebx, -172(%rbp)
	movslq	%ebx, %rax
	subq	$1, %rax
	movq	%rax, -80(%rbp)
	movslq	%ebx, %rax
	movq	%rax, -208(%rbp)
	movq	$0, -200(%rbp)
	movl	-148(%rbp), %ebx
	movslq	%ebx, %rax
	subq	$1, %rax
	movq	%rax, -88(%rbp)
	movslq	%ebx, %rax
	movq	%rax, -224(%rbp)
	movq	$0, -216(%rbp)
	movl	-148(%rbp), %r9d
	movslq	%r9d, %rax
	subq	$1, %rax
	movq	%rax, -96(%rbp)
	movslq	%r9d, %rax
	movq	%rax, -240(%rbp)
	movq	$0, -232(%rbp)
	movq	%rsp, %rax
	movq	%rax, -208(%rbp)
	movl	-148(%rbp), %esi
	movl	-136(%rbp), %edi
	movslq	%esi, %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	movslq	%esi, %rax
	movq	%rax, -256(%rbp)
	movq	$0, -248(%rbp)
	movslq	%esi, %rax
	leaq	0(,%rax,4), %r8
	movslq	%edi, %rax
	subq	$1, %rax
	movq	%rax, -112(%rbp)
	movslq	%esi, %rax
	movq	%rax, %r10
	movl	$0, %r11d
	movslq	%edi, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	%r11, %rdx
	imulq	%r12, %rdx
	movq	%r13, %rax
	imulq	%r10, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r10, %rax
	mulq	%r12
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rax
	movq	%rax, -192(%rbp)
	movq	$0, -184(%rbp)
	movslq	%edi, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movq	-192(%rbp), %r11
	movq	-184(%rbp), %r12
	movq	%r12, %rdx
	imulq	%r14, %rdx
	movq	%r11, %rax
	imulq	%r15, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r11, %rax
	mulq	%r14
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rdx
	movslq	%edi, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -120(%rbp)
	movq	$0, -56(%rbp)
	jmp	.L14
.L17:
	movq	$0, -64(%rbp)
	jmp	.L15
.L16:
	movslq	%ebx, %rax
	imulq	-64(%rbp), %rax
	leaq	0(,%rax,4), %rdx
	movq	-160(%rbp), %rax
	addq	%rax, %rdx
	movq	%r8, %rcx
	shrq	$2, %rcx
	movq	-56(%rbp), %rax
	movl	(%rdx,%rax,4), %edx
	movq	-120(%rbp), %rax
	movq	%rcx, %rsi
	imulq	-56(%rbp), %rsi
	movq	-64(%rbp), %rcx
	addq	%rsi, %rcx
	movl	%edx, (%rax,%rcx,4)
	addq	$1, -64(%rbp)
.L15:
	movl	-148(%rbp), %eax
	cltq
	cmpq	%rax, -64(%rbp)
	jb	.L16
	addq	$1, -56(%rbp)
.L14:
	movl	-136(%rbp), %eax
	cltq
	cmpq	%rax, -56(%rbp)
	jb	.L17
	movl	$0, -68(%rbp)
	jmp	.L18
.L21:
	movl	$0, -72(%rbp)
	jmp	.L19
.L20:
	movl	$0, -124(%rbp)
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movslq	-172(%rbp), %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-144(%rbp), %rax
	addq	%rax, %rdx
	movq	%r8, %rcx
	shrq	$2, %rcx
	movl	-72(%rbp), %eax
	cltq
	imulq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	movq	-120(%rbp), %rax
	addq	%rcx, %rax
#APP
# 43 "main.c" 1
	pxor %xmm0, %xmm0
	mov -136(%rbp), %ecx
	cickle_k:
	movss (%rdx), %xmm1 
	movss (%rax), %xmm2 
	pmullw %xmm2, %xmm1 
	addss %xmm1, %xmm0 
	add $4, %rdx
	add $4, %rax
	dec %ecx 
	jnz cickle_k 
	movss %xmm0, -124(%rbp) 
	
# 0 "" 2
#NO_APP
	movl	-68(%rbp), %eax
	movslq	%eax, %rdx
	movslq	%r9d, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movq	-168(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-124(%rbp), %edx
	movl	-72(%rbp), %eax
	cltq
	movl	%edx, (%rcx,%rax,4)
	addl	$1, -72(%rbp)
.L19:
	movl	-72(%rbp), %eax
	cmpl	-148(%rbp), %eax
	jl	.L20
	addl	$1, -68(%rbp)
.L18:
	movl	-68(%rbp), %eax
	cmpl	-132(%rbp), %eax
	jl	.L21
	movq	-208(%rbp), %rsp
	nop
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	mul_asm, .-mul_asm
	.section	.rodata
	.align 8
.LC1:
	.string	"\320\235\320\265\320\262\320\276\320\267\320\274\320\276\320\266\320\275\320\276 \320\277\320\265\321\200\320\265\320\274\320\275\320\276\320\266\320\270\321\202\321\214 \320\274\320\260\321\202\321\200\320\270\321\206\321\213"
	.align 8
.LC2:
	.string	"\320\240\320\260\320\267\320\274\320\265\321\200\320\275\320\276\321\201\321\202\321\214 \320\274\320\260\321\202\321\200\320\270\321\206\321\213 \320\275\320\265 \320\274\320\276\320\266\320\265\321\202 \320\261\321\213\321\202\321\214 \321\200\320\260\320\262\320\275\320\260 0"
	.align 8
.LC6:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\264\320\273\321\217 \320\241 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: %lf\n"
	.align 8
.LC7:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\264\320\273\321\217 ASM \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: %lf\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$440, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%rsp, %rax
	movq	%rax, -472(%rbp)
	movl	$152, -84(%rbp)
	movl	$153, -88(%rbp)
	movl	$153, -92(%rbp)
	movl	$15, -96(%rbp)
	movl	-88(%rbp), %r10d
	movl	-84(%rbp), %r11d
	movslq	%r10d, %rax
	subq	$1, %rax
	movq	%rax, -104(%rbp)
	movslq	%r10d, %rax
	movq	%rax, %rcx
	movl	$0, %ebx
	movslq	%r10d, %rax
	leaq	0(,%rax,4), %rbx
	movslq	%r11d, %rax
	subq	$1, %rax
	movq	%rax, -112(%rbp)
	movslq	%r10d, %rax
	movq	%rax, %r8
	movl	$0, %r9d
	movslq	%r11d, %rax
	movq	%rax, %rsi
	movl	$0, %edi
	movq	%r9, %rdx
	imulq	%rsi, %rdx
	movq	%rdi, %rax
	imulq	%r8, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r8, %rax
	mulq	%rsi
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%r10d, %rax
	movq	%rax, %r14
	movl	$0, %r15d
	movslq	%r11d, %rax
	movq	%rax, %r12
	movl	$0, %r13d
	movq	%r15, %rdx
	imulq	%r12, %rdx
	movq	%r13, %rax
	imulq	%r14, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r14, %rax
	mulq	%r12
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%r10d, %rdx
	movslq	%r11d, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -120(%rbp)
	movl	-96(%rbp), %esi
	movl	-92(%rbp), %edi
	movslq	%esi, %rax
	subq	$1, %rax
	movq	%rax, -128(%rbp)
	movslq	%esi, %rax
	movq	%rax, -432(%rbp)
	movq	$0, -424(%rbp)
	movslq	%esi, %rax
	leaq	0(,%rax,4), %r8
	movslq	%edi, %rax
	subq	$1, %rax
	movq	%rax, -136(%rbp)
	movslq	%esi, %rax
	movq	%rax, -240(%rbp)
	movq	$0, -232(%rbp)
	movslq	%edi, %rax
	movq	%rax, -256(%rbp)
	movq	$0, -248(%rbp)
	movq	-240(%rbp), %r14
	movq	-232(%rbp), %r15
	movq	%r15, %rdx
	movq	-256(%rbp), %r9
	movq	-248(%rbp), %r10
	movq	%r9, %rax
	imulq	%rax, %rdx
	movq	%r10, %rax
	movq	%r14, %rcx
	imulq	%rcx, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r14, %rax
	mulq	%r9
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rax
	movq	%rax, -272(%rbp)
	movq	$0, -264(%rbp)
	movslq	%edi, %rax
	movq	%rax, -288(%rbp)
	movq	$0, -280(%rbp)
	movq	-272(%rbp), %r9
	movq	-264(%rbp), %r10
	movq	%r10, %rdx
	movq	-288(%rbp), %r11
	movq	-280(%rbp), %r12
	movq	%r11, %rax
	imulq	%rax, %rdx
	movq	%r12, %rax
	movq	%r9, %rcx
	imulq	%rcx, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r9, %rax
	mulq	%r11
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rdx
	movslq	%edi, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %edi
	movl	$0, %edx
	divq	%rdi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -144(%rbp)
	movl	$0, -52(%rbp)
	jmp	.L23
.L26:
	movl	$0, -56(%rbp)
	jmp	.L24
.L25:
	movl	-52(%rbp), %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-56(%rbp), %eax
	addl	%edx, %eax
	movq	%rbx, %rsi
	shrq	$2, %rsi
	leal	1(%rax), %edi
	movq	-120(%rbp), %rcx
	movl	-56(%rbp), %eax
	movslq	%eax, %rdx
	movl	-52(%rbp), %eax
	cltq
	imulq	%rsi, %rax
	addq	%rdx, %rax
	movl	%edi, (%rcx,%rax,4)
	addl	$1, -56(%rbp)
.L24:
	movl	-56(%rbp), %eax
	cmpl	-88(%rbp), %eax
	jl	.L25
	addl	$1, -52(%rbp)
.L23:
	movl	-52(%rbp), %eax
	cmpl	-84(%rbp), %eax
	jl	.L26
	movl	-88(%rbp), %eax
	cmpl	-92(%rbp), %eax
	je	.L27
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L28
.L27:
	cmpl	$0, -84(%rbp)
	je	.L29
	cmpl	$0, -88(%rbp)
	je	.L29
	cmpl	$0, -92(%rbp)
	je	.L29
	cmpl	$0, -96(%rbp)
	jne	.L30
.L29:
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L28
.L30:
	movl	$0, -60(%rbp)
	jmp	.L31
.L34:
	movl	$0, -64(%rbp)
	jmp	.L32
.L33:
	movl	-60(%rbp), %eax
	imull	-84(%rbp), %eax
	movl	%eax, %edx
	movl	-64(%rbp), %eax
	addl	%edx, %eax
	movq	%r8, %rsi
	shrq	$2, %rsi
	leal	5(%rax), %edi
	movq	-144(%rbp), %rcx
	movl	-64(%rbp), %eax
	movslq	%eax, %rdx
	movl	-60(%rbp), %eax
	cltq
	imulq	%rsi, %rax
	addq	%rdx, %rax
	movl	%edi, (%rcx,%rax,4)
	addl	$1, -64(%rbp)
.L32:
	movl	-64(%rbp), %eax
	cmpl	-96(%rbp), %eax
	jl	.L33
	addl	$1, -60(%rbp)
.L31:
	movl	-60(%rbp), %eax
	cmpl	-92(%rbp), %eax
	jl	.L34
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -72(%rbp)
	movl	-96(%rbp), %esi
	movl	-84(%rbp), %edi
	movslq	%esi, %rax
	subq	$1, %rax
	movq	%rax, -152(%rbp)
	movslq	%esi, %rax
	movq	%rax, -448(%rbp)
	movq	$0, -440(%rbp)
	movslq	%edi, %rax
	subq	$1, %rax
	movq	%rax, -160(%rbp)
	movslq	%esi, %rax
	movq	%rax, -304(%rbp)
	movq	$0, -296(%rbp)
	movslq	%edi, %rax
	movq	%rax, -320(%rbp)
	movq	$0, -312(%rbp)
	movq	-304(%rbp), %r14
	movq	-296(%rbp), %r15
	movq	%r15, %rdx
	movq	-320(%rbp), %r8
	movq	-312(%rbp), %r9
	movq	%r8, %rax
	imulq	%rax, %rdx
	movq	%r9, %rax
	movq	%r14, %rbx
	imulq	%rbx, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r14, %rax
	mulq	%r8
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rax
	movq	%rax, -336(%rbp)
	movq	$0, -328(%rbp)
	movslq	%edi, %rax
	movq	%rax, -352(%rbp)
	movq	$0, -344(%rbp)
	movq	-336(%rbp), %r8
	movq	-328(%rbp), %r9
	movq	%r9, %rdx
	movq	-352(%rbp), %r11
	movq	-344(%rbp), %r12
	movq	%r11, %rax
	imulq	%rax, %rdx
	movq	%r12, %rax
	movq	%r8, %rbx
	imulq	%rbx, %rax
	leaq	(%rdx,%rax), %rcx
	movq	%r8, %rax
	mulq	%r11
	addq	%rdx, %rcx
	movq	%rcx, %rdx
	movslq	%esi, %rdx
	movslq	%edi, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -168(%rbp)
	movl	$0, -76(%rbp)
	jmp	.L35
.L36:
	call	clock@PLT
	movq	%rax, -216(%rbp)
	movq	-168(%rbp), %rax
	movq	-144(%rbp), %rcx
	movl	-96(%rbp), %edx
	movq	-120(%rbp), %r10
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %edi
	movq	%rax, %r9
	movq	%rcx, %r8
	movl	%edx, %ecx
	movq	%r10, %rdx
	call	mul_c
	call	clock@PLT
	movq	%rax, -224(%rbp)
	movq	-224(%rbp), %rax
	subq	-216(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-72(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	addl	$1, -76(%rbp)
.L35:
	cmpl	$999, -76(%rbp)
	jle	.L36
	movsd	-72(%rbp), %xmm0
	movsd	.LC5(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	-96(%rbp), %ecx
	movl	-88(%rbp), %esi
	movslq	%ecx, %rax
	subq	$1, %rax
	movq	%rax, -176(%rbp)
	movslq	%ecx, %rax
	movq	%rax, -464(%rbp)
	movq	$0, -456(%rbp)
	movslq	%esi, %rax
	subq	$1, %rax
	movq	%rax, -184(%rbp)
	movslq	%ecx, %rax
	movq	%rax, -368(%rbp)
	movq	$0, -360(%rbp)
	movslq	%esi, %rax
	movq	%rax, -384(%rbp)
	movq	$0, -376(%rbp)
	movq	-368(%rbp), %r8
	movq	-360(%rbp), %r9
	movq	%r9, %rdx
	movq	-384(%rbp), %r14
	movq	-376(%rbp), %r15
	movq	%r14, %rax
	imulq	%rax, %rdx
	movq	%r15, %rax
	movq	%r8, %rbx
	imulq	%rbx, %rax
	leaq	(%rdx,%rax), %rdi
	movq	%r8, %rax
	mulq	%r14
	addq	%rdx, %rdi
	movq	%rdi, %rdx
	movslq	%ecx, %rax
	movq	%rax, -400(%rbp)
	movq	$0, -392(%rbp)
	movslq	%esi, %rax
	movq	%rax, -416(%rbp)
	movq	$0, -408(%rbp)
	movq	-400(%rbp), %r14
	movq	-392(%rbp), %r15
	movq	%r15, %rdx
	movq	-416(%rbp), %r11
	movq	-408(%rbp), %r12
	movq	%r11, %rax
	imulq	%rax, %rdx
	movq	%r12, %rax
	movq	%r14, %rbx
	imulq	%rbx, %rax
	leaq	(%rdx,%rax), %rdi
	movq	%r14, %rax
	mulq	%r11
	addq	%rdx, %rdi
	movq	%rdi, %rdx
	movslq	%ecx, %rdx
	movslq	%esi, %rax
	imulq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ebx
	movl	$0, %edx
	divq	%rbx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -192(%rbp)
	movl	$0, -80(%rbp)
	jmp	.L37
.L38:
	call	clock@PLT
	movq	%rax, -200(%rbp)
	movq	-192(%rbp), %r8
	movq	-144(%rbp), %rdi
	movl	-96(%rbp), %ecx
	movq	-120(%rbp), %rdx
	movl	-88(%rbp), %esi
	movl	-84(%rbp), %eax
	movq	%r8, %r9
	movq	%rdi, %r8
	movl	%eax, %edi
	call	mul_asm
	call	clock@PLT
	movq	%rax, -208(%rbp)
	movq	-208(%rbp), %rax
	subq	-200(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC4(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	-72(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -72(%rbp)
	addl	$1, -80(%rbp)
.L37:
	cmpl	$999, -80(%rbp)
	jle	.L38
	movsd	-72(%rbp), %xmm0
	movsd	.LC5(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	%rax, %xmm0
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
.L28:
	movq	-472(%rbp), %rsp
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC4:
	.long	0
	.long	1093567616
	.align 8
.LC5:
	.long	0
	.long	1083129856
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
