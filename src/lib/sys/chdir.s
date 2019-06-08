	global	chdir

	section	.text
chdir:
	mov	rax, 80		; syscall chdir
	syscall
	ret
