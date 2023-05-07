#!/bin/bash

# ==================================================
# 流程控制
# ==================================================

# ==================================================
# 算术比较
# ==================================================
# -eq 等于
# -ne 不等于
# -gt 大于
# -lt 小于
# -ge 大于或等于
# -le 小于或等于
# -a  逻辑与操作符
# -o  逻辑或操作符
[ $var1 -ne 0 -a $var2 -gt 2 ]
[ $var1 -ne 0 -o $var2 -gt 2 ]

# ==================================================
# 文件系统相关测试
# ==================================================
# [ -f $var ] 如果给定的变量是正常的文件路径或文件名, 返回真
# [ -x $var ] 如果给定的变量是可执行文件, 返回真
# [ -d $var ] 如果给定的变量是目录, 返回真
# [ -e $var ] 如果给定的变量包含的文件存在, 返回真
# [ -c $var ] 如果给定的变量包含字符设备文件的路径, 返回真
# [ -b $var ] 如果给定的变量包含块设备文件的路径, 返回真
# [ -w $var ] 如果给定的变量包含的文件可写, 返回真
# [ -r $var ] 如果给定的变量包含的文件可读, 返回真
# [ -L $var ] 如果给定的变量包含的是一个符号链接, 返回真

# ==================================================
# 字符串比较
# ==================================================
# 测试两个字符串是否相同
# [[ $str1 = $str2 ]] 或者 [[ $str1 == $str2 ]]
# 测试两个字符串是否不同
# [[ $str1 != $str2 ]]
# 字符串比较大小
# [[ $str1 > $str2 ]]
# 测试空串
# [[ -z $str1 ]] 如果 str1 为空串, 则返回真
# [[ -n $str1 ]] 乳沟 str1 不为空串, 则返回真
