%include 'core.m'

	section	.text
proc byte_zero
	mov	rcx, rsi	; number of bytes to zero
	xor	rax, rax
	cld
rep	stosb
endproc
