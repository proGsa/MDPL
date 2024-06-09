.686
.MODEL FLAT, C
.STACK

.CODE

mystrcpy PROC
    mov edi, [esp + 8]    ; dst
	mov esi, [esp + 4]   ; src
	mov ecx, [esp + 12]   ; size

    mov ebx, edi          
    
    cmp edi, esi
    jb copy               

    mov eax, edi
    sub eax, esi
    cmp eax, ecx
    ja copy                
    
    
    add edi, ecx
    dec edi
    add esi, ecx
    dec esi
    std             ; DF = 1

    copy:
        rep movsb       ; rep ������������, ��� ���������� ���������� movsb ��������� ��������� RCX,
                        ; ����� �������, �������� �� ���� ������� ����� 0. ���� �� ��������, �� ��������� ���������� ���� �� RSI � RDI
                        ; � ��������� �������� � �������� RCX. ���� ������� ����������� �� ��� ���, ���� RCX �� ������ ������ 0.
                        ; ���� RCX �������� 0 ��� �������������� ����������, ���������� movsb �� ����� ���������� ����� ������.
        cld             ; DF = 0
        mov eax, ebx    ; � eax ������������ �������� (��������� dst)

    ret
mystrcpy ENDP
END