library(dplyr)
library(data.table)

##download data
if(!file.exists("prog_assing_week4_data.zip")){
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl,destfile="prog_assing_week4_data.zip",method="curl")
}
# Checking if folder exists and unzip the content
if (!file.exists("UCI HAR Dataset")) { 
        unzip('prog_assing_week4_data.zip') 
}
##colnames for features
features <- read.table("UCI HAR Dataset/features.txt")

#proper labels for activities
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

##read and row binding of the training and the test data sets.
train_test_data=list("a","b","c")
filenames<-list.files('./UCI HAR Dataset/train',pattern='.txt$')
names(train_test_data)<-sub("_.*", "", filenames)
for (files in 1:length(filenames)){
        train<-fread(paste0("./UCI HAR Dataset/train/",list.files('./UCI HAR Dataset/train',pattern='.txt$')[files]))
        train[,'set']='train'
        test<-fread(paste0("./UCI HAR Dataset/test/",list.files('./UCI HAR Dataset/test',pattern='.txt$')[files]))
        test[,'set']='test'
        ##row binding
        train_test_data[[files]]<-rbind(train,test)
        
}
colnames(train_test_data$subject)[1]<-'Subject'
colnames(train_test_data$X)[-length(colnames(train_test_data$X))]<-features$V2
colnames(train_test_data$y)[1]<-'Activity'

##column binding
merged_data<-cbind(train_test_data$subject,train_test_data$X,train_test_data$y)

##extracts only the measurements on the mean and standard deviation for each measurement. 
tidy_data<-merged_data %>% select(Subject,Activity,contains("mean"),contains("std"))
##atribute the readble classes to activities
levels(tidy_data$Activity)<-activities$V2

##aggregated tidy data set with the average of each variable for each activity and each subject.
tidy_data_agg_mean<-tidy_data %>% 
        group_by(Subject,Activity) %>%
        summarise_all(mean,na.rm=T)

##more readable column names
names(tidy_data_agg_mean)<-gsub("-", "_", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("\\(", "", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("\\)", "", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("^t", "time", names(tidy_data_agg_mean))
names(tidy_data_agg_mean)<-gsub("^f", "frequency", names(tidy_data_agg_mean))

#Save the dataset in a txt. file:
write.table(tidy_data_agg_mean, file="tidy_data_agg_mean.txt", row.names = FALSE)
