#####Part 1#####
outcome<-read.csv("outcome-of-care-measures.csv",colClasses="character")
head(outcome)
ncol(outcome)
names(outcome)
#Make histogram of column 11 30 day death rates
outcome[,11]<-as.numeric(outcome[,11])
hist(outcome[,11])

#####Part 2#####
##open/use best.R

