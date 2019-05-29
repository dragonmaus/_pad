format	elf64

section	'.text' executable

public str_len
str_len:
	xor	ecx, ecx
	not	ecx		; ecx = MAX_INT
	xor	al, al		; search for '\0'
	cld
repne	scasb			; scan until we see '\0'
	not	ecx		; -ecx - 2 = ~ecx - 1 = string length
	dec	ecx

	mov	eax, ecx
	ret
