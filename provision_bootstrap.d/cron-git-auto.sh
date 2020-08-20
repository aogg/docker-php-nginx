#!/usr/bin/env bash

chmod +x ./script/git-auto.sh;
if [ $GIT_URL ];then

  docker-cronjob ${CRON_FREQ:-'* * * * *'}' application ./script/git-auto.sh $GIT_URL ${GIT_BRANCH:-master} $SSH_KEY $SSH_FILE_NAME 2>&1 /docker.stdout'
  
fi
