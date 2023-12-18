FROM debian:buster

RUN apt-get update && apt-get install -y nginx && apt-get install openssl -y && rm -rf /var/lib/apt/lists/*

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

RUN mkdir -p /run/nginx

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj '/C=CN/ST=QC/L=Quebec/O=42/OU=inception/CN=jgagnon.42.fr'

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;" ]