README
================
        Nuno Martins
28/11/2021


# Getting and Cleaning Data Course Project



## Content
- **run_analysis.R** - script to performs the analysis
- **README.md** - all the code steps
- **CodeBook.md** Variables description


## Requirements

To run **run_analysis.R** script, the bellow packages are needed:
        
        1. dplyr - `install.packages("dplyr")`
2. data.table - `install.packages("data.table")`


## Steps

#### **1. Load the needed packages**
```r
library(dplyr)
library(data.table)
```
#### **2. Download and unzip the data file**
#### 2.1 Checks if the data file exists, if not then download it.
```r
if(!file.exists("prog_assing_week4_data.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="prog_assing_week4_data.zip",method="curl")
}
```
#### 2.2 Check if the downloaded data file is unzipped, if not unzip it. After that all the content will be in "UCI HAR Dataset" directory.
```r
# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
        unzip('prog_assing_week4_data.zip') 
}
```

#### **3. Read all the needed files**

#### 3.1 Auxiliar files
1. *"features.txt"* file - contains the proper variables names
```r
features <- read.table("UCI HAR Dataset/features.txt")
```
2. *"activity_labels.txt"* file - contains the proper activities labels
```r
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
```
#### 3.2 Read train and test data sets
*train* directory:
        
        1. *X_train.txt* - features measured for training

2. *y_train.txt* - encoded activity type for training

3. *subject_train.txt* individuals codes for training

*test* directory: 
        
        1. *X_test.txt* - features measured for testing

2. *y_test.txt* - encoded activity type for testing

3. *subject_test.txt* individuals codes for testing

Read all the files and bind the rows of train and test data sets, respectively. Since we know that the number of files and their structure are identical in both directories we can do a loop to go through each directory, read all the files and bind the rows of each data set type present in both train and test directories. We can also include an additional column to distinguish which rows are from train and from test data sets.
```r
train_test_data=list("a","b","c")
filenames<-list.files('./UCI HAR Dataset/train',pattern='.txt$')
names(train_test_data)<-sub("_.*", "", filenames)
for (files in 1:length(filenames)){
        train<-fread(paste0("./UCI HAR Dataset/train/",list.files('./UCI HAR Dataset/train',pattern='.txt$')[files]))
        train[,'set']='train'
        test<-fread(paste0("./UCI HAR Dataset/test/",list.files('./UCI HAR Dataset/test',pattern='.txt$')[files]))
        test[,'set']='test'
        train_test_data[[files]]<-rbind(train,test)
        
}
```
Then we can set the correct column names
```r
colnames(train_test_data$subject)[1]<-'Subject'
colnames(train_test_data$X)[-length(colnames(train_test_data$X))]<-features$V2
colnames(train_test_data$y)[1]<-'y'
}
```

#### 3.3 Merges the training and the test sets to create one data set. The row binding of train and test datas etswas already done in the previous step. Now we need to merge the three data sets by column. 
```r
merged_data<-cbind(train_test_data$subject,train_test_data$X,train_test_data$y)

```

#### **4. Next we should extract only the measurements on the mean and standard deviation for each measurement.**
```r
tidy_data<-merged_data %>% select(Subject,y,contains("mean"),contains("std"))
```
#### **5. We should also use descriptive activity names to name the activities in the data set. we can do it by re-level the *y* field with the labels in *"activity_labels.txt"* **
```r
levels(tidy_data$y)<-activities$V2
colnames(tidy_data)[2] <- 'Activity'
```

#### **6. creates a second, independent tidy data set with the average of each variable for each activity and each subject. For that we should group the tidy_data by subject and activity and then summarise all the feature variables by mean. We can use *dplyr* functions *group_by* and *summarise_all*. We can also give more readble column names.**
```r
tidy_data_agg_mean<-tidy_data %>% 
        group_by(Subject,Activity) %>%
        summarise_all(mean,na.rm=T)

names(tidy_data_agg_mean)<-gsub("-", "_", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("\\(", "", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("\\)", "", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("^t", "time", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("^f", "frequency", names(tidy_data_agg_mean))
```

#### **7. Finally we can save the dataset in a *txt.* file:**
```r
write.table(tidy_data_agg_mean, file="tidy_data_agg_mean.txt", row.names = FALSE)
```
