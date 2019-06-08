	global	close

	section	.text
close:
	mov	rax, 3		; syscall close
	syscall
	ret
