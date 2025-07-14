ARG FROM_ARG=adockero/php-nginx:7.4-alpine-php-dev

ARG RUN_SH_ARG


FROM ${FROM_ARG}


COPY ./docker-build/script /opt/docker/docker-build

RUN bash /opt/docker/docker-build/${RUN_SH_ARG}