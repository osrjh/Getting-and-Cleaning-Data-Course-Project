# Installing necessary packages
library(reshape2)

# Creating parameter strings 
dataset_dir <- "./Source Data"
data_dir <- "./Data"
output_dir <- "./Output"

dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataset_file_name <- "rawData.zip"

dataset_file_path <- paste0(dataset_dir,"/rawData.zip")
file_paths <- "./Data/UCI HAR Dataset/"

# Downloading the zip file if the dataset has not already been downloaded 
if(!file.exists(dataset_file_path)) {
  dir.create(dataset_dir)
  download.file(url = dataset_url, destfile = dataset_file_path)
}

# Unzipping the dataset if it has not already been unzipped
if(!file.exists(data_dir)) {
  dir.create(data_dir)
  unzip(zipfile = dataset_file_path, exdir = data_dir)
}

# Extracting the mean and standard deviation indexes for each measurement.
features <- readLines(paste0(file_paths,"features.txt"))
mean_indexes <- grep(".*mean.*", features)
std_indexes <- grep(".*std*", features)
mean_and_std_indexes <- sort(c(mean_indexes, std_indexes))

# Loading the data
training_subjects <- read.table(paste0(file_paths, "train/subject_train.txt"))
training_labels <- read.table(paste0(file_paths, "train/Y_train.txt"))
train <- read.table(paste0(file_paths, "train/X_train.txt"))[mean_and_std_indexes]
train <- cbind(training_subjects, training_labels, train) 

testing_subjects <- read.table(paste0(file_paths, "test/subject_test.txt"))
testing_labels <- read.table(paste0(file_paths, "test/Y_test.txt"))
test <- read.table(paste0(file_paths, "test/X_test.txt"))[mean_and_std_indexes]
test <- cbind(testing_subjects, testing_labels, test) 

# Merging the training and test data into one dataset
merged_data <- rbind(train, test)

# Assigning appropriate labels using descriptive variable names
names(merged_data) <- c("Subject", "Activity", features[mean_and_std_indexes])
names(merged_data) <- gsub("[-()]","", names(merged_data))
names(merged_data) <- gsub("mean","Mean", names(merged_data))
names(merged_data) <- gsub("std","Std", names(merged_data))
names(merged_data) <- gsub("\\d* ","", names(merged_data))

# Extracting the descriptive activity names to name the activities in the data set
activity_names <- read.table("./Data/UCI HAR Dataset/activity_labels.txt")

# Assigning descriptive activity names to name the activities in the data set
merged_data$Subject <- as.factor(merged_data$Subject)

merged_data$Activity <- factor(merged_data$Activity,
                               levels = activity_names[,1],
                               labels = as.character(activity_names[,2]))

# Generating the tidy data set 
melted_data <- melt(merged_data, id = c("Subject", "Activity"))
tidy_data <- dcast(melted_data, Subject + Activity ~ variable, mean)

# Writing the output file

if(!file.exists(output_dir)) {
  dir.create(output_dir)
}

write.table(tidy_data, "./Output/tidy_data.txt", 
            row.names = FALSE, 
            quote = FALSE)
