#!/bin/bash -xe
yum -y update
yum -y install amazon-efs-utils httpd
amazon-linux-extras install -y php7.4
systemctl start httpd
systemctl enable httpd
cd /tmp
wget https://raw.githubusercontent.com/mdmoats/lamp-stack-cloudformation/main/mysql_pubkey.asc
rpm --import mysql_pubkey.asc
rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum -y install mysql-community-client
rm /tmp/mysql_pubkey.asc
mount -t efs -o tls,iam ${FileSystemID}:/ /var/www/html
echo "${FileSystemID}:/ /var/www/html efs _netdev,noresvport,tls,iam 0 0" >> /etc/fstab
wget https://raw.githubusercontent.com/mdmoats/lamp-stack-cloudformation/main/assets/config/heartbeat.php -P /var/www/html
wget https://raw.githubusercontent.com/mdmoats/lamp-stack-cloudformation/main/assets/config/wp-config.php -P /var/www/html
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
rm -rf latest.tar.gz wordpress
chmod -R 755 /var/www/html/*
chown -R apache:apache /var/www/html/*
