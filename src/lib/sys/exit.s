%include 'core.m'

	section	.text
proc exit
	sinvoke	60	; syscall exit
endproc
