#!/bin/bash

# 变量与环境变量

var=value
echo "${var}"

# export 声明了将由子进程所继承的一个或多个变量, 各个目录路径间使用 : 分割
PATH="$PATH:home/user/bin"
export PATH

# 使用变量保存命令的输出
ret=$(ls)
echo -e "\e[1;31m${ret}\e[0m"

# 默认情况下, 只会将标准输出保存到变量中，需要将异常结果也保存到变量中
ret=$(ls -e)
echo -e "\e[1;31m${ret}\e[0m"

# 获取字符串的长度
var=123456789
echo ${#var}

# 识别当前使用的 shell
echo $0

echo $SHELL

# 检查是否为 root 用户
if [ $UID -ne 0 ]; then
    echo 'Non root user'
else
    echo 'Root user'
fi

# 修改 bash 的提示字符串
# 打开 ~/.bashrc 文件找到 PS1 变量
cat ~/.bashrc | grep PS1
# PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$' 对应 username@hostname:~$

# 使用函数追加环境变量
function prepend() {
    # 如果 $1 为空, 则会在末尾留下 :
    [ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1
    # ${parameter:+expression}, 如果 parameter 有值则使用 expression 的值
    [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1
}
