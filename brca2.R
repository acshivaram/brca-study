## First set the directory
setwd("/Users/arindambose/GitHub/brca-study")

## Section 1: Load the needed libraries for this analysis
library(Hmisc)
#install.packages("lme4")
library(lme4)
library(lattice)
library(latticeExtra)

## Section 2: setting up the data for the analysis
## This is the final cleaned data set
## Removed the year 1999 from this record
## If needed we can recreate that year record but it is not really needed at this stage

## the working data
mydata <- data.frame(read.csv("brcafinal2.csv", sep = ","))[,-8]

## Add a variable to indicate that age is binarized into screening age < 50 and >=50
## agebin = 1 == age of screening mammogram at 50 or above
## the youngest age at which screening occurred was 50 years
##
mydata$agebin <- mydata$agerange == "50-64" | mydata$agerange=="50-69" | mydata$agerange=="50-74"

## Make it long (call it "mydatal")

mydatalong <- reshape(mydata,
                   varying = c("inc96", "inc97", "inc98",
                               "inc00", "inc01", "inc02",
                               "inc03", "inc04", "inc05",
                               "inc06", "inc07"),
                   v.names = "incidence",
                   direction = "long")

## Selected three time points, 1996, 2003, 2007
## call it mydatatp ("my data with time points")
##
mydatatp <- mydata[,c(1:5, 11, 15, 16)]
write.table(mydatatp, file="threept.csv", sep = ",",
            col.names = T, row.names = F)

## make it into a long data set
## call it resmydatap ("reshape mydatatp")
resmydatatp <- reshape(mydatatp,
                           varying = c("inc96",
                                       "inc03",
                                       "inc07"),
                           v.names = "incidence",
                           direction ="long")
resmydatatpl50 = subset(resmydatatp, agebin == 0)
resmydatatpg50 = subset(resmydatatp, agebin == 1)

## We examine the decline in breast cancer rates among countries starting 2002 onwards
## Then we shall examine this decline for two age-groups, >=50 and < 50
## Here is the data set for years 2002-2007

mydata0207 <- mydata[,c(1:4,10:16)]

write.table(mydata0207, file = "data0207.csv", sep = ",", col.names = T,
            row.names = F)

## Convert that to its reshaped long version mydata0207l

mydata0207long <- reshape(mydata0207,
                       varying = c("inc02",
                                   "inc03", "inc04", "inc05",
                                   "inc06", "inc07"),
                       v.names = "incidence",
                       direction = "long")

# create a dataset where we have age binarised to less than or more than 50
#
mydatagt50 <- subset(mydatal, agebin == 1)
mydatalt50 <- subset(mydatal, agebin == 0)

## Data for change between 2002-2007 for agegroup lt 50 mydatal0207l50

mydatal0207l50 <- subset(mydata0207l, agebin == 0)

## data for change between 2002-2007, agegroup gte 50 mydatal0207g50

mydatal0207g50 <- subset(mydata0207l, agebin == 1)




## Created two other data sets for above and below 50 years


# select those countries that had reached the peak HRT usage in 1996-1998
#
mydatashape19967 <- reshape(mydata[c(1:10,12:16),],
                       varying = c("inc96", "inc97",
                                   "inc98", "inc00",
                                   "inc01", "inc02",
                                   "inc03", "inc04",
                                   "inc05", "inc06", "inc07"),
                       v.names = "incidence",
                       direction = "long")

## data where HRT usage reached peak after 2001
##
mydatashape2001 <- reshape(mydata[c(1:8,11,16),],
                           varying = c("inc96", "inc97",
                                       "inc98", "inc00",
                                       "inc01", "inc02",
                                       "inc03", "inc04",
                                       "inc05", "inc06", "inc07"),
                           v.names = "incidence",
                           direction = "long")


