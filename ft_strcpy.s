; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/02 14:34:31 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/10/02 17:12:27 by jsaariko      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; section .data <- for declaring consts
; section .bss <- for declaring variables

section .text
	global _ft_strcpy

; copy string into already allocated dest
; args: destination, source
; returns pointer to dest

; rsi = src (lol)
; rdi = dest (aaaaaaaa)
_ft_strcpy:
	push rcx
	mov rcx, -1
loop:
	inc rcx
	mov ah, [rsi + rcx]
	mov [rdi + rcx], ah
	cmp ah, 0
	jne loop
	pop rcx
	mov rax, rdi
	ret

; TODO: push and pop ah, or whichever register you wind up using

; use rcx to iterate

; TODO: should I use the ah register or do something else instead?

; You can't move anything from memory to memory, but need to use a temporary register