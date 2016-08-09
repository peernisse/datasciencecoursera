setwd("C:/Coursera/Repos/datasciencecoursera/2_Week_1_Ritems")


myFunction <- function() {
  x <- rnorm(100)
  mean(x)
  }

myFunction()

second <- function(x) {
  x+rnorm(length(x))
}

#####Input and Evaluation#####
x<-1
print(x)
msg<-"hello"
msg
x<-1:50
x

#####Objects and Attributes#####
#Objects
  #character
  #numeric
  #integer
  #complex
  #logical(T/F)
#Lists can contain objects of different classes within the list
#vectors create with vector() function
0/0
Inf/1
1/Inf

#attributes() gives/modify object attributes
attributes(x)

#####Vectors and lists#####
#Creating vectors
x<-c(0.5,0.6)
x<-vector("numeric",length = 10)
class(x)

#mixing objects in a list, automatic coercion converts 
#all elements in the vector to the same class 
y<-c(1.7,"a") #character
y<-c(TRUE,2) #numeric
y<-c("a",TRUE) #character

#Explicit coercion
x<-0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)
x<-c("a","b","c")
as.numeric(x)#illogical

#Lists
x<-list(1,"a",TRUE,1+4i)#mixed classes
x #list elements are listed with double brackets, vectors single brackets

#####Matrices#####
m<-matrix(nrow=2,ncol=3)
m
dim(m)
attributes(m)

m<-matrix(1:6,nrow=2,ncol=3)
m
#create matrix from vector using dim() function
m<-1:10 #vector
m
dim(m)<-c(2,5)#send vector into matrix
m
#binding columns and rows
x<-1:3
y<-10:12
cbind(x,y)
rbind(x,y)

#####Factors#####
#are basically an integer vector but having "levels" attribute
x<-factor(c("yes","no","yes","no","yes"))
x
unclass(x)#shows tha the factor is really just a vector 
#where 1=no and 2=yes because no is before yes alphabetically
#to explicitly set the baseline level use levels()
x<-factor(c("yes","no","yes","no","yes"),levels=c("yes","no"))
x

#####Missing Values#####
#is.na()
#is.nan()
x<-c(1,2,NA,10,3)
is.na(x)
is.nan(x)
x<-c(1,2,NA,NaN,10,3)
is.na(x)
is.nan(x)

#####Dataframes#####
x<-data.frame(foo=1:4,bar=c(T,T,F,F))
x
nrow(x)
ncol(x)
#####Names attribute#####
#in a vector
x<-1:3
names(x)
names(x)<-c("foo","bar","norf")
x
names(x)
#in a list
x<-list(a=1:10,b=2,c=3)
x
#in a matrix
m<-matrix(1:4, nrow=2,ncol=2)
dimnames(m)<-list(c("a","b"),c("c","d")) #matrix naming rows then columns
m

######Reading Tabular data#############

read.table()
read.csv()
readLines #(reads a text file as text)
source()#for reading in R code files (inverse of dump)
dget()#for reading in R code files (inverse of dput)
load()#for reading in workspaces .Rproj
unserialize()#reading single R objects in binary form

#######Writing Files#####
#substitute write for read in above

######Determining colClasses and defining them during read.table
#for large datasets
data<-read.table("datatable.txt",nrows=100) #pull top of the data
classes<-sapply(data,class)#loop through columns and get classes
tabAll<-read.table("datatable.txt",colClasses=classes)#speeds up read.table
#because R does not have to go figure all the colClasses
#use an estimate of the number of rows and set nrows within read.table to let R calculate the required RAM upfront

#####Textual Data Formats#####
#dput deparses data,keeping metadata, and dget gets it back
y<-data.frame(a=1,b="a")
dput(y)
dput(y,file="y.R")
new.y<-dget("y.R")
new.y
#dump/source can do this same thing but can do multiple items at once 
x<-"foo"
y<-data.frame(a=1,b="a")
dump(c("x","y"),file="data.R")
rm(x,y)
source("data.R")
x
y
#####Interface Connections#####
#file(),url()


