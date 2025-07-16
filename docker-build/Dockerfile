ARG FROM_ARG=adockero/php-nginx:7.4-alpine-php-dev



FROM ${FROM_ARG}

ARG RUN_SH_ARG=install-swoole-4.8.sh

COPY ./docker-build/script /opt/docker/docker-build

RUN echo "RUN_SH_ARG=${RUN_SH_ARG}" \
    && ls -al /opt/docker/docker-build/ \
    && if [ -n "$RUN_SH_ARG" ]; then \
        for script in ${RUN_SH_ARG}; do \
            bash "/opt/docker/docker-build/${script}"; \
        done \
    fi \
    && echo "结束"