	.global	_start

	.text
_start:
	mov	r7, #4		// syscall write
	mov	r0, #1		// stdout
	movw	r1, #:lower16:message
	movt	r1, #:upper16:message
	mov	r2, #14
	svc	#0
	mov	r7, #1		// syscall exit
	svc	#0

	.data
message:
	.ascii	"Hello, world!\n"
