format	elf64

section	'.text' executable

public	open

open:
	mov	rax, 2		; syscall open
	syscall
	ret
