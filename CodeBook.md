Download the data below.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

Run the run_analysis.R script.

The R script performs these tasks in order. 

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables:

x_train, x_test, y_train, y_test, subject_train, and subject_test store the data from the downloaded zip file.
xmerge, ymerge, and subjectmerge respectively merge the aformentioned data sets into three datasets.
merged merges xmerge, ymerge, and subject merge into one large data set.
features and activities contain data from the downloaded zip file.
datams contains the extracted measurements of the mean and standard deviation for each measurement.
Data merges datams and activities into one data set.
TidyData contains the second, independent tidy data set with the average of each variable for each activity and each subject.
