%include 'core.m'

	section	.text
proc open
	sinvoke	2	; syscall open
endproc
