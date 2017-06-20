#!/bin/bash

#if elif后面一定要跟then，而且注意分号;，必不可少
if [ 2<1 ] ; then
	echo 'apple';
elif [ 3>=2 ] && [ 4<3 ]; then
	echo 'pear';
else
	echo 'banana';
fi

#for循环要求in后面列举出所有的可能，不加引号，不加括号
for item in dragonfly butterfly moth
do
	echo "${item} is a kind of insects"
done