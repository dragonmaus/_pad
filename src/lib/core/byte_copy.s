	global	byte_copy

	section	.text
byte_copy:
	mov	rcx, rdx	; number of bytes to copy
	cld
rep	movsb
	ret
