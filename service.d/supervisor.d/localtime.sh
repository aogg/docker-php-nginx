#!/usr/bin/env bash


if [ -n "$PHP_DATE_TIMEZONE" ];then

    file="/usr/share/zoneinfo/"$PHP_DATE_TIMEZONE
    if [ -f "$file" ]; then
        cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    fi

fi;