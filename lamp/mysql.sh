#!/bin/bash

dbpass="mySQLPassw0rd"

export DEBIAN_FRONTEND=noninteractive

echo mysql-server-5.6 mysql-server/root_password password $dbpass | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password $dbpass | debconf-set-selections

apt-get update
apt-get -y install mysql-server

MYSQL=`which mysql`
Q1="CREATE DATABASE IF NOT EXISTS myDB;"
Q2="GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
Q3="CREATE USER 'root'@'%' IDENTIFIED BY 'mySQLPassw0rd';"
Q4="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"
SQL="${Q1}${Q2}${Q3}${Q4}"
$MYSQL -u root --password=mySQLPassw0rd -e "$SQL"

sudo sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo /etc/init.d/mysql restart
