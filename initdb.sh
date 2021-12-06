#!/bin/bash
echo "
CREATE USER 'superuser'@'localhost' IDENTIFIED BY 'superuser';
GRANT ALL PRIVILEGES ON *.* TO 'superuser'@'localhost' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS db_estya;
GRANT ALL ON db_estya.* TO 'superuser'@'%';
CREATE DATABASE IF NOT EXISTS db_adg;
GRANT ALL ON db_adg.* TO 'superuser'@'%';
CREATE DATABASE IF NOT EXISTS db_eduhorizons;
GRANT ALL ON db_eduhorizons.* TO 'superuser'@'%';
CREATE DATABASE IF NOT EXISTS db_training;
GRANT ALL ON db_training.* TO 'superuser'@'%';
" > init.sql
sudo mysql -u root < init.sql