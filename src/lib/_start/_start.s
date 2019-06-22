%include 'core.m'

	cextern	main
	cglobal	environ
	cglobal	errno

	section	.text
proc _start	; void _start(void)
	mov	rdx, [rsp+8]		; argc = sp + 1
	add	rdx, 3
	shl	rdx, 3
	add	rdx, rsp		; envv = sp + 3 + argc
	mov	rsi, 16
	add	rsi, rsp		; argv = sp + 2
	mov	[environ], rdx
	cinvoke	main, [rsp+8], rsi, rdx	; r = main(argc, argv, envv)
	sinvoke	60, rax			; exit(r)
endproc

	section	.data
environ	dq	0
errno	dd	0
