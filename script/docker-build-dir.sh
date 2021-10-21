#!/usr/bin/env bash


dirPath=$1;
buildArgArr=(${2//\|/});


cd $dirPath;
for i in ${buildArgArr[@]}
do
    . $i
done    


