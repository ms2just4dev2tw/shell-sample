#!/bin/bash

# 日志文件
DEFAULT_LOG_FILE='default.log'
log_file=${DEFAULT_LOG_FILE}

# 日志等级字符串
LOG_LEVEL_DEBUG='debug'
LOG_LEVEL_INFO='info'
LOG_LEVEL_WARN='warn'
LOG_LEVEL_ERROR='error'
LOG_LEVEL_ALWAYS='always'
LOG_LEVEL_OFF='off'

# 默认的日志等级: info
DEFAULT_LOG_LEVEL=2

# 日志级别 debug-1, info-2, warn-3, error-4, always-5, 大于日志等级有效值默认为关闭日志
log_level=${DEFAULT_LOG_LEVEL}

# 调试日志
function log_debug(){
    prefix="[DEBUG] $(date '+%Y-%m-%d %H:%M:%S')"
    message="$@"
    [ ${log_level} -le 1  ] && echo "${prefix} ${message}" >> ${log_file} && echo -e "\e[1;37m${prefix}\e[0m ${message}"
}

# 信息日志
function log_info(){
    prefix="[INFO] $(date '+%Y-%m-%d %H:%M:%S')"
    message="$@"
    [ ${log_level} -le 2  ] && echo "${prefix} ${message}" >> ${log_file} && echo -e "\e[1;36m${prefix}\e[0m ${message}"
}

# 警告日志
function log_warn(){
    prefix="[INFO] $(date '+%Y-%m-%d %H:%M:%S')"
    message="$@"
    [ ${log_level} -le 3  ] && echo "${prefix} ${message}" >> ${log_file} && echo -e "\e[1;33m${prefix}\e[0m ${message}"
}

# 错误日志
function log_error(){
    prefix="[INFO] $(date '+%Y-%m-%d %H:%M:%S')"
    message="$@"
    [ ${log_level} -le 4  ] && echo "${prefix} ${message}" >> ${log_file} && echo -e "\e[1;31m${prefix}\e[0m ${message}"
}

# 一直都会打印的日志
function log_always(){
    prefix="[INFO] $(date '+%Y-%m-%d %H:%M:%S')"
    message="$@"
    [ ${log_level} -le 5  ] && echo "${prefix} ${message}" >> ${log_file} && echo -e "\e[1;32m${prefix}\e[0m ${message}"
}

# 打开日志文件
function openLogFile(){
    fileName=$1

    if [ "${fileName}" != "" ]; then
        log_file=${fileName}
    else
        log_error '调用 openLogFile 方法时没有传入参数'
    fi
}

function currentLogFile() {
    message=$(printf "%-15s%s" "|log out" "|${log_file}")
    log_info "${message}"
}

# 覆盖日志文件
function resetLogFile(){
    echo -n "" > ${log_file}
}

# 设置日志等级
function setLogLevel(){
    logLevelStr=$1

    # 检验输入参数
    if [ "${logLevelStr}" = "${LOG_LEVEL_DEBUG}" ]; then
        log_level=1
    elif [ "${logLevelStr}" = "${LOG_LEVEL_INFO}" ]; then
        log_level=2
    elif [ "${logLevelStr}" = "${LOG_LEVEL_WARN}" ]; then
        log_level=3
    elif [ "${logLevelStr}" = "${LOG_LEVEL_ERROR}" ]; then
        log_level=4
    elif [ "${logLevelStr}" = "${LOG_LEVEL_ALWAYS}" ]; then
        log_level=5
    elif [ "${logLevelStr}" = "${LOG_LEVEL_OFF}" ]; then
        log_level=6
    else
        log_error '调用 setLogLevel 时没有传入参数'
    fi
}

# 打印当前的有效日志等级
function currentLogLevel(){
    if [ ${log_level} -le 1 ]; then
        message=$(printf "%-15s%s" "|log level" "|${LOG_LEVEL_DEBUG}")
    elif [ ${log_level} -le 2 ]; then
        message=$(printf "%-15s%s" "|log level" "|${LOG_LEVEL_INFO}")
    elif [ ${log_level} -le 3 ]; then
        message=$(printf "%-15s%s" "|log level" "|${LOG_LEVEL_WARN}")
    elif [ ${log_level} -le 4 ]; then
        message=$(printf "%-15s%s" "|log level" "|${LOG_LEVEL_ERROR}")
    elif [ ${log_level} -le 5 ]; then
        message=$(printf "%-15s%s" "|log level" "|${LOG_LEVEL_ALWAYS}")
    else
        message=$(printf "%-15s%s" "|log level" "|${LOG_LEVEL_OFF}")
    fi

    log_info "${message}"
}
