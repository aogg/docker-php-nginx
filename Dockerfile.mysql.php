FROM webdevops/php:5.6

COPY ./provision-build.d/php-ext-mysql.sh /opt/docker/provision/build.d/php-ext-mysql.sh
RUN bash /opt/docker/provision/build.d/php-ext-mysql.sh
