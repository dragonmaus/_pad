	global	fsync

	section	.text
fsync:
	mov	rax, 74		; syscall fsync
	syscall
	ret
