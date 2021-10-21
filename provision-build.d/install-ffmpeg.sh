#!/usr/bin/env bash


if [ -n "$(which apt)" ]; then
    apt-get update;
    apt-get install -y --no-install-recommends ffmpeg;
    rm -rf /var/lib/apt/lists/*;
elif [ -n "$(which apk)" ]; then
    apk add --no-cache ffmpeg;
fi;



