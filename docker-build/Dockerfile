ARG FROM_ARG=adockero/php-nginx:7.4-alpine-php-dev

ARG RUN_SH_ARG=install-swoole-4.8.sh


FROM ${FROM_ARG}


COPY ./docker-build/script /opt/docker/docker-build

RUN echo "RUN_SH_ARG=${RUN_SH_ARG}" \
    && ls -al /opt/docker/docker-build/ \
    && bash "/opt/docker/docker-build/${RUN_SH_ARG}" \
    && echo "结束"