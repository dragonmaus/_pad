; void exit(int rval);
%include 'core.m'

	section	.text
proc exit
	sinvoke	60	; syscall exit
endproc
