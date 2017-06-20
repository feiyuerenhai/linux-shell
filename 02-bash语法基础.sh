#!/bin/bash

#shell是弱类型脚本语言

#shell中声明的变量默认都是全局的，但是也可以使用local来声明局部变量

#定义变量，不能有空格
VAR=1;
#读取变量
echo ${VAR};
#取运算结果
echo $( ls -a );
#消除变量
unset VAR;

#上一个命令的返回码 $?，为0则表示成功，其他都是不成功
result=`cat ./not_exist`;

if [ $? == 0 ];then
	echo ${result};
else
	echo 'file does not exist';
fi

#shell脚本中有三种引用
#双引号""是弱引用，使用弱引用，特殊的字符，如变量会被解析，比如 "the path is ${PATH}"
#单引号''是强引用，特殊字符不会被解析，'the path is ${PATH}'，此时${PATH}依然会作为字符输出
#反引号``是无引用，`the path is ${PATH}`会直接作为系统命令解析，类似于eval，因此，会提示，命令the不存在

#使用bc命令进行精确的数学计算
NUM=3.1415926
echo $( echo "$NUM*2" | bc );