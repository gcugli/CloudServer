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
mount -o bind,ro /etc /home/cgc/repo/CloudServer/etc
mount -o bind,ro /pod /home/cgc/repo/CloudServer/pod
```
