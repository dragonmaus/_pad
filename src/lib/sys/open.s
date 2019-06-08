	global	open

	section	.text
open:
	mov	rax, 2		; syscall open
	syscall
	ret
