	global	_start

	section	.text
_start:
read:	mov	rax, 0
	mov	rdi, 0
	mov	rsi, c
	mov	rdx, 1
	syscall

	cmp	rax, 0
	je	exit
	jl	fail

	cmp	byte [c], `\r`
	jne	write

	mov	rax, 1
	mov	rdi, 1
	mov	rsi, nl
	mov	rdx, 1
	syscall

	mov	rax, 0
	mov	rdi, 0
	mov	rsi, c
	mov	rdx, 1
	syscall

	cmp	rax, 0
	je	exit
	jl	fail

	cmp	byte [c], `\n`
	je	read

write:	mov	rax, 1
	mov	rdi, 1
	mov	rsi, c
	mov	rdx, 1
	syscall

	jmp	read

exit:	mov	rax, 60
	xor	rdi, rdi
	syscall

fail:	mov	rax, 60
	mov	rdi, 1
	syscall

	section	.bss
c:	resb	1

	section	.data
nl:	db	`\n`
