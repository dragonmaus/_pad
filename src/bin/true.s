%include 'core.m'

	section	.text
proc _start
	sinvoke	60, 0	; syscall exit
endproc
