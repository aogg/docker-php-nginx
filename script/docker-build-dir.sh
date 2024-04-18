#!/usr/bin/env bash

# 运行$1目录下的多个脚本
# 需要第二个参数存在才能运行
if [ -z "$2" ]; then
    exit;
fi

dirPath=$1;
buildArgArr=${2//;/$'\n'};


cd $dirPath;

for i in ${buildArgArr[@]}
do
    if [[ -n "$i" && -f "$i" ]];then
        echo 'run   '$i
        . $i
    fi
done    


