#####MAke Function corr()#####
corr<-function(directory,threshold=0){
files<-list.files(directory,full.names=TRUE)
vals<-numeric()       
        for (i in files){
                data<-read.csv(i)
                if(sum(complete.cases(data))>=threshold)
                {vals<-append(vals,cor(data$sulfate,data$nitrate,use="complete.obs"))}
                
        }
        vals
}

cr<-corr("specdata",1)
