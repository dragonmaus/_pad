	global	str_copy

	section	.text
str_copy:
	mov	rcx, rsi	; save starting pointer
	cld
.copy:	movsb			; copy a byte
	cmp	byte [rdi-1], 0	; check if that byte is '\0'
	jne	.copy		; loop until we see '\0'
	dec	rsi		; move pointer back to the '\0'
	mov	rax, rsi
	sub	rax, rcx
	ret
