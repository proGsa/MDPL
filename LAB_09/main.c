#include <stdio.h>
#include <time.h>

void mul_c(int n1, int m1, int a[][m1], int m2, int b[][m2], int c[][m2])
{
    for (int i = 0; i < n1; i++)
    {
        for (int j = 0; j < m2; j++)
        {
            c[i][j] = 0;
            for (int k = 0; k < m1; k++)
            {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
}

void print_matrix(int n, int m, int c[][m])
{
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < m; j++)
            printf("%d ", c[i][j]);
        printf("\n");
    }
}

void mul_asm(int n1, int m1, int a[][m1], int m2, int b[][m2], int c[][m2])
{
    int t_m[m1][m2];
    for (size_t i = 0; i < m1; i++) {
        for (size_t j = 0; j < m2; j++) {
            t_m[i][j] = b[j][i];
        }
    }

    for (int i = 0; i < n1; i++)
    {
        for (int j = 0; j < m2; j++)
        {
            int res = 0;
            __asm__(
                "pxor %%xmm0, %%xmm0\n\t"    // Обнуляем res перед началом вычислений
                "mov %[m1], %%ecx\n\t"      // Загружаем значение m1 в ecx для цикла
                "cickle_k:\n\t"
                    "movups (%[a]), %%xmm1 \n\t" // Загружаем элемент строки из a в xmm0
                    "movups (%[t_m]), %%xmm2 \n\t"
                    "pmullw %%xmm2, %%xmm1 \n\t" // Умножаем xmm2 на xmm1
                    "addss %%xmm1, %%xmm0 \n\t"
                    "add $4, %[a]\n\t"         // Перемещаем указатель на следующий элемент строки в a
                    "add $4, %[t_m]\n\t"         // Перемещаем указатель на следующий элемент столбца в b
                    "dec %%ecx \n\t"
                    "jnz cickle_k \n\t"
                "movss %%xmm0, %[res] \n\t"
                : [res] "=m"(res)
                : [m1] "m"(m1), [a] "r"(a[i]), [t_m] "r"(t_m[j])
                : "%xmm0", "%xmm1", "%xmm2", "%ecx"
            );
            c[i][j] = res;
        }
    }
}

int main(void)
{
    int n1 = 138;
    int m1 = 139;
    int n2 = 139;
    int m2 = 140;
    // printf("Введите количество строк и столбцов в первой матрице\n");
    // scanf("%d %d", &n1, &m1);
    int matrix1[n1][m1];
    int matrix2[n2][m2];
    // printf("Введите 1 матрицу\n");
    for (int i = 0; i < n1; i++)
        for (int j = 0; j < m1; j++)
            // scanf("%d", &matrix1[i][j]);
            matrix1[i][j] = i * n1 + j + 1;
    // printf("Введите количество строк и столбцов во второй матрице\n");
    // scanf("%d %d", &n2, &m2);
    if (m1 != n2)
    {
        printf("Невозможно перемножить матрицы\n");
        return 0;
    }
    if (!n1 || !m1 || !n2 || !m2)
    {
        printf("Размерность матрицы не может быть равна 0\n");
        return 0;
    }
    // printf("Введите 2 матрицу\n");
    for (int i = 0; i < n2; i++)
        for (int j = 0; j < m2; j++)
            // scanf("%d", &matrix2[i][j]);
            matrix2[i][j] = i * n1 + j + 5;


    double result = 0;
    int c[n1][m2];
    // mul_asm(n1, m1, matrix1, m2, matrix2, c);
    // print_matrix(n1, m2, c);
    for (int i = 0; i < 100; i++)
    {
        clock_t start = clock();
        mul_c(n1, m1, matrix1, m2, matrix2, c);
        clock_t end = clock();
        result += (double) (end - start) / CLOCKS_PER_SEC;
    }
    printf("Время для ASM программы: %lf\n", result / 1000);


    int c1[n1][m2];
    // mul_asm(n1, m1, matrix1, m2, matrix2, c1);
    // print_matrix(n1, m2, c1);
    for (int i = 0; i < 100; i++)
    {
        clock_t start = clock();
        mul_asm(n1, m1, matrix1, m2, matrix2, c1);
        clock_t end = clock();
        result += (double) (end - start) / CLOCKS_PER_SEC;
    }
    
    printf("Время для C программы: %lf\n", result / 1000);
  

    return 0;
}