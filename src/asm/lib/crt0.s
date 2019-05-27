	global	_start

	extern	_init
	extern	exit
	extern	initialise_standard_library
	extern	main

	section	.text
_start:
	; set up end of the stack frame linked list
	mov	rbp, 0
	push	rbp
	push	rbp
	mov	rbp, rsp

	; we need those in a moment when we call main
	push	rsi
	push	rdi

	; prepare signals, memory allocation, stdio, and such
	call	initialise_standard_library

	; run the global constructors
	call	_init

	; restore argc and argv
	pop	rdi
	pop	rsi

	; run main
	call	main

	; terminate the process with the exit code
	mov	edi, eax
	call	exit
