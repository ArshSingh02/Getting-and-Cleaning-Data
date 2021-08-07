library(dplyr)
library(data.table)

filename <- "Getting_Cleaning.zip"

if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  "
        download.file(fileURL, filename, method="curl")
}  

if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("number", "activity"))

x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features[,2])

y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "number")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "number")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")


xmerge <- rbind(x_train, x_test)
ymerge <- rbind(y_train, y_test)
subjectmerge <- rbind(subject_train, subject_test)

merged <- cbind(subjectmerge, ymerge, xmerge)


columns <- colnames(merged)
meanstd <- (grepl("number", columns) | grepl("subject", columns) | grepl("mean", columns) | grepl("std", columns))
datams <- merged[, meanstd == TRUE]

Data <- merge(datams, activities, by = "number", all.x = TRUE)

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

TidyData <- aggregate(. ~subject + number + activity, Data , mean)
TidyData <- TidyData[order(TidyData$subject, TidyData$number),]
write.table(TidyData, "TidyData.txt", row.names = FALSE)