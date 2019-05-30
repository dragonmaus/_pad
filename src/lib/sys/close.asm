format	elf64

section	'.text' executable

public	close

close:
	mov	rax, 3		; syscall close
	syscall
	ret
