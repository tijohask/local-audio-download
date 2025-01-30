#!/bin/bash

while getopts n: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
    esac
done

#cp rum-files.txt files.txt
sed -i '/^$/d' rum-files.txt

if [ -n $number ] && [  $number -gt 0 ] 2>/dev/null; then
  echo $number
  head -n $number rum-files.txt | xargs yt-dlp -f "mp4-360p/mp4-360p-1/mp4-480p/hls-1200" -o "%(title).150B.%(ext)s" -x --audio-format mp3 --embed-metadata
  head -n $number rum-files.txt > backup.txt
  a=($(wc rum-files.txt))
  lines=${a[0]}
  echo $(($lines - $number))
  tail rum-files.txt -n $(($lines - $number)) > out.txt 
  mv out.txt rum-files.txt
else
  yt-dlp --batch-file rum-files.txt -f "mp4-360p/mp4-360p-1/mp4-480p/hls-1200" -o "%(title).150B.%(ext)s" -x --audio-format mp3 --embed-metadata
  mv rum-files.txt backup.txt
  touch rum-files.txt
fi

mv *.mp3 /sdcard/Music/Longform/

