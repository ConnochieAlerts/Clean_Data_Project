This Git contains the R script run_analysis2.R and the samsung data that it analyzes.  
Before running the R script you need to unzip all of the files from the course, this script does not do that. 

The script follows these main steps:
Merge the training and the test datasets to create one data set.
Loads activity, subject, and measurement data for both test and training sets.
Combines them into a single, unified dataset.
Extract only the measurements on the mean and standard deviation for each measurement.
Uses select() with contains("mean") and contains("std") to isolate relevant columns.
Use descriptive activity names to name the activities in the data set.
Replaces activity codes with descriptive labels (e.g., “WALKING”, “LAYING”).
Label the dataset with descriptive variable names.
Applies cleaned column names to improve readability and interpretability.
Create a second, independent tidy dataset with the average of each variable for each activity and each subject.
Groups the data by Subject and Activity.
Uses summarise_all(mean) to compute the average of each variable.

Outputs the result to a file called tidy_dataset.txt.

Uses R packages: 
dyplr, and readr
