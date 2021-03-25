bits 64

global ft_read
extern	__errno_location

segment .text

ft_read:
	xor	rax, rax ; also = to mov rax, 0
	syscall
	cmp	rax, 0
		jl set_error
	ret

set_error:
	mov	rcx, rax
	neg	rcx
	call	__errno_location wrt ..plt
	mov	[rax], rcx
	mov	rax, -1
	ret
