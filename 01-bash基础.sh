#这是一条注释
#!/bin/bash
#注释后面紧跟!，则标注该脚本应该以什么shell路径运行

#运行脚本有三种方式：
#1,直接使用bash命令加上脚本路径
#2,chmod为脚本文件添加 +x 执行权限后直接 ./x.sh
#3,使用.号运行 . ./x.sh
#另外，将脚本复制到$PATH所指定的任意目录下，则该脚本会成为系统命令
#通常系统命令都不带文件后缀，比如，mycli，其内容第一行也都形如#!/bin/path/myshell

#shell命令分为內建命令和外部命令，使用type可打印命令路径
type cd # cd is a shell builtin
type node # node is /usr/local/bin/node

#declare用于声明变量，后面跟不同的参数可声明不同类型的变量，变量名和值之间用=号连接，且不可以出现任何空格
declare var1='hello'; #此时可以直接省略declare，如PI=3.14
#声明整数
declare -i var2=4;
#声明数组
declare -a var3='([0]="aaa" [2]="ccc")'
echo ${var3[2]} # 输出ccc
#declare -r声明只读变量
#decalre -f与declare -F比较特殊，用于输出当前脚本中的函数名以及函数体

#eval用于将输入的字符串解析执行
eval "ls -a";

#export用于将变量透析给子脚本
export parent='this is from parent';
#调用子脚本
bash './01_child.sh';

#几个变量
#${PATH}系统环境变量，${PWD}当前工作目录，${OLDPATH}上一次工作目录，$0脚本自身，$1，脚本后紧跟的第一个参数，${BASH_VERSION}是bash版本号
echo ${PATH} #等价于pwd命令

#bash命令能进入子shell
bash;

#exit退出当前shell，退出之后不能继续任何交互，tty进程终结死亡
#但是，因为上文中有bash，所以终止的只是子shell，父tty依然可用
exit;

#在windows中可以使用cygwin模拟类unix环境

#练习：将脚本的第一个参数记为engine变量，查询出engine的shell脚本位置，打印出字符串
# engine=$1;
# engine_path=$(which ${engine});
# result="script: $0 searches for the path of $1, it is $engine_path";
# echo $result;
