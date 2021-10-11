ALIASMAIL="xxxxx@gmail.com"

echo "root:  $ALIASMAIL" | sudo tee -a /etc/aliases 
echo "cgc:   $ALIASMAIL" | sudo tee -a /etc/aliases 
echo "bot:   $ALIASMAIL" | sudo tee -a /etc/aliases 

sudo newaliases

sudo systemctl restart postfix.service 

