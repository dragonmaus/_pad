format	elf64

section	'.text' executable

public	chdir

chdir:
	mov	rax, 80		; syscall chdir
	syscall
	ret
