format	elf64

section	'.text' executable

public	close

close:
	mov	eax, 3		; syscall close
	syscall
	ret
