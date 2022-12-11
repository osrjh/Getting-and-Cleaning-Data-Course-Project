# Code Book  

This code book describes the resulting tidy_data.txt file generated from running the run_analysis.R script. 

---

## Descriptions 

#### Source data  

The source data was obtained from:  
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available at the site where the data was obtained:   
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#### Identifying columns 

Subject: The ID of the subject who performed the activity for each window sample. It ranges from 1-30.  
Activity: The activity names performed by each subject when the measurements were recorded.

Activities were:
1. WALKING 
2. WALKING UPSTAIRS
3. WALKING DOWNSTAIRS
4. SITTING 
5. STANDING
6. LAYING

#### Variable columns
The measurement columns below are averages for each activity and each subject. 
The data comes from signals that were used to estimate variables of the feature vector for each pattern: 
  * '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAccMeanX                
tBodyAccMeanY                
tBodyAccMeanZ               
tBodyAccStdX                 
tBodyAccStdY                 
tBodyAccStdZ                 
tGravityAccMeanX             
tGravityAccMeanY            
tGravityAccMeanZ             
tGravityAccStdX             
tGravityAccStdY              
tGravityAccStdZ              
tBodyAccJerkMeanX           
tBodyAccJerkMeanY            
tBodyAccJerkMeanZ            
tBodyAccJerkStdX             
tBodyAccJerkStdY             
tBodyAccJerkStdZ            
tBodyGyroMeanX               
tBodyGyroMeanY               
tBodyGyroMeanZ               
tBodyGyroStdX                
tBodyGyroStdY               
tBodyGyroStdZ                
tBodyGyroJerkMeanX           
tBodyGyroJerkMeanY           
tBodyGyroJerkMeanZ           
tBodyGyroJerkStdX           
tBodyGyroJerkStdY            
tBodyGyroJerkStdZ            
tBodyAccMagMean              
tBodyAccMagStd               
tGravityAccMagMean          
tGravityAccMagStd            
tBodyAccJerkMagMean          
tBodyAccJerkMagStd           
tBodyGyroMagMean             
tBodyGyroMagStd             
tBodyGyroJerkMagMean         
tBodyGyroJerkMagStd          
fBodyAccMeanX                
fBodyAccMeanY                
fBodyAccMeanZ               
fBodyAccStdX                 
fBodyAccStdY                 
fBodyAccStdZ                 
fBodyAccMeanFreqX            
fBodyAccMeanFreqY           
fBodyAccMeanFreqZ            
fBodyAccJerkMeanX            
fBodyAccJerkMeanY            
fBodyAccJerkMeanZ            
fBodyAccJerkStdX            
fBodyAccJerkStdY             
fBodyAccJerkStdZ            
fBodyAccJerkMeanFreqX        
fBodyAccJerkMeanFreqY        
fBodyAccJerkMeanFreqZ       
fBodyGyroMeanX               
fBodyGyroMeanY               
fBodyGyroMeanZ               
fBodyGyroStdX                
fBodyGyroStdY               
fBodyGyroStdZ            
fBodyGyroMeanFreqX           
fBodyGyroMeanFreqY           
fBodyGyroMeanFreqZ           
fBodyAccMagMean             
fBodyAccMagStd           
fBodyAccMagMeanFreq       
fBodyBodyAccJerkMagMean      
fBodyBodyAccJerkMagStd   
fBodyBodyAccJerkMagMeanFreq 
fBodyBodyGyroMagMean     
fBodyBodyGyroMagStd         
fBodyBodyGyroMagMeanFreq     
fBodyBodyGyroJerkMagMean    
fBodyBodyGyroJerkMagStd    
fBodyBodyGyroJerkMagMeanFreq

---

## Transformations   

The original data was transformed by:
* Extracting only the mean and standard deviation variables for each measurement.
* Merges the training and test sets to create one data set.
* Assigns appropriate and readable labels using descriptive variable names from the `features.txt` file.
* Assigns descriptive activity names to name the activties in the data set from the `activity_lables.txt` file.
* Creates a second, independent tidy data set called `tidy_data.txt` with the average of each varaible for each activity and each subject. 
