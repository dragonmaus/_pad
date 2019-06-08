	global	read

	section	.text
read:
	mov	rax, 0		; syscall read
	syscall
	ret
