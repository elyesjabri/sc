#!/bin/bash
        git clone git@gitlab.com:elitech-ecole/adgeducation-vitrine.git
        mv adgeducation-vitrine adgeducation
        sudo mv adgeducation /var/www/
        sudo chgrp www-data /var/www/adgeducation -R
        sudo chmod g+rwxs /var/www/adgeducation -R
        cd /var/www/adgeducation
        composer install
        php bin/console doctrine:database:create
        php bin/console doctrine:migrations:migrate
        cd ..