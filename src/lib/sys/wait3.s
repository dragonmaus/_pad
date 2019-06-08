;   int
; wait3(int *status, int options, struct rusage *rusage)
; {
;   return wait4(-1, status, options, rusage);
; }

	global	wait3

	section	.text
wait3:
	mov	rcx, rdx
	mov	rdx, rsi
	mov	rsi, rdi
	mov	rdi, -1
	mov	rax, 61		; syscall wait4
	syscall
	ret
