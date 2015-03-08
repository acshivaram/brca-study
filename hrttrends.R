## The purpose of this paper is to write the analysis
setwd("~/Documents")
hrtdata <- read.csv("hrttrends.csv", header = T)
brcadata <- read.csv("BrCaData.csv", header = T)
#print(names(hrtdata))
hrtdata$changeparpct2 <- round((hrtdata$changeparpct/hrtdata$parpctbrcapeakhrtuse)*100, 2)
print(fivenum(hrtdata$changeparpct2))

print(table(brcadata$RegionCountry))

## plot(hrtdata$PctReduction, hrtdata$changepartpct2)