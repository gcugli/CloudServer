
# transfer.sh (https://github.com/dutchcoders/transfer.sh/)
# Copy this file to /etc/profile.d/upload.sh
# gcugli - Feb2019


upload(){ 

  if [ $# -eq 0 ]; then 
    echo -e "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>\n">&2
    return 1
  fi
  curlcmd='curl --progress-bar -H "Max-Days: 5" -H "Max-Downloads: 20" --upload-file "-" "https://upload.cugli.org/$file_name" | tee /dev/null'
  if tty -s; then 
    file="$1"
    file_name=$(basename "$file")
    if [ ! -e "$file" ];then 
      echo "$file: No such file or directory">&2
      return 1
    fi
    if [ -d "$file" ];then 
      file_name="$file_name.zip"
      (cd "$file"&&zip -r -q - .) | eval $curlcmd 
    else 
      cat "$file" | eval $curlcmd 
    fi
  else 
    file_name=$1
    eval $curlcmd 
  fi
  echo ""
}


