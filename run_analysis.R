#load the test and training data
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")

#load the test and training subject data
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#load the test and training activity data
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#load the activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#combine the suject and activity data into the measurements data
testset <- cbind(subject_test, activity_test, test)
trainset <- cbind(subject_train, activity_train, train)

#merge the test and training data into wholeset
wholeset <- rbind(testset, trainset)

#merge the activity labels data into the set, delete the activity number code column,
#keep the descriptive activity names column
newwholeset <- merge(activity_labels, wholeset, by.x = 1, by.y = 2, all.y=TRUE)
newwholeset$V1 <- NULL

#load the features data
features <- read.table("./UCI HAR Dataset/features.txt")

#add the names "activity" and "subject" into features
newfeatures <- (c(c("activity", "subject"), as.character(features[ , 2])))

#name the columns of the dataset with the features names
colnames(newwholeset) = newfeatures

#get the variable names of only the measurements on the mean and standard deviation for each measurement. 
grepmeanstd <- grep("mean\\(\\)|std\\(\\)", newfeatures,value = TRUE)

#load the reshape2 library, melt the dataset by ID of "activity" and "subject"
library(reshape2)
meltset <- melt(newwholeset, id.vars=c("activity", "subject"), measure.vars=grepmeanstd)

#cast the data with the mean of each variable for each activity and subject
tidyset <- dcast(meltset, activity + subject ~ variable, mean)

#save the tidyset.txt into the "UCI HAR Dataset" directory
write.table(tidyset, "./UCI HAR Dataset/tidyset.txt")