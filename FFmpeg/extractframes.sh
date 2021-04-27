#!/bin/bash
Original=Databases/Out/FrameExtraction
Files=$Original/*.mkv
#Files=$Original/*.mp4
Target=Databases/Out/FrameExtraction/Frames
Extension=".mkv"
#Extension=".mp4"

file_path=${Target}
mkdir -p $file_path
echo "Path: ${file_path}"

for f in $Files
do
	bf=${f##*/}  # Get base path
	echo "bf: $bf"
	f=${bf%.mkv}  # Remove .y4m extension
	# f=${f%.*}  # Remove any extension
	ffmpeg -r 120 -i "$Original/$bf" ${file_path}/${f}_%03d.bmp
	#ffmpeg -r 120 -i "$Original/$bf" ${file_path}/${f}/${f}_%03d.bmp

done