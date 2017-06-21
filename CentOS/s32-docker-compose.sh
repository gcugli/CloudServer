#!/bin/sh


sudo yum install -y epel-release
sudo yum install -y python-pip

# You will also need to upgrade your Python packages on CentOS 7 to get docker-compose to run successfully:

sudo yum upgrade python*

sudo pip install docker-compose

sudo docker-compose --version

