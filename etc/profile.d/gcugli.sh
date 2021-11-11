# gcugli : aliases and functions

###### transfer Upload.sh 
transfer () {
	if [ -r "$1" ]; then
		curl -XPOST -F "upfile=@$1" -k "https://up.botnet.ar/upload"
	else
		echo "cannot open '$1' (No such file)" >&2
		return 1
	fi
}

###### pingbulk
pingbulk () {
	while IFS=$' ;:|\t\n\r' read ipaddress ignore
	do
		ping -c1 -W2 "$ipaddress" > /dev/null
		if [ $? -eq 0 ]; then
			echo "$ipaddress up"
		else
			echo "$ipaddress down"
		fi
	done
}

