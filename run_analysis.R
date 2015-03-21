#This file requires to be in the working dir and expects a subdir named "UCI HAR Dataset"
#containing the captured motion data

#setup base directory and read files
dataDir <- "/UCI\ HAR\ Dataset/

#function for reading data, takes  filename and colnames
readData <- function(file,colnames){
  read.table(sprintf("%s%s%s",getwd(),dataDir,"features.txt"), col.names =colnames)
}

#function for reading a set of data. Use "test" or "train" as input parameter 
readSet <- function(dataSet) {
  df <- readData(sprintf("%s/x_%s.txt",dataSet,dataSet),features$featureName)
  activity <- readData(sprintf("%s/y_%s.txt",dataSet,dataSet))
  subject <- readData(sprintf("%s/subject_%s.txt",dataSet,dataSet))
  df$activity <- activity$V1
  df$subject <- subject$V1
  df
}

#read training data from both sets
data <- rbind(readSet("train"),readSet("test")

