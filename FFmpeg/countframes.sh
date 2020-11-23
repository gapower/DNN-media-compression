#!/bin/bash
Files=Databases/Video/Xiph/Colour/Original/*.y4m

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
