library(dplyr)
library(data.table)
setwd("C:/Users/numartin/Desktop/Coursera/Data Science R/Getting and Cleaning Data/Week4/")

##data download
if(!file.exists("prog_assing_week4_data.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="prog_assing_week4_data.zip",method="curl")
}
# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
        unzip('prog_assing_week4_data.zip') 
}
##colnames of features
features <- read.table("UCI HAR Dataset/features.txt")

#proper labels of activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")#, col.names = c("y", "activity"))

##Merges the training and the test sets to create one data set.
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
colnames(train_test_data$subject)[1]<-'Subject'
colnames(train_test_data$X)[-length(colnames(train_test_data$X))]<-features$V2
colnames(train_test_data$y)[1]<-'y'

merged_data<-cbind(train_test_data$subject,train_test_data$X,train_test_data$y)

##xtracts only the measurements on the mean and standard deviation for each measurement. 
tidy_data<-merged_data %>% select(Subject,y,contains("mean"),contains("std"))
##atribute the readble classes to activities
levels(tidy_data$y)<-activities$V2
colnames(tidy_data)[2] <- 'Activity'
#tidy_data<-merge(activities,tidy_data,by="y")[,-1]
#tidy_data_activ<-tidy_data_activ[,c(3,2,4:ncol(tidy_data_activ))]

##independent tidy data set with the average of each variable for each activity and each subject.

tidy_data_agg_mean<-tidy_data %>% 
        group_by(Subject,Activity) %>%
        summarise_all(mean,na.rm=T)

##more readable column names
names(tidy_data_agg_mean)<-gsub("-", "_", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("\\(", "", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("\\)", "", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("^t", "time", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("^f", "frequency", names(tidy_data_agg_mean))

str(tidy_data_agg_mean)

write.table(tidy_data_agg_mean, file="tidy_data_agg_mean.txt", row.names = FALSE)

