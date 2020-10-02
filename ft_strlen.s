; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/02 12:47:36 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/10/02 13:48:28 by jsaariko      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strlen

_ft_strlen:
	mov rax, 2
	ret