Getting-CleaningData_CourseProject
==================================
Coursera - Getting and Cleaning Data - Course Project

#### This CodeBook describes the variables, the data, and transformations that were performed to clean up the data

#### DATA
##### The program uses the following files in the Course project to create tidy dataset. Data processing steps are explained below.
##### 1. TRAINING FILES: X,Y,SUBJECT
##### 2. TEST FILES: X,Y,SUBJECT
##### 3. FEATURES
##### 4. ACTIVITY

#### VARIABLES
##### X: Variables storing mean and standard deviation numbers are retained from X files in the final tidy dataset
##### Subject: Variable from the subject file is retained as-is in final tidy dataset
##### Y & Activity: Values from variable in Y file is substituted by activity labels
##### Features: Values in features dataset is used to define colnames of the tidy dataset

#### PROCESSING STEPS/TRANSFORMATION
##### Step1: Read raw text file and column Bind x_train, subject_train and y_train text files
##### Step2: Read raw text files and Column Bind x_test, subject_test and y_test text files
##### Step3: Concatenate files from Step1 and Step2
##### Step4: Read and modify features text file to remove special characters such as "()" and "-"
##### Step5: Assign Column names to the merged dataset using the modified features dataset creaed in step 4
##### Step6: Subset the merged dataset created in step3 to contain only the variables having MEAN OR STD value
##### Step7: Substitute activity labels in the merged dataset
##### Step8: Create tidy dataset by determining mean of each of the columns in the merged dataset(step7) for each value of Subject and Activity
##### Step9: Download the final tidy dataset to Working Directory