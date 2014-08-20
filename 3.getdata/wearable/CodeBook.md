---
title: "Getting and Cleaning Data Course Project CODE BOOK"
author: "G. Scott Stuart"
date: "08/19/2014"
output: html_document
---

This code book and the data set it represents have been adapted from the "Human Activity Recognition Using Smartphones Data Set", provided by the Machine Learning Repository of the University of California, Irvine.  This new data set (see README.md) merges the original data from UCI and calculates aggregate values on certain fields, grouped by subject and activity.  Please refer to the original UCI documents for additional insight on the data:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

The column names in this data set are modified versions of the original names, with non-alphanumeric characters replaced with a single dot, and ".tidyMean" appended to indicate that these are aggregate values as specified by the Course Project.  Those unfamiliar with the original study are urged to review `features_info.txt` and other documents in the above-referenced ZIP file, as everything in this data set is derivative of UCI's original.

The first three columns indicate the activity and subject, and the remaining columns are the aggregated averages, all of which are variable-length real numbers.  Fields prefixed with a "t" are time series data captured at 50Hz.  Fields prefixed with an "f" are frequency domain signals.



```

DATA DICTIONARY

activity.id
    1. walking
    2. walking upstairs
    3. walking downstairs
    4. sitting
    5. standing
    6. laying
  
activity.desc
    description of activity
  
subject.id
    number corresponding to an individual participant in the study
    1..30
      
tBodyAcc.mean.X.tidyMean
    Mean of means of subject's body acceleration along the X axis.

tBodyAcc.mean.Y.tidyMean
    Mean of means of subject's body acceleration along the Y axis.

tBodyAcc.mean.Z.tidyMean
    Mean of means of subject's body acceleration along the Z axis.

tBodyAcc.std.X.tidyMean  
    Mean of standard deviations of subject's body acceleration along the X axis.

tBodyAcc.std.Y.tidyMean	
    Mean of standard deviations of subject's body acceleration along the Y axis.

tBodyAcc.std.Z.tidyMean
    Mean of standard deviations of subject's body acceleration along the Z axis.

tGravityAcc.mean.X.tidyMean
    Mean of means of subject's gravity acceleration along the X axis.	

tGravityAcc.mean.Y.tidyMean	
    Mean of means of subject's gravity acceleration along the Y axis.	

tGravityAcc.mean.Z.tidyMean
    Mean of means of subject's gravity acceleration along the Z axis.

tGravityAcc.std.X.tidyMean	
    Mean of standard deviations of subject's gravity acceleration along the X axis.

tGravityAcc.std.Y.tidyMean	
    Mean of standard deviations of subject's gravity acceleration along the Y axis.

tGravityAcc.std.Z.tidyMean
    Mean of standard deviations of subject's gravity acceleration along the Z axis.

tBodyAccJerk.mean.X.tidyMean	
    Mean of means of subject's body acceleration Jerk signal along the X axis.

tBodyAccJerk.mean.Y.tidyMean	
    Mean of means of subject's body acceleration Jerk signal along the Y axis.

tBodyAccJerk.mean.Z.tidyMean
    Mean of means of subject's body acceleration Jerk signal along the Z axis.

tBodyAccJerk.std.X.tidyMean	
    Mean of standard deviations of subject's body acceleration Jerk signal along the X axis.

tBodyAccJerk.std.Y.tidyMean	
    Mean of standard deviations of subject's body acceleration Jerk signal along the Y axis.

tBodyAccJerk.std.Z.tidyMean
    Mean of standard deviations of subject's body acceleration Jerk signal along the Z axis.

tBodyGyro.mean.X.tidyMean	
    Mean of means of subject's gyroscope signal along the X axis.

tBodyGyro.mean.Y.tidyMean	
    Mean of means of subject's gyroscope signal along the Y axis.

tBodyGyro.mean.Z.tidyMean
    Mean of means of subject's gyroscope signal along the Z axis.

tBodyGyro.std.X.tidyMean	
    Mean of standard deviations of subject's gyroscope signal along the X axis.

tBodyGyro.std.Y.tidyMean	
    Mean of standard deviations of subject's gyroscope signal along the Y axis.

tBodyGyro.std.Z.tidyMean
    Mean of standard deviations of subject's gyroscope signal along the Z axis.

tBodyGyroJerk.mean.X.tidyMean	
    Mean of means of subject's gyroscope Jerk signal along the X axis.

tBodyGyroJerk.mean.Y.tidyMean	
    Mean of means of subject's gyroscope Jerk signal along the Y axis.

tBodyGyroJerk.mean.Z.tidyMean
    Mean of means of subject's gyroscope Jerk signal along the Z axis.

tBodyGyroJerk.std.X.tidyMean	
    Mean of standard deviations of subject's gyroscope Jerk signal along the X axis.

tBodyGyroJerk.std.Y.tidyMean	
    Mean of standard deviations of subject's gyroscope Jerk signal along the Y axis.

tBodyGyroJerk.std.Z.tidyMean
    Mean of standard deviations of subject's gyroscope Jerk signal along the Z axis.

tBodyAccMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's body acceleration along all three axes.

tBodyAccMag.std.tidyMean	
    Mean of standard deviations of Euclidean norm of subject's body acceleration along all three axes.

tGravityAccMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's gravity acceleration along all three axes.

tGravityAccMag.std.tidyMean
    Mean of standard deviations of Euclidean norm of subject's gravity acceleration along all three axes.

tBodyAccJerkMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's body acceleration Jerk signal along all three axes.

tBodyAccJerkMag.std.tidyMean
    Mean of standard deviations of Euclidean norm of subject's body acceleration Jerk signal along all three axes.

tBodyGyroMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's gyroscope signal along all three axes.

tBodyGyroMag.std.tidyMean
    Mean of standard deviations of Euclidean norm of subject's gyroscope signal along all three axes.

tBodyGyroJerkMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's gyroscope Jerk signal along all three axes.

tBodyGyroJerkMag.std.tidyMean
    Mean of standard deviations of Euclidean norm of subject's gyroscope Jerk signal along all three axes.

fBodyAcc.mean.X.tidyMean	
    Mean of means of FFT of subject's body acceleration along the X axis.

fBodyAcc.mean.Y.tidyMean
    Mean of means of FFT of subject's body acceleration along the Y axis.

fBodyAcc.mean.Z.tidyMean
    Mean of means of FFT of subject's body acceleration along the Z axis.

fBodyAcc.std.X.tidyMean	
    Mean of standard deviations of FFT of subject's body acceleration along the X axis.

fBodyAcc.std.Y.tidyMean	
    Mean of standard deviations of FFT of subject's body acceleration along the Y axis.

fBodyAcc.std.Z.tidyMean
    Mean of standard deviations of FFT of subject's body acceleration along the Z axis.

fBodyAcc.meanFreq.X.tidyMean	
    Mean of weighted averages of subject's body acceleration along the X axis.

fBodyAcc.meanFreq.Y.tidyMean	
    Mean of weighted averages of subject's body acceleration along the Y axis.

fBodyAcc.meanFreq.Z.tidyMean
    Mean of weighted averages of subject's body acceleration along the Z axis.

fBodyAccJerk.mean.X.tidyMean	
    Mean of means of subject's body acceleration Jerk signal along the X axis.

fBodyAccJerk.mean.Y.tidyMean	
    Mean of means of subject's body acceleration Jerk signal along the Y axis.

fBodyAccJerk.mean.Z.tidyMean
    Mean of means of subject's body acceleration Jerk signal along the Z axis.

fBodyAccJerk.std.X.tidyMean	
    Mean of standard deviations of subject's body acceleration Jerk signal along the X axis.

fBodyAccJerk.std.Y.tidyMean	
    Mean of standard deviations of subject's body acceleration Jerk signal along the Y axis.

fBodyAccJerk.std.Z.tidyMean
    Mean of standard deviations of subject's body acceleration Jerk signal along the Z axis.

fBodyAccJerk.meanFreq.X.tidyMean	
    Mean of weighted averages of subject's body acceleration Jerk signal along the X axis.

fBodyAccJerk.meanFreq.Y.tidyMean	
    Mean of weighted averages of subject's body acceleration Jerk signal along the Y axis.

fBodyAccJerk.meanFreq.Z.tidyMean
    Mean of weighted averages of subject's body acceleration Jerk signal along the Z axis.

fBodyGyro.mean.X.tidyMean	
    Mean of means of subject's gyroscope signal along the X axis.

fBodyGyro.mean.Y.tidyMean	
    Mean of means of subject's gyroscope signal along the Y axis.

fBodyGyro.mean.Z.tidyMean
    Mean of means of subject's gyroscope signal along the Z axis.

fBodyGyro.std.X.tidyMean	
    Mean of standard deviations of subject's gyroscope signal along the X axis.

fBodyGyro.std.Y.tidyMean	
    Mean of standard deviations of subject's gyroscope signal along the Y axis.

fBodyGyro.std.Z.tidyMean
    Mean of standard deviations of subject's gyroscope signal along the Z axis.

fBodyGyro.meanFreq.X.tidyMean	
    Mean of weighted averages of subject's gyroscope signal along the X axis.

fBodyGyro.meanFreq.Y.tidyMean	
    Mean of weighted averages of subject's gyroscope signal along the Y axis.

fBodyGyro.meanFreq.Z.tidyMean
    Mean of weighted averages of subject's gyroscope signal along the Z axis.

fBodyAccMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's body acceleration along all three axes.

fBodyAccMag.std.tidyMean	
    Mean of standard deviations of Euclidean norm of subject's body acceleration along all three axes.

fBodyAccMag.meanFreq.tidyMean
    Mean of weighted averages of Euclidean norm of subject's body acceleration along all three axes.

fBodyBodyAccJerkMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's body acceleration Jerk signal along all three axes.

fBodyBodyAccJerkMag.std.tidyMean	
    Mean of standard deviations of Euclidean norm of subject's body acceleration Jerk signal along all three axes.

fBodyBodyAccJerkMag.meanFreq.tidyMean
    Mean of weighted averages of Euclidean norm of subject's body acceleration Jerk signal along all three axes.

fBodyBodyGyroMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's gyroscope signal along all three axes.

fBodyBodyGyroMag.std.tidyMean	
    Mean of standard deviations of Euclidean norm of subject's gyroscope signal along all three axes.

fBodyBodyGyroMag.meanFreq.tidyMean
    Mean of weighted averages of Euclidean norm of subject's gyroscope signal along all three axes.

fBodyBodyGyroJerkMag.mean.tidyMean	
    Mean of means of Euclidean norm of subject's gyroscope Jerk signal along all three axes.

fBodyBodyGyroJerkMag.std.tidyMean	
    Mean of standard deviations of Euclidean norm of subject's gyroscope Jerk signal along all three axes.

fBodyBodyGyroJerkMag.meanFreq.tidyMean
    Mean of weighted averages of Euclidean norm of subject's gyroscope Jerk signal along all three axes.


```

<br>
<br>




A sample of the data is shown below:

```
   activity.id    activity.desc subject.id tBodyAcc.mean.X.tidyMean tBodyAcc.mean.Y.tidyMean
1            1          WALKING         13                0.2759723              -0.01816997
2            1          WALKING         18                0.2775325              -0.01663202
3            1          WALKING         21                0.2783382              -0.01832671
4            1          WALKING         22                0.2747677              -0.01682736
5            1          WALKING         23                0.2734933              -0.01958926
6            1          WALKING         25                0.2784617              -0.01995439
7            2 WALKING_UPSTAIRS         20                0.2746876              -0.01881072
8            2 WALKING_UPSTAIRS         24                0.2767670              -0.01768225
9            2 WALKING_UPSTAIRS         28                0.2774107              -0.01949022
10           2 WALKING_UPSTAIRS         29                0.2791115              -0.01847195```


```

<center>
![](http://amuletanalytics.files.wordpress.com/2014/01/data_science_spec.jpg)
</center>

