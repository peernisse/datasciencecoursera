#####Method 1#####
setwd("C:/Coursera/Repos/datasciencecoursera/2_Week_2_Ritems")

pollutantmean<-function(directory,pollutant,id=1:332){
        files<-list.files(directory,full.names=TRUE)#creates a list of files in the given directory
        data<-data.frame()#create empty data frame
                for(i in id){
                #loops through the selected files by id and puts them together with rbind them together
                data<-rbind(data,read.csv(files[i]))
                }
        mean<-mean(data[,pollutant],na.rm=TRUE)
        mean
}
pollutantmean("specdata","nitrate",23)

#####Method 2#####
setwd("C:/Coursera/Repos/datasciencecoursera/2_Week_2_Ritems")

pollutantmean2<-function(directory,pollutant,id=1:332){
        files<-list.files(directory,full.names=TRUE)
        files<-files[id]
        data<-do.call(rbind,lapply(files,read.csv))
        mean<-mean(data[,pollutant],na.rm=TRUE)
        mean
}
pollutantmean2("specdata","nitrate",23)




