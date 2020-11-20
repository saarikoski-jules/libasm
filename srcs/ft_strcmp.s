; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/03 14:49:51 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/11/20 15:39:45 by jsaariko      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strcmp

_ft_strcmp:
	mov rcx, -1					; set index <3
loop:
	inc rcx						; increment index
	mov ah, [rdi + rcx]			; move current byte be compared
	cmp ah, [rsi + rcx]			; compare stored byte to same byte in s2
	jne ret_val					; if different, move to ret_val
	cmp byte [rdi + rcx], 0		; if not different, check if its the terminator
	jne loop					; if not, go again
ret_val:						; else, finish up
	mov rax, 0					; zero out rax
	mov al, [rdi + rcx]			; move index value of s1 to return register
	sub al, [rsi + rcx]			; substract char in s2 from it
	jnc	end						; if substraction overflows, get the inverse of the result

	neg al						; invert the number accurately by first flipping the single byte
	neg rax						; and then flipping everything including the overflow
end:
	ret
