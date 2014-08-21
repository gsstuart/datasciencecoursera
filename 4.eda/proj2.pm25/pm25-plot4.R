# DIRECTIVE:

library(plyr)
library(ggplot2)
library(jpeg)
library(png)

# SET WORKING DIRECTORY HERE
setwd('/home/scott/datasciencecoursera/4.eda/proj2.pm25')

# set up for PNGs, if desired
writePNG = 0
if (writePNG) png(filename='plot3.png', width=480, height=480)

# load the data set
# for caching purposes, we assume that if the "nei" variable exists, then the data is already loaded
# and up-to-date.
if (!exists('nei')) nei = readRDS('summarySCC_PM25.rds')

# subset to coal-related
coalSCC = scc[grepl('coal', scc$EI.Sector, ignore.case = 1), 1]
dirtyCoal = nei[nei$SCC %in% coalSCC, c('year','Emissions','type')]

# get the sums per year/type
totalPM = ddply(dirtyCoal, c('year'), function(b) sum(b[,'Emissions']))

# j
# img <- readJPEG('earth-egg.jpg')
img <- readPNG('earth-egg.png')
grob = rasterGrob(img)
#+ annotation_custom(grob, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)

# end j

# generate the plot
g = ggplot(totalPM, aes(year, V1))
g + geom_line(alpha=0.77, arrow=arrow(angle=33, type='closed'), size=3, color='darkblue') + 
    theme_bw() + 
    labs(title = expression(PM[2.5] * ' KOAL'), y='emissions') + annotation_custom(grob, xmin=2000, xmax=2006, ymin=350000, ymax=540000)

# clean-up PNG if necessary
if (writePNG) dev.off()
