#!/bin/bash

# Function to execute MySQL queries
execute_mysql_query() {
    mysql -uroot -p"$MARIADB_ROOT_PASSWORD" -e "$1"
}

# Check if MySQL is installed and start the service
mysql_install_db
service mysql start

# Check if the database exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Database already exists"
else
    # Set root password non-interactively
    debconf-set-selections <<< "mysql-server mysql-server/root_password password $MARIADB_ROOT_PASSWORD"
    debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MARIADB_ROOT_PASSWORD"
	apt-get update

    # Add a root user on 127.0.0.1 to allow remote connection
    execute_mysql_query "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; FLUSH PRIVILEGES;"

    # Create a database and user in the database for WordPress
    execute_mysql_query "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    execute_mysql_query "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD'; FLUSH PRIVILEGES;"

    # Import the database in the MySQL command line
    mysql -uroot -p"$MARIADB_ROOT_PASSWORD" $MYSQL_DATABASE < /usr/local/bin/mysql_setup.sql
fi

# Stop the MySQL service
service mysql stop

# Execute the provided command
exec "$@"