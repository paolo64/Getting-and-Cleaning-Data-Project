# Getting and Cleaning Data

## Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How run the script

1. Download the data source from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and put into a folder on your local drive.
2. Unzip file and you'll have a ```UCI HAR Dataset``` folder.
3. Put ```run_analysis.R``` into the folder ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio the fully qualified ```.../UCI HAR Dataset``` folder.
3. Run ```source("run_analysis.R")```, then it will generate a new file ```out_data_averages_per_activity_subject.txt``` in the working directory.

