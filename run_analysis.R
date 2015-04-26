run_analysis <- function(){
      
      # Activate Needed packages
      library(plyr)      
      
      # Read data from the files
      features <- read.table(".\\features.txt",header=FALSE)
      activity_labels <- read.table(".\\activity_labels.txt",header=FALSE)     
      subject_train <- read.table(".\\train\\subject_train.txt",header=FALSE)
      x_train <- read.table(".\\train\\X_train.txt",header=FALSE)
      y_train <- read.table(".\\train\\y_train.txt",header=FALSE)     
      subject_test <- read.table(".\\test\\subject_test.txt",header=FALSE)
      x_test <- read.table(".\\test\\X_test.txt",header=FALSE)
      y_test <- read.table(".\\test\\y_test.txt",header=FALSE)
           
      # Assign column names
      colnames(activity_labels) <- c("activity_id","activity_type")    
      colnames(subject_train) <- "subject_id"
      colnames(x_train) <- features[,2]
      colnames(y_train) <- "activity"   
      colnames(subject_test) <- "subject_id"
      colnames(x_test) <- features[,2]
      colnames(y_test) <- "activity"
      
      # Extract mean and standard deviation columns
      needed_features <- grepl("mean()", features[,2], fixed = TRUE) | 
                        grepl("std()", features[,2], fixed = TRUE)
      x_train <- x_train[,needed_features]
      x_test <- x_test[,needed_features]
      
      # Merge the needed data
      train_data <- cbind(subject_train, y_train, x_train)
      test_data <- cbind(subject_test, y_test, x_test)
      tidy_data <- rbind(train_data,test_data)
      
      # Change activity ids to descriptive activity names
      tidy_data[, 2] <- activity_labels[tidy_data[, 2], 2]

      # Average each variable for each activity and each subject
      average_data <- ddply(tidy_data, .(subject_id, activity), 
                             function(x) colMeans(x[, 3:68]))
      
      # Save the tidy all data & averaged data into files
      write.table(tidy_data, "tidy_data.txt", row.name=FALSE)
      write.table(average_data, "average_data.txt", row.name=FALSE)
      
}