#!/bin/bash

# 数组与关联数组

# 数组

# 1, 定义数组
array=(val1 val2 val3 val4)

array[0]="val1"
array[1]="val2"
array[2]="val3"
array[3]="val4"

# 2, 打印特定索引的数组元素
echo ${array[$index]}

# 3, 打印数组的所有值
echo ${array[*]}

echo ${array[@]}

# 4, 打印数组长度
echo ${#array[*]}

# 关联数组

# 1, 声明关联数组
declare -A map

# 2, 定义关联数组
map=([index1]=val1 [index2]=val2)

map[index1]=val1
map[index2]=val2

# 3, 列出数组索引, 也适用于普通数组
echo ${!map[*]}

echo $[!map[@]]
