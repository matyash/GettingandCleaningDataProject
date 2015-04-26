## Getting and Cleaning Data Course Project

### Overview
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set.
The goal is to prepare tidy data that can be used for later analysis. 

A full description of the data used in this project can be found at:
[The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The source data for this project can be found here:
[Data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Instructions
Create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Steps to run the R script
1. Download the data source and put into a folder on your local drive.
2. Put the run_analysis.R file in the same folder and set it as your working directory.
3. Run run_analysis() in the R-file, it will perform above steps and generate two new files tiny_data.txt & average_data.txt in your working directory.

### Additional Information
Additional information about the variables, data and transformations can be found in the CodeBook.MD file.