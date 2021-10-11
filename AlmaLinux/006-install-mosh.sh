

dnf -y install mosh

firewall-cmd --zone=public --add-service=mosh --permanent
firewall-cmd --reload

