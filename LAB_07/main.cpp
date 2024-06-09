#include <iostream>

extern "C"
{
    void mystrcpy(const char* str, char* new_str, size_t len);
}
size_t mystrlen(const char* string)
{
    int len = 0;

    __asm {
        mov ecx, -1;
        mov edi, string;
        xor al, al;
        repne scasb; // ������� SCASB ���������� ������� AL � ������ � ������ ������ �� ������ ES:DI � ������������� ����� ���������� ������� CMP. 
        // ����� ���������� �������, ������� DI ������������� �� 1, ���� ���� DF = 0, ��� ����������� �� 1, ���� DF = 1
        // REPNE ��������� ��������, ���� ���� ZF ���������� "�� ����".
        neg ecx; // ��� ��� ecx �������������: �� ���� �������� ����� ����� ��� �������������
        sub ecx, 2; // ��������� ����� ��������� ������� /0
        mov len, ecx;
    };
    return len;
}

int main() 
{
    char s2[20] = "\0";
    size_t l = mystrlen(s2);
    std::cout << "Length of the string (" << s2 << "): " << l << std::endl;
    
    char *s3 = s2;

    mystrcpy(s2, s3, l);
    std::cout << "New: " << s3<< std::endl;

    return 0;
}
