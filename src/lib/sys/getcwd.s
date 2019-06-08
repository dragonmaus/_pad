format	elf64

section	'.text' executable

	public	getcwd

getcwd:
	mov	rax, 79		; syscall getcwd
	syscall
	ret
