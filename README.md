Getting-and-Cleaning-Data
=========================

This is the repository for the project of Coursera course "Getting and Cleaning Data"

#####The data source for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#####The script run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.  
2. Extracts only the measurements on the mean and standard deviation for each measurement.  
3. Uses descriptive activity names to name the activities in the data set.  
4. Appropriately labels the data set with descriptive activity names.  
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.    

#####Steps to use the run_analysis.R script:

1. Download the data from data source.
2. Extract it into your working directory. You'll have a folder "UCI HAR Dataset" under your working directory.
3. Save the script run_analysis.R in your working directory.
4. Run source("run_analysis.R"), it will generate a new file tidyset.txt in your working directory.

#####Dependencies

run_analysis.R depends on the reshape2 package. The script will install the dependencies automatically.
