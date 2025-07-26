

# libraries
library(dplyr)

# Read raw data

features <- read.table("features.txt", col.names = c("index", "feature"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))

# Training data
x_train <- read.table("train/X_train.txt", col.names = features$feature)
y_train <- read.table("train/y_train.txt", col.names = "Activity")
subject_train <- read.table("train/subject_train.txt", col.names = "Subject")

# Test data
x_test <- read.table("test/X_test.txt", col.names = features$feature)
y_test <- read.table("test/y_test.txt", col.names = "Activity")
subject_test <- read.table("test/subject_test.txt", col.names = "Subject")

# Merge 
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Combine into one complete dataset
merged_data <- cbind(subject_data, y_data, x_data)

# Mean and std measurements
tidy_data <- merged_data %>%
  select(Subject, Activity, contains("mean"), contains("std"))

#  activity names
tidy_data$Activity <- activities[tidy_data$Activity, "activity"]

# variable names
names(tidy_data) <- names(tidy_data) %>%
  gsub("^t", "Time", .) %>%
  gsub("^f", "Frequency", .) %>%
  gsub("Acc", "Accelerometer", .) %>%
  gsub("Gyro", "Gyroscope", .) %>%
  gsub("Mag", "Magnitude", .) %>%
  gsub("BodyBody", "Body", .)

# averages for each subject/activity
final_data <- tidy_data %>%
  group_by(Subject, Activity) %>%
  summarise_all(mean)

# Output as txt
write.table(final_data, "tidy_dataset2.txt", row.names = FALSE)