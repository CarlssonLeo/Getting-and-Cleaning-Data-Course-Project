# Codebook for Coursera Getting and Cleaning Data Course Project
This directory contains a script, run_analysis.R, that takes data from a set of files containg spatial data from accelerometers and gyroscopes from Samsung Galaxy X-mobile phones, merges observations containing means and standard deviations for observations to a single data frame, merge_set, and then creates a second data frame, mean_set, that contains the means for each variable for each subject and activity.

## Variables in merge_set
There are 88 different variables in merge_set. 

### subject
This variable is an ID for each of the 30 participants in the experiment, ranging from 1 to 30.

### activity
This variable is a factor variable of the six different activities that have been logged. They are as following: Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying.

### Feature-variables
The rest of the variables 
