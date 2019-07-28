%define program 'hd'
%include 'core.m'
%include 'error.m'

%define sys.exit 60
%define sys.read 0
%define sys.write 1

%define stdin 0
%define stdout 1
%define stderr 2

%define isize 16
%define osize 79

%define index r15
%define length r14

	section	.text
	global	_start
_start:
	xor	index, index
.loop1:	sinvoke	sys.read, stdin, ibuf, isize
	cmp	rax, 0
	je	.done
	jl	.fail
	mov	length, rax

	mov	rdi, obuf
	invoke	addindex, rdi, index
	invoke	addchar, rdi, ' '

	xor	rcx, rcx
.loop2:	cmp	rcx, 8
	jne	.skip1
	invoke	addchar, rdi, ' '
.skip1:	invoke	addchar, rdi, ' '
	cmp	rcx, length
	jl	.addhd
	invoke	addstring, rdi, "  ", 2
	jmp	.skip2
.addhd:	invoke	addhexdump, rdi, [ibuf + rcx]
.skip2:	inc	rcx
	cmp	rcx, isize
	jl	.loop2
	invoke	addstring, rdi, "  |", 3

	xor	rcx, rcx
.loop3:	invoke	addchardump, rdi, [ibuf + rcx]
	inc	rcx
	cmp	rcx, length
	jl	.loop3

	invoke	addstring, rdi, ('|', 10) 2

	sub	rdi, obuf
	sinvoke	sys.write, stdout, obuf, rdi

	add	index, length

	cmp	length, isize
	je	.loop1

.done:	or	index, index
	jz	.skip3
	mov	rdi, obuf
	invoke	addindex, rdi, index
	invoke	addchar, rdi, 10
	sub	rdi, obuf
	sinvoke	sys.write, stdout, obuf, rdi

.skip3:	sinvoke	sys.exit, 0

.fail:	neg	rax
.e15:	cmp	rax, 0x15
	jne	.e16
	mov	rdx, e15l
	lea	rsi, e15m
	jmp	.die
.e16:	cmp	rax, 0x16
	jne	.e__
	mov	rdx, e16l
	lea	rsi, e16m
	jmp	.die
.e__:	mov	rdx, e__l
	lea	rsi, e__m
.die:	sinvoke	sys.write, stderr, rsi, rdx

addchar:
	mov	al, sil
	stosb
	ret

addchardump:
	cmp	sil, ' '
	jl	.dot
	cmp	sil, '~'
	jg	.dot
	mov	al, sil
	jmp	.done
.dot:	mov	al, '.'
.done:	stosb
	ret

addhexdump:
	push	rbx
	mov	rbx, htable
	mov	al, sil
	mov	ah, al
	and	al, 0xf
	shr	ah, 4
	xlatb
	xchg	al, ah
	xlatb
	stosw
	pop	rbx
	ret

addindex:



; write the current index (SI) to the output (DI) in hex dword (%08x) format
addindex:
	push	rdx
	mov	rdx, rdi	; save original pointer
	add	rdi, 6		; move pointer to the 4th byte (000000[0]0)
	std			; iterate right-to-left
.loop:	call	hexdump
	stosw
	shr	rsi, 8
	cmp	rdi, rdx
	jge	.loop		; loop until we pass the original pointer
	add	rdi, 10		; move past the 4th byte (00000000[.])
	cld
	pop	rdx
	ret

; translate the next byte pointed to by SI into '.' if it is not printable
chardump:
	lodsb
	cmp	al, 0x20	; return '.' if AL < ' '
	jl	.dot
	cmp	al, 0x7E	; return '.' if AL > '~'
	jg	.dot
	ret			; else return AL unmodified
.dot:	mov	al, 0x2E
	ret

; convert the bottom byte of SI into ASCII characters in hex byte format (%02x)
hexdump:
	push	rbx
	mov	rbx, htable	; lookup table
	mov	rax, rsi
	mov	ah, al		; duplicate so we can get at both nibbles
	and	al, 0x0F	; low nibble
	shr	ah, 4		; high nibble
	xlatb			; convert low nibble into ASCII
	xchg	ah, al
	xlatb			; convert high nibble into ASCII
	pop	rbx
	ret

	section	.data
htable	db	'0123456789abcdef'
; the commented errors seem unlikely, if not impossible
; uncomment if encountered in the wild
;	errmsg	04, 'interrupted syscall'
;	errmsg	05, 'IO error'
;	errmsg	09, 'bad file descriptor'
;	errmsg	0B, 'resource temporarily unavailable'
;	errmsg	0E, 'bad address'
	errmsg	15, 'input is a directory'
	errmsg	16, 'invalid input'
	errmsg	__, 'unknown error'

	section	.bss
ibuf	resb	16
obuf	resb	79
