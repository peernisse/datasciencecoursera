rankall<-function(outcome,num="best"){
library(dplyr)
#read outcome data
data<-read.csv("outcome-of-care-measures.csv",as.is=TRUE,na.strings = "Not Available")
states<-unique(data$State)
outcomes<-c("heart attack","heart failure","pneumonia")

##check that num and outcome are valid

if(!outcome %in% outcomes) {
        stop("invalid outcome")} 
if(!is.numeric(num)) {
        if(is.character(num)) {
                if(!num %in% c("best","worst")) {
                        stop("invalid num")
                }
        }
}

##determine the column containing desired outcome
ifelse(outcome=="heart attack",column<-11,
       ifelse(outcome=="heart failure",column<-17,column<-23))

##create working filtered dataframe, coerce characters to numbers
newdata<-data[,c(2,7,column)]
#newdata<-subset(newdata,newdata$State==state)
newdata<-filter(newdata,newdata[,3]!="Not Available")
newdata$vals<-as.numeric(newdata[,3])

spl<-split(newdata,newdata$State)
ls_hospital<-lapply(spl,function(x,num) {
        x<-x[order(x$vals,x$Hospital.Name),]
        if (num=="best") {return(x$Hospital.Name[1])}
        else if (num=="worst") {return(x$Hospital.Name[nrow(x)])}
        else {return(x$Hospital.Name[num])}
},num)

out<-as.data.frame(cbind(unlist(ls_hospital)))
out$State<-rownames(out)
names(out)<-c("Hospital","State")
#rownames(out)<-NULL
out
}

