#!/bin/bash -xe

# Install Apache, PHP, and EFS utilities
yum -y update
yum -y install amazon-efs-utils httpd
amazon-linux-extras install -y php7.4
systemctl start httpd
systemctl enable httpd

# Download GPG key, configure MySql 5.7 repo and install MySql community edition
cd /tmp
wget https://raw.githubusercontent.com/mdmoats/lamp-stack-cloudformation/main/mysql_pubkey.asc
rpm --import mysql_pubkey.asc
rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum -y install mysql-community-client
rm /tmp/mysql_pubkey.asc

# Use the AWS CLI to pull EFS file system ID from SSM Parameter and store as a local variable, then mount the file system
FileSystemID=$(aws ssm get-parameter --name FileSystemID --region ${AWS::Region} --output text --query Parameter.Value)
mount -t efs -o tls,iam ${FileSystemID}:/ /var/www/html
echo "${FileSystemID}:/ /var/www/html efs _netdev,noresvport,tls,iam 0 0" >> /etc/fstab

# Run with the following command to prefix log entries with timestamps
# ./bootstrap.sh | while IFS= read -r line; do printf '%s %s\n' "$(date +'%Y-%m-%d %T %Z')" "$line"; done >> "bootstrap.$(date +'%Y-%m-%d').log"
