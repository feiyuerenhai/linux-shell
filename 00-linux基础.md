# linux简介

#### 发展历史

- 1965年，贝尔实验室要开发一个多进程、多用户的**操作系统**，兼具可移植性，命名为“星际旅行”，这就是unix原型，unix逐渐壮大，但出于商业考虑，成为了闭源项目。
- 大学教授Tanenbaum为了能让学生有机会练习操作系统源码，自己动手写了一个类unix系统，minix。
- 后来，一个芬兰学生linus发起提议”共创一个自由的操作系统“，在GNU组织的帮助下，linux越发成熟。linus X，所以，linux读音应该是”利纳克斯“
- linux免费开源、模块化程度高、硬件支持众多、可移植性强，主要应用于服务器，嵌入式系统。
- linux 95%基于C语言编写，C语言是一种机器无关的高级语言，是可移植的，因此，linux系统也是可移植的。

#### 终端登陆

- 字符命令行交互终端，tty，teletype，”电传打印机“，linux默认提供6个tty，分别使用`ctrl+alt+F1~6切换`。
- ctrl+alt+F7是一个桌面终端，该终端由xserver程序支持，想要从tty直接进入图形界面使用`startx`命令
- 几个特殊的字符，`$`表示一般用户，`#`表示root超级用户，~表示用户家目录

#### 系统启动流程

* BIOS是固化在主板芯片上的**二进制程序**，芯片接通电源后，开始读取BIOS（因此，BIOS是计算机运行的第一个程序），期间，许多芯片指令集被源源不断地执行，包括：1，硬件可用性检查；2，从磁盘上第一个512字节区域读取主引导记录MBR；3，主引导记录通常存储了一个地址，指向Grub，因此紧接着Grub会被运行，对于linux来说，Grub运行即会加载内核kernel，之后加载linux的第一个程序/sbin/init

### shell简介

* shell是命令行解释器，是包装系统内核的外壳，也是用户和操作系统之间的桥梁，将用户输入的指令送到内核中执行。shell分为两大类，一是图形式，一是命令式。我们将多个shell指令一次性交给计算机内核处理就是shell编程。
* 使用`cat /etc/Shells`指令能查看到当前系统安装的所有shell，基础的shell是/bin/sh，即Bourne Shell，我们常用的bash语义为Bourne Again Shell，是sh的加强版。

# linux用户管理

- root即根用户，UID为0，对系统具有绝对的、完全的控制权
- 用户密码都存放在`/etc/passwd`和`/etc/shadow`文件中，类似于`用户名:密码x:UID:GID:说明栏:家目录:登陆shell`
- 使用`passwd`命令修改当前用户密码，如果当前为root用户，也可以使用`passwd + 用户名`来强制修改某个用户的密码
- 使用`who`命令来查看当前系统中有哪些用户通过哪些登陆终端登陆到了系统中
- 使用`su`命令切换用户，如su - jack，默认切换到root用户，如果在`/etc/sudoers`文件中为某个用户配置了执行权限为ALL，则该用户可以使用sudo命令利用root身份进行某些操作
- 定时任务管理使用`at`和`cron`

# linux文件管理

- 文件系统下有很多目录，其中/bin用于存放用户指令，通常是指编译过后能直接执行的binaries，/boot目录则是内核和启动文件
- head/tail -n 10 file，head和tail都可以查询指定的前后n行文本
- 使用mkdir的时候如果为多层级目录，可用-p参数，如 mkdir -p a/b/c/d
- ls命令，-l指的是详细内容，-a指的是包括隐藏文件，-l列出的内容包括文件类别和权限，连接数，所有者，时间
- chmod改变文件权限，chown改变文件所有者
- find 路径 -name 文件名 用于查找文件，find 路径 -newer 文件名 查找比文件名新的文件
- whereis用于查询可执行命令的bin路径

# linux文件系统

- 文件系统也是一种数据结构，包括超级块（存放总体信息），i节点（文件元数据，如拥有者，时间，执行权限），数据块，目录块等数据

# 字符处理

- 理解管道，ls -l a/b | more，列举目录b作为more命令的输入
- grep搜索文本，sort排序，cut截取，tr文本转换，split分割大文件

# 网络管理

- 使用host查询DNS记录，如host www.google.com

# 进程管理

- 使用 ps -ef获取进程信息快照，top获取实时的进程信息
- lsof filename，显示文件被哪些进程占用

# 软件安装

- 如何执行一个程序？
  - 使用点号 . 执行
  - 使用全路径加x权限执行
  - 将程序执行文件复制到bin目录下
  - 将程序路径追加到系统$PATH变量中
- 如何安装一个软件？
  - 原始方法，源码中执行configure配置软件并检查运行环境，执行make生成模块和主程序，类似于编译，install将编译文件复制到安装目录如/usr/bin
  - RPM，RedHat Package Manager，本质上是将预先编译好的软件整体打包，安装的时候解压复制到指定目录，但是，未能解决依赖问题，导致每安装一个软件，还要查看出错信息，逐个安装其依赖
  - YUM，YellowDog Updator，Modified，能自动下载、安装、更新软件，最大的优点是它自动解决了依赖关系。

# vi和vim编辑器

- vi，visual interface，vim是vi增强版max
- 删除整行dd，删除光标到文件末尾dG
- 尾行命令模式的/用于搜索，搜索结果下一个是n，上一个是N
- 替换所有:s/old/new/g