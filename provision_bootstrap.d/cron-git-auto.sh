#!/usr/bin/env bash

chmod +x /opt/docker/provision/bootstrap.d/script/git-auto.sh;
if [ $GIT_URL ];then

  docker-cronjob ${CRON_FREQ:-'* * * * *'}" root su -c '/opt/docker/provision/bootstrap.d/script/git-auto.sh \"\$GIT_URL\" \${GIT_BRANCH:-master} \${GIT_DIR:-/app} \"\$SSH_KEY\" \$SSH_FILE_NAME ' application  1>& /docker.stdout 2>& /docker.stderr"
  
fi
