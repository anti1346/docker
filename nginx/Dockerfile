FROM nginx:stable

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY ./default.conf /etc/nginx/conf.d/default.conf

entrypoint.sh

CMD ["nginx", "-g", "daemon off;"]
