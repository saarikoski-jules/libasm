; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/02 14:34:31 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/10/03 14:48:58 by jsaariko      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strcpy

; copy string into already allocated dest
; args: destination, source
; returns pointer to dest
_ft_strcpy:
	push rcx				; Save rcx just in case
	mov rcx, -1				; Start counter at -1
loop:
	inc rcx					; increment rcx
	mov ah, [rsi + rcx]		; move character from src to temporary register
	mov [rdi + rcx], ah		; Move character from tmp register to correct spot on dest
	cmp ah, 0 				; check if moved character was the string terminator
	jne loop				; continue looping if not
	pop rcx					; cleanup
	mov rax, rdi			; return address of dest
	ret

; TODO: Should I push and pop ah as well?
; TODO: Should I use ah as temp register or not?
; TODO: To be more effient, maybe run 4 chars at a time 
; TODO: rcx is a volatile register, meaning I don't have to save it
; TODO: Use al instead of ah? (lowest register of rax) Or should I use a register I don't otherwise use