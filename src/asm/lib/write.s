format	elf64

section	'.text' executable

public	write

write:
	mov	eax, 1		; syscall write
	syscall
