	global	_start

	extern	buffer_0
	extern	buffer_1
	extern	buffer_getc
	extern	buffer_putc
	extern	buffer_peek
	extern	buffer_seek
	extern	buffer_flush

	section	.text
_start:
.read:	mov	rdi, buffer_0
	mov	rsi, c
	call	buffer_getc

	cmp	rax, 0
	je	.exit
	jl	.fail

	cmp	byte [c], `\r`
	jne	.write

	mov	rdi, buffer_1
	mov	rsi, `\n`
	call	buffer_putc

	mov	rdi, buffer_0
	call	buffer_peek

	cmp	rax, `\n`
	jne	.read

	mov	rdi, buffer_0
	mov	rsi, 1
	call	buffer_seek

	jmp	.read

.write:	mov	rdi, buffer_1
	mov	rsi, c
	call	buffer_putc
	jmp	.read

.exit:	mov	rdi, buffer_1
	call	buffer_flush

	mov	rax, 60
	xor	rdi, rdi
	syscall

.fail:	mov	rdi, buffer_1
	call	buffer_flush

	mov	rax, 60
	mov	rdi, 1
	syscall

	section	.bss
c:
	resb	1
