FROM webdevops/php:5.6

COPY ./provision-build.d/timezonedb.sh /opt/docker/provision/local-build.d/timezonedb.sh

# RUN bash /opt/docker/provision/build.d/php-ext-mysql.sh
