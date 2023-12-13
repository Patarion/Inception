FROM debian:buster

RUN apt-get update && apt-get install mariadb-server -y && rm -rf /var/lib/apt/lists/*

COPY ./tools/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/mysql_setup.sql /usr/local/mysql/mysql_setup.sql
COPY ./tools/install_db.sh /usr/local/bin/

RUN test -f /etc/mysql/mariadb.conf.d/50-server.cnf && \
    chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

RUN test -f /usr/local/mysql/mysql_setup.sql && \
    sed -i 's/\r//g' /usr/local/mysql/mysql_setup.sql

RUN test -f /usr/local/bin/install_db.sh && \
    sed -i 's/\r//g' /usr/local/bin/install_db.sh && \
    chmod +x /usr/local/bin/install_db.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/install_db.sh" ]

CMD [ "/usr/bin/mysqld", "--console" ]