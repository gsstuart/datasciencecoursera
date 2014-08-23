# DIRECTIVE:
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources
# in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in
# motor vehicle emissions?

library(plyr)
library(ggplot2)

# SET WORKING DIRECTORY HERE
setwd('/home/scott/datasciencecoursera/4.eda/proj2.pm25')

# set up for PNGs, if desired
writePNG = 0
if (writePNG) png(filename='plot6.png', width=900)

# load the data set
# for caching purposes, we assume that if the "nei" variable exists, then the data is already loaded
# and up-to-date.
if (!exists('nei0')) nei0 = readRDS('summarySCC_PM25.rds')

# subset to Baltimore City/LA and ONROAD+NONROAD
bla = nei0[nei0$fips %in% c('24510','06037') & nei0$type %in% c('ON-ROAD','NON-ROAD'), c('year','Emissions','type', 'fips')]

# get the sums per year/type
totalPM = ddply(bla, c('year','fips','type'), function (b) sum(b[,'Emissions']))

# create a reference table for geographic names and merge with totalPM
fipsLabel = data.frame(fips=c('06037','24510'), fipsname=c('Los Angeles County', 'Baltimore City'))
totalPM = merge(totalPM, fipsLabel, by.x = 'fips', by.y = 'fips')

# generate the plot
ggplot(totalPM, aes(year, V1, fill=type)) + 
  geom_bar(stat='identity', position=position_dodge())  + 
  scale_y_log10() + geom_smooth(method='lm', size=3, color='black') + 
  scale_x_continuous(labels=unique(totalPM$year), breaks=unique(totalPM$year)) + 
  theme_bw() + theme(plot.title=element_text(family="Courier", face="bold", size=24)) + 
  labs(title = 'BC & LA Motor Vehicle Emissions', y='emissions (log)') +
  facet_grid(. ~ fipsname)
  
# clean-up PNG if necessary
if (writePNG) dev.off()
