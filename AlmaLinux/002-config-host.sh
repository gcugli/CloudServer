

export VPSHOSTNAME="seven"
export VPSDOMAINNAME="botnet.ar"

hostnamectl set-hostname $VPSHOSTNAME
hostnamectl set-chassis server

# timedatectl set-timezone America/Argentina/Buenos_Aires
timedatectl set-timezone America/Buenos_Aires 
 
cat >> /etc/hosts <<HOSTS
# gcugli - requered to set domain name
$(hostname -I|cut -d" " -f1)    ${VPSHOSTNAME}.${VPSDOMAINNAME}  ${VPSHOSTNAME}
HOSTS

cat >> /etc/resolv.conf <<RESOLV 
domain botnet.ar
#search cugli.org  # no.existe.com resuelve no.existe.com.cugli.org
#nameserver 8.8.8.8
#nameserver 8.8.4.4
#nameserver 2001:4860:4860::8888
# NOTE: the libc resolver may not support more than 3 nameservers.
# The nameservers listed below may not be recognized.
#nameserver 2001:4860:4860::8844
RESOLV


systemctl restart systemd-hostnamed
 
