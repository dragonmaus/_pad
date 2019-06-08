	global	readlink

	section	.text
readlink:
	mov	rax, 89		; syscall readlink
	syscall
	ret
