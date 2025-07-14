#!/usr/bin/env bash

apk add --no-cache libstdc++ && \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS curl-dev openssl-dev pcre-dev pcre2-dev zlib-dev


cd /tmp \
&& pecl download swoole-4.8.13 \
&& mkdir -p /usr/src/php/ext/swoole \
&& tar -xzf ./swoole-4.8.13.tgz --strip-components=1 -C /usr/src/php/ext/swoole \
&& docker-php-ext-configure swoole \
        --enable-http2   \
        --enable-mysqlnd \
        --enable-openssl \
        --enable-sockets --enable-swoole-curl --enable-swoole-json \
&& docker-php-ext-install -j$(nproc) swoole \
&& rm -rf /tmp/* \
&& rm -f $HOME/.composer/*-old.phar