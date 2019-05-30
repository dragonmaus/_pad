format	elf64

section	'.text' executable

public	wait4

wait4:
	mov	rax, 61		; syscall wait4
	syscall
	ret
