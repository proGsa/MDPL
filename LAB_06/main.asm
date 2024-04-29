.model tiny

MINSPEED EQU 11111b
MAXSPEED EQU 0000b
TICK EQU 18

CODE SEGMENT para PUBLIC 'CODE'
    assume cs:CODE
    org 100h ;размер PSP

    main:
        jmp initialization
        count db 1 dup(0)
        all_ticks db 1 dup(0)
        speed db 1 dup(MINSPEED)
        adress dd 1 dup(0)
        flag dw 1704

    resident:
        push ax
        push bx
        push cx
        push dx

        pushf
        push cs
        mov ax, offset count_tick
        push ax
        
        

    count_tick:
        inc all_ticks
        cmp count, 5
        jge dop
        inc count
        cmp all_ticks, TICK
        jl return_reg
        jmp change_speed

    dop:
        inc all_ticks
        cmp all_ticks, TICK + 1
        jl return_reg
        mov count, 0
        jmp change_speed

    change_speed:
        mov all_ticks, 0
        sub speed, 4
        cmp speed, MAXSPEED
        jg change_speed_out
        mov speed, MINSPEED
        jmp change_speed_out

    change_speed_out:
        mov al, 11110011b ; автоповтор
        out 60h, al
        mov al, speed ; задает последние 4 бита (скорость автоповтора)
        out 60h, al
        jmp return_reg

     return_reg:
             pop dx
        pop cx
        pop bx
        pop ax
    jmp cs:adress


    ;     iret

    initialization:
        ; Получаем адрес старого обработчика
        mov ah, 35h
        mov al, 08h
        int 21h

        cmp es:flag, 1704
        je clear

        mov word ptr cs:adress, bx
        mov word ptr cs:adress + 2, es

        ; Установаем новый обработчик
        mov ah, 25h     ; new вектор прерывания
        mov al, 08h     ; номер прерывания (консольный ввод без эха)     
        mov dx, offset resident
        ; mov bx, cs
        ; mov ds, bx
        int 21h

        mov ah, 09h
        mov dx, offset okey_mes
        int 21h

        mov dx, offset cs:initialization
        int 27h  ; выход из резидентной программы

    clear:
        push es
        push ds

        mov dx, word ptr es:adress
        mov ds, word ptr es:adress + 2
        mov ah, 25h
        mov al, 08h
        int 21h

        mov ah, 49h ; Освобождает сегментный адрес es блока памяти 
        int 21h

        pop ds
        pop es

        mov ah, 09h
        mov dx, offset err_mes
        int 21h

        mov ah, 4Ch
        int 21h

        

    okey_mes db "Good initialization$"
    err_mes db "Uninstall$"
CODE ENDS

END main