; long int time(long int *t);
%include 'core.m'

	section	.text
proc time
	sinvoke	201	; syscall time
endproc
