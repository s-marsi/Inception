
FROM debian:bullseye

RUN apt-get update && apt-get install -y adminer apache2 && \
    ln -s /etc/apache2/conf-available/adminer.conf /etc/apache2/conf-enabled/ && \
    echo "ServerName localhost" >> /etc/apache2/conf-enabled/adminer.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]