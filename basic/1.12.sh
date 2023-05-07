#!/bin/bash

# 函数与参数

# 1, 函数参数

# $0 是脚本名称
# $n 是第 n 个参数
# $@ 被扩展成 "$1" "$2" "$3" 等
# $* 被扩展成 "$1c$2c$3", 其中 c 是 IFS 的第一个字符

# 2, 递归函数 - Fork 炸弹
# :(){ :|:& };:
# http://en.wikipedia.org/wiki/Fork_bomb

# 3, 导出函数
function hello() { echo "hello world"; }
echo "hello" > test.sh
export -f hello
bash test.sh

# 4, 向命令传递参数
