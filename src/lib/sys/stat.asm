format	elf64

section	'.text' executable

public	stat

stat:
	mov	eax, 4		; syscall stat
	syscall
	ret
