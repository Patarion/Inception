#!/bin/sh

echo "MariaDB : Configuring MariaDB...";
if [ ! -d "/run/mysqld" ]; then
    echo "-> (MariaDB) Granting MariaDB daemon run permissions...";
    mkdir -p /run/mysqld;
    chown -R mysql:mysql /run/mysqld;
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "MariaDB : Installing MySQL Data Directory...";
    chown -R mysql:mysql /var/lib/mysql;

    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=$MYSQL_USER;
    sed -i "s/\r//g ; s/MYSQL_DATABASE/$MYSQL_DATABASE/g ; s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g ; s/MYSQL_USER/$MYSQL_USER/g ; s/MYSQL_ROOT_PASSWORD/$MYSQL_ROOT_PASSWORD/g" /usr/local/mysql/mysql_setup.sql;

    /usr/bin/mysqld --bootstrap < /usr/local/mysql/mysql_setup.sql;
    echo "MariaDB : MySQL configuration done.";
fi
echo "MariaDB : Allowing remote connections to MariaDB";
echo "MariaDB : listening on port 3306.";

exec "$@"