#!/usr/bin/env bash

# 运行$1目录下的多个脚本

if [ -z "$2" ]; then
    exit;
fi

dirPath=$1;
buildArgArr=${2//;/$'\n'};


cd $dirPath;

for i in ${buildArgArr[@]}
do
    . $i
done    


