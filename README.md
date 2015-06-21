# CleaningDataProject
Class project for Coursera class on getting and cleaning data

Data set for this project was downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A great deal of assistance was found in the discussion forums for this project:
https://class.coursera.org/getdata-015/forum/list?forum_id=10009

To run this code:
I looked at features.txt and deleted all the rows that weren't for columns that contained a mean or std deviation, then saved the file as rel\_feat.txt (i.e. relevant features). In order for the run\_analysis function to work properly, this rel\_feat.txt file needs to be in the same directory as the file with the function. The downloaded data set also needs to be in the same directory; directory and file names with spaces make me cry, so I renamed the directory to "UCI\_HAR\_DATA".

I originally wrote out my tidy data set without the "row.names=false" param. After I added it, when I read the file back in, I get a new row at the top with automatically generated column names, e.g. "V1", "V2", etc. The file itself looks good, though, so I'm calling it a day for now.
