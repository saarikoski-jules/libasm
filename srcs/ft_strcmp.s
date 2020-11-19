; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/03 14:49:51 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/10/07 13:17:36 by jsaariko      ########   odam.nl          ;
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
	jne end						; if different, move to end
	cmp byte [rdi + rcx], 0		; if not different, check if its the terminator
	jne loop					; if not, go again
end:							; else, finish up
	mov   rax, [rdi + rcx]		; move index value of s1 to return register
	sub   rax, [rsi + rcx]		; substract char in s2 from it
	movsx rax, al				; the byte result stored inside rax can be found in the last byte. Moving that single byte to rax gives you the actual value
	ret
	
; TODO: Should I use the ah register or something else
