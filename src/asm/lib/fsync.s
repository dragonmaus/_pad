format	elf64

section	'.text' executable

public	fsync

fsync:
	mov	eax, 74		; syscall fsync
	syscall
	ret
