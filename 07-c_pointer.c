#include <stdio.h>

int main ()
{
	/* 这是一段C语言演示指针的程序 */
	
	// 声明一个普通变量，类型为整型
	int var = 20;

	// 声明一个指针变量，类型为整形，即，该指针指向的值也是一个整型
	// (不同的变量其类型不同，用于存放变量地址的指针类型也不同，指针类型总是与变量类型相同)

	int *ip;
	// 使用 & 符号寻找变量地址，并存入ip中

	ip = &var;  /* 在指针变量中存储整型变量 var 的地址 */

	printf("变量var在内存中的地址: &var =>  %x\n", &var);

	printf("变量ip中存储的是变量var在内存中的地址: ip => %x\n", ip);

	printf("寻找 变量ip中存储的地址 发现它指向的内存区域中的值为: *ip => %d\n", *ip);

	// 程序正常结束
	return *ip;
}