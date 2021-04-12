section .text
	global _ft_strcmp

_ft_strcmp:
	xor rax, rax
	xor rcx, rcx
	push rbx
	xor rbx, rbx

.while:
	mov al, byte[rdi + rbx]
	mov cl, byte[rsi + rbx]
	cmp al, cl
	je .plus
	jmp .return

.plus:
	cmp al, 0
	je .return
	inc rbx
	jmp .while

.return:
	sub rax, rcx					; *s1 - *s2 (subtrack)
	pop rbx
	ret
