section .text
	global _ft_list_size

; rdi: list item
; returns length of list
_ft_list_size:
	mov rax, 0				; zero out return value
	cmp rdi, 0				; check if no list
	je finish				; if no list, finish up and return zeroed out rax
loop:
	inc rax					; increment return value
	mov rdi, [rdi + 8]		; move next element to rdi
	cmp rdi, 0				; check if next is null
	jne loop				; if not, go again
finish:
	ret
