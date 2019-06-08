;   int
; waitpid(int pid, int *status, int options)
; {
;   return wait4(pid, status, options, 0);
; }

	global	waitpid

	section	.text
waitpid:
	xor	rcx, rcx
	mov	rax, 61		; syscall wait4
	syscall
	ret
