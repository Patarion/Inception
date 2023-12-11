FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y

COPY ./tool/50-server.conf /etc/mysql/mariadb.conf.d/

COPY ./tools/script.sh /

CMD ["/script.sh"]