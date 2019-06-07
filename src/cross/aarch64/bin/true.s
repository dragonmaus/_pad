	.global	_start

	.text
_start:
	mov	w8, #93		// syscall exit
	mov	w0, #0
	svc	#0
