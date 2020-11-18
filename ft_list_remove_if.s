section .text
	global _ft_list_remove_if
	extern _asm_list_scoot

; Params:
; rdi: t_list **begin_list
; rsi: void* data
; rdx: int cmp()

; _ft_list_remove_if:
	; cmp rdi, 0x0 ; if NULL, return 
	; je end

	; mov r14, [rdi]	; store value of data
	; mov r13, rdi	; cur item
	; mov r12, rsi	; store item

	; push rdi
	; push rsi

; L1:
	; mov rax, 0
	; mov rdi, [r13]
	; mov rsi, r12
	; call rdx



	; pop rsi
	; pop rdi

; end:
	; ret

_ft_list_remove_if:


	lea r9, [rdi]
	mov r12, [r9]
	; mov r12, rdi ; store head of list in r12
	mov r13, r12	; cur
	mov r14, rdx	; function pointer
	mov r15, rsi

	push rdx
	push rdi
	push rsi

L1:
	mov rdi, [r13]
	mov rsi, r15
	call r14
	cmp rax, 0
	je scoot
	jmp dont_scoot
scoot:
	mov rdi, r12
	mov rsi, r13
	call _asm_list_scoot
	mov r12, rax
dont_scoot:
	mov r13, [r13 + 8]
	cmp r13, 0x0
	jne L1

	pop rsi
	pop rdi
	pop rdx


	mov rax, r12
	ret