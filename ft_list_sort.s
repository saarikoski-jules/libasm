section .text
	global _ft_list_sort

; rdi: head
; rsi: sorting function


; iterate over each item.
; if current item and next item are in the wrong order, reorder
; keep track of swaps
; if zero swaps occur on a given iteration, you're done


; 
; r10 = first node
; r9 = second node	

; void		ft_list_sort(t_list *head, int (*cmp)());

; _compare:
; 	mov rdi, [r10]		; Move value of first node into param
; 	mov r9, [r10 + 8]	; store pointer to second node into r9
; 	mov rsi, [r9]		; get value of data in r9 as param for function call
; 	call rbx			; call function from function pointer
; 	ret

_compare:
	mov rax, r10
	ret
	; mov rdi, [r10]		; Move value of first node into param
	; mov r9, [r10 + 8]	; store pointer to second node into r9
	; mov rsi, [r9]		; get value of data in r9 as param for function call
	; call rbx			; call function from function pointer
	
	; cmp rax, 0			; if arg 1 is smaller, rax is negative
	; jle store
	; mov	rax, [r10 + 8]	; if arg 1 is larger, store arg 2
; store:
	; mov rax, r10


_ft_list_sort:
	mov rbx, rsi		; function pointer now stored in rbx
	mov r10, rdi		; head of list now stored in r10
	mov r8, rdi			; store smallest item in r8
						; ..Can i store the same value in two places?

	; push rax
	; push r10
	push rdi
	push rsi


	mov rdi, [r10]		; Move value of first node into param
	mov r9, [r10 + 8]	; store pointer to second node into r9
	mov rsi, [r9]		; get value of data in r9 as param for function call
	call rbx			; call function from function pointer
	
	; cmp rax, 0			; if arg 1 is smaller, rax is negative
	; jle store
	; mov	rax, [r10 + 8]	; if arg 1 is larger, store arg 2
; store:
	mov rax, r10



	pop rsi
	pop rdi
	; pop r10

	; mov rax, r8

	ret

; _ft_return_val:


