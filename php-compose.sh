#!/bin/bash
sudo apt update -y
#### PHP 8.0 Install + dep
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install  php8.0 php8.0-gmp php8.0-bcmath php8.0-fpm php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl -y 
####### Install Composer 
wget https://getcomposer.org/installer
php installer
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer
######## Ngnix Install 
sudo apt install nginx -y
sudo systemctl start nginx.service
sudo systemctl enable nginx.service
######## Madiadb install 
sudo apt install mysql-server -y
sudo mysql_secure_installation
######### PhpMyAdmin install 
sudo apt install phpmyadmin -y
########### User SQL Creation 
echo "CREATE USER 'dbamaster'@'localhost' IDENTIFIED BY 'dbamaster_estyaserver';
GRANT ALL PRIVILEGES ON *.* TO 'dbamaster'@'localhost' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS `db_estya`;
GRANT ALL ON `db_estya`.* TO 'dbamaster'@'%';
CREATE DATABASE IF NOT EXISTS `db_adg`;
GRANT ALL ON `db_adg`.* TO 'dbamaster'@'%';
CREATE DATABASE IF NOT EXISTS `db_eduhorizons`;
GRANT ALL ON `db_eduhorizons`.* TO 'dbamaster'@'%';
CREATE DATABASE IF NOT EXISTS `db_training`;
GRANT ALL ON `db_training`.* TO 'dbamaster'@'%';" > init.sql
sudo mysql -u root <init.sql
############ Install certbot for ngnix and Letsecnryptssl
sudo apt install letsencrypt -y
sudo apt install python3-certbot-nginx -y
******************************************************
******************************************************
############ move phpmyadmin snippet config to ngnix
sudo echo "server {
     
     include snippets/phpmyadmin.conf;
     server_name  FQDN SERVER;

     error_log /var/log/nginx/error.log;

     root  /var/www/html/estya/public/;
     index index.html index.php;

     client_max_body_size 100M;

     location / {
         try_files $uri $uri/ /index.php?$args;
     }

     location = /favicon.ico {
         log_not_found off;
         access_log off;
     }

     location ~ \.php$ {
         try_files $uri =404;
         fastcgi_split_path_info ^(.+.php)(/.+)$;
         fastcgi_pass unix:/run/php/php-fpm.sock;
         fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
         fastcgi_param DOCUMENT_ROOT $realpath_root;
         fastcgi_read_timeout 3600;
         fastcgi_index index.php;
         fastcgi_buffers 16 16k;
         fastcgi_buffer_size 32k;
         include fastcgi_params;
         internal;
     }}" > /etc/nginx/snippets/phpmyadmin.conf
############ move ngnix config file
sudo rm -rf  /etc/nginx/sites-available/*
sudo rm -rf  /etc/nginx/sites-enabled/*
mv ngxconfig/default.conf  /etc/nginx/sites-available/ 
sudo ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/  