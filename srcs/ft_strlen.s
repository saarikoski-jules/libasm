; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/02 12:47:36 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/11/20 15:17:00 by jsaariko      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strlen

_ft_strlen:
	mov rax, -1					; Set counter to start at -1
loop:
	inc rax						; Increment counter
	cmp byte [rdi + rax], 0		; Compare counter index of string to null
	jne loop					; If not null, go again

	ret							; return value of counter in rax