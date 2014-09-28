setwd("/media/scorpio-win7/Users/scott/datasciencecoursera/course-ng-ml/mlclass-ex1")
exdata = read.csv("ex1data1.txt", header = FALSE)
theta = lm(exdata$V2 ~ exdata$V1)
