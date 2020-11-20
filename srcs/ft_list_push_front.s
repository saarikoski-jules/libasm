section .text
	global _ft_list_push_front
	extern _malloc

; rdi: head
; rsi: data
_ft_list_push_front:
	cmp rdi, 0x0		; check if no head provided
	je error
	cmp qword [rdi], 0x0
	je error
	push rdi			; save all volatile registers before call to external function
	push rsi
	mov rdi, 16			; a pointer in 64 is 8 bytes, so the size of t_list is 16
	call _malloc		; allocate memory into rax
	cmp rax, 0x0		; check for malloc fail
	je error
	pop rsi				; get data back
	pop rdi				; get old head back
	mov [rax], rsi		; store given data to new struct
	mov r9, [rdi]		; move address of head to temp register
	mov [rax + 8], r9	; move contents of temp register to next 
	mov [rdi], rax		; move pointer of the struct to head
	ret
error:
	mov rax, 0			; avoid segfaults on null pointers
	ret
