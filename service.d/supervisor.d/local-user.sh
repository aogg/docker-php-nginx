#!/usr/bin/env bash

# 莫名奇妙好像经常会变
# adduser [--home DIR] [--shell SHELL] [--no-create-home] [--uid ID]
# [--firstuid ID] [--lastuid ID] [--gecos GECOS] [--ingroup GROUP | --gid ID]
# [--disabled-password] [--disabled-login] [--add_extra_groups] USER
#    Add a normal user

# adduser --system [--home DIR] [--shell SHELL] [--no-create-home] [--uid ID]
# [--gecos GECOS] [--group | --ingroup GROUP | --gid ID] [--disabled-password]
# [--disabled-login] [--add_extra_groups] USER
#    Add a system user

# adduser --group [--gid ID] GROUP
# addgroup [--gid ID] GROUP
#    Add a user group

# addgroup --system [--gid ID] GROUP
#    Add a system group

# adduser USER GROUP
#    Add an existing user to an existing group

# general options:
#   --quiet | -q      don't give process information to stdout
#   --force-badname   allow usernames which do not match the
#                     NAME_REGEX configuration variable
#   --help | -h       usage message
#   --version | -v    version number and copyright
#   --conf | -c FILE  use FILE as configuration file


if [[ -n "$LOCAL_USER_ENV" ]];then

    if [[ -z "$(id $LOCAL_USER_ENV)" ]];then

        userdel application;
        if [[ -z "$LOCAL_USER_NUM_ENV" ]];then
            addgroup $LOCAL_USER_ENV;
            # LOCAL_USER_NUM_ENV=$LOCAL_USER_ENV
            adduser --ingroup $LOCAL_USER_ENV -home /var/cache/$LOCAL_USER_ENV --shell /bin/sh $LOCAL_USER_ENV
        else
            addgroup --system --gid $LOCAL_USER_NUM_ENV $LOCAL_USER_ENV;
            adduser --system --gid $LOCAL_USER_NUM_ENV --home /var/cache/$LOCAL_USER_ENV --shell /bin/sh --uid $LOCAL_USER_NUM_ENV  $LOCAL_USER_ENV 

        fi

        # addgroup --system --gid $LOCAL_USER_NUM_ENV $LOCAL_USER_ENV;
        #  adduser -S -D -u 1000 -h /var/cache/www -s /bin/sh -G www www;
        # adduser -S -D -u $LOCAL_USER_NUM_ENV -h /var/cache/$LOCAL_USER_ENV -s /bin/sh -G $LOCAL_USER_ENV $LOCAL_USER_ENV;
    fi;
fi;
