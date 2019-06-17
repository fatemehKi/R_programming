'''
-merge data
'''

paste('the life of', pi)# the sep argument as default is space

paste('I', 'Love', 'R', sep = '-')

#pasting a single element with the vector
paste('X', 1:5, sep='.') #"X.1" "X.2" "X.3" "X.4" "X.5".. the output has multiple component

paste(1:3, c('!', '?', '+'), sep='', collapse = '')#no repetation but every element goes with each.. both should have the same length
#"1!2?3+".. collapse will give you the output in a joint type
paste(1:3, c('!', '?', '+'), sep='')

evalue=paste("the value of 'e' is", exp(1), NA ) # you can paas function as a paramter and NA does not need quotation
evalue

paste0('lets', 'collapse', 'these', 'words') #works like concatination func in python and it makes no space

paste('lets', 'collapse', 'these', 'words') #space exists

X=' a data'
paste('I am', X , 'science')

########merge vs cbind (rbind).. we need the matching columns for merge not rbind (cbine)
##columns of two data set must be the same, otherwise they can not be rbind

##create a matrix
x=cbind(c(1,2,3), c(4,5,6))
t(x) #transpose

#cbind.fill itself fill the empty values with repeating the values from the begining but cbind.fill (.. fill=NA)
#saying that the emptyelements with the NA
install.packages(rowr)
install.packages(plyr)
library(rowr)
library(plyr)

x=cbind(c(1), c(4,5,6)) #repeats the 1
x=cbind.fill(c(1), c(4,5,6))
cbind.fill(c(1,2,3),list(1,2,3),cbind(c('a','b')),'a',df)

mydata1 <- data.frame(index=c("A","B","C"), var1=5:7)
mydata2 <- data.frame(var1=8:10, species=c("one","two","three"))
# smartbind the dataframes together
library(plyr)
rbind.fill(mydata1, mydata2) # we need to have index from the first and species from the second
##merge for data frames is more meaningful compare to the bind

#merge is similar to the one in SQL
##########********** a and y are the defined argument
data1 <- data.frame(ID=1:5, x=letters[1:5]) #letters show the alphabets from a b..
data2 <- data.frame(ID=1:5, y=letters[6:10])
merge(data1, data2) # the default is the inner join same as merge(data1, data2, by.).. the matching point is optional.. the default merge is inner
merge(data2, data1)


data1 <- data.frame(ID=1:5, x=letters[1:5])
data2 <- data.frame(ID=4:8, y=letters[6:10])
merge(data1, data2, all=TRUE) #it is the full outer join
merge(data1, data2, all.x=TRUE) # Only keep the rows from the 1st argument data1 and only the matching from the second.. left join
merge(data1, data2, all.y=TRUE) # Only keep the rows from the 2nd argument data2 and only the matching from the first.. right


data1 <- data.frame(ID=1:5, m=letters[1:5])
data2 <- data.frame(ID=1:5, m=letters[6:10]) # x is for the first dataset and y is the second daraset
merge(data1, data2, all=TRUE) # Add rows
merge(data1, data2, by="ID") # Add columns
merge(data1, data2, by="ID", suffixes=c(1, 2)) # we can change the x and y name by the suffuix
merge(data1, data2, by="ID", suffixes=c('_first', '_second'))

## merging with two different names as the matching columns
data1 <- data.frame(ID1=1:5, x=letters[1:5])
data2 <- data.frame(ID2=1:5, x=letters[6:10])
merge(data1, data2, by.x="ID1", by.y="ID2") # ID1 is first shown
merge(data2, data1, by.y="ID1", by.x="ID2") # ID2 is shown first
merge(data2, data1, by.x="ID2", by.y="ID1") 

## if you have repeated value in the first
data1 <- data.frame(unit=c("x","x","x","y","z","z"),Time=c(1,2,3,1,1,2))
data2 <- data.frame(unit=c("y","z","x"), height=c(3.4,5.6,1.2))

merge(data1, data2, by="unit") 
merge(data1, data2)

### the apply function is 
sample(10,4)


A = data.frame(a=LETTERS[1:10], x=1:10)
A
A[sample(nrow(A), 4),] #random 


rnorm(50)

summary(A$x)


A = data.frame(a=rnorm(10), x=1:10)
apply(A, 1, sum) #summation over the row
apply(A, 2, sum) #summation over the column

set.seed(4)
rnorm(10)
x
x[which.max(x)] # == max(x)
max(x)

A=matrix(rnorm(50), nrow = 10)
colSums(A)
rowSums(A)
max.col(A) #showing the column number which has the maximum value in each row
which.max(A) #looking at the value in the 4th colunm of the 4th row
max(A) #giving the maximum of the whole data frame


############################
file <- "http://www.sr.bham.ac.uk/~ajrs/papers/sanderson09/sanderson09_table2.txt"
a <- read.table(file, header=TRUE, sep="|")
table(a$cctype)
levels(a$cctype)
table(a$cctype, a$det)
xtabs(~ cctype + det, data=a) # meaning  based on two columns.. columns are added.. formula tab
addmargins(xtabs(~ cctype + det, data=a))
prop.table(xtabs(~ cctype + det, data=a))

aggregate(.~cctype, data=a[c('cctype', 'z', 'kT')], mean) # . means all data

#page 20 in chapter 6.. 
stname=c('john', 'marry', 'larry', 'lucy', 'david')
age=c(59,31,38, 52, 46)
gender=c('M', 'F', 'M', F, "M")
smoker=c('Y', 'N', 'Y', "N", 'Y')
tenure=c(12, 9, 7,20, 10)
income=c(50000, 70000, 39000, NA, 52000)
people= data.frame(stname, smoker, age, gender, tenure, income)
s=list(age=people$age, tenure=people$tenure)
m=aggregate(s, by=list(gender, smoker), FUN = mean, na.rm=TRUE) #the output is the list
m
m2=aggregate(list(age=people$age, tenure=people$tenure), by=list(gender, smoker), FUN = mean, na.rm=TRUE)

m[,1:3]

iris
aggregate(. ~ Species, data = iris, mean)

ToothGrowth
aggregate(len ~ ., data = ToothGrowth, mean) # . here means the rest.. equal to aggregate(len ~ supp+dose, data = ToothGrowth, mean)
aggregate(len ~ supp+dose, data = ToothGrowth, mean)

## Often followed by xtabs():.. rearranging the layout
ag <- aggregate(len ~ ., data = ToothGrowth, mean)
xtabs(len ~ ., data = ag)

#Date and time
Sys.Date()
Sys.time()

as.Date('1/15/2001',format='%m/%d/%Y') #converting string to date
as.Date('April 26, 2001',format='%B %d, %Y')
as.Date('22JUN01',format='%d%b%y')   # %y is system-specific; use with caution.. small y refers to the abreviation of the month
Sys.Date() - as.Date("1970-01-01")

