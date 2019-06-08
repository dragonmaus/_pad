	global	brk

	section	.text
brk:
	mov	rax, 12		; syscall brk
	syscall
	ret
