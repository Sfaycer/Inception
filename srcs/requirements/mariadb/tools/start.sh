#! /bin/bash
#connecting database to wordpress
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf

#Creating init-file for mysqld to start with
echo "CREATE DATABASE IF NOT EXISTS ${DB_DATABASE};" > /my-init
echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" >> /my-init
echo "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';" >> /my-init
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" >> /my-init

#Those services create mysqld socket
service mysql start
killall mysqld

#Start mysql daemon
mysqld --init-file=/my-init
