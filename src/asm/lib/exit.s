format	elf64

section	'.text' executable

public	exit

exit:
	mov	eax, 60		; syscall exit
	syscall
