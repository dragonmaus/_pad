format	elf64

section	'.text' executable

public	open

open:
	mov	eax, 2		; syscall open
	syscall
	ret
