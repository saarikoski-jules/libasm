; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/03 14:49:51 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/10/03 16:12:31 by jsaariko      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strcmp

; rdi is s1
; rsi is s2
; when compared characters are different, or you hit null terminator, return s1[i] - s2[i]
; _ft_strcmp:
; 	mov rcx, -1						; start counter register
; loop:
; 	inc rcx							; increment counter
; 	mov ah, [rdi + rcx]				; move one value into comparison register
; 	cmp ah, [rsi + rcx]				; compare values in temp register with same char from other string
; 	je label2						; if yes, go label2
; 	jmp label1						; else jump to label1
; label2:								; chars equal, check if it is terminating char
; 	cmp byte [rdi + rcx], 0			; check if current index char is null
; 	jne loop						; if not, loop
; 	jmp label1						; else go to label one
; label1:								; chars not equal or null byte, finish loop
; 	mov ah, [rdi + rcx]				; move current char in s1 into temp register
; 	sub ah, [rsi + rcx]				; substract current char in s2 from t
; 	mov [rax], ah					; move ah so that is the value stored in return address
; 	ret

; TODO: Should I use the ah register or something else



_ft_strcmp:
	mov rcx, -1						; start counter register
loop:
	inc rcx							; increment counter
	mov ah, [rdi + rcx]				; move one value into comparison register
	cmp ah, [rsi + rcx]				; compare values in temp register with same char from other string
	je loop
	mov rcx, [rdi + rcx]
	sub rcx, [rsi + rcx]
	mov [rax], rcx

