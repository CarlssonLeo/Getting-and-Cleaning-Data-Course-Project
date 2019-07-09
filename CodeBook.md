# Codebook for Coursera Getting and Cleaning Data Course Project
This directory contains a script, run_analysis.R, that takes data from a set of files containg spatial data from accelerometers and gyroscopes from Samsung Galaxy X-mobile phones, merges observations containing means and standard deviations for observations to a single data frame, merge_set, and then creates a second data frame, mean_set, that contains the means for each variable for each subject and activity.

## Variables in merge_set
There are 88 different variables in merge_set, with 10299 observations. 

### subject
This variable is an ID for each of the 30 participants in the experiment, ranging from 1 to 30.

### activity
This variable is a factor variable of the six different activities that have been logged. They are as following: Walking, Walking_Upstairs, Walking_Downstairs, Sitting, Standing, Laying.

### Feature-variables
The rest of the variables are variables containing information on different features. These have a unchanged syntax from the original experiment, and reads as follows:

Variables can begin with t or f, where t stands for time and f or frequency. They end with X, Y or Z, denoting the 3D-plane of which the measurement is taken. 

The body of the variable name contains abbreviations for quick identification of long names.

Taken from the features_info.txt file from the raw data-folder, which describes the names best:
"Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'"

## Variables in mean_set
There are still 88 variables in mean_set, but only 180 observations, containing the mean of each observation for each subject and activity. So, subject 1 has in merge_set several observations of walkinig. In mean_set, all these observations are averaged, so subject 1 only has one observation of walking, containing the mean values for each variable. All the variable names function in the same way.