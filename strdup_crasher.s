section	.text
extern  _ft_strdup
global  _ft_strdup_crasher

_ft_strdup_crasher:
    push    rbp
    mov     rbp, rsp
    and     rsp, -10h
    sub     rsp, 8

    call    _ft_strdup

    pop     rbp
    ret