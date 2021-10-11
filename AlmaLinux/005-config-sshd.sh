### https://www.marksei.com/change-ssh-port-on-centos-7-with-selinux-and-fail2ban/


# Adding the new port to SELinux
semanage port -a -t ssh_port_t -p tcp 2211

# firewalld
cat > /etc/firewalld/services/ssh-hidden.xml <<SSHXML
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>SSH Hidden Port</short>
  <description>Secure Shell (SSH) is a protocol for logging into and executing commands on remote machines. It provides secure encrypted communications. Listen in alternative port to keep hidden</description>
  <port protocol="tcp" port="2211"/>
</service>
SSHXML

firewall-cmd --reload
firewall-cmd --add-service ssh-hidden 

# fail2ban

dnf -y install fail2ban

cat > /etc/fail2ban/jail.d/sshd-alt-port.conf <<SSHJAILCONF
## Added by gcugli
[sshd]
enabled = true
port = 2211
SSHJAILCONF

systemctl restart fail2ban

# sshd daemon

cat >> /etc/ssh/sshd_config <<EditSSHdConfig
## Added by gcugli
Port 2211
PermitRootLogin no
PermitEmptyPasswords no
EditSSHdConfig

systemctl restart sshd

# IMPORTANT: Test access via alternative port and sudo su - before block original port 
firewall-cmd --add-service ssh-hidden --permanent
firewall-cmd --remove-service ssh --permanent
firewall-cmd --reload

# Verify with: iptables -S


