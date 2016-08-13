setwd("/Users/arindambose/github/brca-study")

require(foreign)
require(Hmisc)

# Read different types of datasets
# comma separated value data set

mydata <- read.csv("BrCaData.csv", header = T, sep = ",")
# an SPSS data set
# spssdata <- read.spss("vinodlong.sav",
 #                     to.data.frame = TRUE)
## a stata data set

# statadata <- read.dta("anxiety.dta")

lm.mort <- lm(mydata$brcamortality2008 ~ mydata$Brcaincidence2008, data = mydata)

sink("mortality.jpg")
plot(mydata$Brcaincidence2008, mydata$brcamortality2008, 
     main ="BrCa Mortality versus Incidence",
     xlab = "BrCa Incidence 2008",
     ylab = "BrCa Mortality in 2008" )
sink()


progage <- table(mydata$AgeGroupsCovered, mydata$ProgramType1)
write.table(progage, file = "progage.csv", col.names = TRUE, sep = ",")






print(names(mydata))