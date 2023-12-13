FROM debian:buster

RUN apt-get update -y && apt-get install php-fpm -y && apt-get install curl -y && apt-get install php-mysqli && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /

COPY ./tools/wp-config.php /

CMD ["./script.sh"]