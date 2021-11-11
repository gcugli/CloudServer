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
