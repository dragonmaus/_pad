	global	byte_zero

	section	.text
byte_zero:
	mov	rcx, rsi	; number of bytes to zero
	xor	rax, rax
	cld
rep	stosb
	ret
