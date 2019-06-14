%include 'core.m'

	global	_start

	section	.text
_start:
	sinvoke	60, 1	; syscall exit
