%include 'core.m'

	section	.text
proc _start
	sinvoke	60, 1	; syscall exit
endproc
