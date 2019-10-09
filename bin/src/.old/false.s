%include 'core.m'

	section	.text
	global	_start
_start:
	sinvoke	60, 1	; syscall exit
