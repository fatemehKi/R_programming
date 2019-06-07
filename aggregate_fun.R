'''
- apply is a function of repeating actions on a data set without loop
- apply family.. the main difference is the type of input that they take
-apply.. the second argument is margin which is not optional
- NULL is different than NA.. it is not a value but NA and NAN are special value but they are not a number

'''

x=seq(1:10)
x[x<5]=4

x= matrix(rnorm(30), nrow = 5, ncol = 6)
apply(x,2,sum) #we have 6 columns therefore the output is 6 element
apply(x,1,sum) #we have 5 rows therefore the output is 5 element
apply(x,sum) #error
apply(x,1, max)
apply(x,1, round) # matrix type  in output
apply(x,1, sqrt) ##???

### apply with the defined function on all individual elements
apply(x,1:2,function(x) x/2) #1:2 refers to all element
f=apply(x,1,function(x) x/2) #gives the output rearranged.. transposed.. it is better to have both 
is.matrix(f)

str(Titanic) ##4D table.. 

##finding how many passengers in each cabin class
apply(Titanic, 1, sum)

### number of paasengers in the different age groups
apply(Titanic, 3, sum)

### number of passengers in the gender
apply(Titanic, 2, sum)

### number of passengers in the survived
apply(Titanic, 4, sum)

###applying summation in two dimension
t=apply(Titanic, c(3,4), sum)
is.table(t) #FALSE
is.matrix(t)

###lapply created the list from a list
l=list(a=1:10, b=11:20)
lapply(l, mean)

x= matrix(rnorm(30), nrow = 5, ncol = 6)
lapply(x, mean) ##miss using the lapply 

##working in the dataframe
student=c('john', 'marry', 'larry', 'lucy')
age=c(19,21, 18, 22)
gender=c('M', 'F', 'M', "F")
mark=c(88,92,78,80)
mydata=data.frame(student, age, gender, mark)
is.data.frame(mydata)
is.list(mydata)
result=lapply(mydata[c('age', 'mark')], mean, na.rm=TRUE) #the output is the list.. applying on two columns
is.list(result)
names(result)



#list of matrices
a=matrix(1:9, 3,3)
b=matrix(4:15, 4,3)
c=matrix(8:10, 3,2)
mylist= list(a,b,c)
lapply(mylist, function(mylist) mylist/2)
#the output is the list
lapply(mylist, mean) #the output shows the mean on each elements of the lsit

###sapply returns the vector; however, if we put simplify as False the output can be shown like list
l=list(a=1:10, b=11:20)
sapply(l,mean) #output is in the vector format.. can be matrix as well


###
mydata
v=mydata[c('age', 'mark')]
x=sapply(v, mean, simplify = T, na.rm=TRUE)
x

#if simplify is FALS the output is vector but it is in the list visualization type
x=sapply(v, mean, simplify = F, na.rm=TRUE)
x

iris
a=sapply(iris[c("Sepal.Length", "Sepal.Width")], mean, simplify=F)
is.vector(a) #still vector but in the different shape

random=c("this", 'is', 'random', 'vector')
sapply(random, nchar) #finding the number of character in the vector and the output is vector

#####Mapply.. we start with the function.. the output is the vector and a list............................................................................................................................................................................................................................

mapply(sum, 1:4, 1:4, 1:4) # it will apply the function to every elements of every vector

#the output depends on the function you are applying.. rep has two argument first what 
#to repeat and te second is the number of times
mapply(rep, 1:4, 1:4)
a=mapply(rep, 1:4, 1:2)

is.vector(a)
is.list(a)

#####tapply.. grouping by based on the argument
attach(iris)
tapply(Sepal.Length, Species, mean) #.. equal to tapply(iris$Sepal.Length, iris$Species, mean)
detach(iris)

attach(ToothGrowth)
tapply(len, supp, mean) #average of the record based on the suppliment

mean(len) #that was the mean for the whole 

##
stname=c('john', 'marry', 'larry', 'lucy', 'david')
age=c(59,31,38, 52, 46)
gender=c('M', 'F', 'M', "F", "M")
smoker=c('Y', 'N', 'Y', "N", 'Y')
tenure=c(12, 9, 7,20, 10)
income=c(50000, 70000, 39000, NA, 52000)
D= data.frame(stname, smoker, age, gender, tenure, income)

#range function on D$tenure/D$age
tapply(D$tenure/D$age, D$smoker, range, na.rm=TRUE)
###to understand above.. it is obtained from below
D$new=D$tenure/D$age
D

b=tapply(D$age, list(D$smoker, D$gender), mean, na.rm=TRUE) #the second argument needs to be a list
is.array(b)
is.matrix(b)
is.vector(b)

##### rapply.. it is a recursive.. mainly nested list
x=list(1,2,3,4)
rapply(x,function(x) x^2, class=c('numeric'))

x=list(3,list(4,5), 6, list(7,list(8,12)))
str(x)
rapply(x,function(x) x^2, class=c('numeric'))

#### vapply.. complex data used vapply
vapply(1:5, sqrt, 1i)

x=cbind(x1=3, x2=c(4:1, 2:5))
x[4,2] = NA
x[3,] =NA

rowSums(x)
colSums(x)
rowMeans(x)

rowSums(x, na.rm=TRUE)
colSums(x, na.rm=TRUE)

### replace string character with specific car
install.packages(stringr)
library(stringr)
str_replace(x, '[$]', ' ')

###moving from column to .. 
#if data frame is not only numeric we will miss the data from stack to unstack..
# in the ~ operation, left side is the group by 

area=c('Ame', 'Asi', 'Euro', 'Ame', 'Ame')

library(MASS)
library(reshape2)
library(reshape)

ships

shipdata = head(ships, n=10)
mel_ship=melt(shipdata, id=c('type', 'year')) #it seperated the data frame based on the different period, service, incident (each as the variable)
#and put the coresponding value to the variable.. we are moving from vertical to horizantal
rec_ship=cast(mel_ship, type+year~variable, sum)
rec_ship=cast(mel_ship, type+year~variable, sqrt)
