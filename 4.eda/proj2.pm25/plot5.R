# DIRECTIVE:
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

library(plyr)
library(ggplot2)

# SET WORKING DIRECTORY HERE
setwd('/home/scott/datasciencecoursera/4.eda/proj2.pm25')

# set up for PNGs, if desired
writePNG = 0
if (writePNG) png(filename='plot5.png', width=900)

# load the data set
# for caching purposes, we assume that if the "nei" variable exists, then the data is already loaded
# and up-to-date.
if (!exists('nei0')) nei0 = readRDS('summarySCC_PM25.rds')

# subset to Baltimore City and ONROAD+NONROAD
baltimore = nei0[nei0$fips == '24510' & nei0$type %in% c('ON-ROAD','NON-ROAD'), c('year','Emissions','type')]

# get the sums per year/type
totalPM = ddply(baltimore, c('year','type'), function(b) sum(b[,'Emissions']))

# generate the plot
ggplot(totalPM, aes(year, V1, fill=type)) + 
  geom_bar(stat='identity', position=position_dodge())  + 
  geom_smooth(method='loess', aes(color=type), size=1.8) +
  scale_x_continuous(labels=unique(totalPM$year), breaks=unique(totalPM$year)) + 
  theme_bw() + theme(plot.title=element_text(family="Courier", face="bold", size=24)) + 
  labs(title = 'Baltimore City Motor Vehicle Emissions', y='emissions') +
  scale_fill_manual(values = c("darkorange4","gray13")) # TODO: make the color scheme less ugly?  maybe.  emissions are ugly...
  
# clean-up PNG if necessary
if (writePNG) dev.off()
