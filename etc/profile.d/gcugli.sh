# gcugli : aliases and functions

###### transfer Upload.sh 
transfer () {
	for fn in "$@"
	do
		if [ -r "$fn" ]; then
			curl -XPOST -F "upfile=@$fn" -k "https://up.botnet.ar/upload"
		else
			echo "cannot open '$fn' (No such file)" >&2
			return 1
		fi
	done
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

