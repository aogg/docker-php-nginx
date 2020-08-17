#!/usr/bin/env bash


if [ -z $1 ];then
    exit;
fi

GIT_HTTP_URL=$1
GIT_BRANCH=${2:-'master'}

git init || ls .git
git remote rm origin || echo '删除原有分支';
git remote add origin $GIT_HTTP_URL;
git fetch origin || git clone -b $GIT_BRANCH ${GIT_HTTP_URL} . || echo '克隆代码';
git checkout . || echo 'checkout'
git reset --hard origin/$GIT_BRANCH || echo '还原代码'
git branch -f $GIT_BRANCH || git checkout $GIT_BRANCH
git pull -f origin $GIT_BRANCH
