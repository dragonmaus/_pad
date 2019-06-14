%include 'core.m'

	section	.text
proc write
	sinvoke	1	; syscall write
endproc
