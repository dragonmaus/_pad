format	elf64

section	'.text' executable

public	read

read:
	mov	eax, 0		; syscall read
	syscall
