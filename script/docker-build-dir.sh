#!/usr/bin/env bash

if [ -z "$2"];then
    exit;
fi

dirPath=$1;
buildArgArr=(${2//\|/});


cd $dirPath;
for i in ${buildArgArr[@]}
do
    . $i
done    


