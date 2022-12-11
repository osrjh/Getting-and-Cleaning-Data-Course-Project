# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Coursera Data Science Specialisation - Getting and Cleaning Data course. 

The R script is called `run_analysis.R` and does the following:

1. Downloads the data set from the web if it does not exist in the directory. 
2. Unzips the donwloaded zip file if it has not already been extracted.
3. Grabs the indexes for the mean and standard deviation measurements.
4. Loads the training and test sets - extracting only the measurements on the mean and standard deviation for each measurement. 
5. Merges the training and test sets to create one data set. 
6. Assigns appropriate labels using descriptive variable names.
7. Assigns descriptive activity names to name the activities in the data set.
8. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The tidy data set is included in the repository - `tidy_data.txt`

A code book is also included that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
