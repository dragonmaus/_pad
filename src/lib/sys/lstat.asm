format	elf64

section	'.text' executable

public	lstat

lstat:
	mov	eax, 6		; syscall lstat
	syscall
	ret
