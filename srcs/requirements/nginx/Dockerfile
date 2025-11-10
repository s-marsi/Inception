FROM debian:bullseye


# RUN apt-get update && apt-get install -y nginx openssl && \
#     mkdir -p /etc/nginx/certs && \
#     openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
#     -keyout /etc/nginx/certs/key.pem -out /etc/nginx/certs/cert.pem \
#     -subj "/CN=smarsi.42.fr" && rm /etc/nginx/sites-enabled/default \
#     && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y nginx openssl && \
mkdir -p /etc/ssl/certs/ && \
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/certs/smarsi.42.fr.key -out /etc/ssl/certs/smarsi.42.fr.cert \
-subj "/CN=smarsi.42.fr" && \
rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html/wordpress/

COPY conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

RUN chmod 777 /etc/nginx/sites-enabled/nginx.conf

CMD ["nginx", "-g", "daemon off;"]