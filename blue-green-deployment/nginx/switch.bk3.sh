#!/bin/bash

NGINX_CONF="/etc/nginx/nginx.conf"
NGINX_CONF_BACKUP="${NGINX_CONF}.bak"

# 함수: Nginx 설정 파일 테스트 및 복원
nginx_conf_test() {
    nginx -t
    if [ $? -ne 0 ]; then
        echo "Nginx configuration test failed. Restoring backup."
        cp "${NGINX_CONF_BACKUP}" "${NGINX_CONF}"
        exit 1
    fi
}

# 메인 스크립트 시작
# 인자 유효성 검사 및 처리
case "$1" in
    "green")
        echo "Switching to green..."
        sed -i 's/default blue;/default green;/g' "${NGINX_CONF}"
        ;;
    "blue")
        echo "Switching to blue..."
        sed -i 's/default green;/default blue;/g' "${NGINX_CONF}"
        ;;
    *)
        echo "Usage: $0 [blue|green]"
        exit 1
        ;;
esac

# Nginx 설정 파일 테스트 및 복원
nginx_conf_test

# Nginx 재시작
nginx -s reload

# 재시작 결과 확인 및 출력
if [ $? -eq 0 ]; then
    echo "Switched to $1 successfully."
else
    echo "Failed to switch to $1. Check Nginx configuration."
    exit 1
fi

# 백업 파일 삭제
rm "${NGINX_CONF_BACKUP}"
