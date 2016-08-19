best<-function(state=NULL,outcome=NULL){
        library(dplyr)
        #read outcome data
        data<-read.csv("outcome-of-care-measures.csv")
        states<-unique(data$State)
        outcomes<-c("heart attack","heart failure","pneumonia")
        ##check that state and outcome are valid
                ifelse(state %in% states,st<-state,stop("invalid state",call.=TRUE))
                
                ifelse(outcome %in% outcomes,oc<-outcome,stop("invalid outcome"))
        
        ##return hospital name in that state with lowest 30-day death rate
                ifelse(outcome=="heart attack",column<-11,
                   ifelse(outcome=="heart failure",column<-17,column<-23))
        
        data<-data[,c(2,7,column)]
        data<-subset(data,data$State==st)
        data<-filter(data,data[,3]!="Not Available")
        data<-as.data.frame(data)
        vals<-as.numeric(as.character(data[,3]))
        min<-min(vals)
        data<-subset(data,data[,3]==min)
        data<-arrange(data,Hospital.Name)
        as.character(data[1,1])
}


