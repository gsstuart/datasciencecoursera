# DIRECTIVE:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# SET WORKING DIRECTORY HERE
setwd('/home/scott/datasciencecoursera/4.eda/proj2.pm25')

# set up for PNGs, if desired
writePNG = 0
if (writePNG) png(filename='plot2.png', width=900)

# load the data set
# for caching purposes, we assume that if the "nei" variable exists, then the data is already loaded
# and up-to-date.
if (!exists('nei0')) nei0 = readRDS('summarySCC_PM25.rds')

# subset to Baltimore City
baltimore = nei0[nei0$fips == '24510', c('year','Emissions')]

# get the sums per year
totalPM = tapply(baltimore$Emissions, baltimore$year, sum)

# generate the plot
options(scipen=7) # avoid scientific notation
plot(names(totalPM), totalPM, xlab='Year', main='Total PM2.5 Emissions, Baltimore City', type='o', 
     lwd=5, family='URWGothic', col='sienna1', pch=3)

# clean-up PNG if necessary
if (writePNG) dev.off()
