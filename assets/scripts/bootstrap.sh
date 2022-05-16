
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
