; int fcntl(int fd, int cmd, long int arg);
%include 'core.m'

	section	.text
proc fcntl
	sinvoke	72	; syscall fcntl
endproc
