segment .text
	global _ft_strdup
	extern _ft_strlen
	extern _malloc
	extern _ft_strcpy

_ft_strdup:
	call _ft_strlen		; get strlen to allocate
	inc rax				; add space for string terminator
	push rdi			; save s1
	mov rdi, rax		; use length of string as argument for malloc
	call _malloc		; call malloc
	pop rdi				; get s1 back
	mov rsi, rdi		; set s1 as src argument for strcpy call
	mov rdi, rax		; set malloced memory area as dest for strcpy call
	call _ft_strcpy		; call strcpy
	mov rax, rdi		; return dest with copied string in it
	ret
