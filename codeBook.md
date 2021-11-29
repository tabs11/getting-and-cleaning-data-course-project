
# Codebook

## Human Activity Recognition Using Smartphones Data Set 
This code book describes all the variables and summaries calculated, along with units, and any other relevant information.

## Original Dataset 

data soruce:
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   

description of the dataset: 
- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variables

### subject

Person subject ID

### activity
Type of activity - "WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING"", "STANDING"" or "LAYING"

### features 
The features selected for this database come from the **accelerometer** and **gyroscope** 3-axial raw signals **tAcc-XYZ** and **tGyro-XYZ** 

Meaning of the content in variable names:

1. **t** - time domain signals

2. **f** - frequency domain signals

3. **Body** - signal based on the body of the subject

4. **Gravity** - signal based on gravity

5. **Acc** - signal taken from the accelerometer

6. **Gyro** - signal taken from the gyroscope

7. **Jerk** - measurement of sudden movement

8. **Mag** - measurement of magnitude

9. **X** - measurement was taken in "X" dimension

10. **Y** - measurement was taken in "Y" dimension

11. **Z** - measurement was taken in "Z" dimension

11. **mean()** - average of measurement
12. **std()** - standard deviation of the measurement
=======
# Codebook

## Human Activity Recognition Using Smartphones Data Set 
This code book describes all the variables and summaries calculated, along with units, and any other relevant information.

## Original Dataset 

data soruce:
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   

description of the dataset: 
- http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variables

### subject

Person subject ID

### activity
Type of activity - "WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING"", "STANDING"" or "LAYING"

### features 
The features selected for this database come from the **accelerometer** and **gyroscope** 3-axial raw signals **tAcc-XYZ** and **tGyro-XYZ** 

Meaning of the content in variable names:

1. **t** - time domain signals

2. **f** - frequency domain signals

3. **Body** - signal based on the body of the subject

4. **Gravity** - signal based on gravity

5. **Acc** - signal taken from the accelerometer

6. **Gyro** - signal taken from the gyroscope

7. **Jerk** - measurement of sudden movement

8. **Mag** - measurement of magnitude

9. **X** - measurement was taken in "X" dimension

10. **Y** - measurement was taken in "Y" dimension

11. **Z** - measurement was taken in "Z" dimension

11. **mean()** - average of measurement

12. **std()** - standard deviation of the measurement

