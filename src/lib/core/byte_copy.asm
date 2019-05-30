format	elf64

section	'.text' executable

	public byte_copy

byte_copy:
	mov	rcx, rdx	; number of bytes to copy
	cld
rep	movsb
	ret
