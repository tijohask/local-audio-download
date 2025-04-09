#!/bin/bash

while getopts n: flag
do
    case "${flag}" in
        n) number=${OPTARG};;
    esac
done

music_folder="$(head -n 1 .config)"
#cp rum-files.txt files.txt

if [ -n $number ] && [  $number -gt 0 ] 2>/dev/null; then
  echo $number
  head -n $number ban.txt | xargs yt-dlp -f "hls-0" -o "%(title).150B.%(ext)s" -x --audio-format mp3 --parse-metadata "%(channel)s:%(meta_artist)s" --embed-metadata
  head -n $number ban.txt > backup.txt
#  wc -l ban.txt | awk '{print $number-1}' | xargs tail ban.txt -n > out.txt
  a=($(wc ban.txt))
  lines=${a[0]}
  echo $(($lines - $number))
  tail ban.txt -n $(($lines - $number)) > out.txt
  mv out.txt ban.txt
else
  yt-dlp --batch-file ban.txt -f "hls-0/hls-group_audio-original" -o "%(title).150B.%(ext)s" -x --audio-format mp3 --parse-metadata "%(channel)s:%(meta_artist)s" --embed-metadata
  mv ban.txt backup.txt
  touch ban.txt
fi

#mv *.mp3 $music_folder

