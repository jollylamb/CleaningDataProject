library(dplyr)

run_analysis <- function(){
  
  #1. Merge the training and the test sets to create one data set.
  #First, read in the files for train and test data
  sub_test <- read.table(file="UCI_HAR_Data/test/subject_test.txt")
  X_test <-read.table(file="UCI_HAR_Data/test/X_test.txt")
  Y_test <-read.table(file="UCI_HAR_Data/test/y_test.txt")
  
  sub_train <- read.table(file="UCI_HAR_Data/train/subject_train.txt")
  X_train <-read.table(file="UCI_HAR_Data/train/X_train.txt")
  Y_train <-read.table(file="UCI_HAR_Data/train/y_train.txt")
  
  #read in the list of relevant features that I created and use that to subject the X measurement tables
  #this is step 2
  features <- read.table(file="rel_feat.txt")
  colList <- features[,1]
  X_test_data <- X_test[,colList]
  X_train_data <- X_train[,colList]
  
  #merge the subject, activity, and measurements together
  test <- cbind(sub_test, Y_test, X_test_data)
  train <- cbind(sub_train, Y_train, X_train_data)
  
  #now merge the two datasets together
  data <- rbind(test, train)
  
  
  #2. Extract only the measurements on the mean and standard deviation for each measurement. 
  #done before the merge
  
  
  #3. Use descriptive activity names to name the activities in the data set
  #i.e. replace the numbers in the second col with the values found in activity_labels.txt
  #start by reading in activity files
  activities <- read.table(file="UCI_HAR_Data/activity_labels.txt")
  data[,2] <- as.character(factor(data[,2], labels = activities[,2]))
  
  #4. Appropriately label the data set with descriptive variable names. 
  colnames(data) <- c(c("Subject", "Activity"), make.names(features[,2]))
  
  #5. From the data set in step 4, create a second, independent tidy data set with the 
  #average of each variable for each activity and each subject. 
  gdata <- data %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
  
  #write the data out to a file
  write.table(gdata, file="tidy_data.txt", row.names = F)
}



