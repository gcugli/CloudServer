
dnf update -y

# On kernel related updates it is recommended to perform a system restart:
# sudo reboot

dnf -y install mosh
dnf -y install rsync lftp
dnf -y install git
dnf -y install wget curl httpie
dnf -y install nmap-ncat socat 
dnf -y install mailx
dnf -y install unzip
dnf -y install jq      # json query 

