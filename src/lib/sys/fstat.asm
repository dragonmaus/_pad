format	elf64

section	'.text' executable

public	fstat

fstat:
	mov	rax, 5		; syscall fstat
	syscall
	ret
