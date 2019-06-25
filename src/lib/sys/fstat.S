; int fstat(int fd, struct stat *sb);
%include 'core.m'

	section	.text
proc fstat
	sinvoke	5	; syscall fstat
endproc
