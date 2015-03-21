# GettingDataProject

This repository contains a R script which calculates means for the activity recognition data set from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. 

The means are calculated according to the Coursera Get data project requirements



> You should create one R script called run_analysis.R that does the following. 


>1.  Merges the training and the test sets to create one data set.
>1. Extracts only the measurements on the mean and standard deviation for each measurement. 
>1. Uses descriptive activity names to name the activities in the data set
>1. Appropriately labels the data set with descriptive variable names. 
>1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Running the script
The data set requires the plyr package. This can be installed using `install.packages("plyr")`

The data must be in the same directory as the R script, following the original data structure. I.e there should be one directory called `UCI HAR Dataset` in the folder containing the R script. 

1. Set working directory to the same directory as the R file using `setwd` 
1. Load the run_analysis.R using `source("run_analysis.R")`
1. Run the script using `writeMeans()`
1. A text file called `averages.txt` will be created in the working directory 

