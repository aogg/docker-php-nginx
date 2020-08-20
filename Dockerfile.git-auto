FROM webdevops/php:7.2

COPY ./provision_bootstrap.d/cron-git-auto.sh /opt/docker/provision/bootstrap.d/cron-git-auto.sh
COPY ./provision_bootstrap.d/script/git-auto.sh /opt/docker/provision/bootstrap.d/script/git-auto.sh

COPY ./provision_entrypoint.d/docker-run-bootstrap.sh /opt/docker/provision/entrypoint.d/docker-run-bootstrap.sh
