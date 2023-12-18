FROM debian:buster

RUN apt-get -y update && apt-get install -y aptitude && aptitude install -y mariadb-server mariadb-client vim && rm -rf /var/lib/apt/lists/*

COPY ./tools/mysql_setup.sql /usr/local/bin/mysql_setup.sql
COPY ./tools/install_db.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/mysql_setup.sql
RUN chmod +x /usr/local/bin/install_db.sh


RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

EXPOSE 3306

#ENTRYPOINT [ "/usr/local/bin/install_db.sh" ]

CMD [ "mysqld", "--bind-address=0.0.0.0"]