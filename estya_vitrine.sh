sudo apt update -y 
#### PHP 8.0 Install + dep
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.0 -y
sudo apt install php8.0-common php8.0-mysql php8.0-xml php8.0-xmlrpc php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip php8.0-intl -y
sudo apt install php8.0-fpm -y
sudo apt install php8.0-bcmath -y
sudo apt install php8.0-gmp -y 
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
########### User Creation For PhpMyadmin
sudo mysql -u root -p
CREATE USER 'superuser'@'localhost' IDENTIFIED BY 'superuser@phpmyadmin';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost' WITH GRANT OPTION;
########### User Creation For WebSite DB
sudo mysql -u root -p
CREATE USER 'estyadbuser'@'localhost' IDENTIFIED BY 'Estyafr2021**';
GRANT ALL PRIVILEGES ON *.* TO 'estyadbuser'@'localhost' WITH GRANT OPTION;
############ Install certbot for ngnix and Letsecnryptssl
sudo apt install letsencrypt -y
sudo apt install python3-certbot-nginx -y
******************************************************
******************************************************
#sudo certbot --nginx  - d 
sudo certbot --nginx certonly
sudo certbot --nginx -d  vitrine.australiacentral.cloudapp.azure.com
############ Clone Code Repo
##cd
git clone https://gitlab.com/elitech-ecole/estya-vitrine.git
cd estya-vitrine
############ move phpmyadmin snippet config to ngnix
sudo mv ngxconfig/phpmyadmin.conf /etc/nginx/snippets/phpmyadmin.conf
############ move ngnix config file
sudo rm -rf * /etc/nginx/sites-available/
sudo rm -rf * /etc/nginx/sites-enabled/
mv ngxconfig/default.conf  /etc/nginx/sites-available/ 
sudo ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/  
############ move sql backup folder 
mv 
############ move code to root html 
cd ..
sudo mv  estya-vitrine/ /var/www/html/estya
cd /var/www/html/estya
############ build project 
composer install
composer update 
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate
################ CHMOD 
chmod 777 /var/www/html/estya/ -R
############ Restore SQL backup

############ From Dev to Prod .env file 

php bin/console cache:clear --env=prod --no-debug
####################################################################### 

