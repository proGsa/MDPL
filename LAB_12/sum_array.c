#include <stdio.h>

void mul_arrays(int *result, const int *array1, const int *array2, int size) {
    for (int i = 0; i < size; i += 4) {
        __asm__ volatile (
            "ld1 {v0.4s}, [%1] \n"  // Загружаем 4 элемента из array1 в регистр v0
            "ld1 {v1.4s}, [%2] \n"  // Загружаем 4 элемента из array2 в регистр v1
            "add v0.4s, v0.4s, v1.4s \n" // Складываем элементы в регистрах v0 и v1, результат в v0
            "st1 {v0.4s}, [%0] \n"  // Сохраняем результат из регистра v0 в массив result
            : 
            : "r" (result + i), "r" (array1 + i), "r" (array2 + i) // Входные операнды
            : "v0", "v1" 
        );
    }
}


int main(void)
{
    int size = 12;
    int a1[] = {1, 2, 3, 4, 5, 6, 3, 0, 2};
    int a2[] = {6, 5, 4, 3, 2, 1, 3, 0, -2};
    int res[size];
    mul_arrays(res, a1, a2, size);
    for (int i = 0; i < size; i++) {
        printf("%d ", res[i]);
    }
    printf("\n");
    return 0;
}