#include <ctime>
#include <iostream>

template <typename T>
void count_time_cpp(int count, T a, T b)
{
	T res;
	clock_t begin = clock();
	for (int i = 0; i < count; i++)
		res = a + b;
	clock_t end = clock();

	clock_t sum_operation = end - begin;

	begin = clock();
	for (int i = 0; i < count; i++)
		res = a * b;
	
	end = clock();
	(void) res;

	clock_t mul_operation = end - begin;

	std::cout << "C++ realize:" << std::endl;
	std::cout << "Sum_time: " << sum_operation << ", mul_time: " << mul_operation << std::endl;
}
template <typename T>
void count_time_asm(int count, T a, T b)
{
	T res;
	clock_t begin = clock();
	for (int i = 0; i < count; i++)
	{
        __asm__(
            "fldl %[a]\n"
            "fldl %[b]\n"
            "faddp \n"
            "fstpl %[res]\n"
            : [res] "=m"(res)
            : [a] "m"(a), [b] "m"(b)
        );
	}
	clock_t end = clock();

	clock_t sum_operation = end - begin;

	begin = clock();
    for (int i = 0; i < count; ++i)
	{
        __asm__(
				"fldl %[a]\n"
            "fldl %[b]\n"
            "fmulp \n"
            "fstpl %[res]\n"
            :[res] "=m"(res)
            : [a] "m"(a), [b]"m"(b)
		);
	}
	end = clock();

    clock_t mul_operation = end - begin;

	std::cout << "asm realize : " << std::endl;
	std::cout << "Sum_time: " << sum_operation << ", mul_time: " << mul_operation << std::endl;
}


int main(void)
{
	float a = 10.1223;
	float b = 1.8;
	int count = 1000000;
	std::cout << "Float " << std::endl;
	count_time_cpp(count, a, b);
	count_time_asm(count, a, b);

	
	double c = 10.23;
	double d = 0.34;
	std::cout << "Double " << std::endl;
	count_time_cpp(count, c, d);
	count_time_asm(count, c, d);
	return 0;
}
