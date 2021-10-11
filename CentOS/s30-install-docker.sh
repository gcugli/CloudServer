
yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum install -y docker-ce

systemctl enable --now docker

usermod -aG docker cgc

docker info

yum -y install epel-release
yum -y install python-pip
pip install docker-compose

docker-compose --version

docker network create -o com.docker.network.bridge.name=rproxy rproxy
