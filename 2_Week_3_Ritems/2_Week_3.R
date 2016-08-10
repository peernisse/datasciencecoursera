#####Loop Functions#####
#lapply
#sapply
#apply
#tapply
#mapply

#lapply
x<-list(a=1:5,b=rnorm(10))
lapply(x,mean)#returns a list

x<-1:4
lapply(x,runif)

x<-1:4
lapply(x,runif,min=0,max=10)

#using an anonymous function (function without a name)
x<-list(a=matrix(1:2,2,2),b=matrix(1:6,3,2))
x
#pull out first column from each matrix in x
lapply(x,function(elt) elt[,1])#there isno function to pull out first column, 
#so make one wiht argument elt

#sapply
#tries to simplify the result of lapply
x<-list(a=1:4,b=rnorm(10),c=rnorm(20,1),d=rnorm(100,5))
x
lapply(x,mean)#returns list of means
sapply(x,mean)#returns vector of means
mean(x)#see how mean of x does not work without apply function

#apply
#watch video

#mapply
#used to apply a function to multilpe sets of arguments
list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
#or use mapply
mapply(rep,1:4,4:1)
#vectorizing a function
noise<-function(n,mean,sd){
        rnorm(n,mean,sd)
}
noise(5,1,2)
noise(1:5,1:5,2)#not quite correct
mapply(noise,1:5,1:5,2)

#tapply
#used to apply a function over subsets of a vector

str(tapply)

x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
f
tapply(x,f,mean)
tapply(x,f,mean,simplify=FALSE)
tapply(x,f,range)

#split
#takes a vector and splits into groups
x<-c(rnorm(10),runif(10),rnorm(10,1))
f<-gl(3,10)
split(x,f)

lapply(split(x,f),mean)

#splitting a dataframe
library(datasets)
head(airquality)
#calculate mean of each parameter in each month
s<-split(airquality,airquality$Month)
lapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")]))
sapply(s,function(x) colMeans(x[,c("Ozone","Solar.R","Wind")],na.rm=TRUE))
#splitting on more than one level
x<-rnorm(10)
f1<-gl(2,5)
f2<-gl(5,2)
f1
f2
#combine the levels from f1 and f2 using interaction()
interaction(f1,f2)

#####Debugging Tools#####
#message
#warning
#error
#condition








