#!/bin/bash
Original=Databases/Out/results/mc/original/crf=8
Comp=Databases/Out/results/nmc/crf=20

file_path=${Target}
mkdir -p $file_path
echo "Path: ${file_path}"

for f in $Original/*.mkv
do
	bf=${f##*/}  # Get base path
	echo "bf: $bf"
	f=${bf%.mkv}  # Remove .y4m extension
	f=${f#"Copy of "}

	#ffmpeg -i "$Comp/${f}.mkv" -i "$Original/$f.mkv" -filter_complex "psnr" -f null -
	ffmpeg -i "$Comp/${f}_20.mkv" -i "$Original/$f.mkv" -filter_complex "psnr" -f null -

done
