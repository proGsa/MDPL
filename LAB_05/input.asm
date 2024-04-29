
PUBLIC input_prog

DATA SEGMENT para PUBLIC
    buf DB 5 dup(0)
    msg6 DB 'Error $'
    flag db 0
DATA ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume cs:CSEG, ds:DATA
.386
input_prog proc near
    mov ax, data
    mov ds, ax

    call new

    call enter_buf

    call enter_hex

    ; call dop_hex

    ret

input_prog endp

enter_buf:
    mov si, OFFSET buf
    mov cx, 5
    a1:
        mov ah,01h
        int 21h
        
        cmp al, 0Dh   ;прекращение ввода чисел и выход по нажатию клавиши Enter
        jz exit
        
        mov [si], al
        inc si
    loop a1
    
    exit:
    mov al, '$'
    mov [si], al

    ret

enter_hex:
    mov si, OFFSET buf
    mov bx, 0
    a2:
        mov dl, [si]

        cmp dl, '$'
        je exit1

        cmp dl, '-'
        je minus

        cmp dl, '0'
        jl err_msg

        cmp dl, '9'
        jg letter

        sub dl, '0'
        
        mov cl, 4
        shl bx, cl
        or bl, dl
        
        continue:
        inc si

        jmp a2
    exit1:
    cmp flag, 1
    je dop_hex
    ret

    minus:
        mov flag, 1
        jmp continue

letter:
    cmp dl, 'A'
    jl err_msg
    cmp dl, 'F'
    jg err_msg

    sub dl, 'A'-10

    mov cl, 4
    shl bx, cl
    or bl, dl

    inc si
    jmp a2

; dop_hex:
;     test bx, 8000h     ; Проверяем старший бит
;     jnz goto1
;     ret
    dop_hex:
        mov ax, bx          ; Загружаем значение числа в регистр ax
        not ax              ; Инвертируем все биты числа
        add ax, 1           ; Добавляем 1
        mov bx, ax 
        or bx, 8000h
        ret

err_msg:
    mov ah, 09h
    mov dx, OFFSET msg6
    int 21h
    jmp exit1

new:
    mov ah, 02h 
    mov dl, 0Ah
    int 21h
    ret

CSEG ENDS
END