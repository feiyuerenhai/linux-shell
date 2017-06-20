#!/bin/bash

#函数必须先定义后使用
#函数似乎无法传参，但是，可以使用全局变量
function checkAnswer(){
	pre="the answer is "
	if [ ${input} = 'tony' ]; then
		echo "${pre}right!";
		return 0;
	else
		echo "${pre}nooop!";
		return 1;
	fi;
}

echo "who is most gorgeous ?";
read input;
echo "you have just answered ${input} !";
checkAnswer;

#函数可定义返回值，可以使用$?取得
if [ $? -eq 0 ]; then
	echo 'function is assumed success!'
else
	echo 'function is assumed failure!'
fi