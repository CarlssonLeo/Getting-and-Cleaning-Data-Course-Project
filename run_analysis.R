# Neccecary packages
library(tidyverse)

# Appropriately labels the data set with descriptive variable names
# This uses the variable names as described in features.txt in the data folder,
# which admitedly may not be the easiest to follow at first. However,
# this data is assumed to be cleaned for someone with atleast some insight in 
# the study, so the variable names are NOT changed in any way. This
# is to make reproducability easier, and for different reserachers using the same
# data to be able to understandn each others data in the same way.
names <- read.table("./Data/UCI HAR Dataset/features.txt", sep = " ")
names <- as.character(names$V2) 


# Read Test ---------------------------------------------------------------
# Read subject
subject_test <- read.table("./Data/UCI HAR Dataset/test/subject_test.txt")
subject_test <- rename(subject_test, subject = V1)

# Read X, using the names variable for column names
X_test <- read.table("./Data/UCI HAR Dataset/test/X_test.txt", col.names = names)

# Read y
# Uses descriptive activity names to name the activities in the data set
y_test <- read.table("./Data/UCI HAR Dataset/test/y_test.txt")
y_test <- rename(y_test, activity = V1)
#set factor names
y_test$activity <- factor(y_test$activity,
                        levels = c(1,2,3,4,5,6),
                        labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying"))

#merge into a combined test-dataframe
test <- cbind(subject_test, y_test, X_test)

# Read Train --------------------------------------------------------------

# Read Train-files
subject_train <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt")
subject_train <- rename(subject_train, subject = V1)

#using the names variable for column names
X_train <- read.table("./Data/UCI HAR Dataset/train/X_train.txt", col.names = names)

# Uses descriptive activity names to name the activities in the data set
y_train <- read.table("./Data/UCI HAR Dataset/train/y_train.txt")
y_train <- rename(y_train, activity = V1)
y_train$activity <- factor(y_train$activity, 
                        levels = c(1,2,3,4,5,6),
                        labels = c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying"))


train <- cbind(subject_train,y_train, X_train)


# Merge -------------------------------------------------------------------

# Merges the training and the test sets to create one data set.
merge_set <- rbind(train, test) 
merge_set <- arrange(merge_set, subject) #sorts by subject, from 1 to 30


# Extract -----------------------------------------------------------------

# Extracts only the measurements on the mean and standard deviation 
# for each measurement.

merge_set <- select(merge_set, subject, activity, contains("mean"),contains("std"))


# Mean --------------------------------------------------------------------

# From the data set in step 4, creates a second, independent tidy data 
# set with the average of each variable for each activity and each subject.


mean_set<- merge_set %>% 
        group_by(subject, activity) %>% 
        summarise_all(funs(mean))
write.table(mean_set, "./mean_set.txt", row.names = FALSE)

#if the file is run as a whole, print the mean_set
mean_set
