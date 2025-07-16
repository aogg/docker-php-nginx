#!/usr/bin/env bash


apk add --no-cache boost

cd /usr/src/php/ext/
git clone https://github.com/swoole/yasd.git
cd yasd

echo "开始编译yasd"

docker-php-ext-configure yasd
docker-php-ext-install -j$(nproc) yasd

rm -rf /tmp/* 
rm -f $HOME/.composer/*-old.phar
