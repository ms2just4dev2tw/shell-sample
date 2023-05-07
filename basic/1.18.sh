#!/bin/bash

# ==================================================
# 定制 bash
# ==================================================

# 定义 ls 命令使用的颜色
LS_COLORS='no=00:di=01;46:ln=00;36:pi=40;33:so=00;35:bd=40;33;01'
export LS_COLORS

# 主提示符
PS1='Hello $USER'; export PS1

# 正常路径之外的个人应用程序安装目录
PATH=$PATH:/opt/MySpecialApplication/bin;
export PATH

# 常用命令的快捷方式
function lc() { /bin/ls -C $* ; }
