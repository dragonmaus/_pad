; int getdents(int fd, struct dirent *dirp, unsigned int count);
%include 'core.m'

	section	.text
proc getdents
	sinvoke	78	; syscall getdents
endproc
