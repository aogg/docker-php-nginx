#!/bin/ash

sed -i -e "s%<DOCUMENT_INDEX>%`echo $DOCUMENT_INDEX`%g" /opt/docker/etc/nginx/vhost.common.d/10-location-root.conf
sed -i -e "s%<SERVICE_NGINX_CLIENT_MAX_BODY_SIZE>%`echo $SERVICE_NGINX_CLIENT_MAX_BODY_SIZE`%g" /opt/docker/etc/nginx/vhost.common.d/10-general.conf


exec /usr/local/openresty/bin/openresty -g "daemon off;" $@