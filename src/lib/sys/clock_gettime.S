; int clock_gettime(int clock_id, struct timespec *tp);
%include 'core.m'

	section	.text
proc clock_gettime
	sinvoke	228	; syscall clock_gettime
endproc
