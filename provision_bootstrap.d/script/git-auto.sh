#!/usr/bin/env bash


if [ -z $1 ];then
    exit;
fi



GIT_URL=$1
GIT_BRANCH=${2:-'master'}
SSH_KEY=${3}
SSH_FILE_NAME=${4:-id_rsa}

# ssh的yes处理
# @see https://github.com/CoRfr/docker-git-autoupdate/blob/master/entrypoint.sh
if [ -n "$SSH_KEY" ]; then
    mkdir -p ~/.ssh/
    echo "SSH_KEY of type $SSH_FILE_NAME provided"
    echo $SSH_KEY | base64 -d -i > ~/.ssh/$SSH_FILE_NAME
fi

# Accept key for SSH
if echo $GIT_URL | grep "ssh://"; then
    ssh_host_port=$(echo $GIT_URL | cut -d@ -f2 | cut -d/ -f1)
    ssh_host=$(echo $ssh_host_port | cut -d: -f1)
    ssh_port=$(echo $ssh_host_port | cut -d: -f2)
    if [[ "$ssh_port" == "$ssh_host" ]]; then
        ssh_port=22
    fi
# Accept key for SSH (scp like format)
elif echo $GIT_URL | grep "git@"; then
    ssh_host=$(echo $GIT_URL | cut -d@ -f2 | cut -d: -f1)
    ssh_port=22
fi

if [ -n "$ssh_host" ]; then
    echo "Scanning $ssh_host $ssh_port"
    ssh_keyscan=$(ssh-keyscan -p $ssh_port $ssh_host 2>/dev/null)
    echo $ssh_keyscan > ~/.ssh/known_hosts
fi



# 正式git代码

git init || ls .git
git remote rm origin || echo '删除原有分支';
git remote add origin $GIT_URL;
git fetch origin || git clone -b $GIT_BRANCH ${GIT_URL} . || echo '克隆代码';
git checkout . || echo 'checkout'
git reset --hard origin/$GIT_BRANCH || echo '还原代码'
git branch -f $GIT_BRANCH || git checkout $GIT_BRANCH
git pull -f origin $GIT_BRANCH
