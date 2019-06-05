'''
- data frame is a colection of vectors.. in python it is series 
- vector name by defult is used as the column names...
- we also can give the name that we are looking for 
- by default any character type will be converted to factor 
- python is very good at reading the file 
'''
###first method of creation
student=c('john', 'marry', 'larry', 'lucy')
age=c(19,21,18, 22)
gender=c('m', 'f', 'm', 'f')
mark=c(88,92, 78, 80)
mydata=data.frame(student, age, gender, mark)

##second method 
v1=c('john', 'marry', 'larry', 'lucy')
v2=c(19,21,18, 22)
v3=c('m', 'f', 'm', 'f')
v4=c(88,92, 78, 80)
mydata= data.frame(student=v1, age=v2, gender=v3, mark=v4)

#by default any character type will be converted to factor 
x=data.frame('SN'=1:2, 'age'=c(21,15), 'name'=c('john', 'dora'))
str(x) #statistical data of the data frame

x=data.frame('SN'=1:2, 'age'=c(21,15), 'name'=c('john', 'dora'), stringsAsFactors = FALSE) #passing the value inside... the data type is changing from factor to character
str(x)

 class(x) #it is a dataframe class 

typeof(x) # it is a  list

names(x) #name of columns

ncol(x) #number of columns

nrow(x) #number of row

length(x)

###similar to python we can read csv or.. if we don't put header then the first line is considered as the header and it will set a new line of v.. for the title
employee = read.table(header = T, text=' 
                      empid name age
                      001 John 37
                      002 Marry 39
                      003 Kevin 51
                      004 NA NA
                      006 David 40' 
                      )

employee

dim(employee)
names(employee)
sum(employee[c('age')], na.rm=TRUE) #getting the summation of the data and we are removing the missing values

### import and installing packages
install.packages(xlsx) #error 
library(xlsx)

library(sqldf)

##adding a new column
x$gender=c('w','F')
x$age2=x$age+10

#or
x['age3']=x['age']+20

##add amultiple columns-- we have to use c function in both sides 
x[,c('col1', 'col2')]=c(x$age2,x$gender)
x[,c('col1', 'col2')]=c(c(100,200),c(1000,2000)) #outer c is to group two values and inner c is for each vector

##droping columns
x$age2=NULL
x[c('col1', 'col2')]=NULL
 
##use subset to delete.. no need to have the " " it is only inside subset.. it doesnot change x 
z=subset(x,select=-c(gender))
x
z

v2=c(1,2,3)
v2=NULL
v2[2]=NULL ##error
v2[-1] #removing an element in vector
v2[-c(2,3)] #removing multiple elements
v2[1]='t' #replacing element 

#changing the name of existing column
##method 1
names(x)=c('m_student', 'm_age', 'm_name', 'm_gender', 'age' )
row.names(x)=c('r1', 'r2')

##method 2.. only one colum
names(x)[3]= "name"
##multiple columns
names(x)[c(3,4)] =c('name2','gender2')

head(x) #first 5 rows
head(x,1) #first row

tail(x,1) #last row

##method 3
library(Rcpp)

install.packages(plyr)
library(plyr)

#after defining the vs
x5=data.frame(v1,v2,v3,v4)

##extracting subset from dara frames
student = c('John', 'Marry', 'Larry')

sb1 = subset(x=x, subset=(age>30), select=c('m_student', 'm_age'))



####------- 
#iris is a built in data set.. we can modifi the built in local if you did do: data(iris)
df=iris #making copy of built in data
dim(df)
names(df)
df$Species=NULL
df

data() #giving all existing data sets

#using existing terminalogy of the data in our data..
names(iris)
y=iris[, c('Sepal.Length', 'Sepal.Width', 'Petal.Length')]
class(y)
x=as.matrix(y) #x is numeric therefore we can take the sqrt
class(x)
x=sqrt(x)

#colnames work with matrix and names works with the data farame
names(x) #nothinf shown
names(y)
colnames(x)

##we can not take the sqrt of the character.. we can not astypeinteger(char)
x=as.matrix(head(iris))
is.matrix(x)
sqrt(x)

y=iris[,-c('Species')] #error
subset(iris, select=-c(Species))#using subset and removing quotation
y=iris[,-c(5)]

#extracting columns
v=iris[,2]
is.vector(v) #it is vector automatically
class(v) #numeric type

v2=iris[,1:2]
class(v2)
is.vector(v2) #it is not a vector and it is a data frame
v3=as.vector(v2) #it is two columns
is.vector(v3) #still not a vector

v4=as.matrix(v2)
is.matrix(v4) #it is matrix

v5=as.vector(v4)
is.vector(v5) #it is a vector.. 
############### data frame can not be converted to vector but from matrix it can be conevrted to vector
#so from data frame -> matrix  -> vector (all elemnts in the matrix in the same line in the vector)

Sepal.Length #error because the vector is not defined


### we can attache only one data frame at once.. attach works with dataframe and list.. 
#we don't need to call the name of data frame if we already attach the data frame

v1=c('john', 'marry', 'larry', 'lucy')
v2=c(19,21,18, 22)
v3=c('m', 'f', 'm', 'f')
v4=c(88,92, 78, 80)
mydata= data.frame(name=v1, age=v2, gender=v3, mark=v4)
name #error
mydata$name

attach(mydata)
name
age=age+mark #it doesnot update the data frame
mydata$age=mydata$age+mydata$mark #it does update the data frame

detach(mydata)
name

##when we are merging the data frame we use cbine if we want to have A | B therefore we should have the 
#same number of rows.. increasing the information of each row
##when we are merging the data frame we use rbine if we want to have A/B therefore we should have the
#same columns.. even the name needed to be the same.. we are 


