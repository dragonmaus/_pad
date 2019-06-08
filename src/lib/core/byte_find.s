format	elf64

section	'.text' executable

	public byte_find

byte_find:
	mov	rbx, rdi	; save starting pointer
	mov	rcx, rdx	; number of bytes to scan
	mov	rax, rsi	; byte to look for
repne	scasb
	dec	rdi		; go back to matching byte (or string[len] if no match)
	mov	rax, rdi
	sub	rax, rbx	; byte index == [current pointer] - [initial pointer]
	ret
