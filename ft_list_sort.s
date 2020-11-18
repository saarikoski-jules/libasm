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

; _compare:
	; mov rax, r10
	; ret
	; mov rdi, [r10]		; Move value of first node into param
	; mov r9, [r10 + 8]	; store pointer to second node into r9
	; mov rsi, [r9]		; get value of data in r9 as param for function call
	; call rbx			; call function from function pointer
	
	; cmp rax, 0			; if arg 1 is smaller, rax is negative
	; jle store
	; mov	rax, [r10 + 8]	; if arg 1 is larger, store arg 2
; store:
	; mov rax, r10


; non volatile registers to use: rbx, rbp, r12 - r15



_ft_list_sort:
	mov rbx, rsi		; function pointer now stored in rbx
	mov r12, rdi		; head of list now stored in r12 ; TODO: Do i need this?
	mov r13, rdi		; store smallest item in r13
	mov r14, rdi		; current item iterated over stored in r14
						; ..Can i store the same value in two places?

	push rdi
	push rsi
	push rax

L1:
	mov rax, 0
						; compare smallest (r13) with current index ()
	mov rdi, [r13]		; Move value of smallest node into first param
	mov rsi, [r14]		; get data from current oterated over node into param
	call rbx			; call function from function pointer
	cmp eax, 0			; compare 4 byte register return (int) to 0
	jl continue			; if arg 1 is smaller, rax is negative -> do nothing
	mov r13, r14		; else store current node to smallest
continue:

	mov r14, [r14 + 8]
	cmp r14, 0x0
	je finish					; TODO: could also do jump if zero
	jmp L1

finish:
	pop rsi
	pop rdi
	pop rax

	mov rax, r13

	ret

; _ft_return_val:


