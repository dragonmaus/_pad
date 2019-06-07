	.global	_start

	.text
_start:
	mov	w8, #93		// syscall exit
	mov	w0, #1
	svc	#0
