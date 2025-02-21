#!/bin/bash

yt-dlp --batch-file x-files.txt -f "ba/replay-300" -o "%(title).150B.%(ext)s" -x --audio-format mp3 --embed-metadata

mv *.mp3 /sdcard/Music/Longform/

mv x-files.txt backup.txt

touch x-files.txt