## List of interaction plots
## Plot 1: For all countries irrespective of year and age
interaction.plot(mydatalong$time,
                 mydatalong$Country, mydatal$incidence,
                 legend = F,
                 main = "Plot of Breast Cancer incidence, 1996-2007",
                 xlab = "1= 1996, 11=2007",
                 ylab = "Age-standardised incidence/100K")


## Plot 2: For those countries where HRT usage reached their peak in 1996-1998
interaction.plot(mydatashape19967$time,
                 mydatashape19967$Country, mydatashape19967$incidence,  legend=F,
                 main = "Plot of BrCa incidence, where peak HRT 96-98",
                 xlab = "1 = 1996, 11 = 2007",
                 ylab = "Age-standardised incidence/100K"
)
## Plot 3: For countries where peak HRT usage 2001 or later

interaction.plot(mydatashape2001$time,
                 mydatashape2001$Country, mydatashape2001$incidence,  legend=F,                 main = "Plot of BrCa incidence, where peak HRT 2001 or later",
                 xlab = "1 = 1996, 11 = 2007",
                 ylab = "Age-standardised incidence/100K"
)

## Plot 4: For countries where mammography started younger than age 50

interaction.plot(mydatalt50$time,
                 mydatalt50$Country, mydatalt50$incidence,  legend=F,
                 main = "BrCa incidence countries screening age < 50",
                 xlab = "1 = 1996, 11 = 2007",
                 ylab = "Age-standardised incidence"
)

## Plot 5: Interaction plot for countries where mammography started at age >= 50
interaction.plot(mydatagt50$time,
                 mydatagt50$Country, mydatagt50$incidence,  legend=F,
                 main = "BrCa incidence countries screening age >= 50",
                 xlab = "1 = 1996, 11 = 2007",
                 ylab = "Age-standardised incidence"
)

## Plot 6: Interaction plot of change in BrCa incidence 2002-2007 for all

interaction.plot(mydata0207l$time,
                 mydata0207l$Country,
                 mydata0207l$incidence,
                 legend = F,
                 main = "Brca incidence, all countries, 2002-2007",
                 xlab = "1=2002, 6=2007 ",
                 ylab = "Age-standardised incidence/100K")

## Plot 7: Interaction plot of change in BrCa incidence, 2002-2007 for countries age < 50

interaction.plot(mydatal0207l50$time,
                 mydatal0207l50$Country,
                 mydatal0207l50$incidence,
                 legend = F,
                 main = "Brca incidence, 2002-2007, age at screening < 50",
                 xlab = "1=2002, 6=2007 ",
                 ylab = "Age-standardised incidence/100K")

## Plot 8: Interaction plot of change in BrCa incidence, 2002-2007, countries age >= 50

interaction.plot(mydatal0207g50$time,
                 mydatal0207g50$Country,
                 mydatal0207g50$incidence,
                 legend = F,
                 main = "Brca incidence, 2002-2007, screening age >= 50",
                 xlab = "1=2002, 6=2007 ",
                 ylab = "Age-standardised incidence/100K")

## Lists of repeated measures anova for the longitudinal studies
# conduct a longitudinal data analysis of breast cancer incidence
## before and after 2003
## Analyses using pairwise t tests

## Pairwise t tests for the differences in age standardised means
## between 1996 and 2003 and between 2003 and 2007

## Tests is means for time point n less than that for time point n-1?
## is mean for time 2 less than time 1, or is means for time 3 less than time 2

compmeans <-with(resmydatatp, tapply(incidence, time, mean, na.rm = T))

ptestsless <- pairwise.t.test(resmydatatp$incidence,
                                resmydatatp$time,
                                paired = T,
                                alternative = "less")


## Tests is mean for time 2 more than time 1? is time 3 more than time 2? time 3 more than time 1?
##

ptestsmore <- pairwise.t.test(resmydatatp$incidence,
                              resmydatatp$time,
                              paired = T,
                              alternative = "greater")

print(compmeans)
print(ptestsless)
print(ptestsmore)

## Continue pairwise tests with age < 50
## Compare the mean incidence across when age at screening was less than 50
## get the p-values of comparisons as well

