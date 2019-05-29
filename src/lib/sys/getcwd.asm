format	elf64

section	'.text' executable

public	getcwd

getcwd:
	mov	eax, 79		; syscall getcwd
	syscall
	ret
