#!/usr/bin/env bash

# 检测是否有其他git命令在更新
git_num=`cat /proc/*/cmdline |grep -a 'git-auto.sh' | wc -l`;
if [[ $git_num > 2 ]];then
    echo '检测有其他git命令在更新, '$git_num;
    exit;
fi

chown application:application ${GIT_DIR:-/app}
source /opt/docker/provision/bootstrap.d/script/source.sh >> /docker.stdout 2>&1
su -c '/opt/docker/provision/bootstrap.d/script/git-auto.sh "$GIT_URL" ${GIT_BRANCH:-master} ${GIT_DIR:-/app} "$SSH_KEY" $SSH_FILE_NAME ' application >> /docker.stdout 2>&1
