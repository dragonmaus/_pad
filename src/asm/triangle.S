	global	_start
	section	.text
_start:	mov	rdx, output
	mov	r8, 1
	mov	r9, 0
line:	mov	byte [rdx], '*'
	inc	rdx
	inc	r9
	cmp	r9, r8
	jne	line
ldone:	mov	byte [rdx], 10
	inc	rdx
	inc	r8
	mov	r9, 0
	cmp	r8, linemax
	jng	line
done:	mov	rax, 1
	mov	rdi, 1
	mov	rsi, output
	mov	rdx, dlen
	syscall
	mov	rax, 60
	xor	rdi, rdi
	syscall

	section	.bss
linemax	equ	8
dlen	equ	44
output:	resb	dlen
