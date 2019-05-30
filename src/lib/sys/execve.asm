format	elf64

section	'.text' executable

public	execve

execve:
	mov	rax, 59		; syscall execve
	syscall
	ret
