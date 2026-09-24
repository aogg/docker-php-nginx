#!/usr/bin/env bash


if [ -n "$FPM_LISTEN" ]; then
    echo "替换fpm端口----$FPM_LISTEN";

    sed -i -e "s%listen = 127.0.0.1:9000%listen = ${FPM_LISTEN}%g" /opt/docker/etc/php/fpm/pool.d/application.conf;
    sed -i -e "s%listen = \[::\]:9000%listen = ${FPM_LISTEN}%g" /opt/docker/etc/php/fpm/pool.d/application.conf;

    sed -i -e "s%listen = \[::\]:9000%listen = ${FPM_LISTEN}%g" /opt/docker/etc/php/fpm/pool.d/application.conf;

    echo "更新php-fpm access.format日志格式"
    NEW_ACCESS_FORMAT='access.format = "%R - %{HTTP_HOST}e %u %t \"%m %r%Q%q\" %s %f root: %{DOCUMENT_ROOT}e cpu:%C%% mem:%{megabytes}M reqTime:%d"'
    sed -i 's/^access.format/;access.format/g' /opt/docker/etc/php/fpm/pool.d/application.conf
    sed -i "\|${NEW_ACCESS_FORMAT}|d" /opt/docker/etc/php/fpm/pool.d/application.conf
    echo "${NEW_ACCESS_FORMAT}" >> /opt/docker/etc/php/fpm/pool.d/application.conf

    service php-fpm restart

fi