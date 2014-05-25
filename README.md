Getting-CleaningData_CourseProject
==================================

Coursera - Getting and Cleaning Data - Course Project

### NOTES/ASSUMPTION
#### 1. Raw data files are already downloaded and unzipped in the working directory
#### 2. All relevant packages such as plyr have been already installed

### Following steps explain how run_analyis.R script creates a tidy dataset
#### Step1: Read Train files(X, Y, Subject), Test files(X, Y, Subject), Activity Labels and Features files
#### Step2: Join Train & Test datasets using Column Bind (X, Subject & Y)
#### Step3: Concatenate Train and Test Datasets using Row Bind
#### Step4: Prepare Variable Names for the combined train & test dataset using Features data frame
##### a. Removing "()" and "-" from the variable names
##### b. Assign column names to combined data frame
#### Step5: Retain only the variables from the combined dataset that have mean and standard deviation values
##### a. Identify row indexes in the features dataset having mean and standard deviaiton variables
##### b. Add TRUE value at position 562 and 563 to retain columns "Subject" & "Activity"
##### c. Create a new data frame with desired columns
#### Step6: Use merge command to add Activity labels to the combined data set
#### Step7: Creates an independent tidy data set with the average of each variable for each activity and each subject
#### Step8: Download tidyData dataframe to working directory as a .txt file







