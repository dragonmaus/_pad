format	elf64

section	'.text' executable

public	execve

execve:
	mov	eax, 59		; syscall execve
	syscall
	ret
