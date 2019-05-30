;   int
; wait3(int *status, int options, struct rusage *rusage)
; {
;   return wait4(-1, status, options, rusage);
; }

format	elf64

section	'.text' executable

	public	wait3

wait3:
	mov	rcx, rdx
	mov	rdx, rsi
	mov	rsi, rdi
	mov	rdi, -1
	mov	rax, 61		; syscall wait4
	syscall
	ret
