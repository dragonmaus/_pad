format	elf64

section	'.text' executable

public	readlink

readlink:
	mov	rax, 89		; syscall readlink
	syscall
	ret
