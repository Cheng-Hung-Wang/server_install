#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install aptitude -y

sudo aptitude install python3-pip -y
sudo aptitude install git  -y
sudo aptitude install nginx  -y
#sudo aptitude install memcached -y

sudo locale-gen zh_TW zh_TW.UTF-8 zh_CN.UTF-8 en_US.UTF-8
export LANG=en_US.UTF-8

sudo aptitude install mysql-server -y
sudo aptitude install libmysqlclient-dev -y
sudo aptitude install phpmyadmin php-fpm php-gettext php-mbstring -y

# adjust nginx 
#sudo mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
sudo cp config/50x.html /usr/share/nginx/html/

# python3 package
sudo pip3 install -r requirement.txt --upgrade


sudo vim /etc/apt/sources.list
# add two line (deb, deb-src)
#deb http://ppa.launchpad.net/pi-rho/dev/ubuntu xenial main 
#deb-src http://ppa.launchpad.net/pi-rho/dev/ubuntu xenial main 
sudo apt-add-repository ppa3:pi-rho/dev
sudo apt-get update
sudo apt-get build-dep vim -y
sudo apt-get source vim
cd vim-*  # it will be vim-7.4.something

sudo dpkg-buildpackage -us -uc
cd ..
sudo aptitude purge vim 
sudo dpkg -i vim-gnome_*_amd64.deb vim-common_*_amd64.deb vim-gui-common_*_all.deb vim-runtime_*_all.deb

vim --version | grep "+python3"`
#rm -rf vim*

# install vim plugin
mkdir -p ~/.vim/bundle

git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
#git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim

#install jedi (python3 命令補齊)
sudo pip3 install jedi

cp .vimrc ~/.vimrc
cp .bashhead.template ~/.bashhead.template
cp .pyhead.template ~/.pyhead.template

