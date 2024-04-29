EXTRN output_X: near

CSEG SEGMENT PARA PUBLIC 'CODE'
main:
	mov ah, 01h         ; Запрос на ввод символа с клавиатуры
    int 21h             ; Прерывание для ввода символа

    mov bl, al          ; Сохраняем введенный символ в регистре BL

    call output_X       ; Вызов внешней процедуры output_X для обработки символа

    mov ah, 4Ch         ; Завершение программы DOS
    int 21h             ; Прерывание для завершения программы
CSEG ENDS

END main