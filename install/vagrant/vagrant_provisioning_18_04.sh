#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update

# install mariadb
sudo apt-get install mariadb-server -y
sudo mysqladmin -u root password 'password'
sudo mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION; FLUSH PRIVILEGES;"
sudo mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'django'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION; FLUSH PRIVILEGES;"
sudo mysql -u root -ppassword -e "create database djangodb"


mysql_tzinfo_to_sql /usr/share/zoneinfo | sudo mysql -u root mysql

sudo service mysqld restart

# install related django
sudo apt-get install libmysqlclient-dev -y

# install pip, venv
sudo apt-get install python3-venv -y
sudo apt-get install python3-pip -y
sudo pip3 install pipenv


# install gssapi
sudo apt-get install libkrb5-dev -y


# install redis
sudo apt-get install redis-server -y
sudo service redis-server restart
sudo systemctl enable redis-server.service

# install rabbitmq
sudo apt-get install rabbitmq-server -y
sudo rabbitmq-plugins enable rabbitmq_management
sudo rabbitmq-plugins enable rabbitmq_federation
sudo rabbitmq-plugins enable rabbitmq_federation_management

# setting rabbitmq
sudo service rabbitmq-server restart


# copy celery conf


# simbol link


# install kerberos
# sudo apt-get install --no-install-recommends krb5-user libkrb5-dev libpam-krb5 libpam-ccreds auth-client-config
