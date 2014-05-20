Variables:

  traintest, traintest2, traintestsum 
    This 3 variable contain the raw data
    
  traintestheader, traintestsumheader, meanstdcols
    This 3 variable contain different column names
    
  traintestmeanstd
    This variable has the collection of the used rawdata, not used column was dropped
  
  traintestaverage
    This varible has the tidy data
    
    
    
Transformations:

  cbind, rbind: 
    to build 1 common data frame for the raw data

  gsub: 
    make the header information useable and readable for R

  ddply: 
    calculate the mean depending on column's value
    need plyr package

  within: 
    change the activity values for readable names
    