format	elf64

section	'.text' executable

	public byte_diff

byte_diff:
	mov	rcx, rdx	; number of bytes to compare
	cld
repe	cmpsb
	jne	diff		; found a difference
	xor	rax, rax	; return 0
	ret
diff:	dec	rsi		; back up to the difference
	mov	rsi, [rsi]	; convert address to the bytes stored therein
	and	rsi, 0xFF	; we only want one byte
	dec	rdi
	mov	rdi, [rdi]
	and	rdi, 0xFF
	mov	rax, rdi	; return (*s - *t)
	sub	rax, rsi
	ret
