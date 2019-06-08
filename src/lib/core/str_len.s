	global	str_len

	section	.text
str_len:
	xor	rcx, rcx
	not	rcx		; rcx = MAX_INT
	xor	rax, rax	; search for '\0'
	cld
repne	scasb			; scan until we see '\0'
	not	rcx		; -rcx - 2 = ~rcx - 1 = string length
	dec	rcx
	mov	rax, rcx
	ret
