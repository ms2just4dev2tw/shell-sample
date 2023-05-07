#!/bin/bash

echo -n "Count: "
# 存储光标位置
tput sc

# 循环 10 秒
for count in `seq 0 10`
do
    # 恢复之间存储的光标位置
    tput rc
    # 清除当前光标位置到行尾的内容
    tput ed
    echo -n $count
    sleep 1
done
