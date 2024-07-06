#!/bin/bash

NGINX_CONF=/etc/nginx/nginx.conf

if [ "$1" == "green" ]; then
    echo "Switching to green..."
    sed -i 's/default blue;/default green;/g' $NGINX_CONF
elif [ "$1" == "blue" ]; then
    echo "Switching to blue..."
    sed -i 's/default green;/default blue;/g' $NGINX_CONF
else
    echo "Usage: switch.sh [blue|green]"
    exit 1
fi

nginx -s reload