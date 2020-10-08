section .text
    global _ft_read
    extern ___error

_ft_read:                   ; same as write, but read <3
    mov rax, 0x2000003
    syscall
    jc fail
    ret
fail:
    mov rdi, rax
    call ___error
    mov [rax], rdi
    mov rax, -1
    ret

; TODO: Should i push and pop rdi before using it/use another register