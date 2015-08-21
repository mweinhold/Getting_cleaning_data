#README

This is a project for the Getting and Cleaning Data MOOC from John Hopkins.

## Steps performed
We used [data]
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
created a script run_analysis.R that 
 
1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


As long as the data is unzipped in the current directory creating a subdirectory UCI HAR Dataset just executing the script will result in a tidy_data.txt as required, as long as reshape2 is installed.
