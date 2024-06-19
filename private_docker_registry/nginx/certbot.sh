#!/bin/bash

# 필요한 경로를 변수로 설정
CERTBOT_ETC_DIR='letsencrypt'

# 도메인과 이메일 주소 설정
DOMAIN='registry.sangchul.kr'
EMAIL='admin@sangchul.kr'

# letsencrypt 디렉토리 생성
mkdir $CERTBOT_ETC_DIR

# Docker 컨테이너 실행을 통해 Let's Encrypt 인증서 발급 및 갱신
docker run -it --rm --name certbot \
    -v "$CERTBOT_ETC_DIR:/etc/letsencrypt" \
    certbot/certbot certonly \
    -d "$DOMAIN" \
    --email "$EMAIL" \
    --manual --preferred-challenges dns \
    --agree-tos
