	global	_start

	section	.text
_start:
	mov	rdx, length
	mov	rsi, message
	mov	rdi, 1		; stdout
	mov	rax, 1		; syscall write
	syscall
	mov	rdi, rax
	mov	rax, 60		; syscall exit
	syscall

	section	.data
message:
	db	'Hello, world!', 0x0A
length	equ	$ - message
