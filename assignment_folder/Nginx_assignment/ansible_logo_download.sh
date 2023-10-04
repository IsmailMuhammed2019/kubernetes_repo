#!/bin/bash

echo " Downloading ansible logo "

sudo apt install wget
sudo wget https://logos-download.com/wp-content/uploads/2016/10/Ansible_logo.png

sudo cp Ansible_logo.png static-site-src/

sudo ls static-site-src/

echo " Task complete "
