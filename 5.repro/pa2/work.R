library(plyr)
library(dplyr)
library(ggplot2)
library(gridExtra)

setwd("~/datasciencecoursera//5.repro//pa2")

colClasses = c("numeric","character","NULL","NULL","NULL","NULL","character","character","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL","character","numeric","numeric","numeric","numeric","character","numeric","character","character","NULL","NULL","NULL","NULL","NULL","NULL","NULL","NULL")
system.time(storm <- read.csv('repdata_data_StormData.csv.bz2', colClasses=colClasses))
storm$pdate <- as.Date(storm$BGN_DATE, "%m/%d/%Y")
 
### GENERATE EVS TABLE
# evs = storm[storm$FATALITIES + storm$INJURIES + storm$PROPDMG + storm$CROPDMG > 0, 'EVTYPE']
# write.csv(table(evs), 'evs.table.csv', row.names=FALSE)

storm_evmap = read.csv('ev_mapping.csv')
storm <- join(storm, storm_evmap, by = "EVTYPE")

fi_sums <- ddply(storm, c('EV_LEVEL1'), function(s) c(FATALITIES=sum(s$FATALITIES), INJURIES=sum(s$INJURIES)))
    
plot_fatalities <- ggplot(fi_sums, aes(reorder(EV_LEVEL1, -FATALITIES), FATALITIES)) +
     geom_bar(stat='identity') +
     theme(text = element_text(size=20),axis.text.x = element_text(angle=90, vjust=0.7)) +
     scale_x_discrete(limits = fi_sums[order(fi_sums$FATALITIES, decreasing = TRUE), 'EV_LEVEL1'][1:10])

plot_injuries <- ggplot(fi_sums, aes(reorder(EV_LEVEL1, -INJURIES), INJURIES)) +
    geom_bar(stat='identity') +
    theme(text = element_text(size=20),axis.text.x = element_text(angle=90, vjust=0.7)) +
    scale_x_discrete(limits = fi_sums[order(fi_sums$INJURIES, decreasing = TRUE), 'EV_LEVEL1'][1:10])

plot_fi <- grid.arrange(plot_fatalities, plot_injuries, ncol = 2)

### PROPS N CROPS

storm$prop_dmg_tot <- storm$PROPDMG * ifelse(storm$PROPDMGEXP %in% c('k','K'), 1e+03,
                                      ifelse(storm$PROPDMGEXP %in% c('m','M'), 1e+06,
                                      ifelse(storm$PROPDMGEXP %in% c('b','B'), 1e+09, 0)))

storm$crop_dmg_tot <- storm$CROPDMG * ifelse(storm$CROPDMGEXP %in% c('k','K'), 1e+03,
                                      ifelse(storm$CROPDMGEXP %in% c('m','M'), 1e+06,
                                      ifelse(storm$CROPDMGEXP %in% c('b','B'), 1e+09, 0)))

# sample_n(select(storm[storm$PROPDMGEXP=='B',], PROPDMG, PROPDMGEXP, prop_dmg_tot), 20)










            