#!/usr/bin/env bash

source /opt/docker/provision/bootstrap.d/script/source.sh >> /docker.stdout 2>&1
su -c '/opt/docker/provision/bootstrap.d/script/git-auto.sh "$GIT_URL" ${GIT_BRANCH:-master} ${GIT_DIR:-/app} "$SSH_KEY" $SSH_FILE_NAME ' application >> /docker.stdout 2>&1
