best<-function(state=NULL,outcome=NULL){
        library(dplyr)
        #read outcome data
        data<-read.csv("outcome-of-care-measures.csv",as.is=TRUE)
        states<-unique(data$State)
        outcomes<-c("heart attack","heart failure","pneumonia")
        ##check that state and outcome are valid
                if(state %in% states) {
                        st<-state} else {stop("invalid state",call.=TRUE)}
                
                if(outcome %in% outcomes) {
                        oc<-outcome} else {stop("invalid outcome",call.=TRUE)}
        
        ##return hospital name in that state with lowest 30-day death rate
                ifelse(outcome=="heart attack",column<-11,
                   ifelse(outcome=="heart failure",column<-17,column<-23))
        
        newdata<-data[,c(2,7,column)]
        newdata<-subset(newdata,newdata$State==state)
        newdata<-filter(newdata,newdata[,3]!="Not Available")
        newdata$vals<-as.numeric(newdata[,3])
        xxx<-arrange(newdata,newdata[,4],newdata[,1])
        as.character(xxx[1,1])
}
