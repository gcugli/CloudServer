
useradd -m --password Temporal cgc
usermod -aG wheel cgc

groupadd -g 33 suri #could fail if 33 is used 
useradd --system -g 33 -u 33 -M suri

