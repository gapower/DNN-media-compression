#!/bin/bash
Original="Original"
Files=Original/*.y4m
Extension=".mp4"

[ -z "$1" ] && method="crf" || method="$1"

[ -z "$2" ] && quality=24 || quality=$2

echo "Quality: $quality"
file_path=${Target}
mkdir -p $file_path
echo "Path: ${file_path}"

for f in $Files
do
	bf=${f##*/}  # Get base path
	echo "bf: $bf"
	f=${bf%.y4m}  # Remove .y4m extension
	# f=${f%.*}  # Remove any extension
	# Cmd
	ffprobe -v error -count_frames -select_streams v:0 -show_entries stream=nb_read_frames -of default=nokey=1:noprint_wrappers=1 $Original/$bf
done
