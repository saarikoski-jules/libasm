; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: jsaariko <jsaariko@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/10/03 15:34:36 by jsaariko      #+#    #+#                  ;
;    Updated: 2020/10/07 11:45:23 by jsaariko      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_write

; _ft_write:
	; mov eax, 4		; specify syscall number
	; int 80h

_ft_write:
	mov       rax, 1 ; or 0x02000004
	syscall

; rax is syscall number
; rdi, rsi and rdx are already defined in function call
; TODO: remember errno