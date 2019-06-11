	global	_start

	section	.text
_start:
	mov	rdx, msglen
	mov	rsi, msg
	mov	rdi, 1		; stdout
	mov	rax, 1		; syscall write
	syscall
	mov	rdi, rax
	mov	rax, 60		; syscall exit
	syscall

	section	.data
msg	db	'Hello, world!', 0x0A
msglen	equ	$ - msg
