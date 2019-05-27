" 
- It does not give you error vs python.. they are competitor
- It is stronger in the visualization 
- packages in the python is more powerfull
- most of the work will be done using the inside packages
- we are doing more 
- factor is special in R
- vector is quite similar to the list in python
- python is more powerful in reading files compare to the R
- python is considered independent programming languages but R is different, we need to
install external thing in the R
- we will quickly look at the  syntacs
- you can export in the Latex
- install.packages(name) and library(name)
- RGUI is the very poor version for the R environment
- but RDI which is the main interactive environment is Rstudio
- Data objects (built in) data frame, factors adn vector is the most important.. different than python
-ctrl + enter will run the current line andb going to the nexr line
- if you highlight and run you don't go to the next line
- if we assume the list is the main in python; vector is the main in R adn 'c' is the function
- we have 1. Atomic, collection, data frame, other object
- we have two types of data  numeric class(data type is double ) and logical
- when we do operation the most powerful or generic will be the output type
- character is the most generic data type and everthing is going to be converted character
- NA representing the missing value in R
- NULL is empty but Nan and NA are showing special values and they are different
- r is case sensitive
- we can pass multiple types of variables and we get the output is vector using function c and the type 
of the output is the strongest one
- <- means =
- the first element in array is 1 and the last one is n.. be carful indexing start from 1 not 0 and end is n not 'n-1'
- seq is showing the 
- for the slicing for more than one number we need c 
"
#my first program
x=5

v=c(1,2,3,3)

d= TRUE
class(d)

a=10.5
class(a)
typeof(a)

b=10
class(b)
is.integer(b)
is.numeric(b)
c=as.integer(b)

v1=c(1,2,3,3)
class(v1)
typeof(v1)

v2=c(1,2,"aaa",3)
class(v2) #class changed to the character
typeof(v2)
#character is the most generic data type and everthing is going to be converted character




3/0

100**100*99

0/0

v=c()
print(v)

x<- 1:7
x
is.vector(x)

y <- 2:-2 #starting from 2 and ending at -2
y

seq(1,3,by=0.2)
seq(1,3,0.2)

seq(1,5,length.out = 4) #(5-1)/3 
seq(1,5,length.out = 2)
?seq

x=c(0,2,4,6,8,10)
x[3]
x[c(2,-4)]##error.. can not be mixed of positive and negative
x[-3] #ignore the element at 3
x[c(2,4,3.54)] #ignoring the decimal part for the element.. python is error

v1=c(3,5,8,9,17)

v1[3]
v1[c(1,3,5)]
v1[1:3]
v1[-5]
v1[:-3] #error
v1[1:-3]#error
v1[-c(1,3,5)] #ignoring 
v1[-c(1:3)]

x=c(7,3,12,1,3:9)
q=sort(x)
sort(x,decreasing = TRUE)
y=x[x>=3 & x<8] #lsilimar to the list comprehensive..becarful it is a [] not () and 

minv=which.min(x)
minv #returns the location of the minimum value and \if we are going to get the value look below
x[minv]

v1=c(3,5,8,9,17)
max(v1)#giving the maximum value of the vector

which(v1>10) ############which always give location######

v2=which(v1*2>10) #location of the values greater
v1[v2]
#or
v1[v1*2>10]

a = c(1,3,5)
b = 1:6
match(a,b)
match(b,a) #showing NA for thoes that do not exist
rev(a) #reversing the order

z=rep(3,5)#repeating 3 for 5 times
is.vector(z)

v1=c(1,3,5)
v2=rep(3,2) #(3,3)
v3=seq(2,4) #(2,3,4)
x=c(v1,v2,v3) # we have concatinating
c(x,1000)

z=c(x, c(17,18))
z

p=c(c('age', 'name'),v1) #everthing is converted to character
p

q=c(v1,c('age', 'name'), v2)
q

q2=c(v1,c(v3,c('age', 'name')), v2)
q2

length(q2) #total number of elements in the vector

z=rep(3,5)
is.vector(z)
z
length(z)

length(z)=8
z
z[6]=10 #updating 
length(z)
z[9]=10 #adding a new element to a new location ### does not exist in python


q=c()
q
length(q)

v1=c(1,2)
vf=rep(v1,10)

#output 1 2 1 2 1 2 1 2 1 2
rep(c(1,2),5)

##output 1 1 2 2 .. 9 9 10 10
#1
v2=c(rep(1,2), rep(2,2), rep(3,2), rep(4,2), rep(5,2), rep(6,2), rep(7,2), rep(8,2))

#2
d=c()
for (i in  1:10){
  d=append(d,rep(i,2))
}
print(d)

#3
sort(rep(1:10,2))

#4
rep(1:10, each=2) #using the each parameter we can have an element twice here

#deletinng a vector
a=1:5
a
a=NULL
a[0]
a[2]

a=1:5
a[1]=NULL #error
a[2]<-NULL #error

a=c(1,5,NULL)  
a#NULL is not shown in the result 
a[3] #we get NA value 

is.na(a)

length(a)=5
a
is.na(a)
is.na(a[5]) 

q=c()
q
is.null(q)

### operation in vectors:
x=2*(1:10)
x
x[-c(1,6)]
x[-(2:5)] #exclusind the range of element... ## we don't use c with a range of element##
x[c(5,3,8,3)] #repeating one element twice

x=66
x=paste(x,'=65+1')#works like + (concatinating) in python
paste('tareq', 'jaber') #it will remove ',' and replace it space

a=c(1,2,4,8)
a[2]='my name' #it will change all elements to char
a

b=TRUE
class (b)

#arithmatic ############ "+" here is arithmatic not concatination.. concatination equals c(a,b)
a=c(1,3,5)
b=c(1,2,3,4,5,6)
a+b #it goes to the beginning of the short one and start over

a=c(1,3,5)
b=c(1,2,3,4,5)
a+b##error due to the size

"target"+"jaber" #error the correct way is using paste.. paste('tareq', 'jaber')

a=c(1,3,5)
b=c(1,2,3,4, 'y',5,6)
a+b##error due to the size
