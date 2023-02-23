## Project script for Getting and Cleaning Data Course
## Author: Jaime Tejero Bermúdez

library(dplyr)

# Get features names
featuresNames <- read.table("data/features.txt")
# Filter features to take those related with mean and standard deviation
featuresNames <- featuresNames %>% filter(grepl("mean()", V2, fixed = TRUE) 
                                          | grepl("std()", V2, fixed = TRUE))
#Get activity labels
activityLabels <- read.table("data/activity_labels.txt")

## Getting train data
X_trainData <- read.table("data/train/X_train.txt")
# Keep only relevant columns and set descriptive columns names
X_trainData <- X_trainData[,featuresNames$V1]
names(X_trainData) <- featuresNames$V2
#Get train subjects
trainSubjects <- read.table("data/train/subject_train.txt",col.names = c("Subject"))

Y_trainData <- read.table("data/train/Y_train.txt")
names(Y_trainData) <- c("Activity")
# Renaming labels
for(i in 1:6){
  Y_trainData[Y_trainData$Activity==i,] <- activityLabels[i,][2]
}

trainData = cbind(trainSubjects,Y_trainData,X_trainData)

## Getting test data
X_testData <- read.table("data/test/X_test.txt")
# Keep only relevant columns and set descriptive columns names
X_testData <- X_testData[,featuresNames$V1]
names(X_testData) <- featuresNames$V2
#Get test subjects
testSubjects <- read.table("data/test/subject_test.txt",col.names = c("Subject"))

Y_testData <- read.table("data/test/Y_test.txt")
names(Y_testData) <- c("Activity")
# Renaming labels
for(i in 1:6){
  Y_testData[Y_testData$Activity==i,] <- activityLabels[i,][2]
}

testData = cbind(testSubjects,Y_testData,X_testData)

## Merge test and training datasets

cleanDataset = rbind(trainData, testData)

groupedData <- cleanDataset %>% 
                group_by(Subject,Activity) %>%
                summarize(across(everything(), ~mean(.)))
