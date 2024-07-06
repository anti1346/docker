#!/bin/bash

NGINX_CONF="/etc/nginx/nginx.conf"
BACKUP_SUFFIX=".bak"
DEFAULT_BACKEND="blue"
NEW_BACKEND=""

# 인자 확인
if [ "$1" == "green" ]; then
    NEW_BACKEND="green"
elif [ "$1" == "blue" ]; then
    NEW_BACKEND="blue"
else
    echo "Usage: $0 [blue|green]"
    exit 1
fi

# 백업 파일 생성
backup_file="$NGINX_CONF$BACKUP_SUFFIX"
cp $NGINX_CONF $backup_file

# 설정 변경
sed -i "s/default $DEFAULT_BACKEND;/default $NEW_BACKEND;/g" $NGINX_CONF

# 설정 파일의 유효성 검사
nginx -t
if [ $? -ne 0 ]; then
    echo "Nginx configuration test failed. Restoring backup."
    cp $backup_file $NGINX_CONF
    exit 1
fi

# Nginx 재시작
nginx -s reload
if [ $? -ne 0 ]; then
    echo "Failed to reload Nginx configuration. Restoring backup."
    cp $backup_file $NGINX_CONF
    exit 1
fi

# 백업 파일 삭제
rm $backup_file

echo "Switched to $NEW_BACKEND successfully."
exit 0
