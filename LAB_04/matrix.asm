EXTRN new: near
EXTRN print: near
EXTRN space: near
EXTRN change_act: near

EXTRN n:byte
EXTRN m:byte
EXTRN mat:byte

STK SEGMENT PARA STACK 'STACK'
    db 100 dup(0)
STK ENDS

DATA SEGMENT   
    msg1 DB 'Enter the number of rows (<= 9): $'  ; Строка для вывода запроса о длине
    msg2 DB 'Enter the number of columns (<= 9): $' ; Строка для вывода запроса о ширине
    i DB 0
    j DB 0
DATA ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume cs:CSEG, ds:DATA

main:
    mov ax,data
    mov ds, ax

    call f
    call change_act
    call print
    mov ah, 4Ch       ; Выход из программы с кодом 0
    int 21h             ; Прерывание для завершения программы

f:
    ; Вывод запроса на ввод количества строк
    mov ah, 09h         
    mov dx, OFFSET msg1
    int 21h

    ; Ввод количества строк
    call enter_num
    mov n, al

    ; переход на новую строку
    call new

    ; Вывод запроса на ввод количества столбцов
    mov ah, 09h
    mov dx, OFFSET msg2
    int 21h

    ; Ввод количества столбцов
    call enter_num
    mov m, al

    mov al, n            ; Загрузка количества строк в AL
    mul m                ; Умножение количества строк на количество столбцов
    mov cx, ax           ; Сохранение результата умножения в CX

    mov si, 0
    mov i, 0
    mov j, 0

    call new
    read_lbl:
        call enter_num
        mov bl, al

        call space
        mov dl, bl

        mov al, i
        mov bl, 9
        mul bl
        add al, j
        mov si, ax

        mov mat[si], dl
        
        inc j

        mov al, j
        cmp al, m
        je call_newline
        goto1:
        loop read_lbl
    ret
    
enter_num:
    mov ah, 01h
    int 21h
    sub al, '0'
    ret

call_newline:
    inc i
    mov j, 0
    
    call new
    jmp goto1

CSEG ENDS


END main
