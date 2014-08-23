# DIRECTIVE:
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
# plot answer this question.

library(plyr)
library(ggplot2)

# SET WORKING DIRECTORY HERE
setwd('/home/scott/datasciencecoursera/4.eda/proj2.pm25')

# set up for PNGs, if desired
writePNG = 0
if (writePNG) png(filename='plot3.png', width=900)

# load the data set
# for caching purposes, we assume that if the "nei" variable exists, then the data is already loaded
# and up-to-date.
if (!exists('nei0')) nei0 = readRDS('summarySCC_PM25.rds')

# subset to Baltimore City
baltimore = nei0[nei0$fips == '24510', c('year','Emissions','type')]

# get the sums per year/type
totalPM = ddply(baltimore, c('year','type'), function(b) sum(b[,'Emissions']))

# generate the plot
g = ggplot(totalPM, aes(year, V1))
g + facet_grid(. ~ type) + 
    geom_area(aes(fill=type), alpha=0.77) + 
    theme_bw() + 
    labs(title = expression(PM[2.5] * ' Baltimore City'), y='emissions')

# clean-up PNG if necessary
if (writePNG) dev.off()
