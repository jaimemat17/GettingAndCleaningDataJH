# GettingAndCleaningDataJH
 
## Introduction

The code and data included in this repository is part of the Assignment for the project of the Coursera course Getting And Cleaning Data by Johns Hopkins University.
The purpose of this project is to demonstrate our ability to collect, work with, and clean a data set.

## Data

Information about the data taken for the assignment can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Analysis performed

- Merges the training and the test sets to create one data set.

- Extracts only the measurements on the mean and standard deviation for each measurement. 

- Uses descriptive activity names to name the activities in the data set

- Appropriately labels the data set with descriptive variable names. 

- From the data set in previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script run_analysis.R takes the test and training data from the data folder and generates a file called "tidyDataset.txt" with the final dataset obtained from the previous steps.
