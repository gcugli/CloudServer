
dnf install yum-utils -y

# dnf install device-mapper-persistent-data lvm2 -y #needed on CentOS! but on AlmaLinux?

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# dnf repolist # To confirm repository is available for use

dnf install docker-ce docker-ce-cli containerd.io -y

systemctl enable --now docker

usermod -aG docker cgc

# systemctl status docker
# docker info

# Install docker-compose
# https://docs.docker.com/compose/install/ 

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version


# Create main virtual bridge
docker network create -d bridge -o com.docker.network.bridge.name=rproxy rproxy

