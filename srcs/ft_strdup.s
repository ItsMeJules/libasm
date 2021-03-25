bits 64

global ft_strdup
extern ft_strlen
extern ft_strcpy
extern malloc

segment .text

ft_strdup:
	call	ft_strlen wrt ..plt
	add	rax, 1 ; adds 1 to rax so there's enough space for the '\0' for malloc
	push rdi ; saves the string we want to dup
	mov	rdi, rax ; sets the argument for malloc
	call	malloc wrt ..plt
	cmp	rax, 0
		je exit
	mov	rdi, rax
	pop	rsi ; pops rdi into rsi, remember that the string we want to dup "is in the stack"
	call	ft_strcpy wrt ..plt
	ret

exit:
	ret


