#!/bin/bash
Original=Databases/Video/Xiph/Colour/LowQual/420p
Target=Databases/Video/Xiph/Colour/LowQual/352p

Files=${Original}/*.mp4
Extension=".mp4"

file_path=${Target}
mkdir -p $file_path
echo "Path: ${file_path}"

for f in $Files
do
	bf=${f##*/}  # Get base path
	echo "bf: $bf"
	f=${bf%.mp4}  # Remove .y4m extension
    ffmpeg -i $Original/$bf -vcodec libx264 -b:v 1024k -s 352x288 ${file_path}/${f}_352${Extension}
done

#Original=Databases/Video/Xiph/Colour/420p
#Target=Databases/Video/Xiph/Colour/352p

#Files=${Original}/*.y4m
#Extension=".y4m"

#file_path=${Target}
#mkdir -p $file_path
#echo "Path: ${file_path}"

#for f in $Files
#do
	#bf=${f##*/}  # Get base path
	#echo "bf: $bf"
	#f=${bf%.y4m}  # Remove .y4m extension
    #ffmpeg -i $Original/$bf -s 352x288 ${file_path}/${f}_352${Extension}
#done

