	global	exit

	section	.text
exit:
	mov	rax, 60		; syscall exit
	syscall
	ret
