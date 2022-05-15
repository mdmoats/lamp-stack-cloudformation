#!/bin/bash -xe

# Download and install Wordpress
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress /var/www/html
