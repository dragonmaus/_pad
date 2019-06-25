; long int write(int fd, const char *buf, unsigned long int nbyte);
%include 'core.m'

	section	.text
proc write
	sinvoke	1	; syscall write
endproc
