
## Getting and Cleaning Data Programming Assignment: run_analysis.R

## This is a script that:

## - Merges the training and the test sets to create one data set.
## - Extracts only the measurements on the mean and standard deviation for each measurement. 
## - Uses descriptive activity names to name the activities in the data set
## - Appropriately labels the data set with descriptive variable names. 
## - From the data set in step 4, creates a second, independent tidy data set with the average
##   of each variable for each activity and each subject.

## This script assumes that the data has been downloaded and that 
## the UCI HAR Dataset folder is in the working directory.

# install.packages("dplyr") # install the package
library(dplyr) # load the library; useful for merging, selecting etc.

xtrain <- read.table("X_train.txt") # read X_train data-set into dataframe; no headers
ytrain <- read.table("y_train.txt") # read y_train data-set into dataframe; no headers
# dim(xtrain) # 7352 by 561
# dim(ytrain) # 7352 by 1
xtest <- read.table("X_test.txt") # read X_test data-set into dataframe; no headers
ytest <- read.table("y_test.txt") # read y_test data-set into dataframe; no headers
# dim(xtest) # 2947 by 561
# dim(ytest) # 2947 by 1
stest <- read.table("subject_test.txt") # read subject_test data-set into dataframe; no headers
strain <- read.table("subject_train.txt") # read subject_test data-set into dataframe; no headers
# dim(stest) # 2947 by 1
# dim(strain) # 7352 by 1
features <- read.table("features.txt") # read features (data-set headers) into dataframe
# dim(features) # 561 by 2
# head(features)
activityLabels <- read.table("activity_labels.txt") # read activity_labels data-set into dataframe
# dim(activityLabels) # 6 by 2
# activityLabels


## (1) Merge + create one dataset

test<-cbind(ytest,stest,xtest) # combine the labels, subjects + measurements
train<-cbind(ytrain,strain,xtrain) # combine the labels, subjects + measurements
fullData<-rbind(train,test) # merge (combine) the 2 datasets
# dim(fullData) # 10299 by 563

## (4) label the variables with the features variable names

features2<-as.character(features[,2]) # getting the column labels as characters (not factors)
cnames<-c('Label','Subject',features2) # column headers for the combined (3) datasets
# head(cnames)
# tail(cnames)
# length(cnames) # 563
colnames(fullData)<-cnames # add the column labels to the data

## (2) extract only mean and std related data

fullData <- fullData[ , !duplicated(colnames(fullData))] # there are duplicate columns! remove
# dim(fullData) # Now 10299 by 479!

subData<-cbind(select(fullData, Label),select(fullData, Subject),
        select(fullData, contains("mean")),select(fullData, contains("std"))) # extract mean-std
# dim(subData) # Now 10299 by 88
# names(subData)

## (3) name the activities in the dataset

subData$Label<-factor(subData$Label) # update the Labels column to be factors (levels 1-6)
levels(subData$Label) <- activityLabels[,2] # apply the activity labels

# subData[1:4,1:4] # just taking a quick look at the data
# table(subData$Label,useNA="ifany") # quick look  at the data in terms of activities
# table(subData$Subject,useNA="ifany") # quick look  at the data in terms of the 30 subjects
# any(is.na(subData)) # quick check to make sure there aren't any NAs; returns FALSE

subData$Subject<-factor(subData$Subject) # re-state Subject as factor, not int


## (5) create separate, independent tidy dataset: av of each var for each act & each subj
##
##  Here my tidy daya approach is:
##  (a) each variable stays as each column
##  (b) the average of the observations for each individual subject forms a row
##  (c) there is a separate table for each of the 6 activities (walking etc..)

# calculate the means for all variable, by both Subject and Label; store in interim:

interim<-subData %>% group_by(Subject,Label) %>% summarise_each(funs(mean)) 
# dim(interim) # gives 180 by 88 (that is subject i:activities 1-6 by variable, repeated x30)

##  Separate table for each activity, e.g. myTidyData$SITTING: 30 x 86(variables) table of means

myTidyData<-split(interim,interim$Label) # generates 6 tables, one for each activity

# write.table(myTidyData, file = "GCDCourseProject.txt", row.names = FALSE) # output text file

