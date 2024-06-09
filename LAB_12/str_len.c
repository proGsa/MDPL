#include <stdio.h>
#include <string.h>

size_t asm_strlen(const char* str) {
    size_t length = 0;
    __asm__
    (
        "MOV X1, %1\n"              // X1 = str (начало строки)
        "MOV X0, X1\n"              // X0 = str (копия адреса начала строки)
        // в цикле получаем все байты, пока не дойдем до нулевого байта
        "loop: 
            LDRB W2, [X1], #1\n" // загружаем из X1 один байт - один символ в W2 и увеличиваем адрес в X1 на 1 байт
            "CMP W2, #0\n"              // сравниваем с нулевым байтом
            "B.NE loop\n"               // если ненулевой байт, переход обратно к метке loop для загрузки следующего символа
        "SUB %0, X1, X0\n"          // X1 - X0 = длина строки
        "SUB %0, %0, #1\n"          // Уменьшаем длину на 1, так как последний байт был нулевым
        : "=r" (length)
        : "r" (str)
        : "x0", "x1", "w2"
    );
    return length;
}
int main(void)
{
    const char str[] = "Hello, world!";
    size_t my_len = asm_strlen(str);
    size_t len = strlen(str);
    printf("String: %s, my_len: %zu, strlen: %zu\n", str, my_len, len);
}