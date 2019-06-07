	.global	_start

	.text
_start:
	mov	x8, #64		// syscall write
	mov	x0, #1		// stdout
	adrp	x1, :pg_hi21:message
	add	x1, x1, #:lo12:message
	mov	x2, #14
	svc	#0
	mov	x8, #93		// syscall exit
	svc	#0

	.data
message:
	.ascii	"Hello, world!\n"
