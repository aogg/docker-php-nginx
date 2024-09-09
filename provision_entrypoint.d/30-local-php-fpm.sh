#!/usr/bin/env bash


if [ -n "$FPM_LISTEN" ]; then
    echo "替换fpm端口----$FPM_LISTEN";

    sed -i -e "s%listen = 127.0.0.1:9000%listen = ${FPM_LISTEN}%g" /opt/docker/etc/php/fpm/pool.d/application.conf;
    sed -i -e "s%listen = \[::\]:9000%listen = ${FPM_LISTEN}%g" /opt/docker/etc/php/fpm/pool.d/application.conf;

    sed -i -e "s%listen = \[::\]:9000%listen = ${FPM_LISTEN}%g" /usr/local/etc/php-fpm.d/application.conf;

fi