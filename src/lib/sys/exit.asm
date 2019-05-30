format	elf64

section	'.text' executable

	public	exit

exit:
	mov	rax, 60		; syscall exit
	syscall
	ret
