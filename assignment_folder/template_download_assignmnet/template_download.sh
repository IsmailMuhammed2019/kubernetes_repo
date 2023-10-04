#!/bin/bash

# Declaring variables
PACKAGES="wget unzip"
URL="https://www.tooplate.com/zip-templates/2100_artist.zip"
ART_NAME="2100_artist"
WEBFILE_DIR="02/webfiles"


# Install dependencies
echo "###########################################"
echo "packages"
echo "###########################################"
sudo apt install $PACKAGES -y > /dev/null
echo

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -rf $ART_NAME/* $WEBFILE_DIR

echo "Almost done"

echo "End"