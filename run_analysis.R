#try to do merge
library(dplyr)

##1.Merges the training and the test sets to create one data set

##read training dataset 
x_train <- read.table("Analysis_Project/UCI-dataset/X_train.txt") 

##read testing dataset
x_test <- read.table("Analysis_Project/UCI-dataset/X_test.txt")

# merge the Training and testing sets into x_data  dataset
x_data <- bind_rows(x_train, x_test)
###############################################################################

##read training labels dataset 
y_train <- read.table("Analysis_Project/UCI-dataset/y_train.txt")

##read testing labels dataset 
y_test <- read.table("Analysis_Project/UCI-dataset/y_test.txt")

# merge the Training and testing labels into y_data  dataset
y_data <- bind_rows(y_train, y_test)
##############################

##read subject at training dataset
subject_train <- read.table("Analysis_Project/UCI-dataset/subject_train.txt")

##read subject at testing dataset
subject_test <- read.table("Analysis_Project/UCI-dataset/subject_test.txt")

# merge the Training and testing subject into 'subject' dataset
subject_data <- bind_rows(subject_train, subject_test)

##################################################################################################
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 

##read the whole features of the dataset
features <- read.table("Analysis_Project/UCI-dataset/features.txt")

## get only features with mean() or std() in their names
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

## subset the x_data to find the desired columns
x_data_sample <- x_data[, mean_std_features]

## name the variables with the selected column names
names(x_data_sample) <- features[mean_std_features, 2]

###################################################################################################
#3.Uses descriptive activity names to name the activities in the data set

#read the activity labels (the descriptive activity names)
activities <- read.table("Analysis_Project/UCI-dataset/activity_labels.txt")

#convert the y-data from numeric to characters, each activity with its name label
y_data[ , 1] <- activities[y_data$V1, 2]

##################################################################################################
#4.Appropriately labels the data set with descriptive variable names. 
##rename label variable with "activity_name"
names(y_data) <- "activity_name"

##rename subject variable with "subject"
names(subject_data) <- "subject"

##modify the column names of dataset with new names:
## read current names
colNames<-colnames(x_data_sample) 

## remove () from names 
tmp <-gsub("\\(\\)","",colNames)  

##replace "BodyBody" with "Body"
descolNames<-gsub("BodyBody","Body",tmp)

#rename the header with modified names
names(x_data_sample) <-descolNames

####################################################################################################
#5.From the data set in step 4, creates a second, independent tidy data set with the average of
#each variable for each activity and each subject.

#To group the dataset on x_data_sample (mean and std data-set) with activity and subject means we have to 
#gather them in one data frame where each observation has 66 variables in addition to subject and activity new variables.

#Add new variable 'subject' into the sample dataset from  subject_data
subject_x_dataset<-mutate(x_data_sample,subject=subject_data$subject)

#Add new variable 'activity' into the sample dataset from  activity_name of label dataset
activity_subject_x_dataset<-mutate(subject_x_dataset,activity=y_data$activity_name)

#Group the sample dataset by the subject (30 different subject) then by activity (6 different subject)
activity_subject_x_dataset_groups<-group_by(activity_subject_x_dataset,subject,activity)

#Find the average of each group separately  which produces a single value for each group (180 different value)
average_dataset<-summarise_each(activity_subject_x_dataset_groups,funs(mean))    
    
#save the dataset into average_dataset.txt tidy-dataset
write.table(average_dataset, "Analysis_Project/UCI-dataset/average_dataset.txt", row.name=FALSE)   
    