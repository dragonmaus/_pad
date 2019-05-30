format	elf64

section	'.text' executable

public	fork

fork:
	mov	rax, 57		; syscall fork
	syscall
	ret
