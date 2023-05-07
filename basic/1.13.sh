#!/bin/bash

# ==================================================
# 使用匿名管道将多个命令单向连接
# ==================================================

# 组合命令
ls | cat -n > out.txt

# 使用 () 操作符定义一个子 shell
echo $not_define_var
(not_define_var='define'; echo $not_define_var)
echo $not_define_var

