#!/bin/bash

# 文件描述符与重定向

# 文件描述符是与某个打开的文件或数据流相关联的整数
# 0 --- stdin  (标准输入)
# 1 --- stdout (标准输出)
# 2 --- stderr (标准错误)

# 成功与不成功的命令
# 使用 echo ? 打印上一条命令的执行状态


# tee 将输入数据重定向 stdout 以及一个或多个文件
# command | tee FILE1 FILE2 | otherCommand


# exec 创建全新的文件描述符
# 只读模式
exec 3<input.txt

# 截断写入模式
exec 4>output.txt

# 追加写入模式
exec 5>>output.txt


