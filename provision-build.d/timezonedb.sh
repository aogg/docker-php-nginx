#!/usr/bin/env bash

if [[ -f "$PHP_INI_DIR/conf.d/docker-php-ext-timezonedb.ini" ]];then
    exit
fi

pecl install timezonedb 
 
docker-php-ext-enable timezonedb