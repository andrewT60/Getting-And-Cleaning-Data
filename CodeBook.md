---
title: "CodeBook"
author: "A. C. L."
date: "June, 2015"
output: html_document
---

## The Tidy Data Set

* filename: ```submission.txt```
* source:   Derive from the data set 
**
"Human Activity Recognition Using Smartphones Data Set" ([1])
**
Obtained from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

* format: The txt file contains a $180$ by $88$ table ($181$ row if the column
names are counted). Each row stores a record
of an activity (specified by the first entry) performed by a subject (specified
by the second entry). Each remaining entry store the average of a variable in
the original data set.  There are 86 variables in this tidy data set.

* features of the original data set: 
There are 561 features in the original data set. The feature description,
given in the file features_info.txt (included as an appendix in this document)
provides the details of the meanings of these features.

* Natures of the variables included in the tidy data set:

First we select, from the 561 features, those with names that have either the 
term *mean* or *std* (standard deviation) in it.  Second, we collect, for each
feature selected, the data and group them by fixing the activity and subject.
We will then take the average of the data. As we have 6 disinct activities
and 30 subjects, we will obtain 180 rows of data. The first two entries 
(activity and subject) serves as the identifier of the record. Each of the 
remaining 86 entries will store the average of quantity the.mean.of.X, where
X is a feature (among the 561 features) with names that has the term *mean* 
and *std* in it.  The column names of tidy data set table will show this
naming convention.

* The dataset meets the Tidy requirement. That is, each variable you measured 
is in 1 column. Also,  each different observation of that variable is stored
in a different row

* Data types of the 88 columns

1. column 1  one of the following character strings: 
"WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING",
"STANDING" or "LAYING"

2. Column 2  an integer within the range 1 to 30 (including end points)
3. Column 3 - Column 88:  real number 

* Additional notes

1. The Unit for each of the last 86 data fields is THE SAME AS the corresponding
column in the origin data set (See appendix for further details)
2. The measurement of the feature data are normalized and bounded between [-1,1]
(stated in the README.txt file that came with the original dataset)
3. A full description of the dataset and the experiments performed  can be found
in [2]

### Reference

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra 
and Jorge L. Reyes-Ortiz 
*Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine* 
International Workshop of Ambient Assisted Living (IWAAL 2012),
Vitoria-Gasteiz, Spain. Dec 2012

[2]
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones (http://archive.ics.uci.edu/ml/datasets
/Human+Activity+Recognition+Using+Smartphones)

## Appendix 

It is taken from the {\tt features_info.txt} file that came with the original data set
It contains details on the meaning of the features, how some of the data are being
collected and the values of the parameters related in the process and how some
of the quantities are being calculated.

### Excerpts from features_info,txt file

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

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

The complete list of variables of each feature vector is available in 'features.txt'

