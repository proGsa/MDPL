#include <iostream>
#include <cmath>
#include <iomanip> 

#define eps 0.000001

double func(double x)
{
    double res = 0;
    double five = 5.0;
    double two = 2.0;
    __asm__(
            "fldl %1\n"
            "fldl %1\n"              // Загружаем значение x в вершину стека FPU
            "fmulp \n"   // Умножаем вершину стека FPU саму на себя
            "fldl %2\n"
            "fsubp \n" 
            "fsin\n\t"
            "fldl %3\n"
            "fmulp \n" 
            "fstpl %0\n"                 // Сохраняем результат из вершины стека FPU в res
            : "=m"(res)                 // Выходной операнд - res
            : "m"(x), "m"(five), "m"(two)
    );
    return res;
}

double hord_cpp(double a, double b, size_t n)
{
    double x0 = a;
    double x1 = b;
    for (size_t i = 0; i < n; i++) {
        x1 = x1 - (func(x1) * (x0 - x1) / (func(x0) - func(x1)));
    }
    return x1;
}

double hord_asm(double (*func)(double), double a, double b, size_t n)
{
    double res = b;
    double x0 = a;
    double x1 = b;
    double five = 5.0;
    double two = 2.0;
    double f0 = func(a);
    // auto f = func;
    __asm__ volatile(
        "movq %[n], %%rcx\n\t"   // Устанавливаем счетчик итераций в регистре rcx
        "cycle:\n\t"
        
        "fldl %[x1]\n"
        "fldl %[x1]\n"              // Загружаем значение x в вершину стека FPU
        "fmulp \n"   // Умножаем вершину стека FPU саму на себя
        "fldl %[five]\n"
        "fsubp \n" 
        "fsin\n\t"
        "fldl %[two]\n"
        "fmulp \n" 

        "fldl %[f0]\n"
        "fsubp \n\t"


        "fldl %[x1]\n\t"
        "fldl %[x0] \n\t"
        "fsubp \n\t"

        "fldl %[x1]\n"
        "fldl %[x1]\n"              // Загружаем значение x в вершину стека FPU
        "fmulp \n"   // Умножаем вершину стека FPU саму на себя
        "fldl %[five]\n"
        "fsubp \n" 
        "fsin\n\t"
        "fldl %[two]\n"
        "fmulp \n" 

        "fmulp \n"
        "fdivp \n\t"  

        "fldl %[x1]\n\t"
        "fsubp \n\t"

        "fstpl %[x1] \n\t"

        "loop cycle\n\t"            // Повторяем цикл, пока rcx не станет равным 0
        "movq %[x1], %%rax \n"
        "movq %%rax, %[res] \n"

        : [res] "=m" (res)       // Выходной операнд - res
        : [x0] "m" (x0), [x1] "m" (x1), [n] "m" (n), [five] "m" (five), [two] "m" (two), [f0] "m" (f0) // Входные операнды - адреса x0, x1 и n
        : "%rcx", "%rax"                 // Список регистров, которые мы используем
    );

    return res;
}


int main(void)
{
    std::cout << std::fixed << std::setprecision(5);
    double a = -1.8;
    double b = 0.8;
    size_t n = 20;
    std::cout << hord_cpp(a, b, n) << std::endl;
    std::cout << hord_asm(func, a, b, n) << std::endl;

    return 0;
}