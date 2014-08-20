README.md i

This project utilizes data from the University of California, Irvine, as explained in the companion file `CodeBook.md`.

The script run_analysis.R will load the data from UCI's data set and perform the following operations:

- read a reference table of all variables 
- identify which variables correspond to a mean or standard deviation, and capture them
- modify the variable (column) names to be better suited as R variables, and also relatively more human-readable
- verify that there are no duplicates among the final list of extracted names
- read the desired columns from the Training data
- bind to the Training data the subject IDs
- read the desired columns from the Testing data
- bind to the Testing data the subject IDs
- read the activities reference table (walking, standing, etc.)
- bind the descriptive activity labels to both Testing and Training data
- union the testing and training data into a master set (named "tidyOne")
- group the tidyOne set by (activity, subject) and calculate the mean for each data column, storing the result in "tidyTwo"

The resulting tidyTwo data set is a "wide" set, adhering to the convention of observations (subjects) in a row and variables in a column.  Because the number of variables identified as suitable for inclusion in the result (i.e., those containing an average or standard deviation) exceeds the number of individuals in the study, the resulting data frame is wide.  The user is encouraged to subset and/or transpose this data set if a narrower result is desired; the author believes that the present form provides the greatest flexibility and compliance with the project specifications.
