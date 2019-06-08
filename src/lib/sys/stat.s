	global	stat

	section	.text
stat:
	mov	rax, 4		; syscall stat
	syscall
	ret
