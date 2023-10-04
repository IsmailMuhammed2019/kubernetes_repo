#!/bin/bash

# Declaring variable
WEBFILE_DIR="02/webfiles/*"


echo "Deleting html template files"
sudo rm -rf $WEBFILE_DIR

echo "All files deleted."