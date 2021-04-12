section .text
	global _ft_write
	extern ___error

_ft_write:
	xor rax, rax
	mov rax, 0x2000004				; system write

.body:
	syscall							; call write
	jc .error						; if error
	jmp .return

.error:
	push rax
	call ___error
	pop rdx
	mov [rax], rdx
	mov rax, -1
	jmp .return

.return:
	ret
