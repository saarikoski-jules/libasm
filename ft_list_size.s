section .text
	global _ft_list_size

; rdi: list item
_ft_list_size:
	mov rax, 0
	cmp rdi, 0
	je finish
loop:
	mov rdi, [rdi + 8]
	inc rax
	cmp rdi, 0
	jne loop
finish:
	ret
