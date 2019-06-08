	global	wait4

	section	.text
wait4:
	mov	rax, 61		; syscall wait4
	syscall
	ret
