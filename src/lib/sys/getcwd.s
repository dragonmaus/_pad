	global	getcwd

	section	.text
getcwd:
	mov	rax, 79		; syscall getcwd
	syscall
	ret
