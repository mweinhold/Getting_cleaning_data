## Merge the training and the test sets to create one data set.
## Extract only the measurements on the mean and standard deviation for each measurement. 
## Use descriptive activity names to name the activities in the data set
## Appropriately label the data set with descriptive variable names. 
##From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
setwd("UCI HAR Dataset/")

# Load: activity labels & feautures
activity_labels <- read.table("activity_labels.txt")[,2]
features <- read.table("features.txt")[,2]

# Create vec with loc of mean and std for each measurement 
extract_features <- grepl("mean|std", features)

#load relevant data 
x_test <- read.table("test/X_test.txt")[,extract_features]
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")


# Name the stuff
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(x_test)=features[extract_features]
names(subject_test) = "subject"

# Bind data
test_data <- cbind(subject_test, y_test, x_test)

# Same for traning data
x_train <- read.table("train/X_train.txt")[,extract_features]
y_train <- read.table("train/y_train.txt")

subject_train <- read.table("train/subject_train.txt")

names(x_train) = features[extract_features]

y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

train_data <- cbind(subject_train, y_train, x_train)

# Merge test and train
data = rbind(test_data, train_data)

id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
library(reshape2)
reshape_data      = melt(data,id_labels, data_labels)


mean_data   = dcast(reshape_data, subject + Activity_Label ~ variable, mean)

write.table(mean_data, file = "tidy_data.txt",row.names=FALSE)
