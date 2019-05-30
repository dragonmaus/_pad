format	elf64

section	'.text' executable

	public byte_findr

byte_findr:
	mov	rbx, rdi	; save starting pointer
	mov	rcx, rdx	; number of bytes to scan
	mov	rax, rsi	; byte to look for
	xor	rdx, rdx	; track whether this is set
scan:
repne	scasb
	jne	done		; exhausted rcx without finding a match
	mov	rdx, rdi	; save pointer if it matches
	jmp	scan
done:	or	rdx, rdx
	jz	skip
	mov	rax, rdx	; if matching pointer was saved, use that
	dec	rax
	jmp	calc
skip:	mov	rax, rdi	; else use end pointer
calc:	sub	rax, rbx	; byte index == [current pointer] - [starting pointer]
	ret
