#!/bin/bash

#Script Name	:install_ansible.sh
#Description	:This script will install ansible on EC2 instance
#Run where      :AWS
#Author       	:Victor Biga                                                
#Email         	:victor.biga@gmail.com                                           
#Version info   :1.0
#Test date      :
#Test result    :NA

sudo su
yum update -y
pip install --upgrade pip
pip install ansible
