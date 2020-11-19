section .text
	global _ft_list_remove_if
	extern _asm_list_scoot
	extern _free

; Params:
; rdi: t_list **begin_list
; rsi: void* data
; rdx: int cmp()

_ft_list_remove_if:

	push r12
	push r13
	push r14
	push r15

	lea r9, [rdi]	; get address of [rdi]
	mov r12, [r9]	; store head in r12
	mov r13, r12	; cur in r13
	mov r14, rdx	; function pointer stored in r14
	mov r15, rsi	; data stored in r15

	push rdx		; preserve args
	push rdi
	push rsi
L1:
	mov rdi, [r13]
	mov rsi, r15
	call r14		; compare data with current node's data
	cmp rax, 0
	je scoot
	jmp dont_scoot
scoot:				; if equal, remove item from list
	mov rdi, r12
	mov rsi, r13
	call _asm_list_scoot
	mov r12, rax
	mov rdi, r13
	call _free
dont_scoot:			; else check next one
	mov r13, [r13 + 8]
	cmp r13, 0x0
	jne L1

	pop rsi
	pop rdi
	pop rdx			; get params back

	mov [rdi], r12	; move possibly updated list to head param

	pop r15
	pop r14
	pop r13
	pop r12

	ret