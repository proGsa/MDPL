.386
.model flat, stdcall
option casemap:none

include \masm32\include\windows.inc
include \masm32\macros\macros.asm
include \masm32\include\msvcrt.inc

uselib kernel32, user32, masm32, comctl32
 
WndProc PROTO :DWORD,:DWORD,:DWORD,:DWORD
hord_asm PROTO :REAL8, :REAL8, :DWORD

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib

TEST_DIALOG = 1000
TEST_BTN = 1001
EXIT_BTN = 1002
TEST_BEG_NUM_EDIT = 1003 
TEST_END_NUM_EDIT = 1004
TEST_STEP_NUM_EDIT = 1005

.data
  five REAL8 5.0
  two REAL8 2.0

.data?
  hInstance dd ?
  hWnd dd ?
  icce INITCOMMONCONTROLSEX <>
  buffer_beg db 128 dup(?)
  buffer_end db 128 dup(?)
  buffer_step db 128 dup(?)
  float_result REAL8 ?
  res REAL8 ?
  global_x0 REAL8 ?
  global_x1 REAL8 ?
  global_n dd ?

.code
start:
    mov icce.dwSize, SIZEOF INITCOMMONCONTROLSEX
    mov icce.dwICC, ICC_DATE_CLASSES or \
                    ICC_INTERNET_CLASSES or \
                    ICC_PAGESCROLLER_CLASS or \
                    ICC_COOL_CLASSES

    invoke InitCommonControlsEx, offset icce

    invoke GetModuleHandle, NULL
    mov hInstance, eax

    invoke DialogBoxParam, hInstance, TEST_DIALOG, 0, offset WndProc, 0

    invoke ExitProcess, eax

hord_asm PROC param_x0:REAL8, param_x1:REAL8, param_n:DWORD
    LOCAL x0:REAL8
    LOCAL x1:REAL8
    LOCAL f0:REAL8
    mov ecx, param_n    ; Устанавливаем счетчик итераций в регистре ecx
    fld param_x0
    fstp x0
    fld param_x1
    fstp x1

    fld x1  

cycle:
    fld x0
    fld st(0)
    fmulp st(1), st(0)     ; x0^2
    fld five
    fsubp st(1), st(0)     ; x0^2 - 5
    fsin       ; sin(x0^2 - 5)
    fld two
    fmulp st(1), st(0)     ; 2*sin(x0^2 - 5)

    fstp f0

    fld x1
    fld st(0)
    fmulp st(1), st(0)
    fld five
    fsubp st(1), st(0)
    fsin
    fld two
    fmulp st(1), st(0)

    fld st(0)
    fld x0
    fsub x1
    fmulp st(1), st(0)
    fxch
    fld f0
    fxch
    fsubp st(1), st(0)
    fdivp st(1), st(0)
    fld x1
    fxch
    fsubp st(1), st(0)

    fstp x1
    loop cycle

    fld x1
    fstp res

    ret
hord_asm ENDP

WndProc proc hWin:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD
    LOCAL float_beg:REAL4
    LOCAL float_end:REAL4
    LOCAL float_step:REAL4

    switch uMsg
        case WM_INITDIALOG
            invoke SendMessage, hWin, WM_SETICON, 1, FUNC(LoadIcon, NULL, IDI_ASTERISK)

        case WM_COMMAND
            switch wParam
                case TEST_BTN
                    invoke GetDlgItemText, hWin, TEST_BEG_NUM_EDIT, addr buffer_beg, 128
                    invoke GetDlgItemText, hWin, TEST_END_NUM_EDIT, addr buffer_end, 128
                    invoke GetDlgItemText, hWin, TEST_STEP_NUM_EDIT, addr buffer_step, 128

                    invoke crt_atof, addr buffer_beg
                    fstp float_beg
                    invoke crt_atof, addr buffer_end
                    fstp float_end
                    invoke crt_atof, addr buffer_step
                    fstp float_step

                    ; Сохранение значений в переменные
                    fld float_beg
                    fstp qword ptr [global_x0]
                    fld float_end
                    fstp qword ptr [global_x1]
                    mov eax, float_step
                    mov [global_n], eax

                    ; Вызов hord_asm с правильными аргументами
                    invoke hord_asm, qword ptr [global_x0], qword ptr [global_x1], [global_n]

                    ; Сохранение результата в float_result
                    fld qword ptr [res]
                    fstp qword ptr [float_result]

                    ; Преобразуем результат обратно в строку и выводим
                    invoke crt_sprintf, addr buffer_beg, chr$("Sum: %lf"), float_result
                    invoke MessageBox, hWin, addr buffer_beg, chr$("Sum"), 0

                case EXIT_BTN
                    jmp exit_program
            endsw
        case WM_CLOSE
        exit_program:
            invoke EndDialog, hWin, 0

    endsw

    xor eax, eax
    ret
WndProc ENDP

end start
