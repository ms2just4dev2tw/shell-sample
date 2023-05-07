#!/bin/bash

# ==================================================
# 输入
# ==================================================

# read -n number_of_chars variable_name
read -n 2 var
echo $var

# 用无回显的方式读取密码
read -s var

# 使用 read 显示提示信息
read -p "enter input:" var

# 在给定时限内读取输入
read -t 2 var
# 在 2 秒内键入的字符存入变量

# 用特定的定界符作为输入行的结束
read -d ":" var
