#!/bin/bash


#Script Name:	install_ansible.sh
#Description:	This script will install ansible, docker, git and start 2 containers - nagios4 and automated jenkins installation with default users  on EC2 instance
#Run where:	AWS EC2 AMI
#Author:	Victor Biga                                                
#Email:		victor.biga@gmail.com                                           
#Version info:	1.0
#Test date:	02/10/2018
#Test result:	OK
#nagios username: nagiosadmin password: nagios
#jenkins username: admin password: admin


#Become root, update AMI, enable epel release including updating repo app list and install ansible
sudo su
yum update -y
yum-config-manager --enable epel
yum repolist
yum install ansible -y
yum install git -y
yum install docker -y
service docker start
usermod -a -G docker ec2-user
docker run \
  --name auto-jenkins \
  --publish 0.0.0.0:8080:8080 \
  --detach \
  --restart always \
  depositsolutions/jenkins-automation

docker run \
  --name nagios4 \
  --publish 0.0.0.0:80:80 \
  --detach \
  --restart always \
  jasonrivers/nagios:latest

