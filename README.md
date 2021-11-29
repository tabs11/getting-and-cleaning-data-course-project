README
================
Nuno Martins
28/11/2021


# Getting and Cleaning Data Course Project



## Content
- **run_analysis.R** - Script to performs the analysis
- **README.md** - All the analysis steps
- **CodeBook.md** Variables description


## Requirements

To run **run_analysis.R** script, the bellow packages are needed:

1. dplyr - `install.packages("dplyr")`

2. data.table - `install.packages("data.table")`


## Steps

#### **1. Load the needed packages**

#### **2. Download and unzip the data folder**
#### 2.1 Checks if the data file exists, if not then download it.

#### 2.2 Check if the downloaded data file is unzipped, if not unzip it. After that all the content will be in "UCI HAR Dataset" directory.

#### **3. Read all the needed files**

#### 3.1 Auxiliar files
1. *"features.txt"* file - contains the proper variables names

2. *"activity_labels.txt"* file - contains the proper activities labels

#### 3.2 Read train and test data sets
*train* directory:
        
1. *X_train.txt* - features measured for training

2. *y_train.txt* - encoded activity type for training

3. *subject_train.txt* individuals codes for training

*test* directory: 
        
1. *X_test.txt* - features measured for testing

2. *y_test.txt* - encoded activity type for testing

3. *subject_test.txt* individuals codes for testing

Read all the files and bind the rows of train and test data sets, respectively. Since we know that the number of files and their structure are identical in both directories we can do a loop to go through each directory, read all the files and bind the rows of each data set type present in both train and test directories. We can also include an additional column to distinguish which rows are from train and from test data sets and set the correct column names.


#### 3.3 Merges the training and the test sets to create one data set. The row binding of train and test datas was already done in the previous step. Now we need to merge the three data sets by column. 


#### **4. Extract needed fields**

Extract only the measurements on the mean and standard deviation for each measurement.

#### **5. Proper column names**

Use descriptive activity names to name the activities in the data set. we can do it by re-level the *y* field with the labels in *"activity_labels.txt"*

#### **6. Aggregated data**

Create a second, independent tidy data set with the average of each variable for each activity and each subject. For that we should group the tidy_data by subject and activity and then summarise all the feature variables by mean. We can use *dplyr* functions *group_by* and *summarise_all*. We can also give more readble column names.

#### **7. Save data**

Last step is save the dataset in a *txt.* file.

