#!/bin/bash


# 调试脚本

# set -x 在执行时显示参数和命令
# set +x 禁止调试
# set -v 当命令进行读取时显示输入
# set +v 禁止打印输入

# shebang 的妙用
# #!/bin/bash -xv 开启调试功能

# 修改默认的 + 符号
PS4='$LINENO: '

# 调试信息会输出到 stderr
bash -x sleep.sh 2> debug.log
