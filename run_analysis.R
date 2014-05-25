## COURSE PROJECT DESCRIPTION:-
## A. Data for the project: 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##
## B. STEPS:
## B.1 You should create one R script called run_analysis.R that does the following. 
## B.2 Merges the training and the test sets to create one data set.
## B.3 Extracts only the measurements on the mean and standard deviation for each measurement. 
## B.4 Uses descriptive activity names to name the activities in the data set
## B.5 Appropriately labels the data set with descriptive activity names. 
## B.6 Creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Read Train files(X, Y, Subject)
xTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
yTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
subjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)

## Read Test files - X, Y, Subject
xTestData <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
yTestData <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
subjectTestData <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)

## Read Activity .txt files & labelling colnames
activityData <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
colnames(activityData) <- c('Act', 'Activity')

## Read features .txt files
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

## Join Train files using Column Bind (X, Subject & Y)
trainData <- cbind(xTrainData, subjectTrainData, yTrainData)

## Join Test files using Column Bind (X, Subject & Y)
testData <- cbind(xTestData, subjectTestData, yTestData)

## Join Train and Test Datasets using Row Bind
combinedData <- rbind(trainData, testData)

## Preparing Variable Names for the combined dataset using Features data frame
## a. Removing "()" and "-" from the variable names
## b. Assign column names to combined data frame
features_mod1 <- sapply(features,function(x) gsub("\\(\\)","",x))
features_mod2 <- sapply(as.data.frame(features_mod1),function(x) gsub("-","",x))
colnames(combinedData)[1:561] <- features_mod2[,2]
colnames(combinedData)[562] <- 'Subject'
colnames(combinedData)[563] <- 'Act'

## Retaining only the variables having mean and standard deviation values
## a. Identify row indexes in the features dataset having mean and standard deviaiton variables
## b. Adding TRUE value at position 562 and 563 to retain columns "Subject" & "Activity"
## c. Creating the new data frame with desired columns
indx <- (grepl("mean()", features$V2, fixed=TRUE)| grepl("std()", features$V2, fixed=TRUE))
indx[562:563] <- TRUE
combinedData.df <- combinedData[,indx]
    
## Merging combinedData with Activity Dataframe to add Activity Descritions i.e. Walking, Standing etc.
mergedData <- merge(combinedData.df, activityData, by.x="Act", by.y="Act")

## Drop Act Column
mergedData <- subset(mergedData, select = -Act)

## Creates an independent tidy data set with the average of each variable for each activity and each subject
tidyData <- ddply(mergedData, .(Subject, Activity), numcolwise(mean))

## Download tidyData dataframe as a .txt file
write.table(tidyData, "./UCI HAR Dataset/tidyData.txt", sep=" ", row.names=FALSE)
