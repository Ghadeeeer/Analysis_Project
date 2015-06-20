# Analysis_Project
# Getting and Cleaning Data Course Project

This repository contains one R script and documentation files for the project of  "Getting and Cleaning data" course provided by coursera.

#Dataset
The dataset being used is: Human Activity Recognition Using Smartphones, A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Files

  - run_analysis.R : R script will perform different processing steps on the               dataset to transforme the messy dataset into a tidy dataset ready for further          analysis .Moreover, it will calculate the means per activity, per subject of the      mean and Standard deviation measurements of sample group of the dataset.
  - CodeBook.md : describes the variables, the data, and transformations and the work     that was performed to clean up the data.
  - UCI-dataset: contains the downloaded and extracted messy dataset in addition to       a sample tidy of dataset that generated after the running the script
  - UCI-dataset/average_dataset.txt : Independent tidy dataset with the average of       each variable for each activity and each subject.


  #Required Packages:
 In order to run the R script, you need to install and load [dplyr] package 
```sh
  > install.packages('dplyr')
  > library('dplyr')
```
[dplyr]:http://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html