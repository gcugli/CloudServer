CloudServer
============

Cloud Server Start configuration


Start Cloud CentOS 7 server
----------------------------
	yum update
	yum install -y git
	git clone https://github.com/gcugli/CloudServer.git
	cd CloudServer/CentOS
	chmod +x *.sh
	./s01.update.sh
	...


Mounts
------

```bash
sudo mount -o bind,ro /etc /home/cgc/repo/CloudServer/etc
sudo mount -o bind,ro /pod /home/cgc/repo/CloudServer/pod
```
