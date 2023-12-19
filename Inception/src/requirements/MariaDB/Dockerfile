FROM alpine:3.18.3


RUN apk update && apk upgrade && apk add --no-cache \
    mariadb \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/script.sh /usr/local/bin/script.sh
COPY ./tools/mysql_setup.sql /usr/local/mysql/mysql_setup.sql
COPY ./conf/my.cnf /etc/my.cnf.d

RUN test -f /usr/local/bin/script.sh
RUN test -f /usr/local/mysql/mysql_setup.sql
RUN test -f /etc/my.cnf.d/my.cnf

RUN sed -i 's/\r//g' /usr/local/bin/script.sh
RUN sed -i 's/\r//g' /usr/local/mysql/mysql_setup.sql

RUN chmod +x /usr/local/bin/script.sh
RUN chmod 0444 /etc/my.cnf.d/my.cnf

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/script.sh" ]

CMD [ "/usr/bin/mysqld", "--console" ]