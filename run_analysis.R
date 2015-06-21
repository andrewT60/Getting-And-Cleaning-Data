## Get and Clean Data 
## Term Project
## Filename: run_analysis.R
## Last Modified: 6/17/2015

###########################################################
## This file and the data are stored in the same directory
## as follows:
## current_dir
##  run_analysis.R
##  \data
##      activity_labels.txt
##      features.txt
##      \train
##          X_train.txt
##          y_train.txt
##          subject_train.txt
##          \Inertial Signals
##              body_acc_x_train.txt
##              body_acc_y_train.txt
##              body_acc_z_train.txt
##              body_gyro_x_train.txt
##              body_gyro_y_train.txt
##              body_gyro_z_train.txt
##              total_acc_x_train.txt
##              total_acc_y_train.txt
##              total_acc_z_train.txt
##      \test
##          X_test.txt
##          y_test.txt
##          subject_test.txt
##          \Inertial Signals
##              body_acc_x_test.txt
##              body_acc_y_test.txt
##              body_acc_z_test.txt
##              body_gyro_x_test.txt
##              body_gyro_y_test.txt
##              body_gyro_z_test.txt
##              total_acc_x_test.txt
##              total_acc_y_test.txt
##              total_acc_z_test.txt
###########################################################
## Part 1
## Step 1:  Merges the training and the test sets 
##          to create one data set.

## Merge X_train.txt and X_test.txt
## Store the results in the table X_all

act_labels<-read.table("./data/activity_labels.txt")
features<-read.table("./data/features.txt")

X_train<-read.table("./data/train/X_train.txt")
X_test<-read.table("./data/test/X_test.txt")
X_all<-rbind(X_train,X_test)
colnames(X_all)<-features[,2]   ## part of step 4 reference here

## Merge y_train.txt and y_test.txt
## Store the results in the table y_all

y_train<-read.table("./data/train/y_train.txt")
y_test<-read.table("./data/test/y_test.txt")
y_all<-rbind(y_train,y_test)

## Merge subject_train.txt and subject_test.txt
## Store the results in the table subject_all

subject_train<-read.table("./data/train/subject_train.txt")
subject_test<-read.table("./data/test/subject_test.txt")
subject_all<-rbind(subject_train,subject_test)
colnames(subject_all)<-"sub_no" ## part of step 4 reference here


## Merge the data files in Inertial Signal directories

## Merge body_acc_x_train.txt and body_acc_x_test.txt
## to get       body_acc_x_all.txt

body_acc_x_train<-read.table("./data/train/Inertial Signals/body_acc_x_train.txt")
body_acc_x_test<-read.table("./data/test/Inertial Signals/body_acc_x_test.txt")
body_acc_x_all<-rbind(body_acc_x_train,body_acc_x_test)

## and perform analogous operations to the remaining 8 pairs to get
##              body_acc_y_all.txt

body_acc_y_test<-read.table("./data/test/Inertial Signals/body_acc_y_test.txt")
body_acc_y_train<-read.table("./data/train/Inertial Signals/body_acc_y_train.txt")
body_acc_y_all<-rbind(body_acc_y_train,body_acc_y_test)

##              body_acc_z_all.txt

body_acc_z_test<-read.table("./data/test/Inertial Signals/body_acc_z_test.txt")
body_acc_z_train<-read.table("./data/train/Inertial Signals/body_acc_z_train.txt")
body_acc_z_all<-rbind(body_acc_z_train,body_acc_z_test)


##              body_gyro_x_all.txt

