format	elf64

section	'.text' executable

public	write

write:
	mov	rax, 1		; syscall write
	syscall
	ret
