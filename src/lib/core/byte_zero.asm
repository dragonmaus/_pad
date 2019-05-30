format	elf64

section	'.text' executable

	public byte_zero

byte_zero:
	mov	rcx, rsi	; number of bytes to zero
	xor	rax, rax
	cld
rep	stosb
	ret
