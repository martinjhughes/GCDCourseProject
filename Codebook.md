# Codebook
### Codebook for John Hopkins Getting and Cleaning Data Coursera course project.

The project uses Human Activity Recognition Data, Using Smartphones, from the UCI Machine Learning Repository: [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
### The following information and data descriptions are based on the course project data readme document:

Experiments have been carried out with a group of 30 volunteers, each of whom performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) whilst wearing a smartphone on the waist. Using the embedded accelerometer and gyroscope, data for 3-axial linear accelerations and 3-axial angular velocities were captured. Data was partitioned into two sets: training and test data. 

This primary data used in the project is:

* 'X_train.txt': Training set.
* 'X_test.txt': Test set.

This data consists of 561 'features', comprising time and frequency domain variables for triaxial acceleration(total acceleration), estimated body acceleration and triaxial angular velocity. This data has been generated as follows: The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. Features are normalized and bounded within [-1,1].

The datasets have row labels which specify what activity (1-6) each entry relates to:

* 'y_train.txt
* 'y_test.txt'

As well as labels which specify what subject (1-30) each entry relates to:

* 'subject_train.txt'
* 'subject_test.txt'

The names of the features (variables) are given in:

* 'features.txt'

The labels for the 6 activities are given in:

* 'activity_labels.txt'

### The project is to create one R script called run_analysis.R that:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
### My approach has involved:
* Combining the test + train datasets for all variables (columns), including variable names (features) and row labelling for subjects (1-30) and activity descriptors (1-6)
* Removing duplicate variables and sub-setting the dataset down to only contain variables with "mean" or "std" in their names.
* Generating an interim table where each column is a variable and there are 180 datset rows, with each row containing the average value for a specific subject (1-30) doing a specific activity (1-6).
* Finally splitting the interim dataset by activity.
