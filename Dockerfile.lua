ARG FROM_ARG="adockero/php-nginx:latest"
#FROM webdevops/php:${TAG}
FROM ${FROM_ARG}


# docker-image-info dist-codename
# 原有是最新nginx版本的
RUN set -x \
    && if [ -n "$(which apt)" ]; then \
      echo 'apt安装';\
      rm -Rf /etc/nginx/modules-enabled/*;\
      mv /etc/nginx /etc/nginx_bak; \
      apt remove -y nginx; \
      if [ -n "$(which nginx)" ]; then \
        apt autoremove -y ;\
      fi; \
      apt-get update; \ 
      wget -O - https://openresty.org/package/pubkey.gpg | apt-key add -; \
      codename=`grep -Po 'VERSION="[0-9]+ \(\K[^)]+' /etc/os-release`;\
      echo "deb http://openresty.org/package/debian $codename openresty" \
      | tee /etc/apt/sources.list.d/openresty.list;\
      apt-get update; \ 
      apt-get install -y --no-install-recommends openresty; \     
      rm -Rf /etc/nginx; \
      mv /etc/nginx_bak /etc/nginx; \
      rm -rf /var/lib/apt/lists/*; \
      rm -f /var/log/*.log; \
      if [ -z "$(id application 2> /dev/null)" ];then echo '不存在application用户';adduser --disabled-password --no-create-home --gecos "" application;fi;\
      ln -s -f /usr/local/openresty/nginx/sbin/nginx /usr/sbin/nginx; \
      ln -s /usr/local/openresty/nginx/conf/nginx.conf /opt/docker/etc/nginx/nginx.conf; \
      sed -i '/ssl\s*on;/d' /opt/docker/etc/nginx/vhost.ssl.conf; \
    elif [ -n "$(which apk)" ]; then \
      echo 'apk安装';\
      apk add --no-cache nginx-mod-http-lua; \
      if [ -z "$(id application 2> /dev/null)" ];then echo '不存在application用户';adduser --disabled-password --no-create-home --gecos "" application;fi;\
      echo 'apk结束'; \
    fi


COPY ./nginx-conf.d/nginx-lua.conf /opt/docker/etc/nginx/nginx.conf  
# 下面才是正确的    
COPY ./nginx-conf.d/nginx-lua.conf /etc/nginx/nginx.conf    
    
