#!/usr/bin/env bash

chmod +x ./script/git-auto.sh;
if [ $GIT_HTTP_URL ];then

  docker-cronjob ${CRON_FREQ:-'* * * * *'}' application ./script/git-auto.sh $GIT_HTTP_URL 2>&1 /docker.stdout'
  
fi
