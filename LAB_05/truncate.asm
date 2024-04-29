.386
PUBLIC output1_prog

DATA SEGMENT PARA USE16 PUBLIC
    number db 0
DATA ENDS

DSEG SEGMENT BYTE PUBLIC USE16 'DECSTRNUM'
    decdigs db 4 dup(0)
DSEG ENDS 

CSEG SEGMENT PARA PUBLIC USE16 'CODE'
    assume cs:CSEG, ds:DATA

output1_prog proc near
    call new

    call output_decimal

    ret
output1_prog endp

new:
    mov ah, 02h 
    mov dl, 0Ah
    int 21h
    ret

output_decimal:
    pusha
    push ds

    mov ax, bx
    bt bx, 7
    jc is_neg
    mov bx, ax

    continue:
    mov ax, seg decdigs
    mov ds, ax
    

    mov al, bl
    mov ah, 0
    mov bl, 10

    assume DS:DSEG
    mov si, 0
    get_nums:
        div bl
        add ah, '0'
        mov decdigs[si], ah
        inc si
        mov ah, 0
        cmp al, 0
        jne get_nums

    mov ah, 02h
    print_digs:
        dec si
        mov dl, decdigs[si]
        int 21h
        cmp si, 0
        jne print_digs
    
    pop ds
    popa
    ret

is_neg:
    neg bl
    pusha
    mov ah, 02h
    mov dl, '-'
    int 21h
    popa
    jmp continue

CSEG ENDS
END
