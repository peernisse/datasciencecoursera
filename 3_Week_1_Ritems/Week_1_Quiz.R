##Question 1

#The American Community Survey distributes downloadable data about 
#United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
        
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

#and load the data into R. 
#The code book, describing the variable names is here:
        
#https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

#How many properties are worth $1,000,000 or more?

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "idaho.csv", method = "curl")
list.files()
idhousdata<-read.csv("idaho.csv")

idhouscodebkUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
download.file(idhouscodebkUrl, destfile="idhouscodebk.pdf", mode="wb")

View(idhousdata)
library(dplyr)
ans<-filter(idhousdata,VAL==24)
length(ans)
##the answer is 53


##Question 2
#Use the data you loaded from Question 1. 
#Consider the variable FES in the code book. 
#Which of the "tidy data" principles does this variable violate?




#Question 3
#download the file
library(xlsx)
xUrlFile<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(xUrlFile, destfile="NatGas.xlsx",mode="wb")
list.files()
dateDownloaded<-date()
#read specifc rows and columns
colIndex<-7:15
rowIndex<-18:23
dat<-read.xlsx("NatGas.xlsx",sheetIndex = 1,colIndex = colIndex,
                      rowIndex = rowIndex)
ans3<-sum(dat$Zip*dat$Ext,na.rm=T)
#answer is 36534720

#Question 4
#Read XML data, determine how many restaurants have zip code 21231
library(XML)
xmlUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
xmlData<-xmlTreeParse(xmlUrl,useInternal = TRUE)
rootNode<-xmlRoot(xmlData)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]

xmlSApply(rootNode,xmlValue)
#extract zip code info
zipdata<-xpathSApply(rootNode,"//zipcode",xmlValue)
zdat<-as.data.frame(zipdata)
zdat<-subset(zdat,zipdata=="21231")
#answer is 127

#Question 5
#Using data.table() and checking function speed
lastUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(lastUrl, destfile = "lastidaho.csv")

#using data table functions
library(data.table)
library(stats)
tables()
DT<-fread("lastidaho.csv")

system.time(mean(DT[DT$SEX==1,]$pwgtp15))#0.03
system.time(mean(DT[DT$SEX==2,]$pwgtp15))#0.02

system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(tapply(DT$pwgtp15,DT$SEX,mean))

#no
system.time(rowMeans(DT)[DT$SEX==1])
system.time(rowMeans(DT)[DT$SEX==2])

system.time(DT[,mean(pwgtp15),by=SEX])

system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))


?system.time
sessionInfo()
