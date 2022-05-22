#!/usr/bin/env bash

# npm-n可以自定义node版本   n use [版本]

if [ -n "$(which apt)" ]; then
    apt-get update;
    apt-get install -y --no-install-recommends npm;
    rm -rf /var/lib/apt/lists/*;
elif [ -n "$(which apk)" ]; then
    apk add --no-cache npm;
fi;

npm install n -g;
n lts