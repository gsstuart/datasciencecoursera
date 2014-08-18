# TO RUN THIS CODE: comment or change the below setwd() call as needed
setwd('/home/scott/datasciencecoursera/3.getdata/wearable/')

# read in features.txt, so we can easily manipulate which columns to subset
feat <- read.csv('UCI HAR Dataset/features.txt', 
        sep=' ', header=FALSE, 
        colClasses=c('integer','character'),
        col.names = c('colnum','description'))

# the above will give us something like:
# colNum       description
# 1      1 tBodyAcc-mean()-X
# 2      2 tBodyAcc-mean()-Y
# 3      3 tBodyAcc-mean()-Z

# since we are only interested in measurements of mean and standard deviation,
# let's identify those columns.  the project instructions allow for interpretations
# on exactly what columns to include, so we will go with all columns containing "mean" 
# or "std" in the name.  this could easily be changed to reflect other requirements.

feat <- feat[grep('mean|std', feat$description),]




# we must explicitly set sep='' to ensure that multiple delimiters are counted as just one!
xtrain <- read.csv('UCI HAR Dataset/train/X_train.txt', header=FALSE, sep='')

