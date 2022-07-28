#!/usr/bin/env bash


if [[ -n "$LOCAL_USER_ENV" ]];then

    if [[ -z "$(id $LOCAL_USER_ENV)" ]];then

        if [[ -z "$LOCAL_USER_NUM_ENV" ]];then
            LOCAL_USER_NUM_ENV=$LOCAL_USER_ENV;
        fi

        userdel application;
        addgroup -g $LOCAL_USER_NUM_ENV $LOCAL_USER_ENV;
        #  adduser -S -D -u 1000 -h /var/cache/www -s /bin/sh -G www www;
        adduser -S -D -u $LOCAL_USER_NUM_ENV -h /var/cache/$LOCAL_USER_ENV -s /bin/sh -G $LOCAL_USER_ENV $LOCAL_USER_ENV;
    fi;
fi;
