#!/usr/bin/env bash


if [ -n "$FPM_LISTEN" ]; then

    sed -i -e "s%listen = 127.0.0.1:9000%listen = ${FPM_LISTEN}%g" /opt/docker/etc/php/fpm/pool.d/application.conf;

fi