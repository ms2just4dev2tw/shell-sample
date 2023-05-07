#!/bin/bash

# 导入 logger，确保该文件与 logger.sh 在同一目录下
source ./logger.sh
# 导入 csv encoder, 确保该文件与 csv-encoder.sh 在同一目录下
source ./csv-encoder.sh

# 所有的测试套变量
SUITE_OCATNE2=octane2
SUITE_SNIPPETS=snippets
SUITE_SUNSPIDER=sunspider
SUITE_KRAKEN=kraken
SUITE_JETSTREAM_ES5=jetstream-es5
SUITE_HVM_BENCH=hvm-bench

DEFAULT_SUITE_ARR="${SUITE_OCATNE2} ${SUITE_SNIPPETS} ${SUITE_SUNSPIDER} ${SUITE_KRAKEN} ${SUITE_JETSTREAM_ES5} ${SUITE_HVM_BENCH}"

suite_arr=${DEFAULT_SUITE_ARR}

# 设置 harmony 的路径
Default_OpenHarmony_Dir="/home/dongwangcp/repos/OpenHarmony"
openharmony_dir=${Default_OpenHarmony_Dir}

# 设置库依赖
export LD_LIBRARY_PATH=${Default_OpenHarmony_Dir}/out/hi3516dv300/clang_x64/ark/ark:${Default_OpenHarmony_Dir}/out/hi3516dv300/clang_x64/ark/ark_js_runtime:${Default_OpenHarmony_Dir}/out/hi3516dv300/clang_x64/thirdparty/icu:${Default_OpenHarmony_Dir}/prebuilts/clang/ohos/linux-x86_64/llvm/lib

# 测试套父目录路径
DEFAULT_TARGET_DIR="not set path"
target_dir=${DEFAULT_TARGET_DIR}

# 将测试用例的结果用关联数组保存, 使用关联数组前需要先定义, bash 4.o 版本才支持关联数组
declare -A suiteResultMap


# 设置 OpenHarmony 的路径
function setOpenHarmonyDirection() {
    openharmony_dir=$1
    export LD_LIBRARY_PATH=${openharmony_dir}/out/hi3516dv300/clang_x64/ark/ark:${openharmony_dir}/out/hi3516dv300/clang_x64/ark/ark_js_runtime:${openharmony_dir}/out/hi3516dv300/clang_x64/thirdparty/icu:${openharmony_dir}/prebuilts/clang/ohos/linux-x86_64/llvm/lib
}

function currentOpenHarmonyDirection() {
    message=$(printf "%-15s%s" "|harmony dir" "|${openharmony_dir}")
    log_info "${message}"
}

# 向 suiteArr 添加 suite
function appendSuite() {
    if [ ${suiteArr} = ${Default_Suite_Arr} ]; then
        suite=$@
    else
        suite="${suiteArr} $@"
    fi
}

function currentSuite() {
    message=$(printf "%-15s%s" "|suite array" "|${suite_arr}")
    log_info "${message}"
}

# 设置测试套的父目录路径
function setTargetDirection() {
    targetDir=$1

    if [ "${targetDir}" != "" ]; then
        target_dir=${targetDir}
    else
        log_error "调用 setTargetDirection 没有传入参数"
    fi
}

function currentTargetDirection() {
    message=$(printf "%-15s%s" "|target dir" "|${target_dir}")
    log_info "${message}"
}

# 运行测试套
function runSuite() {
    for suite in $suiteArr
    do
        runSuiteCase suite
    done
}

# 以当进程的方式运行测试用例
function runSuiteCase() {
    # 找出 dir_target 下的所有 <target.js> 文件
    cd $dir_target
    filename_list=$(ls | grep "**.js")

    for target_js in $filename_list
    do
        log_info "the filename of target is "$dir_target/$target_js
    done

    for target_js in $filename_list
    do
        log_info "start compiler js file [${target_js}]"
        ret=$(node --expose-gc $dir_openharmony/out/hi3516dv300/clang_x64/ark/ark/build/src/index.js $dir_target/$target_js)
  
        if test $ret"x" != ""x
        then
            log_err $ret
        else
            log_info "["$target_js"] compiler completed"
        fi
  
        log_info ""
  
        target_abc=${target_js%.*}.abc
  
        log_info "start run abc exec file ["$target_abc"]"
        start=$(expr $(date "+%s") \* 1000 + $(date "+%N") / 1000000)
        $dir_openharmony/out/hi3516dv300/clang_x64/ark/ark_js_runtime/ark_js_vm $dir_target/$target_abc >> $LOG_FILE
        end=$(expr $(date "+%s") \* 1000 + $(date "+%N") / 1000000)

        ret_run=$(($end-$start))
        log_info "runtime: "$ret_run"ms"
        log_info "===================================================================================================="
    done
}

# 以多进程的方式运行测试用例
function runSuiteCaseByMultiProcessor() {

}
