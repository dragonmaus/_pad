%include 'core.m'

	section	.text
proc str_len
	xor	rcx, rcx
	not	rcx		; max uint64
	xor	al, al		; search for the null terminator
	cld
repne	scasb
	not	rcx		; ~rcx - 1 = string length
	dec	rcx
	mov	rax, rcx
endproc
