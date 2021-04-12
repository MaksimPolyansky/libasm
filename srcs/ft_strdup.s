section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy

_ft_strdup:
	push rdi					; save stack
	call _ft_strlen
	inc rax
	call _malloc				; str = malloc(len)
	cmp rax, 0					; str == NULL
	je .return					; if yes, return
	mov rdi, rax				; rdi = str
	pop rsi						; take stack
	call _ft_strcpy

.return:
	ret