#####Subsetting Basics######
#using [,[[, or $
x<-c("a","b","c","c","d","a")
x[1]
x[2]
x[1:4]
x[x>"a"]
u<-x>"a"
u
#####Subsetting Lists#####
x<-list(foo=1:4,bar=0.6)
x
x[1]#returns the list with name

x[[1]]#returns just the sequence

x$bar
x[["bar"]]
x["bar"]

#multiple items
x<-list(foo=1:4,bar=0.6,baz="hello")
x[c(1,3)]

#[[ can be used with computed indices,$ cannot
x<-list(foo=1:4,bar=0.6,baz="hello")
name<-"foo" #computed index for 'foo'
x[[name]]
x$name #returns NULL, 'name' does not exists oin object x
x$foo
#nested elements
x<-list(a=list(10,12,14),b=c(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]
x[[c(2,1)]]

####Subsetting Matrices#####

x<-matrix(1:20,5,4)
x
x[1,2]
x[2,1]
x[1,]#leave out the column index to get a whole row
x[,2]#leave out the row index to get a whole column
#using drop=FALSE (drop drops the matrix dimensions)
x<-matrix(1:6,2,3)
x[1,2]#value is returned as a vector, the matrix dimensions are dropped by default
x[1,2,drop=FALSE]#the matrix row/column are retained
x[1,]
x[1,,drop=FALSE]

#####Partial Matching#####
x<-list(aardvark=1:5)
x$a
x[["a"]]#does not do partial matching unless use exact=FALSE
x[["a",exact=FALSE]]

#####Removing NAs#####
x<-c(1,2,NA,4,NA,5)
bad<-is.na(x)#a logical vector T/F for presence of NAs
bad
x[!bad]#returns the vector without the NAs
#using complete.cases()
require(stats)
x<-c(1,2,NA,4,NA,5)
y<-c("a","b",NA,"d",NA,"f")
good<-complete.cases(x,y)
good
x[good]
y[good]

#remove NAs from data frames
airquality[1:6,]
good<-complete.cases(airquality)
airquality[good,][1:6,]#removes any row with NAs in it

#####Vectorized Operations#####
x<-1:4;y<-6:9
x+y
x>2#returns logical vector
x>=2#returns logical vector
y==8#returns logical vector, testing where is 8
x*y
x/y
#with matrices
x<-matrix(1:4,2,2);y<-matrix(rep(10,4),2,2)
x*y #element wise multiplication
x/y
x%*%y #true matrix multiplication

#####Week 1 Quiz#####
x<-4
class(x)
x<-c(4,"a",TRUE)
class(x)
x<-c(1,3,5);y<-c(3,2,10)
foo<-cbind(x,y)
class(foo)
v<-c("ahh",2,4)
class(v)
is.vector(v)
x<-list(2,"a","b",TRUE)
xxx<-x[[1]]
class(xxx)
is.list(xxx)
is.vector(xxx)
x<-1:4;y<-2
x+y
x<-c(3,5,1,10,12,6)
x[x < 6]==0

data<-read.csv(file="hw1_data.csv")
data
data[47,]
vec<-data$Ozone
length(vec)
bad<-is.na(vec)
length(vec[!bad])
153-116
vec2<-vec[!bad]
mean(vec2)
length(vec2)
library(tidyr,dplyr)
sub<-subset(data,Ozone>31 & Temp>90)
mean(sub$Solar.R)
sub<-subset(data,Month==6)
mean(sub$Temp)
sub<-subset(data,Month==5)
oz<-sub$Ozone
bad<-is.na(oz)
max(oz[!bad])

#####SWIRL optional exercises#####

install.packages("swirl")
library(swirl)
install_course_zip("C:/Coursera/Lessons/2_Week 1/swirl_courses-master.zip",multi=TRUE,which_course = "R Programming")
swirl()
Pedro
1
5+7
x<-5+7
x
