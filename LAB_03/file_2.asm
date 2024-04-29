PUBLIC output_X

STK SEGMENT PARA STACK 'STACK'
    db 100 dup(0)
STK ENDS


CSEG SEGMENT PARA PUBLIC 'CODE'
    assume CS:CSEG, SS:STK
output_X PROC NEAR
    sub bl, 32          ; Преобразование символа в верхний регистр ASCII

    mov dl, ' '         ; Помещение пробела в регистр DL
    mov ah, 02h         ; Функция DOS для вывода символа
    int 21h             ; Вывод пробела
    
    mov dl, bl          ; Помещение значения символа (верхнего регистра) в регистр DL
    int 21h             ; Вывод заглавной буквы

    ret                 ; Возвращение из процедуры
output_X endp
CSEG ENDS
END
