%include 'core.m'

	section	.text
proc fstat
	sinvoke	5	; syscall fstat
endproc
