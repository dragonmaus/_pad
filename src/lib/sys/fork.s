	global	fork

	section	.text
fork:
	mov	rax, 57		; syscall fork
	syscall
	ret
