%include 'core.m'

	cextern	main
	cglobal	environ
	cglobal	errno

	section	.text
proc _start
	mov	rdx, [rsp+8]	; argc
	add	rdx, 3
	shl	rdx, 3
	add	rdx, rsp	; envp
	mov	[environ], rdx
	mov	rsi, 16
	add	rsi, rsp	; argv
	cinvoke	main, [rsp+8], rsi, rdx	; main(argc, argv, envp)
	sinvoke	60, rax		; exit code is what main returns
endproc

	section	.data
environ	dq	0
errno	dd	0
