# g.cugli - Feb2020
# Copy this file to /etc/profile.d/multimedia.sh



# Resize Image and convert extension to lowercase

img-resize(){

  which convert >/dev/null 2>/dev/null
  if [ $? -ne 0 ]; then
    echo -e "convert command required.">&2
    return 1
  fi

  [ $# -eq 0 ] && echo -e "No arguments specified.\n">&2
  if [ $# -ne 3 ]; then 
    echo -e "Usage:\n  img-resize <max-pixels> <source-file> <dest-path>\n">&2
    echo -e "Example:\n  img-resize 1200 \"*.jpg\" ~/Pictures\n">&2
    return 1
  fi
  
  outFileDir=$3
  
  for imageFile in $2
  do
    local baseName=$(basename "$imageFile")
    local extension="${baseName##*.}"
    local outFilePath="${outFileDir}/${baseName%.*}.${extension,,}"
    echo converting $baseName
    convert "$imageFile" -resize "$1x$1" -quality 94 "$outFilePath"
    pDate=$(convert  "$imageFile" -format "%[EXIF:Datetime]" info: 2>/dev/null |sed 's/:/-/' |sed 's/:/-/')
    [ "$pDate" != "" ] && touch -a -m -d "$pDate" "$outFilePath"
  done

}



# Video Down BitRate and convert extension to lowercase

vid-downrate(){

  which ffmpeg >/dev/null 2>/dev/null
  if [ $? -ne 0 ]; then
    echo -e "ffmpeg command required.">&2
    return 1
  fi

  [ $# -eq 0 ] && echo -e "No arguments specified.\n">&2
  if [ $# -ne 3 ]; then 
    echo -e "Usage:\n  vid-downrate <bitrate> <source-file> <dest-path>\n">&2
    echo -e "Example:\n  vid-downrate 2048k \"*.mp4\" ~/Videos\n">&2
    return 1
  fi
  
  outFileDir=$3
  
  for videoFile in $2
  do
    local baseName=$(basename "$videoFile")
    local extension="${baseName##*.}"
    local outFilePath="${outFileDir}/${baseName%.*}.${extension,,}"
    echo processing $baseName
    ffmpeg -hide_banner -i "$videoFile" -b:v 2048k "$outFilePath"
    touch -r "$videoFile" "$outFilePath"
  done
  
}
 

