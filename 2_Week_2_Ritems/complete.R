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
        foo
}

complete("specdata",30:25)

#####Method 2#####
setwd("C:/Coursera/Repos/datasciencecoursera/2_Week_2_Ritems")
complete2<-function(directory,id){
        files<-list.files(directory,full.names=TRUE)
        files<-files[id]
        data<-do.call(rbind,lapply(files,read.csv))
        sub<-subset(data,complete.cases(data))
                output<-data.frame()
                for (i in id){
                        output$ID<-unique(sub$ID)
                        output$nobs<-length(sub$ID)
                }
        output
}

complete2("specdata",30:25)



files<-list.files("specdata",full.names=TRUE)
files<-files[1]
data<-read.csv(files)
data<-subset(data,complete.cases(data))
ID<-unique(data$ID)
nobs<-length(data$ID)


data<-do.call(rbind,lapply(files,read.csv))
sub<-subset(data,complete.cases(data))
output<-data.frame(ID=character(),nobs=character())
unique<-unique(sub$ID)      
        for (i in unique){        
                data<-subset(sub,ID==25)
                
        }
output
unique(sub$ID)
ID<-lapply(sub)

