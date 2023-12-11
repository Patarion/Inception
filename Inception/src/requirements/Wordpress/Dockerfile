FROM debian:buster

RUN apt-get update -y && apt-get install php-fpm -y && apt-get install curl -y

COPY ./tools/script.sh /
COPY ./tools/wp-config.php /

CMD ["/scripth.sh"]