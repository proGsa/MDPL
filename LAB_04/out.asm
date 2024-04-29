PUBLIC new
PUBLIC print
PUBLIC space
PUBLIC change_act

PUBLIC n
PUBLIC m
PUBLIC mat

DATA SEGMENT PARA COMMON 'DATA'
    n DB 0             ; Переменная для хранения длины
    m DB 0             ; Переменная для хранения ширины
    mat db 81 dup(?) 
    i db 0
    j db 0
DATA ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, DS:DATA
new proc near
    mov ah, 02h 
    mov dl, 0Ah
    int 21h
    ret
new endp

space proc near
    mov dl, ' '     ; Загрузить пробел в DL
    mov ah, 02h     ; Загрузить функцию для вывода символа
    int 21h         ; Вывести символ
    ret
space endp

call_newline_p:
    inc i
    mov j, 0
    
    call new
    jmp goto2

print proc near
    mov ax,data
    mov ds, ax

    mov si, 0
    mov i, 0
    mov j, 0

    mov al, n
    mul m
    mov cx, ax   
    call new
    call prnt_mat
    ret
print endp

prnt_mat:
    mov dl, mat[si]
    add dl, '0'
    mov ah, 02h         
    int 21h

    call space

    inc j

    mov al, j
    cmp al, m
    je call_newline_p
    goto2:
    mov al, i
    mov bl, 9
    mul bl
    add al, j
    mov si, ax

    loop prnt_mat
    ret

call_newline_c:
    inc i
    mov j, 0
    
    jmp goto3

change_act proc near
    mov ax,data
    mov ds, ax

    mov si, 0
    mov i, 0
    mov j, 0

    mov al, n
    mul m
    mov cx, ax   
    call new
    call change
    ret
change_act endp

change:
    mov al, mat[si]
    cbw
    mov bl, 3
    div bl
    mov dl, ah

    mov mat[si], dl

    inc j

    mov al, j
    cmp al, m

    je call_newline_c

    goto3:
    mov al, i
    mov bl, 9
    mul bl
    add al, j
    mov si, ax

    loop change
    ret


CSEG ENDS
END
