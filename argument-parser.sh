#!/bin/bash

# 导入 logger，确保该文件与 logger.sh 在同一目录下
source ./logger.sh
# 导入 csv encoder, 确保该文件与 csv-encoder.sh 在同一目录下
source ./csv-encoder.sh
# 导入 suite test, 确保该文件与 suite-test.sh 在同一目录下
source ./suite-test.sh

function help(){
    printf "%-25s%-50s\n" "-h|--help" "information about how to use this shell script"
    printf "%-25s%-50s\n" "-e|--openharmony-dir" "the path of open harmony direction"
    printf "%-25s%-50s\n" "-t|--target-dir" "the path of target direction"
    printf "%-25s%-50s\n" "-s|--suite" "the variable suite if designate one or more benchmark suite, else default use all suite"
    printf "%-25s%-50s\n" "-l|--log-level" "debug, info, warn, error, always, off"
    printf "%-25s%-50s\n" "   --log-out" "no designate then use default.log"
    printf "%-25s%-50s\n" "   --csv-out" "no designate then use default.csv"
}

# 使用 getopt 命令做命令行参数解析器
# 使用参考链接: https://www.cnblogs.com/hit-joseph/p/12060376.html

# -o or --options 表示可接受的短选项，如ab:c::，表示可接受的短选项为 -a -b -c，其中 -a 表示不接参数，-b 表示必接参数，-c 表示参数可选
# -l or --long 表示可接受的长选项，不同的选项之间用逗号分开，冒号的意义与短选项相同
# -n or --name 表示解析错误时显示的提示脚本名称

ARGS=`getopt --options hl:o:t:s:: --longoptions help,log-level:,open-harmony-dir:,target-dir:,suite:: --name 'argument-parser.sh' -- "$@"`
if [ $? != 0 ]; then
    echo -e "\e[42;31mterminated by error paser $@\e[0m"
    exit 1
fi

# 将规范化后的命令行参数分配至位置参数（$1,$2,...)
eval set -- "${ARGS}"

echo -e "argument: \e[42;31m$@\e[0m"

while true
do
    case "$1" in
    -h|--help)
        # help information
        help
        shift
    ;;
    --log-out)
        # set log out
        openLogFile $2
        shift 2
    ;;
    -l|--log-level)
        # set log level
        setLogLevel $2
        shift 2
    ;;
    --csv-out)
        # set csv out
        openCsvFile $2
        shift 2
    ;;
    -o|--open-harmony-dir)
        # set openharmony source dir
        setOpenHarmonyDirection $2
        shift 2
    ;;
    -t|--target-dir)
        # the direction of suite parent direction
        setTargetDirection $2
        shift 2
    ;;
    -s|--suite)
        case "$2" in
        "")
            # if no designate then use all suite
            currentSuite
            shift 2;
        ;;
        *)
            addSuite $2
            currentSuite
            shift 2;
        ;;
        esac
    ;;
    --)
        shift
        break
    ;;
    *)
        echo -e "\e[1;31minternal error by $@!\e[0m"
        exit 1
    ;;
    esac
done

#
resetLogFile

# 打印信息
currentLogFile
currentLogLevel
currentCsvFile
currentOpenHarmonyDirection
currentTargetDirection

# 使用可选参数短选项(-soctane2)
# 使用可选参数长选项(-suite=octane2)]]]]
