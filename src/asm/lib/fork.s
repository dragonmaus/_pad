format	elf64

section	'.text' executable

public	fork

fork:
	mov	eax, 57		; syscall fork
	syscall
	ret
