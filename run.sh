#!/bin/bash
# Sample script for running 5E1 project

home_dir=$(/content/drive/'My Drive'/'Fifth Year'/MAI)

# Activate virtual env for project
# source $Git/Envs/5E1/bin/activate

# cd to Project dir
cd /content/drive/'My Drive'/'Fifth Year'/MAI/DNN-media-compression

# Set up alias for training data location
data_dir=/content/drive/'My Drive'/'Fifth Year'/MAI/Databases

# Set up runtime args

# -ci = compressed_input
ci=$data_dir/Video/Xiph/Colour/LowQual/sub_640p
#ci=$data_dir/Video/Xiph/Colour/LowQual/H264crf
#ci=$data_dir/Video/Xiph/Colour/LowQual/test

# -oi = original_input
oi=$data_dir/Video/Xiph/Colour/sub_640p
#oi=$data_dir/Video/Xiph/Colour/test
#oi=$data_dir/Video/Xiph/Colour/H264crf
# -od = output_dir
od=$data_dir/Out

# -m = model (path or name)
#m="$data_dir/Out/GP_3D/sub_640p/LowQual/Y_optimiser=Adam_epochs=17_batch_size=4_lr=0.0005/Model/GP_3D.tf"
m="GP_3D"
#m="Attempt1_3D"

# -nt = no-train [Include if only loading model output]
nt="nt"
# -s = sequences [Include for video]
s="s"
# -e = epochs
e=24
# -b = batch_size
b=2
# -d = dims (w, h, c)
#d="352, 256, 3"
d="426, 240, 3"
#d="256, 256, 3"
# -cs = colourspace (YUV, BGR, RGB) [YUV is default]
cs="YUV"
# -kl = keep loss function [Default is to change when loading model], add to preserve loss function (MSE)
kl="kl"

# Run script
python Python/Code/main.py -ci "$ci" -oi "$oi" -od "$od" -m "$m" -nt -s -e $e -b $b -d "$d" -cs "$cs"

# Deactivate Python virtual env
# deactivate

# Return to home dir
cd $home_dir