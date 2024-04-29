;.386

EXTRN input_prog: near
EXTRN output_prog: near
EXTRN output1_prog: near
EXTRN process: near

STK SEGMENT PARA STACK 'STACK'
    db 150 dup(0)
STK ENDS

DATA SEGMENT PARA PUBLIC
    msg1 DB '1. Enter a signed number (16 s/s) $'
    msg2 DB '2. Output unsigned number (2 s/s) $'
    msg3 DB '3. Output signed number (10 s/s) $'
    msg4 DB '4. Process variant 2 $'
    msg5 DB '5. Program exit $'
DATA ENDS

CSEG SEGMENT PARA PUBLIC 'CODE'
    assume cs:CSEG, ds:DATA
    sub_programs DD input, out_p, out2_prog, process_prog, exit_prog

menu:
    mov ax,data
    mov ds, ax

    mov ah, 09h
    mov dx, OFFSET msg1
    int 21h

    call new

    mov ah, 09h
    mov dx, OFFSET msg2
    int 21h

    call new

    mov ah, 09h
    mov dx, OFFSET msg3
    int 21h

    call new

    mov ah, 09h
    mov dx, OFFSET msg4
    int 21h

    call new
    
    mov ah, 09h
    mov dx, OFFSET msg5
    int 21h
    
    call new

    ret

main:
    call menu
    call enter_num

    cmp al, 1
    je input

    cmp al, 2
    je out_p

    cmp al, 3
    je out2_prog

    cmp al, 4
    je process_prog

    cmp al, 5
    je exit_prog

    call new

    jmp main

exit_prog:
    mov ah, 4Ch
    int 21h

enter_num:
    mov ah, 01h
    int 21h
    sub al, '0'
    ret

input:
    call input_prog
    call new
    jmp main

out_p:
    call output_prog
    call new
    jmp main

out2_prog:
    call output1_prog
    call new
    jmp main

process_prog:
    call new
    call process
    call new
    jmp main

new:
    mov ah, 02h 
    mov dl, 0Ah
    int 21h
    ret

CSEG ENDS

END main