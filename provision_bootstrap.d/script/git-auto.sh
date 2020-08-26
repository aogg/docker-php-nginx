#!/usr/bin/env bash


if [ -z $1 ];then
    echo 'git地址不存在';
    exit;
fi



GIT_URL=$1
GIT_BRANCH=${2:-'master'}
GIT_DIR=${3:-/app}
SSH_KEY=${4}
SSH_FILE_NAME=${5:-id_rsa}

# ssh的yes处理
# @see https://github.com/CoRfr/docker-git-autoupdate/blob/master/entrypoint.sh
if [[ -n "$SSH_KEY" && (! -f ~/.ssh/$SSH_FILE_NAME) ]]; then
    mkdir -p ~/.ssh/
    echo "SSH_KEY of type $SSH_FILE_NAME provided"
    echo "$SSH_KEY" | base64 -d -i > ~/.ssh/$SSH_FILE_NAME
fi
chmod 700 ~/.ssh/$SSH_FILE_NAME

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

if [[ -n "$ssh_host" && (! -f ~/.ssh/known_hosts) ]]; then
    echo "Scanning $ssh_host $ssh_port"
    ssh_keyscan=$(ssh-keyscan -p $ssh_port $ssh_host 2>/dev/null)
    echo $ssh_keyscan > ~/.ssh/known_hosts
fi



# 正式git代码
echo '正式更新代码' `date`;

cd $GIT_DIR
git init || ls .git
git remote rm origin || echo '删除原有分支报错';
git remote add origin $GIT_URL;
git fetch origin || git clone -b $GIT_BRANCH ${GIT_URL} . || echo '克隆代码';
# 还原
git checkout . || echo 'checkout'
git reset --hard origin/$GIT_BRANCH || echo '还原代码报错'
# 更新代码
git pull -f origin $GIT_BRANCH
git checkout -B $GIT_BRANCH $GIT_BRANCH || echo '更新代码失败';

