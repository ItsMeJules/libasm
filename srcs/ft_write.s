bits 64

global	ft_write
extern	__errno_location ; get errno's address

segment .text

ft_write:
	mov	rax, 1 ; value for write in the kernel
	syscall ; when calling write if there's an error it will be set in rax as a neg value
	cmp	rax, 0
	jl	error
	ret

error:
	neg		rax ; as rax is negative I set it positive
	push	rcx	; saves previous rcx value into the stack
	mov		rcx, rax ; saves rax into rcx because rax contains the error id which we have to set to errno
	call	__errno_location wrt ..plt ; implicitly set errno's addres in rax
	mov		[rax], rcx ; sets errno's returned value into 
	pop		rcx ; retrives rcx's former value
	mov		rax, -1 ; now sets the returned value to -1 because that's what write returns if there's an error
	ret



