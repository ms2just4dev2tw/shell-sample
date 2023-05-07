#!/bin/bash
# csv 文件的 shell 版本的编码器

# 导入 logger，确保该文件与 logger.sh 在同一目录下
source ./logger.sh

# CSV 文件默认的分隔符 ,
DEFAULT_DELIMITER=','

# 打开的 CSV 文件
DEFAULT_CSV_FILE='default.csv'
csv_file=${DEFAULT_CSV_FILE}

# 打开指定的文件
function openCsvFile(){
    fileName=$1

    if [ "${fileName}" != "" ]; then
        csv_file=${fileName}
    else
        log_error '调用 openCsvFile 方法时没有传入参数'
    fi
}

function currentCsvFile() {
    message=$(printf "%-15s%s" "|csv out" "|${csv_file}")
    log_info "${message}"
}

# 重置 CSV 文件
function resetCsvFile(){
    echo -n "" >> ${csv_file}
}

#====================================================================================================
# 向 csv 文件写入数据
#====================================================================================================

# 写入 csv 文件的首部
function writeHeader(){
    # 从参数获取所有首部字段
    fieldArr=$@
    
    # 如果首部字段的第一个字段不为空就写入数据
    if [ "${fieldArr[0]}" != "" ]; then
        writeCsvData ${fieldArr[0]}
    else
        log_error '调用 writeHeader 时没有传入参数'
    fi

    # 将首部字段除第一个字段外的其他字段写入文件
    for((i=1; i<=${#fieldArr[*]}; i++))
    do
        writeDelimiter
        writeCsvData ${fieldArr[i]}
    done
}

# 向 csv 文件写入一行数据
function writeLine(){
    # 从参数获取一行的数据
    valueArr=$@

    # 如果行数据的第一个数据不为空就写入数据
    if [ "${valueArr[0]}" != "" ]; then
        writeCsvData ${valueArr[0]}
    else
        log_error '调用 writeLine 时没有传入参数'
    fi

    # 将行数据除第一个数据外的其他数据写入文件
    for((i=1; i<=${#valueArr[*]}; i++))
    do
        writeDelimiter
        writeCsvData ${valueArr[i]}
    done
}

# 向 csv 文件写入分隔符，默认为 DEFAULT_DELIMITER
function writeDelimiter(){
    writeCsvData ${DEFAULT_DELIMITER}
}

# 向 csv 文件写入一个数据
function writeCsvData(){
    # 从参数获取数据
    value=$1

    # 如果数据不为空就写入数据
    if [ "${value}" != "" ]; then
        echo "${value}" >> ${csv_file}
    else
        log_error '调用 writeCsvData 时没有传入参数'
    fi
}
