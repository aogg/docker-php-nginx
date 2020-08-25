#!/usr/bin/env bash

chmod +x /opt/docker/provision/bootstrap.d/script/git-auto.sh;
if [ $GIT_URL ];then
  set|grep -E '^((GIT)|(SSH_))' > /opt/docker/provision/bootstrap.d/script/source.sh
  docker-cronjob ${CRON_FREQ:-'* * * * *'}" root source /opt/docker/provision/bootstrap.d/script/source.sh && su -c '/opt/docker/provision/bootstrap.d/script/git-auto.sh \"\$GIT_URL\" \${GIT_BRANCH:-master} \${GIT_DIR:-/app} \"\$SSH_KEY\" \$SSH_FILE_NAME ' application  1>& /docker.stdout 2>& /docker.stderr"
  
fi
