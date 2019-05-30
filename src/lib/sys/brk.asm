format	elf64

section	'.text' executable

	public	brk

brk:
	mov	rax, 12		; syscall brk
	syscall
	ret
