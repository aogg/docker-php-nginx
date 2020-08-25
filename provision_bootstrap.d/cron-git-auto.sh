#!/usr/bin/env bash

chmod +x /opt/docker/provision/bootstrap.d/script/git-auto.sh;
chmod +x /opt/docker/provision/bootstrap.d/script/git-auto-crontab.sh;
if [ $GIT_URL ];then
  export |grep -Pzo '\n?(declare -x ((GIT)|(SSH))[^=]+="[^"]+"\n?)' > /opt/docker/provision/bootstrap.d/script/source.sh
  docker-cronjob ${CRON_FREQ:-'* * * * *'}" root /opt/docker/provision/bootstrap.d/script/git-auto-crontab.sh >> /docker.stdout 2>&1"
  
fi
