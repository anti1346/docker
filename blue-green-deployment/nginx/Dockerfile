# Base 이미지 설정
FROM nginx:latest

# Nginx 설정 파일 복사
COPY ./nginx.conf /etc/nginx/nginx.conf

# 스위치 스크립트 복사 및 실행 권한 부여
COPY ./switch.sh /apps/switch.sh
RUN chmod +x /apps/switch.sh

# 컨테이너가 시작될 때 실행할 명령
CMD ["nginx", "-g", "daemon off;"]
