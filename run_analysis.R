# First of all set the 'UCI HAR Dataset' directory to be the current working dir with the 'setwd' function.

# 1. Merge training and test sets to create one data set.
X_train       <- read.table('train/X_train.txt')
y_train       <- read.table('train/y_train.txt')
subject_train <- read.table('train/subject_train.txt')

X_test        <- read.table('test/X_test.txt')
y_test        <- read.table('test/y_test.txt')
subject_test  <- read.table('test/subject_test.txt')

X_total <- rbind(X_train,X_test)
y_total <- rbind(y_train,y_test)
subject_total <- rbind(subject_train,subject_test)

total <- cbind(subject_total,y_total,X_total)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
features <- read.table('features.txt')
featuresVector <- as.vector(features$V2)
colnames(total) <- c("subject","activity",featuresVector)

total <- total[, grep('subject|activity|mean\\(\\)|std\\(\\)',colnames(total))]

# 4. Appropriately label the data set with descriptive variable names. 
activityLabels <- read.table("activity_labels.txt")
total[,2] <- activityLabels[total[,2],2]

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
totalAvg <- ddply(total, .(subject, activity), function(x) colMeans(x[,3:68],na.rm=TRUE))
write.table(totalAvg, "averages_by_subject_and_activity.txt", row.name=FALSE)