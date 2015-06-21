
---
title: "README"
author: "A. C. L."
date: "June, 2015"
output: html_document
---

### Introduction

This document (README.md/html; html version generated via *knitr*) describes 
how the script *run_analysis.R* works with the data set

**
"Human Activity Recognition Using Smartphones Data Set"[1]
**
Obtained from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This script prepares, from the data set above, a tidy data set 
(a text file named as *submission.txt*) 
that can be used for later analysis. 

### The Original Data Set 

The data set contains 10299 observations (training data: 7352 obs (~70%); 
test data: 2947 obs (~30%)) from experiments carried out by 30 subject
(volunteers with age: 19-48). Each subject 

- performed 6 activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
- wore a Samsung Galaxy S II and data such as 3-axial linear acceleration;
3-axial angular velocity are being recorded via the smartphones' embedded 
accelerometer and gyroscope.
- additional details regarding data (pre-)processing and assunmptions made
can be found in the files 'README.txt', 'features_info.txt' included in the
dataset.

For each observation it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and 
the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': stores a (561 X 2) table. First column stores the feature number
second column stores the feature name
- 'activity_labels.txt': stores a (6 X 2) table. First column stores the 
activity number; second column stores the activity name
- 'train/X_train.txt': store a (7352 X 561) table of training data. The 
(i (row), j(col)) entries is the measurements of the jth feature
as recorded in record i
- 'train/y_train.txt': stores a (7352 X 1) vector. The $i^{th}$ entry is the 
activity number of the activity record i referred to
- 'train/subject_train.txt': stores a (7352 X 1) vector. The $i^{th} entry$ 
stores the subject (its subject no; range: 1-30) where the record i is from
- 'test/X_test.txt': stores a (2947 X 561) table of test data. 
- 'test/y_test.txt': stores a (2947 X 1) vector. 
- 'test/subject_test.txt: stores a (2947 X 1) vector.

(The files above (test data) have structures analogous to their training 
data counterparts.)

-The files stored in the Inertial Signals directory. These data are available 
for the train and test data. Our tidy data set will not include them and the
details of them can be found in the file 'README.txt' included in the data set.

- For more information about te dataset check 'README.txt','features-info.txt'
or contact: activityrecognition@smartlab.ws

*****

### The script *run_analysis.R*

It develop the tidy data via 5 steps (outline stated below. Details about
operations performed can be found in the comments of the R script) 

**Step 1** Merges the training and the test sets to create one data set:

We append the test data to the training data for each related table via
*rbind* (i.e. *rbind* (train_data, test_data) for each related table) so
that the $i^{th}$ test observation will be re-numbered as the $7352 + i^{th}$
observation in the tidy data set. 

Right after Step 1, the data of interest will be stored in the tables
X_all (10299 X 561), y_all (10299 X 1) and subject_all (10299 X 1).

**Step 2**  Extracts only the measurements on the mean and standard deviation 
for each measurement.

We restrict our attention to the 86 features with names that contains mean 
or std as subtrings in the feature' name (see: features table). 


Right after Step 2, the data of interest will be stored in the tables
X_modified (10299 X 86), y_all (10299 X 1) and subject_all (10299 X 1).

**Step 3** Uses descriptive activity names to name the activities in the data set

We label the entries of the y_all vector via descriptive activities names as given
in act_labels table and call the results y_modified.


Right after Step 3, the data of interest will be stored in the tables
X_modified (10299 X 86), y_modified(10299 X 1) and subject_all (10299 X 1).

**Step 4** Appropriately labels the data set with descriptive variable names.

We label the columns of the tables X_modified (done in step 1), y_modified 
and subject_all (done in step 1) via descriptive names found from the table 
act_labels and features. We also label the columns of act_labels and 
features table. Note that some operations were already performed in Step 1.


**Step 5**  From the data set in step 4, creates a second, independent tidy 
data set with the average of each variable for each activity and each subject.

At the end of step 4, the tidy data are in the tables X_modified, y_modified and 
subject_all. We perform database operations (via ddply from the plyr package) to
the data as outline below:

- form the table *dat1* which contains all data and are sorted first by col 1
(activity) and by col 2 (sub_no).
- use ddply iteratively to get the means of the 86 variables. The col names
are relabeled to indicate that the values are the mean of the original measurements.
- The final result is stored in the data frame *averages*.
- The tidy data set is now formed by the *write.table* command:
  
  
```
write.table(averages,file="submission.txt",row.name=FALSE)
```




### Additional Notes

- Data from Inertial Signals will not included in the tidy data set after Step 2.

### Reference

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra 
and Jorge L. Reyes-Ortiz 
*Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine* 
International Workshop of Ambient Assisted Living (IWAAL 2012),
Vitoria-Gasteiz, Spain. Dec 2012
