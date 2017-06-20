#!/bin/bash

read -p 'what is your name?' name
ct=`cat 'a.txt'`
if [ $? == 0 ]
then
	echo ${ct}
else
	echo 'no'
fi

say(){
	echo 'hello'
}
say