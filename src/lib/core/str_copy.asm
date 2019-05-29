format	elf64

section	'.text' executable

public str_copy
str_copy:
	push	rdi
	push	rsi
	push	rsi

	pop	rdi

	xor	ecx, ecx
	not	ecx		; ecx = MAX_INT
	xor	al, al		; search for '\0'
	cld
repne	scasb			; scan until we see '\0'
	not	ecx		; -ecx - 2 = ~ecx - 1 = string length
	dec	ecx
	mov	ebx, ecx

	pop	rsi
	pop	rdi
	cld
rep	movsb

	mov	eax, ebx
	ret
