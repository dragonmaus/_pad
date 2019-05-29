format	elf64

section	'.text' executable

public	readlink

readlink:
	mov	eax, 89		; syscall readlink
	syscall
	ret
