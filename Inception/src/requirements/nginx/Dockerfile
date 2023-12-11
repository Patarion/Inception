FROM debian:buster

RUN apt-get update && apt-get install -y nginx

COPY ./tool/script.sh /

CMD ["/script.sh"]