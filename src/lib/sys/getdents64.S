; int getdents64(unsigned int fd, struct dirent64 *dirp, unsigned long int count);
%include 'core.m'

	section	.text
proc getdents64
	sinvoke	217	; syscall getdents64
endproc
