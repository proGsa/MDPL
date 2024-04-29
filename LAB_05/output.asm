PUBLIC output_prog

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume cs:CSEG
.386

output_prog proc near
    mov cx, 16
    mov dx, 0
    call new
    call print

    ret
output_prog endp
print:
    print_bdigits:
        dec cx
        bt bx, cx
        inc cx
        jc print_one
        jnc print_zero
        loop print_bdigits
    ret

    print_one:
        mov dl, '1'   ; Загружаем символ '1' в dl
        jmp print_char   ; Переходим к выводу символа

    print_zero:
        mov dl, '0'   ; Загружаем символ '0' в dl

    print_char:
        mov ah, 02h   ; Загружаем номер сервиса для вывода символа
        int 21h       ; Выводим символ
        loop print_bdigits  ; Повторяем для всех битов
new:
    mov ah, 02h 
    mov dl, 0Ah
    int 21h
    ret


CSEG ENDS
END
