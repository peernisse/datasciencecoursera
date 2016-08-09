#####Method 1#####
setwd("C:/Coursera/Repos/datasciencecoursera/2_Week_2_Ritems")
complete<-function(directory,id){
        files<-list.files(directory,full.names=TRUE)
        files<-files[id]
        data<-do.call(rbind,lapply(files,read.csv))
        sub<-subset(data,complete.cases(data))
        nobs<-lapply(split(sub$Date,sub$ID),length)
        foo<-as.data.frame(t(rbind(nobs)))
        foo$ID<-row.names(foo)
        foo<-foo[,c(2,1)]
        foo#Does not appear to retain the order of the IDs, the lapply sorts them
}

complete("specdata",30:25)

#####Method 2#####
setwd("C:/Coursera/Repos/datasciencecoursera/2_Week_2_Ritems")
complete2<-function(directory,id){
        output<-data.frame(ID=character(),nobs=character())
        for (i in id){
                
                files<-list.files(directory,full.names=TRUE)
                files<-files[i]
                data<-read.csv(files)
                data<-subset(data,complete.cases(data))
                ID<-unique(data$ID)
                nobs<-length(data$ID)
                out<-cbind(ID,nobs)
                output<-rbind(output,out)
                }
        output#This retains the order ofthe ids
}

complete2("specdata",30:25)
