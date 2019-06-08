format	elf64

section	'.text' executable

	public	read

read:
	mov	rax, 0		; syscall read
	syscall
	ret
