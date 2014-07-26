---
title: "README"
author: "evoletttt (Lovette Regner)"
date: "Saturday, July 26, 2014"
output: pdf_document
---

# SUMMARY
The experiment measured the 3-axial linear acceleration and 3-axial angular velocity (at a constant rate of 50Hz) of thirty volunteers performing six activities: walking, walking upstairs, walking downstairs, sitting, standing and laying. These were measured using the embedded accelerometer and gyroscope of Samsung Galaxy SII units worn on their waists. The tidy data consist of the means of the means and standard deviations of the measurement variables per subject and activity combination.




# LABELS
## Subject
Column 1: numeric with values 1:30. Each number (1:30) represents a unique study respondent.

## Activity
Column 2: factor with levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. This represents the activity done by the respective respondent that resulted to the rest of the measurements.




# MEASUREMENTS
The 66 measurement variables are the means and standard deviations of each respective variable set. There are 17 tidy variable sets, each with its corresponding mean and standard deviation variables. These variable sets can be simplified to four types: untransformed 3-axial, untransformed magnitude, transformed 3-axial, and transformed magnitude. For the complete untidy variables, please refer to the README.md file.

For a more detailed explanation on these features, here is some verbatim explanation from the original dataset: The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Type 1: UNTRANSFORMED 3-AXIAL
Columns 3-32: 5 numeric variable sets (tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ). These variables sets have 3 means and 3 stdev variables each. These three values represent the variable set value per XYZ axis. The numeric values correspond to the mean summary of all the mean/stdev variable values corresponding with the respective subjects and activities; thus, for every subject and activity combination, there is only one value per variable.

## Type 2: UNTRANSFORMED MAGNITUDE
Columns 33-42: 5 numeric variable sets (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). These variables sets have one set of mean and stdev variables each. The numeric values correspond to the mean summary of all the mean/stdev variable values corresponding with the respective subjects and activities; thus, for every subject and activity combination, there is only one value per variable.

### Type 3: TRANSFORMED 3-AXIAL
Columns 43-60: 3 numeric variable sets (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ). These variables sets have 3 means and 3 stdev variables each. These three values represent the variable set value per XYZ axis. The numeric values correspond to the mean summary of all the mean/stdev variable values corresponding with the respective subjects and activities; thus, for every subject and activity combination, there is only one value per variable. These variable sets were obtained through a Fast Fourier Transform (FTT) of their corresponding untransformed variable sets.

### Type 4: TRANSFORMED MAGNITUDE
Columns 61-68: 4 numeric variable sets (fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag). These variable sets have 1 mean and 1 stdev variables each. The numeric values correspond to the mean summary of all the mean/stdev variable values corresponding with the respective subjects and activities; thus, for every subject and activity combination, there is only one value per variable. These variable sets were obtained through a Fast Fourier Transform (FTT) of their corresponding untransformed variable sets.