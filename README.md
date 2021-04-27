# General Info

Repo for work on 5E1 project for MAI

Prior to making a commit, pre-commit must be installed on the user's machine. Follow tutorial [here](https://pre-commit.com/).

The bash files included in FFmpeg/ should be placed in the directory any videos you wish to modify are stored.

run.sh is a sketelon file for running the project, edit as appropriate.

# Setting up the repo:

## Install requirements 

These are specified in the requirements.txt file, as well as either the requirements-gpu or cpu, depending on your environment.

## Create a Database

The database must contain:
1: a directory with series of original media files in the y4m format.
2: a directory containing compressed media at one or more bitrates. For information on compressing the media, read *FFmpeg Scripts*. The compressed media must follow the following formatting:

> originalFilename_CRF.mp4

where **CRF** is the level of compression. For example a file called *akiyo* compressed at a CRF of 20 would be called:

> akiyo_20.mp4

## Update the directories in run.sh

Update run.sh to contain the directories to the original and compressed datasets, as well as an output directory for the results.

## Run the script

Type:

> bash run.sh

or the corresponding command in your environment to run the script.


To better understand how the code reads from the database, we suggest you read *load_video()*, *preprocess_video()* and *video_generator()* in *code_util.py*.

# FFmpeg Scripts

Several scripts are provided to help compress media and generate results. These can be found in the *FFmpeg folder*. 

Files such as av1.sh and h264.sh allow you to compress original data at a desired crf value. Make sure, however to edit the scripts to specify the correct directories and CRF value

countframes.sh and getfilesize.sh can be used to gather information on your compressed media. this can be useful when assessing the size of your database, for example.

extractframes.sh gets all the frames contained in each sequence and saves them as images. Very useful for comparing models.

getPSNR.sh and getSSIM.sh return the PSNR and SSIM of each video in a directory.

# Loading models

To load a new model, specify the model name in the model variable (-m) in *run.sh*. 

To continue training a model, pass the directory of the saved_model.pb file into -m. If you only wish to output results, ensure that the -nt variable is passed as a command line argument

Depending on the environment/version of keras, some issues can arise when continuing to train models. You may need to specify the epoch where you last left off. There is no framework set up to do this (sorry), so you will have to edit the *initial_epoch* variable in models.py to be the last epoch at which the model was trained.

For further information on loading models, we suggest you read *main.py* and *modules.py*.

# Motion Compensation

The motion compensation module can be found in *code_util.py*. I never got around to making this specifiable with a command line argument, so it must be activated/deactivated manually. To do this, comment/uncomment the line in which it is called inside the *preprocess_video()* function in *code_util.py*:

> frame = self.motion_compensation(frame_pr, frame)

# Results

The output directory for your results must be specified in *run.sh*. There, the model will return

## 1) The trained model:

A saved_model.pb file containing the trained model

## 2) Plots:

A series of plots and txt files containing the change in training and validation PSNR, MSE, MS-SSIM over time.

## 3) Trained media

Compressed and trained media across all crf values, saved in .mkv format.


For further information regarding the generation of results, we suggest you read the *output_results_video()* and *output_helper_video()* modules in *code_util.py*. 