format	elf64 executable 0

segment	readable executable

entry	$
	mov	rdx, len
	lea	rsi, [msg]
	mov	rdi, 1		; stdout
	mov	rax, 1		; syscall write
	syscall

	xor	rdi, rdi	; exit code 0
	mov	rax, 60		; syscall exit
	syscall

segment	readable

msg	db	'Hello, world!', 0xA
len	=	$ - msg
