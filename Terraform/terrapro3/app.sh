#!/bin/bash

yum install httpd wget unzip -yum

systemctl start httpd
systemctl enable httpd

wget https://www.tooplate.com/zip-templates/2076_zentro.zip

unzip -o 2076_zentro.zip

cp -r 2076_zentro/* /var/www/html/

systemctl restart httpd