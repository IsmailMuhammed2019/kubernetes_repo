#!/bin/bash

yum install httpd wget unzip -y

sudo systemctl start httpd

sudo systemctl enable httpd

wget https://templatemo.com/tm-zip-files-2020/templatemo_589_lugx_gaming.zip

unzip -o templatemo_589_lugx_gaming.zip

cp -r templatemo_589_lugx_gaming/* /var/www/html

sudo systemctl restart httpd