body_gyro_x_test<-read.table("./data/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_x_train<-read.table("./data/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_x_all<-rbind(body_gyro_x_train,body_gyro_x_test)

##              body_gyro_y_all.txt

body_gyro_y_test<-read.table("./data/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_y_train<-read.table("./data/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_y_all<-rbind(body_gyro_y_train,body_gyro_y_test)

##              body_gyro_z_all.txt

body_gyro_z_test<-read.table("./data/test/Inertial Signals/body_gyro_z_test.txt")
body_gyro_z_train<-read.table("./data/train/Inertial Signals/body_gyro_z_train.txt")
body_gyro_z_all<-rbind(body_gyro_z_train,body_gyro_z_test)


##              total_acc_x_all.txt

total_acc_x_test<-read.table("./data/test/Inertial Signals/total_acc_x_test.txt")
total_acc_x_train<-read.table("./data/train/Inertial Signals/total_acc_x_train.txt")
total_acc_x_all<-rbind(total_acc_x_train,total_acc_x_test)

##              total_acc_y_all.txt

total_acc_y_test<-read.table("./data/test/Inertial Signals/total_acc_y_test.txt")
total_acc_y_train<-read.table("./data/train/Inertial Signals/total_acc_y_train.txt")
total_acc_y_all<-rbind(total_acc_y_train,total_acc_y_test)

##              total_acc_z_all.txt

total_acc_z_test<-read.table("./data/test/Inertial Signals/total_acc_z_test.txt")
total_acc_z_train<-read.table("./data/train/Inertial Signals/total_acc_z_train.txt")
total_acc_z_all<-rbind(total_acc_z_train,total_acc_z_test)


## Step 2:  Extracts only the measurements on the mean 
##          and standard deviation for each measurement.

## Determine from the second column of the features table which features
## are measurements on the mean or measurements on the std
## Criteria used: has either the substring mean or std in the feature name

has_either<- grep("mean|std",features[,2],ignore.case=TRUE)


## Restrict X_all that are related to the features
## as included in has_either only

X_modified<-X_all[,has_either]
## y_all and subject_all remains unchanged as no observations 
## were being eliminated

## Step 3:  Uses descriptive activity names to name the 
##          activities in the data set

## Descriptive activity names are stored in act_labels
## we rename the activities (represented by number) in y_all to descriptive 
## names as given in act_labels and store the results in y_modified (data.frame)

y<-as.matrix(y_all)
y_modified<-as.character(y_all)
for(i in 1:length(y)){
    y_modified[i]<-as.character(act_labels[y[i],2])
}
y_modified<-as.data.frame(y_modified)


## Step 4:  Appropriately labels the data set with descriptive 
##          variable names.
## for activities
colnames(act_labels)<-c("act_no","act_name")
## for features
colnames(features)<-c("feat_no","feat_name")
## for X_modified See line 53
## for y_modified
colnames(y_modified)<-"activity"
## for subject_all see line 68

## Step 5: From the data set in step 4, creates a second, 
## independent tidy data set with the average of each variable for each activity
## and each subject.

## After step 4, the data set has been downsided. It has essentially 
## 1. features table
## 2. activity labels table
## 3. X table: 10299 observations (row no.) Each observation has 86 features
##    all are related to either mean or std measurements
## 4. y table: a table to describe the activity performed for each observation
## 5. subject table: a table to describe who (represented by sub_no) is being
##    observed for each observation 
##    

## use library plyr
library(plyr)
## form the table which contains all data
dat<-cbind(y_modified, subject_all,X_modified)
dat1<-arrange(dat, activity, sub_no)

## use ddply repeatedly to get the means of all variables
## Note: see help R pages of ddply

averages<-NULL
for(i in 3:88){
    ## get data from dat1
    current<-data.frame(activity=dat1[,1],subject=dat1[,2], variable=dat1[,i])
    if (i==3) {
        getmean<-ddply(current,.(activity,subject),summarize, mean(variable))
        colnames(getmean)[3]<-paste("The mean of ",colnames(dat1)[3])
    }
    else {
        getmean<-ddply(current,.(activity,subject),summarize, mean(variable))[3]
        colnames(getmean)<-paste("The mean of",colnames(dat1)[i])
    }
    averages<-c(averages,getmean) 
}
averages<-data.frame(averages)
write.table(averages,file="submission.txt",row.name=FALSE)
