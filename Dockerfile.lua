#ARG TAG=latest
#FROM webdevops/php:${TAG}
FROM webdevops/php-nginx:7.2-alpine

RUN apt update \ 
    && apt-get install -y --no-install-recommends libnginx-mod-http-lua \     
    && rm -rf /var/lib/apt/lists/*