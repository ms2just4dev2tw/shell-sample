#!/bin/bash

# 终端信息

# 1, 获取终端的行数和列数
tput cols
tput lines

# 2, 获取当前的终端名
tput longname

# 3, 移动光标的位置
tput cup 100 100

# 4, 设置终端背景色
tput setb $n # n 可以在 0 到 7 之间取值

# 5, 设置终端前景色
tput setf $n # n 可以在 0 到 7 之间取值

# 6, 设置终端文本样式
tput bold

# 7, 设置下划线的起止
tput smul

tput rmul

# 8, 删除从当前光标位置到行尾的所有内容
tput ed

# 9, 设置终端的回显
stty -echo

stty echo
