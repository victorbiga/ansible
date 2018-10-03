#!/bin/bash

#Script Name	:install_ansible.sh
#Description	:This script will install ansible on EC2 instance
#Run where      :AWS EC2 AMI
#Author       	:Victor Biga                                                
#Email         	:victor.biga@gmail.com                                           
#Version info   :1.0
#Test date      :
#Test result    :NA


#Become root, update AMI, enable epel release including updating repo app list and install ansible
sudo su
yum update -y
yum-config-manager --enable epel
yum repolist
yum install ansible -y
