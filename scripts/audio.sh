#!/bin/bash

flac_to_mp3() {
  for file in *.flac; do ffmpeg -i "$file" -ab 320k "${file%.flac}.mp3"; done && exit
}

m4a_to_flac() {
  for file in *.m4a; do ffmpeg -i "$file" -c:a flac "${file%.m4a}.flac"; done && exit
}
