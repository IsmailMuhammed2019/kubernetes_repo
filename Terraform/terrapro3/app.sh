#!/bin/bash
apt install apache2 wget unzip -yum
systemctl start apache2
systemctl enable apache2
wget https://www.tooplate.com/zip-templates/2076_zentro.zip
unzip -o 2076_zentro.zip
cp -r 2076_zentro/* /var/www/html/
systemctl restart apache2