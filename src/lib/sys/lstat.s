	global	lstat

	section	.text
lstat:
	mov	rax, 6		; syscall lstat
	syscall
	ret
