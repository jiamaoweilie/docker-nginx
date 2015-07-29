FROM ubuntu:14.04

MAINTAINER wei 20150629

RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    chown -R www-data:www-data /var/lib/nginx

ADD run.sh /run.sh

ADD nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /*.sh

VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

WORKDIR /etc/nginx

CMD ["/run.sh"]

EXPOSE 80 

