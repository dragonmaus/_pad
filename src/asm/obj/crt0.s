format	elf64

section	'.text' executable

public _start
_start:

	extrn	_main

	pop	rdi		; argc
	mov	rsi, rsp	; argv

	call	_main

	mov	rdi, rax	; exit code is what _main returned
	mov	rax, 60		; syscall exit
	syscall