compmeansl50 <-with(resmydatatp[resmydatatp$agebin == 0,], tapply(incidence, time, mean, na.rm = T))


ptestslessl50 <- pairwise.t.test(resmydatatp[resmydatatp$agebin == 0,]$incidence,
                              resmydatatp[resmydatatp$agebin == 0,]$time,
                              paired = T,
                              alternative = "less")

ptestsmorel50 <- pairwise.t.test(resmydatatp[resmydatatp$agebin == 0,]$incidence,
                                 resmydatatp[resmydatatp$agebin == 0,]$time,
                                 paired = T,
                                 alternative = "greater")

print(compmeansl50)
print(ptestslessl50)
print(ptestsmorel50)

## compare mean incidence rates when age at screening was 50 or up

compmeansg50 <-with(resmydatatp[resmydatatp$agebin == 1,], tapply(incidence, time, mean, na.rm = T))

print(compmeansg50)
ptestslessg50 <- pairwise.t.test(resmydatatp[resmydatatp$agebin == 1,]$incidence,
                                 resmydatatp[resmydatatp$agebin == 1,]$time,
                                 paired = T,
                                 alternative = "less")

ptestslessg502 <- pairwise.t.test(resmydatatp[resmydatatp$agebin == 1,]$incidence,
                                 resmydatatp[resmydatatp$agebin == 1,]$time,
                                 paired = T,
                                 alternative = "greater")


print(ptestslessg50)
print(ptestslessg502)

allmeans9607 <- data.frame(rbind(compmeans, compmeansl50, compmeansg50))

write.table(allmeans9607, file = "mean9607.csv",
            sep = ",", col.names = T, row.names = T)

## Extract all the data years
datayears <- mydata[,c(5:7,9:16)]
#mycor <- cor(forcor)
#
#print(cov(datayears, use = "complete.obs"))

## Fit Repeated measures ANOVA for the years 2002-2007
## Does the fall occur monotonously between 2002-2007?
## Is the fall steeper for those with age <= 50 than age > 50?

# For countries with and without age 50 years at screening

avinc0207 = with(mydata0207l, tapply(incidence, time, mean, na.rm = T))
print(avinc0207)
#barplot(avinc0207)

aovcan0207 = aov(incidence ~ time + Error(Country/time), data = mydata0207l)
print(summary(aovcan0207))

aovcan0207a <- aov(incidence ~ time + Error(agerange/time), data = mydata0207l)
print(summary(aovcan0207a))

lmcan0207 <- lm(incidence ~ agebin*time + agebin/time, data = mydata0207l)
print(summary(lmcan0207))

## For countries with age < 50 for screening

avinc0207l50 = with(mydatal0207l50, tapply(incidence, time, mean, na.rm = T))
print(avinc0207l50)

aovcan0207l50 = aov(incidence ~ time + Error(Country/time), data = mydatal0207l50)
print(summary(aovcan0207l50))

## For countries with age >= 50 screening

avinc0207g50 = with(mydatal0207g50, tapply(incidence, time, mean, na.rm = T))
print(avinc0207g50)

aovcan0207g50 = aov(incidence ~ time + Error(Country/time), data = mydatal0207g50)
print(summary(aovcan0207g50))


allv0207 <- data.frame(rbind(avinc0207, avinc0207l50, avinc0207g50))
write.table(allv0207, file = "avr0207.csv",
            sep = ",", col.names = F)


## What is the relationship between HRT and incidence rates for all,
## For those countries with age < 50, and
## for those countries with age >= 50?
## Between 2002-2007, we take all countries here to start with mydata0207l

plot(mydata0207l$incidence ~ mydata0207l$time)
line(abline(lm(incidence ~ time, data = mydata0207l)))

## Between 2002-2007, but with age < 50
## Plotting the rate of decline with time
##
plot(mydatalt50$incidence ~ mydatalt50$time)
abline(lm(incidence ~ time, data = mydatalt50))
#


