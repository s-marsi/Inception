FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

WORKDIR /var/www/html/

COPY tools/* .

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf


RUN chmod 777 /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]