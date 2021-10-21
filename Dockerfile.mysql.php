FROM webdevops/php:5.6

RUN bash /opt/docker/provision/build.d/php-ext-mysql.sh
