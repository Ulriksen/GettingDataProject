require(plyr)

#This file requires to be in the working dir and expects a subdir named "UCI HAR Dataset"
#containing the captured motion data. Requires plyr package. To generate text files for 
#means, call the writeMeans function. 

writeMeans <- function() {
  #setup base directory and read files
  dataDir <- "/UCI\ HAR\ Dataset/"
  
  #function for reading data, takes  filename and colnames
  readData <- function(file,colnames){
    read.table(sprintf("%s%s%s",getwd(),dataDir,file), col.names =colnames)
  }
  
  features <- readData("features.txt",c("featureid","featureName"))
  #function for reading a set of data. Use "test" or "train" as input parameter 
  readSet <- function(dataSet) {
    df <- readData(sprintf("%s/x_%s.txt",dataSet,dataSet),features$featureName)
    activity <- readData(sprintf("%s/y_%s.txt",dataSet,dataSet))
    subject <- readData(sprintf("%s/subject_%s.txt",dataSet,dataSet))
    df$activityId <- activity$V1
    df$subject <- subject$V1
    df
  }
  
  #read training data from both sets
  data <- rbind(readSet("train"),readSet("test"))
  
  #filter columns
  #could be done during read, but done here in order to follow steps in assignment
  columnFilter <- grepl("mean|std",names(data))
  data <- data[,grepl("mean|std|activity|subject",names(data))]
  
  #add text label for activity
  activityLabels <- readData("activity_labels.txt",c("activityId","activityName"))
  data <- join(data, activityLabels, by = "activityId", match = "first")
  
  #calculate means
  means <- ddply(data, c("subject","activityName"), numcolwise(mean))
  means[,3] = NULL
  
  #save file
  write.table(means, file = "averages.txt", append = FALSE, row.names = FALSE)
}