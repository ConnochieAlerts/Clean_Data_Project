This Git contains the R script run_analysis2.R and the samsung data that it analyzes.  
Before running the R script you need to unzip all of the files from the course, this script does not do that. 
The R script does the following
Loads in dplyr
It reads in the X_train and y_train training data into subject_train 
It reads in the X_test and y_test test data into subject_test 
It then uses Rbind to merge into one dataset called merged_data 
Tidy_data is created by using "select" to keep the Subject and Activity columns, and then uses the contains commeand to keep columns with the phrases "mean" and "std"
Next it uses names to clean up the names so the data is more readable
Next final_data is created from tidy_data by pulling inthe Subject and Activity columns and then uses summarise_all to find the mean of the other numeric columns 
Finally, the script writes the data as "tidy_dataset2.txt" as requested 
