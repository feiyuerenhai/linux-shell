#!/bin/bash

#使用方括号 [] 进行测试，要注意格式，[ expression ]，expression两端要有空格
FILE1='./not_exist';
FILE2='./not_exist_neither';
if [ -e ${FILE1} -a -x ${FILE2} ]; then
	echo '文件存在'
else
	echo '文件不存在'
fi;

#注意文件比较符号
# -e 存在；-x 存在且可执行；-d 存在且为目录；-w 存在且可写，等等

#注意逻辑运算符
# -a 表示 and；-o 表示 or；
# 也可以写成
# [ -e ${FILE1} -a -x ${FILE2} ] 等价于 [ -e ${FILE1} ] && [ -x ${FILE2} ]

#千万注意字符串比较符
# -z str 字符串为空；-n str 字符串非空；str1 = str2 字符串相等；

#千万注意整数比较符
# -eq ==；-le <=；-ge >=; 

#注意区分字符串比较符与整数比较符

#变量赋值是A='test'，字符串比较是${A} = 'test'