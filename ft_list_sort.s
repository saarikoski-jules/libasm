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

_reorder:
	ret

_compare:
	mov rdi, [r10]		; Move value of first node into param
	mov r9, [r10 + 8]	; store pointer to second node into r9
	mov rsi, [r9]		; get value of data in r9 as param for function call
	call rbx			; call function from function pointer
	ret

_ft_list_sort:
	mov rbx, rsi		; function pointer now stored in rbx
	mov r10, rdi		; head of list now stored in r10

	push rdi
	push rsi
	call _compare
	cmp rax, 0
	jle _reorder
	pop rsi
	pop rdi


	ret


