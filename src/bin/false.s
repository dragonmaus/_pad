	global	_start

	section	.text
_start:
	xor	rdi, rdi
	inc	rdi		; exit code 1
	mov	rax, 60		; syscall exit
	syscall
