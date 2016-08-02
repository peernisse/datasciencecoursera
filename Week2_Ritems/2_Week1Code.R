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
