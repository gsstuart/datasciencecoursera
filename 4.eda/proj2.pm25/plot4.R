# DIRECTIVE:
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

library(plyr)
library(ggplot2)
library(png)
library(grid)

# SET WORKING DIRECTORY HERE
setwd('/home/scott/datasciencecoursera/4.eda/proj2.pm25')

# set up for PNGs, if desired
writePNG = 0
if (writePNG) png(filename='plot4.png', width=900)

# read scc
scc = readRDS('Source_Classification_Code.rds')

# load the data set
# for caching purposes, we assume that if the "nei" variable exists, then the data is already loaded
# and up-to-date.
if (!exists('nei0')) nei0 = readRDS('summarySCC_PM25.rds')

# subset to coal-related
# based on forum discussions, TA feedback, and manual inspection of the data, the below criterion has been
# determined to be sufficient for the purposes of this assignment.
coalSCC = scc[grepl('coal', scc$EI.Sector, ignore.case = 1), 1]
dirtyCoal = nei0[nei0$SCC %in% coalSCC, c('year','Emissions','type')]

# get the sums per year/type
totalPM = ddply(dirtyCoal, c('year'), function(b) sum(b[,'Emissions']))

useImage = TRUE   # if TRUE, include an image for added visual impact (image must exist locally)
if (useImage) {
  try (egg <- readPNG('earth-egg.png'))
  grob = rasterGrob(egg)
  annot = annotation_custom(grob, xmin=2000, xmax=2005, ymin=350000, ymax=540000)
} else {
  annot = NULL
}

# generate the plot
g = ggplot(totalPM, aes(year, V1))
g + geom_line(alpha=0.77, arrow=arrow(angle=33, type='closed'), size=3, color='darkblue') +
    geom_point(color='orange', size=7, alpha=0.7) +
    theme_bw() + 
    labs(title = expression(PM[2.5] * ' from Coal Combustion-Related Sources Across the U.S.'), y='emissions') + annot

# clean-up PNG if necessary
if (writePNG) dev.off()
