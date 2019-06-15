%include 'core.m'

	section	.text
proc byte_diff
	mov	rcx, rdx	; number of bytes to compare
	cld
repe	cmpsb
	jne	.calc		; found a difference
	xor	rax, rax	; return 0
endproc
.calc:	mov	sil, byte [rsi-1]
	mov	dil, byte [rdi-1]
	xor	rax, rax
	mov	al, dil
	sub	al, sil		; return (*s - *t)
endproc
