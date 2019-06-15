%include 'core.m'

	section	.text
proc byte_copyr
	mov	rcx, rdx	; number of bytes to copy
	dec	rdx
	add	rsi, rdx	; go to end of source
	add	rdi, rdx	; go to end of destination
	std
rep	movsb
endproc
