	global	_start

	section	.text
_start:
	xor	rdi, rdi	; exit code 0
	mov	rax, 60		; syscall exit
	syscall
