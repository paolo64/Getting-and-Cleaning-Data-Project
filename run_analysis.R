# Input data are from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# the file is unziped into the "current directory"                      

# STEP#1. Merges the training and the test sets to create one data set.
xTrain <- read.table("train/X_train.txt")
xTest <- read.table("test/X_test.txt")
xAll <- rbind(xTrain, xTest)

yTrain <- read.table("train/y_train.txt")
yTest <- read.table("test/y_test.txt")
yAll <- rbind(yTrain, yTest)

sTrain <- read.table("train/subject_train.txt")
sTest <- read.table("test/subject_test.txt")
sAll <- rbind(sTrain, sTest)

# STEP2. Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")
indices_mean_std <- grep("-mean\\(\\)|-std\\(\\)", features$V2)
xAll <- xAll[, indices_mean_std]
names(xAll) <- features[indices_mean_std, 2]

# STEP3. Uses descriptive activity names to name the activities in the data set.
activities <- read.table("activity_labels.txt")
yAll[,1] = activities[yAll[,1], 2]
names(yAll) <- "activity"

# STEP4. Appropriately labels the data set with descriptive activity names.
names(sAll) <- "subject"
cleaned <- cbind(sAll, yAll, xAll)
write.table(cleaned, "out_merged_cleaned_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
# Reshape the data.
# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
numC <- dim(cleaned)[2]
uniqSubjects <- unique(sAll)[,1]
numSubjects <- length(uniqSubjects)
numActivities <- length(activities[,1])

final <- cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    act <- activities[a, 2]
    final[row, 1] = uniqSubjects[s]
    final[row, 2] = act
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==act, ]
    final[row, 3:numC] <- colMeans(tmp[, 3:numC])
    row = row+1
  }
}
write.table(final, "out_data_averages_per_activity_subject.txt")
