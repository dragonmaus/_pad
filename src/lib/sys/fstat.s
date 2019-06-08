	global	fstat

	section	.text
fstat:
	mov	rax, 5		; syscall fstat
	syscall
	ret
