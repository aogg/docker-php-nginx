#!/usr/bin/env bash

chmod +x /opt/docker/provision/bootstrap.d/script/git-auto.sh;
if [ $GIT_URL ];then
  export |grep -Pzo '\n?(declare -x ((GIT)|(SSH))[^=]+="[^"]+"\n?)' > /opt/docker/provision/bootstrap.d/script/source.sh
  docker-cronjob ${CRON_FREQ:-'* * * * *'}" root source /opt/docker/provision/bootstrap.d/script/source.sh && su -c '/opt/docker/provision/bootstrap.d/script/git-auto.sh \"\$GIT_URL\" \${GIT_BRANCH:-master} \${GIT_DIR:-/app} \"\$SSH_KEY\" \$SSH_FILE_NAME ' application >> /docker.stdout 2>&1"
  
fi
