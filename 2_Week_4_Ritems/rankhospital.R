rankhospital<-function(state,outcome,num="best"){
        library(dplyr)
        #read outcome data
        data<-read.csv("outcome-of-care-measures.csv",as.is=TRUE)
        states<-unique(data$State)
        outcomes<-c("heart attack","heart failure","pneumonia")
                ##check that state and outcome are valid
                if(state %in% states) {
                        state<-state} else {stop("invalid state",call.=TRUE)}
                
                if(outcome %in% outcomes) {
                        outcome<-outcome} else {stop("invalid outcome",call.=TRUE)}
                
                ##determine the column containing desired outcome
                ifelse(outcome=="heart attack",column<-11,
                       ifelse(outcome=="heart failure",column<-17,column<-23))
        ##create working filtered dataframe, coerce characters to numbers
        newdata<-data[,c(2,7,column)]
        newdata<-subset(newdata,newdata$State==state)
        newdata<-filter(newdata,newdata[,3]!="Not Available")
        newdata$vals<-as.numeric(newdata[,3])
        
        ##create unique list of vals, order and rank into a df
        vals<-unique(newdata$vals)
        vals<-sort(vals)
        ranks<-as.vector(1:length(vals))
        lookup<-as.data.frame(cbind(vals,ranks))
                ##determine desired rank
                if(num=="best") {rnk<-1
                        
                } else if(num=="worst") {rnk<-max(ranks)
                        
                } else {rnk<-num}
        ##merge the ranks into newdata via vals
        newdata<-merge(newdata,lookup,by = "vals")
        ##filter on the desired rank, sort and return hospital
        newdata<-filter(newdata,ranks==rnk)
        newdata<-arrange(newdata,Hospital.Name)
        as.character(newdata[1,2])
}