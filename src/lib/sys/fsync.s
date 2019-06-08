format	elf64

section	'.text' executable

	public	fsync

fsync:
	mov	rax, 74		; syscall fsync
	syscall
	ret
