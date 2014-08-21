# DIRECTIVE:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

# SET WORKING DIRECTORY HERE
setwd('/home/scott/datasciencecoursera/4.eda/proj2.pm25')

# set up for PNGs, if desired
writePNG = 0
if (writePNG) png(filename='plot1.png', width=480, height=480)


# load the data set
# for caching purposes, we assume that if the "nei" variable exists, then the data is already loaded
# and up-to-date.
if (!exists('nei')) nei = readRDS('summarySCC_PM25.rds')

# get the sums per year
totalPM = tapply(nei$Emissions, nei$year, sum)

# generate the plot
options(scipen=7) # avoid scientific notation
plot(names(totalPM), totalPM, xlab='Year', main='Total PM2.5 Emissions', type='o')

# clean-up PNG if necessary
if (writePNG) dev.off()
