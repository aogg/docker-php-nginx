#!/usr/bin/env bash

chmod +x ./script/git-auto.sh;
docker-cronjob ${CRON_FREQ:-'* * * * *'}' application ./script/git-auto.sh 2>&1 /docker.stdout'
