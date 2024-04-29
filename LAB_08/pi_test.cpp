#include <iostream>
#include <cmath>
#include <iomanip> 

#define PI1 3.14
#define PI2 3.141596

double sin_pi()      
{                   
    double res;

    __asm__("fldpi\n\t"                     // загружаем константу пи на вершину стека сопроцессора
            "fsin\n\t"                      // считаем синус числа, находящегося в ST(0) (на вершине стекасопроцессора); операнд считается заданным в радианах
            "fstpl %0\n\t"                   // извлекаем число из FPU в память, в данном случае из ST(0) в res
            : "=m" (res)                    // res - выходной параметр
        );

    return res;
}

double sin_half_pi()
{
    double res;
    double div = 2.0;
    __asm__(
        "fldl %1\n\t"
        "fldpi\n\t"
        "fdivp\n\t"
        "fsin\n\t"
        "fstpl %0\n"
        : "=m"(res)
        : "m"(div)
        );

    return res;
}

int main(void)
{
    std::cout << std::fixed << std::setprecision(50);
    std::cout << "Test func sin(pi): " << std::endl;

    std::cout << "sin(3.14): " << sin(PI1) << std::endl;
    std::cout << "sin(3.141596): " << sin(PI2) << std::endl;
    std::cout << "sin(m_pi): " << sin(M_PI) << std::endl;
    std::cout << "sin(asm): " << sin_pi() << std::endl;

    std::cout << "Test func sin_half(pi): " << std::endl;
    
    std::cout << "sin(3.14 / 2): " << sin(PI1 / 2) << std::endl;
    std::cout << "sin(3.141596 / 2): " << sin(PI2 / 2) << std::endl;
    std::cout << "sin(m_pi): " << sin(M_PI / 2) << std::endl;
    std::cout << "sin_half(asm): " << sin_half_pi() << std::endl;

    return 0;
}
