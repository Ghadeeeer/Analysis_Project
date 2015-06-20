
#The dataset:
The dataset being used is: Human Activity Recognition Using Smartphones,which is accelerometer data generated from an experiment with Samsung Galaxy S smartphones.
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

You can download the dataset used in the project from [link]
#Variable (Fields)

[link]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  #Transformations:
  There are a set of steps done on the dataset to prepare it for analysis. These steps include :
  - Merging two different datasets (training,testing) into one complete dataset, the number of observations after merging is (10299 obs.) each of them has (561) different variables describing it.
  - Subsetting the variables to extract only the measurements on the mean and standard    deviation for each measurement. The number of variables after Subsetting the   columns is down to 66 variables.
  - Renaming the activity values in the y_data into a descriptive activity names to        name the activities in the dataset with appropriate readable label
  - Changing the labels in  dataset with descriptive variable names: 
  
  The variable of activity dataset (y_dataset) is named by (activity), the variable in the subject dataset is named by (subject),and the complete x dataset is named by the selected 66 variables from features.txt file after doing simple modification like removing redundent words ("BodyBody" modified to "Body") and  removing some characters ("()" is removed from the variables names).

  - Grouping a subset of dataset by different variables (subject,activity) then    calculating average of each variable for each activity and each subject.
  - A new tidy dataset is created for the variables average in each group.
  
####The purpose of the analysis is to Tidying messy dataset. In what follows, I will specify the most common problems with messy datasets and disscus the exsistance of each on in the Human Activity Recognition dataset.

  - Column headers are values, not variable names: 
  - 
  - 
  - This problem exists in the dataset 
   one of the main problem of the data-set is that 
  -A single observational unit is stored in multiple tables
  -Multiple variables are stored in one column
- Variables are stored in both rows and columns

