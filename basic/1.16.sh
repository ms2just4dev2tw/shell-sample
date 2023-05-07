#!/bin/bash

# ==================================================
# 字段分隔符与迭代器
# ==================================================

# 内部字段分隔符(Internal Field Separator, IFS)
# IFS 是一个环境变量, 保存了用于分割的字符

# 使用 echo 生成各种值序列
echo {1..10}
echo {a..z} {A..Z}

# for 循环
for var in list;
do
    command;
done

# 指定范围的迭代
for((i=0; i<10; i++))
{
    command;
}

# while 循环
while condition
do
    command;
done

# until 循环
x=0;
until [ $x -eq 9 ]
do
    let x++;
    echo $x;
done

