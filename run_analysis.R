
library(plyr)

# read all necessary data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = " ")
features <- read.table("UCI HAR Dataset/features.txt", sep = " ")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")

# change variable names
names(X_train) <- features[, 2]
names(X_test) <- features[, 2]
names(subject_train) <- "subject"
names(subject_test) <- "subject"

# select only those varibles that denote mean or standard deviation
X_train <- X_train[, grep("mean|std", names(X_train))]
X_test <- X_test[, grep("mean|std", names(X_test))]

# get vectors describing the activities by words
y_train_factors <- activity_labels[y_train[, 1], 2]
y_test_factors <- activity_labels[y_test[, 1], 2]

# compose train and test data
train_data <- cbind(subject_train, activity = y_train_factors, X_train)
test_data <- cbind(subject_test, activity = y_test_factors, X_test)

# join train and test data into one dataset
all_data <- rbind(train_data, test_data)

# compute mean value of all variables for each subject and activity
summarized_data <- ddply(all_data, .(subject, activity), numcolwise(mean))

# save the data from previous step into a text file
write.table(summarized_data, "TidyData.txt", row.names = FALSE)

