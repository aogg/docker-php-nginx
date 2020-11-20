#ARG TAG=latest
#FROM webdevops/php:${TAG}
FROM webdevops/php-nginx:7.2-alpine

RUN apk add --no-cache nginx-mod-http-lua

COPY ./nginx-conf.d/nginx-lua.conf /opt/docker/etc/nginx/nginx.conf

# RUN apt-get update \ 
#     && apt-get install -y --no-install-recommends libnginx-mod-http-lua \     
#     && rm -rf /var/lib/apt/lists/*