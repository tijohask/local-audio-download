#!/bin/bash

yt-dlp --batch-file x-files.txt -f "ba" -o "%(title).150B.%(ext)s" -x --audio-format mp3 --embed-metadata

#for f in *.mp4
#do
#  ffmpeg -i "$f" "${f%.mp4}.mp3"
#done

mv *.mp3 /sdcard/Music/Longform/

mv x-files.txt backup.txt

touch x-files.txt

#rm *.mp4
