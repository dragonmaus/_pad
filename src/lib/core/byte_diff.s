	global	byte_diff

	section	.text
byte_diff:
	mov	rcx, rdx	; number of bytes to compare
	cld
repe	cmpsb
	jne	calc		; found a difference
	xor	rax, rax	; return 0
	ret
calc:	mov	rsi, qword [rsi-1]
	and	rsi, 0xFF
	mov	rdi, qword [rdi-1]
	and	rdi, 0xFF
	mov	rax, rdi	; return (*s - *t)
	sub	rax, rsi
	ret
