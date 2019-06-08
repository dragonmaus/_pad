format	elf64

section	'.text' executable

	public	stat

stat:
	mov	rax, 4		; syscall stat
	syscall
	ret
