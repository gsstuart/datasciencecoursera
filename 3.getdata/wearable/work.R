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

# initialize a vector of column names that will be used later to read the columns we want from train & test data.
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

# we must explicitly set sep='' to ensure that multiple delimiters are counted as just one!
xtrain <- read.csv('UCI HAR Dataset/train/X_train.txt', header=FALSE, sep='', colClasses = xcolclasses)
colnames(xtrain)  <- feat$description




