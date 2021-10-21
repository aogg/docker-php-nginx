ARG TAG="php-nginx:latest"
#FROM webdevops/php:${TAG}
FROM adockero/${TAG}



RUN set -x \
    && if [ -n "$(which apt)" ]; then \
      apt-get update; \ 
      apt-get install -y --no-install-recommends libnginx-mod-http-lua; \     
      rm -rf /var/lib/apt/lists/*; \
    elif [ -n "$(which apk)" ]; then \
      apk add --no-cache nginx-mod-http-lua; \
    fi


COPY ./nginx-conf.d/nginx-lua.conf /opt/docker/etc/nginx/nginx.conf   
# 下面才是正确的    
COPY ./nginx-conf.d/nginx-lua.conf /etc/nginx/nginx.conf    
    
