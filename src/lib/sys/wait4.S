; int wait4(int pid, int *status, int options, struct rusage *rusage);
%include 'core.m'

	section	.text
proc wait4
	sinvoke	61	; syscall wait4
endproc
