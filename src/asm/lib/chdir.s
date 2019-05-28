format	elf64

section	'.text' executable

public	chdir

chdir:
	mov	eax, 80		; syscall chdir
	syscall
	ret
