format	elf64

section	'.text' executable

public	lstat

lstat:
	mov	rax, 6		; syscall lstat
	syscall
	ret
