	global	execve

	section	.text
execve:
	mov	rax, 59		; syscall execve
	syscall
	ret
