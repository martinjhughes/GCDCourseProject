# GCDCourseProject
John Hopkins Getting and Cleaning Data Coursera Course: Script, codebook and readme for course project
### The project is to create one R script called run_analysis.R that does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### My approach has been to:
* Read in the core datasets: train + test data (x); row labels (y); subject row labels, features (variable headings), and activity labels.
* Separately for the train + test data, column bind the y labels, subjects labels + datasets (x) to create two datsets.
* Row bind these 2 datsets to generate one dataset: fullData.
* Added variable (column) names: "Label", "Subject", and the features dataset for the data variable names.
* Because there are some duplicate variables I have removed all duplicates.
* Generated a new reduced datset now containing only variable with "mean" or "std" in their names: subData.
* The "Label" values, initially integers, have been re-stated factors and named as the activity labels.
* The "Subject"s (1-30) have also been re-stated as factors, for subsequent analysis.
### The final part of the project is to generate a new tidy dataset.
My solution has been to generate an interim table where:

* Each column is a variable.
* There are 180 datset rows, where each row contains the average value for a specific subject (1-30) doing a specific activity (1-6).

Finally I have split this dataset by activity to generate myTidyData. Individual activity tables can now be accessed. For example myTidyData$SITTING.
