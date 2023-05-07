#!/bin/bash

# 数学运算

# 1, 使用 let, (()), [] 执行基本的算术操作

# 1.1, 使用 let 命令时变量名之前不需要加 $

# 自加操作
let num++

# 自减操作
let num--

# 简写形式
let num=num+6
let num=num-6

let num+=6
let num-=6

# 1.2, 操作符 [] 与 let 命令使用方法一致
number=$[ num1 + num2 ]

# 在 [] 中也可以使用 $ 前缀
number=$[ $num1 + 5]

# 1.3, 使用操作符 (()) 时, 出现在 (()) 中的变量名之前需要加上 $
number=$(( number1 + 5 ))

# 2, 使用 expr 执行高级操作

number=`expr 3 + 4`

number=$(expr $number1 + 5)


# 3, 使用 bc 执行高级操作, 用于支持浮点运算

# 3.1, 设定小数精度
echo "scale=2;22/7" | bc

# 3.2, 进制转换
echo "obase=2;$number" | bc

echo "obase=10;ibase=2;$number" | bc

# 3.3, 计算平方及平方根
echo "10^10" | bc

echo "sqrt(100)" | bc
