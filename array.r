'''
- vector is the main data structure in R.. vs list in python
- array covers 1D, 2D and 3D
- first number is for row, second column and third is depth
- dem is used to check/create dimension (dim=c(2,3) two rows and three columns)
- the arange is column wise..
- vector and matrices are also array
- we can use array function to create vector and matrix but not other way around
- matrix are 2D not 3D.. 3D are arrays
- matrix function can create only matrix but array can create both amtrix and array
- for the dot operation second dimension of the first matrix MUST match the first dimension of the second matrix
- unlike vector/matrics and array we can save the non heteregenous data in list.. so in the list we can have mix.. list here is different from python..
we can have data structure with the list 
- factor are used for categorical data.. categorical data are the data that are non continues and they have few categories like gender, colour..
age is continues. not categorical.. but we have to change them to the categorical data
'''

###### arrays
w <- array(c(12,22,1,2,0,13), dim=c(2,3)) 
w <- array(c(12,22,1,2,0,13), dim=c(2,4)) # no error but repeating from the begining
w <- array(c(12,22,1,2,0,13), dim=c(1,3)) # no error but some are empty

v1= c(10, 20, 30, 40, 50)
v2= c(60, 70, 80, 90, 100)
is.vector(v1)
is.array(v1) #FALSE

q=rbind(v1,v2) #merge row-wise
is.vector(q) #False
is.array(q) #TRUE
is.matrix(q) #TRUE.. two dimensional matrix is also array

w2=cbind(v1,v2) #merge column-wise
is.vector(w2) #False
is.array(w2) #TRUE
is.matrix(w2) #TRUE.. two dimensional matrix is also array

#check dimension
dim(w2)

w3=cbind(v1,v2,v1)

#convert it to the one dimensional vector
as.vector(w2)
c(w2) #even the c function convert the matrix to the one dimensional vector


x=1:12
array(x, dim=c(2,3,2))

array(x, dim=c(2,3,1))

#slicing
t=array(1:12, dim=c(2,3,2))
t1=t[,,1] #first slice.. all rows and columns
t1_=t[:,:,1] #error
dim(t1) 

t2=t[,,2] #second slice

is.array(t1)#t1 is still array
is.matrix(t1) #t1 is matrix
is.vector(t1) #is not vector

newarray=array(c(t1,t2), dim=c(2,3,2))
t=newarray

b=matrix(c(2,4,3,1,5,7),  nrow=3,  ncol=2) #it moves column -wise
b1=matrix(c(2,4,3,1,5,7),  nrow=3) #defining one dimension is enough
b11=matrix(c(2,4,3,1,5,7),  ncol=2)
b111=matrix(c(2,4,3,1,5,7))

b2=matrix(c(2,4,3,1,5,7),  nrow=4,  ncol=2)############???

b3=matrix(c(2,4,3,1,5,7),  nrow=3,  ncol=2, byrow=TRUE) #it moves column -wise
b3[3,2]

#naming the columns-- changing from number to the name
A=matrix(c(2,4,3,1,5,7),  nrow=2,  ncol=3)
dimnames(A) =list(c('row1', 'row2'), c('col1', 'col2', 'col3'))

#combining multiple matrix
c=matrix(c(7,4,2), nrow=3, ncol=1)
cbind(b,c)


#attributes gives us the dimensiom
attributes(A)

#naming the rows and columns in the same line of code
x=matrix(1:9, nrow=3,dimnames=list(c('X', 'Y', 'Z'), c('A','B', 'C')))
class(x)
typeof(x)


#operation in the matrix
#matrix and vector
m=matrix(seq(1:20), nrow=5, ncol=4)
m+3 #3 added to all values
m+m[1,] #adding a row to the matrix.. becarful that we start from 1 and then if we are lacking a value we get it from the rest of the list in the vector

#matrix and matrix operation.. position by position
m+m
m+A #missmatch error
m-m 

#product operation: important:second dimension of the first matrix MUST match the first dimension of the second matrix and put it in the appropriate location
a=matrix(1:4, nrow=2)
a
a*a #position by position multiplication
a%*%a #product 
m%*%a #mismaching error

a/a #for division we don't need to be worried about inverse
c=solve(a)
a%*%c


#transposing give is the transpose if the matrix
t(m) 
#
2*m

#if the matrics has the label we can slice using the name of the columns/rows
colnames(A)
A[,'col1']

rownames(A)

####lists.. bob and john are the label and the list below is the list of two vectors
v=list(bob=c(2,3,5), john=c('aa', 'bb'))
v
class(v)
typeof(v)
#slicing
v[c('john', 'bob')]

v['bob']

#to get rid of the label and getting just the values..[[]] or $
v[['bob']]
v$bob

attach(v)
bob 
detach(v)
bob #error

class(v[['bob']])

v[1] #refering to the first element of the v
length(v) 
is.list(v[["bob"]]) #FALSE
is.list(v['bob']) #TRUE

class(v['bob']) #list
class(v[['bob']]) #numeric

typeof(v[['bob']]) #double.. default of the numeric

x=list(1,2,3,4)
x
x[1]

x1=list(1,2,'ww',4)
x1[3]

x2=list(c(1,2),3, 'ww',matrix(1:4, nrow=2)) #first element is a vector, second is a single value and the third is a character and the forth is a matrics


z=list(2,4,6,8)
z
y=c(2,4,6,8)
y
z==y #because list is a vector essentially
x2==y #error because it does have a string

x2[4]+3 #error because we can not add the scaler to the list
x2[[4]]+3 #we can have the add to the matrix

paste(x2[3], 'tt') # works
paste(x2[[3]], 'tt') #works

######factor
p=factor(c(1,0,0, 1,1,0))
p #the results is the data itself and the levels
levels(p) #similar to the unique function in python

ord=c( 'no school', 'high school', 'university',  'post graduare')
newlevels=c(ord, 'unknown')


p=factor(c(1,0,0, 1,1,0))
p #the results is the data itself and the levels
levels(p) 
t=factor(p, levels=c(0)) #passing only one level rather than two
t #because I removed the level 1 the data on those level we have NA

t2=factor(p, levels=c(0,1,2)) #it is ok .. we are maupulating with the level

gender=c('m', 'm', 'f', 'm', 'm', 'f')
f_gender=factor(gender)

#it is important sometimes to maupulate for the gender
#First method
f_gender[1]='un' #error because it is not in our level list
levels(f_gender)=c('m','f','un')
f_gender
f_gender[1]='un' #no error

#Second method
f_gender = factor(gender, levels=c('m','f','un'))
f_gender
f_gender[1]='un' #no error
