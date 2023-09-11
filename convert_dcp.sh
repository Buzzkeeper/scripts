#!/bin/bash

input_file_video=$1
input_file_audio=$2
output_file="$(dirname $1).mp4"

ffmpeg -i "$input_file_video" -i "$input_file_audio" -c:v libx264 -crf 28 -c:a aac -b:a 192k "$output_file"
