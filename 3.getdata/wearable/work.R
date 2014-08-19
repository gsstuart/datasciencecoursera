# TO RUN THIS CODE: comment or change the below setwd() call as needed...
# as per the instructions, this script expects to be located in the same directory
# as the input files
setwd('/home/scott/datasciencecoursera/3.getdata/wearable/UCI HAR Dataset')

library(plyr)  # plyr is used for the final step (creation of 2nd tidy set)

# read in features.txt, so we can easily manipulate which columns to subset
feat <- read.csv('features.txt', 
                 sep=' ', header=FALSE, 
                 colClasses=c('integer','character'),
                 col.names = c('colnum','description'))

# the above will give us something like:
# colNum       description
# 1      1 tBodyAcc-mean()-X
# 2      2 tBodyAcc-mean()-Y
# 3      3 tBodyAcc-mean()-Z

# initialize a vector of column names that will be used later to read the columns we want from train & test data
xcolnames <- rep('NULL', nrow(feat))

# since we are only interested in measurements of mean and standard deviation,
# let's identify those columns.  the project instructions allow for interpretations
# on exactly what columns to include, so we will go with all columns containing "mean" 
# or "std" in the name.  this could easily be changed to reflect other requirements.
feat <- feat[grep('mean|std', feat$description),]

# since we will use the descriptions from features.txt to name our columns in the test/train data 
# to be subsequently loaded, we will make the names more appropriate for use as R variable names.
# the convention here is that mixed lower and upper case is OK, and anything other than letters 
# and numbers will be converted to a single dot
feat$description <- gsub('[^a-z0-9]+', '.', feat$description, ignore.case=TRUE)

# to clean up further, let's get rid of any trailing non-alphanumerics
feat$description <- sub('[^a-z0-9]+$', '', feat$description, ignore.case=TRUE)

# NOW our variables are ready:
# colnum     description
# 1      1 tBodyAcc.mean.X
# 2      2 tBodyAcc.mean.Y
# 3      3 tBodyAcc.mean.Z

# populate the NULL-initialized vector of column names with the columns we've chosen...
# since by default columns are NULL, they will be skipped over when we pass this to read.csv
for (i in feat$colnum) xcolnames[i] <- feat[feat$colnum==i,'description']

# do a final sanity check to ensure we have all unique colnames
if (anyDuplicated(xcolnames[xcolnames != 'NULL'])) stop ('duplicate column names detected.  this should not happen!')

# generate xcolclasses variable to pass to "colClasses" parameter of read.csv... since we know
# all of the data columns are numeric, anything non-NULL will be transformed to "numeric"
xcolclasses <- xcolnames
xcolclasses[xcolclasses != 'NULL'] = 'numeric'

### READ TRAINING DATA
# we must explicitly set sep='' to ensure that multiple delimiters are counted as just one!
xtrain <- read.csv('train/X_train.txt', header=FALSE, sep='', colClasses = xcolclasses)
colnames(xtrain)  <- feat$description

# read the subjects for training and bind to the data set
strain <- read.csv('train/subject_train.txt', header=FALSE, colClasses='integer', col.names='subject.id')
xtrain <- cbind(strain, xtrain)
### END READ TRAINING DATA

### READ TEST DATA
# we must explicitly set sep='' to ensure that multiple delimiters are counted as just one!
xtest <- read.csv('test/X_test.txt', header=FALSE, sep='', colClasses = xcolclasses)
colnames(xtest)  <- feat$description

# read the subjects for testing and bind to the data set
stest <- read.csv('test/subject_test.txt', header=FALSE, colClasses='integer', col.names='subject.id')
xtest <- cbind(stest, xtest)
### END READ TEST DATA

# read in the activities reference table
activities <- read.csv('activity_labels.txt', 
              header=FALSE, sep=' ', 
              col.names=c('activity.id','activity.desc'),
              colClasses=c('integer','character'))

# read in the training data and merge with activities to get descriptive labels
# (we set SORT=FALSE so that the merge does not misalign the data)
ytrain <- read.csv('train/y_train.txt', colClasses='integer', col.names='activity.id', header=FALSE)
ytrain <-  merge(ytrain, activities, by.x='activity.id', by.y='activity.id', sort=FALSE)
xtrain <- cbind(ytrain, xtrain)

# read in the testing data and merge with activities to get descriptive labels
# (we set SORT=FALSE so that the merge does not misalign the data)
ytest <- read.csv('test/y_test.txt', colClasses='integer', col.names='activity.id', header=FALSE)
ytest <-  merge(ytest, activities, by.x='activity.id', by.y='activity.id', sort=FALSE)
xtest <- cbind(ytest, xtest)

# merge testing and training
tidyOne <- rbind(xtrain, xtest)

# group by (activity and subject) and compute averages
tidyTwo <- ddply(tidyOne, c('activity.id', 'activity.desc', 'subject.id'), function(x) colMeans(x[,-(1:3)]))
# append '.tidyMean' to each column name to indicate this is the mean as specified for the 2nd tidy set
colnames(tidyTwo)[-(1:3)] <- paste0(colnames(tidyTwo)[-(1:3)],".tidyMean")

# the variable tidyTwo now contains our final and desired result.

