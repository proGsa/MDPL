
PUBLIC process
EXTRN output1_prog: near
DATA SEGMENT para PUBLIC
    buf_hex DB '10$'
    buf DB '11$'
    enter_buf db 'The desired degree: $'
DATA ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume cs:CSEG, ds:DATA

.386
process proc near
    mov ax, data
    mov ds, ax
    call new

    call find

    ret
process endp


find:
    mov dx, 0
    mov cx, 16
    print_bdigits:
        dec cx
        bt bx, cx
        inc cx
        jc exit
        loop print_bdigits
    exit:
        mov dx, cx
        inc dx
        mov bh, 0
        mov bx, dx
        call output1_prog
    ret

new:
    mov ah, 09h
    mov dx, OFFSET enter_buf
    int 21h
    ret

CSEG ENDS
END