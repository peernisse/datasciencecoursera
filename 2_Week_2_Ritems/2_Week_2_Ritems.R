setwd("C:/Coursera/Repos/datasciencecoursera/2_Week_2_Ritems")

#####Control Strucures Intro#####
#if/else
#for
#while
#repeat
#break
#next
#return

#####If/Else#####
x<-4
y<-45
if(x>3){
  y<-10
  
} else {
  y<-0
}
#or
y<-if(x>3){
10  
} else{0}

#####For loop#####
for (i in 1:10){
  print(i)
}
#other forms
x<-c("a","b","c","d")

for (i in 1:4) {
  print(x[i])
}

for (i in seq_along(x)) {
  print(x[i])
}

for (letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])

#Nested FOR loops
x<-matrix(1:6,2,3)
x

for(i in seq_len(nrow(x))) {
        for(j in seq_len(ncol(x))){
          print(x[i,j])
        }
}

#####While loop#####
count<-0
while(count<10){
  print(count)
  count<-count+1
}
require(stats)
z<-5

while(z >= 3 && z <= 10) {
  print(z)
  coin<-rbinom(1,1,0.5)
  
  if(coin==1){
        z <- z+1
  } else {
        z <- z-1    
  }
}

#####Repeat, next, break#####
x0<-1
tol<-1e-8

repeat {
  x1<-computeEstimate()#computeEstimate is not a real function
  if(abs(x1-x0)>tol){
    break
  } else {
    x0<-x1
  }
}

#next
for(i in 1:100) {
  if(i<=20) {
        ##Skip the first 20 iterations
        next
  }
    ##Do something here
}

#return
#return can be used to break a loop when a desired condition is met


#####Functions#####
add2<-function(x,y){
  x+y
}
add2(3,5)

above10<-function(x) {
  use<- x > 10
  x[use]
}
above10(1:15)

above<-function(x,n) {
  use<- x > n
  x[use]
}
x<-1:20
above(x,12)

#with a default value of 10
above<-function(x,n = 10) {
  use<- x > n
  x[use]
}

above(x)#no n specified so defaulted to 10
above(x,11)#still works if n is provided

#mean function
columnmean<-function(x){
  nc<-ncol(x)
  means<-numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(x[,i])
  }
  means
}
columnmean(airquality)
#remove NAs in this function
columnmean_NA<-function(x,removeNA=TRUE){ #added removeNA argument
  nc<-ncol(x)
  means<-numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(x[,i],na.rm = removeNA) #passed removeNA to calculation
  }
  means
}
columnmean_NA(airquality)
columnmean_NA(airquality,FALSE)#turn off removeNA

#save function as file
#save the .R file


#####Functions (cont)#####

mydata<-rnorm(100)
#these are all equivalent
sd(mydata)
sd(x=mydata)
sd(x=mydata,na.rm=FALSE)
sd(na.rm=FALSE,x=mydata)
sd(na.rm=FALSE,mydata)

#Argument matching
require(stats)
args(lm)#tells you the arguments in function lm
#the following are equivalent
rm(x)
rm(y)
lm(data=mydata,y~x,model=FALSE,1:100)
lm(y~x,mydata,1:100,model=FALSE)

# The ... argument used when replicating/tweaking an exiting function
myplot<-function(x,y,type='1',...){#modifying the plot function
  plot(x,y,type=type,...)
}

#####Scoping rules#####
#watch videos

#lexical scoping
make.power<-function(n) {
  pow<-function(x){
    x^n
  }
  pow
}

cube<-make.power(3)
square<-make.power(2)
cube(3)
square(3)

#explore function closure
ls(environment(cube))

#####Coding Standards#####
#use text editor
#indent your code
#limit width of code
#limit length of functions

#####Dates and Times#####
x<-as.Date("1970-01-01")
x
unclass(x)
weekdays(x)
months(x)
quarters(x)
x<-Sys.time()
x
p<-as.POSIXlt(x)
p
names(unclass(p))



#####Quiz#####
cube<-function(x,n) {
        x^3
}
cube(3)

x <- 1:10
if(x > 5) {
        x <- 0
}

f <- function(x) {
        g <- function(y) {
                y + z
        }
        z <- 4
        x + g(x)
}

z<-10
f(3)

x <- 5
y <- if(x < 3) {
        NA
} else {
        10
}

y

x<3


#####Assignment#####
#see assignment.R




