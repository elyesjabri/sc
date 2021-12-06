#!/bin/bash
sudo apt update -y
#### PHP 8.0 Install + dep
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install  php8.0 php8.0-gmp php8.0-bcmath php8.0-fpm php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl -y 
echo "####################################################################"
echo "########             PHP 8.0 + module install OK           #########"
echo "####################################################################"
####### Install Composer 
wget https://getcomposer.org/installer
php installer
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
echo "####################################################################"
echo "########                Composer install OK                #########"
echo "####################################################################"
######## Ngnix Install 
sudo apt install nginx -y
sudo systemctl start nginx.service
sudo systemctl enable nginx.service
usermod -a -G www-data $USER
echo "####################################################################"
echo "########                  NGINX  install OK                #########"
echo "####################################################################"
######## Madiadb install 
sudo apt install mysql-server -y
######### PhpMyAdmin install 
#sudo apt install phpmyadmin -y
echo "####################################################################"
echo "########                   MysqL install OK                #########"
echo "####################################################################"
############ Install certbot for ngnix and Letsecnryptssl
sudo apt install letsencrypt -y
sudo apt install python3-certbot-nginx -y
echo "####################################################################"
echo "########              letsencrypt install OK               #########"
echo "####################################################################"
