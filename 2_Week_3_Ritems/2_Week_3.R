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

#Warning Example
log(-1)
#[1] NaN
#Warning message:
#In log(-1) : NaNs produced

printmessage<-function(x){
    if(x>0)
      print("x is greater than zero")
    else
      print("x is less than or equal to zero")
    invisible(x)#a command that revents autoprinting of function result
}

printmessage(1)
printmessage(NA)
#Error in if (x > 0) print("x is greater than zero") else print("x is less than or equal to zero") : 
#missing value where TRUE/FALSE needed

printmessage2<-function(x) {
        
        if(is.na(x))
                print("x is a missig value!")
                
        else if(x>0)
                print("x is greater than zero")
        else
                print("x is less than or equal to zero")
        invisible(x)
}

x<-log(-1)
printmessage2(x)


#####Debugging Tools#####
#Traceback
#Browser
#Trace
#Recover

#####Using Debugging Tools#####
#traceback()
rm(x)
mean(x)
traceback()

lm(y~x)
traceback()

#debug()
debug(lm)
lm(y~x)
#use the n to step through the debugger pane

#recover()
options(error=recover)#for this session, launch recover on any error

read.csv("nosuchfile")


#####Module 2 Week 3 Quiz#####
library(datasets)
data(iris)
?iris
sl<-subset(iris,Species=="virginica")
mean(sl$Sepal.Length)

#2
colMeans(iris)
no2<-apply(iris[,1:4],2,mean)
no2
is.vector(no2)

library(datasets)
data(mtcars)
?mtcars
mtcars
#my code
xxx<-lapply(split(mtcars$mpg,mtcars$cyl),mean)
xxx
#3 Trying answers
split(mtcars,mtcars$cyl)#No
tapply(mtcars$mpg,mtcars$cyl,mean)#yes
tapply(mtcars$cyl,mtcars$mpg,mean)#no
with(mtcars,tapply(mpg,cyl,mean))#yes
sapply(mtcars,cyl,mean)#no
sapply(split(mtcars$mpg,mtcars$cyl),mean)#yes
lapply(mtcars,mean)#no
mean(mtcars$mpg,mtcars$cyl)#no
apply(mtcars,2,mean)#no

#4
sapply(split(mtcars$hp,mtcars$cyl),mean)#yes
val<-209.21429-82.63636
val


debug(ls)
ls()


#####Module 2 Week 3 Programming assignment#####
See R File



