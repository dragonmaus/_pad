format	elf64

section	'.text' executable

public	fstat

fstat:
	mov	eax, 5		; syscall fstat
	syscall
	ret
