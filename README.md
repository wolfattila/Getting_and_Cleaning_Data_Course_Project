### Introduction

This program was created as the course project of the Getting and Cleaning Data MOOC by Johs Hopkins.


### How it works

At the begining it read all the files to collect the raw data, and merge the train and test result in 1 data frame

From the feature.txt it read the labels for the columns.

In the meanstdcols variable I collect the number of the columns, where the header contain tha mean or std word, and with the help of this, 
I create the traintestmeanstd variable, which contain only the requested column.

with the ddply() function from the plyr package, I get the mean of the same subject same activity, and put it in the final variable called
traintestaverage, This variable contain the tidy data