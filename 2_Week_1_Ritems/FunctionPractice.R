data<-iris
head(data)
library(tidyr)
library(dplyr)
datalong<-gather(data,Parameter,Value,1:4)
head(datalong)

mySum<-function(x) {
  Count<-length(x)
  Minimum<-min(x)
  Maximum<-max(x)
  Average<-mean(x)
  Median<-median(x)
  StDeviation<-sd(x)
  Variance<-var(x)
  quant1<-quantile(x,.25)
  quant3<-quantile(x,.75)
  return(c(Count=Count,Minimum=Minimum,Maximum=Maximum,Average=Average,
         Median=Median,StDeviation=StDeviation,
         Variance=Variance,FirstQuantile=quant1,ThirdQuantile=quant3))
}

datalong$Unique<-paste(datalong$Species,datalong$Parameter)


summary<-lapply(split(datalong$Value,datalong$Unique),mySum)
summary<-do.call(rbind,summary)
summary<-as.data.frame(summary)
summary$Unique<-row.names(summary)
row.names(summary)<-NULL
summary$Species<-substr(summary$Unique,1,regexpr(" ",summary$Unique)-1)
summary$Parameter<-substr(summary$Unique,regexpr(" ",summary$Unique)+1,100)
summary$Unique<-NULL
summary<-select(summary,10,11,1:9)

write.table(summary,file="IrisSummary.txt",sep="\t",col.names=TRUE)


#####Graphing#####
library(ggplot2)
g<-ggplot(datalong,aes(x=Parameter,y=Value,fill=Parameter))+
  geom_boxplot(alpha=0.5)+
  facet_wrap(~Species)+
  scale_fill_manual(values=c('gold','red','blue','grey'))
g



