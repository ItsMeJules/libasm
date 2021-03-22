bits 64

global ft_strcmp

segment .text

ft_strcmp:
	push	rcx
	mov	rcx, 0
	jmp	compare

compare:
	mov	
