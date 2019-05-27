format	elf64

section	'.text' executable

public _start
_start:

extrn	main

	call	main

	mov	edi, eax	; exit code is what main returned
	mov	eax, 60		; syscall exit
	syscall
