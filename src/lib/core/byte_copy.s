%include 'core.m'

	section	.text
proc byte_copy
	mov	rcx, rdx	; number of bytes to copy
	cld
rep	movsb
endproc
