library(plyr)

#Read the data in variables
traintest<-read.table(paste0("UCI HAR Dataset/train/subject_train.txt"))
traintest<-cbind(traintest,read.table(paste0("UCI HAR Dataset/train/y_train.txt")))
traintest<-cbind(traintest,read.table(paste0("UCI HAR Dataset/train/x_train.txt")))
traintest2<-read.table(paste0("UCI HAR Dataset/test/subject_test.txt"))
traintest2<-cbind(traintest2,read.table(paste0("UCI HAR Dataset/test/y_test.txt")))
traintest2<-cbind(traintest2,read.table(paste0("UCI HAR Dataset/test/x_test.txt")))

#Rbind the 2 variable above
traintestsum<-rbind(traintest,traintest2)

#Read and add headers for data frame
traintestheader<-read.table(paste0("UCI HAR Dataset/features.txt"))
colnames(traintestsum)<-c("subject","activity",gsub("-","_",gsub("\\(\\)","",traintestheader$V2)))
traintestsumheader<-c("subject","activity",gsub("-","_",gsub("\\(\\)","",traintestheader$V2)))

#collect which column's name contain the mean and std words
meanstdcols<-sort(c(grep("mean",traintestheader$V2),grep("std",traintestheader$V2)))+2

#create new data frame for the mean and std values
traintestmeanstd<-traintestsum[,c(1,2,meanstdcols)]

#Average the values by subject and activity
traintestaverage<-ddply(traintestmeanstd, .(subject,activity), numcolwise(mean))

#name the activity
traintestaverage <- within(traintestaverage, { 
  activity <- ifelse(activity == 1, "WALKING", activity) 
  activity <- ifelse(activity == 2, "WALKING_UPSTAIRS", activity) 
  activity <- ifelse(activity == 3, "WALKING_DOWNSTAIRS", activity) 
  activity <- ifelse(activity == 4, "SITTING", activity) 
  activity <- ifelse(activity == 5, "STANDING", activity) 
  activity <- ifelse(activity == 6, "LAYING", activity) 
}) 
