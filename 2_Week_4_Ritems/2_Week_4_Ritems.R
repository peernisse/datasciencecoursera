#####SystemTime#####
##Elapsed time>user time
system.time(readLines("http://www.jhsph.edu"))

##Elapsed time<user time
hilbert<-function(n){
        i<-1:n
        1/outer(i-1,i,"+")
}

x<-hilbert(1000)
x
system.time(svd(x))

#####Rprof#####
#summaryRprof must be used to be readable, raw output is not
##Do not use system.time and Rprof together

#####Week 4 Quiz#####

##1
set.seed(1)
y<-rpois(5,2)
class(y)
str(y)
y
#4
?dpois
qpois

#5
set.seed(10)
x<-rep(0:1,each=5)
e<-rnorm(10,0,20)
y<-0.5-2*x+e
y
plot(y)
#6
?rbinom
rbinom(100,1,0.5)
#7

#8
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)