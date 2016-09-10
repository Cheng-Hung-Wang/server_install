#!/usr/bin/env bash


sudo vim /etc/php/7.0/fpm/php.ini
# add this line
# cgi.fix_pathinfo=0
sudo ln -fs /usr/share/phpmyadmin/ /usr/share/nginx/html/phpmyadmin
sudo cp config/default /etc/nginx/sites-available/default

sudo /etc/init.d/php7.0-fpm restart
sudo /etc/init.d/nginx restart


