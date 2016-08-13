library(MASS)
#print(head(immer))
#print(wilcox.test(immer$Y1, immer$Y2, paired = TRUE))

url = "http://ww2.coastal.edu/kingw/statistics/R-tutorials/text/groceries.txt"
groceries = read.table(url, header=T)
#print(groceries)

# this is a way to convert a flat data or wide data to
# long data form
groceries2 <- stack(groceries)
# because there are 4 repeatitions, hence subjects are 4
# in my case there are 11 reps, so countries will be 11
subject = rep(groceries$subject, 4)
# add the subject variable to the groceries2 dataset
groceries2[3] = subject
#remove subject from the workspace or object space
rm(subject)
colnames(groceries2) = c("price", "store", "subject")
#print(groceries2)

# total values for each store
totvals = with(groceries2, tapply(price, store, sum))
print(totvals)

aov.out = aov(price ~ store + Error(subject/store), data=groceries2)
print(summary(aov.out))
