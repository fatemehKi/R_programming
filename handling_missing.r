'''
- handling missing data 
- sort(x) == sort(x, na.last=NA)
'''

x=c(1,2,NA,3)
is.na(x)
complete.cases(x)# if there is a missing value it will give you a FALSE.. opposite to the is.na function.. in the dataframe it checks the row

df=data.frame(a=c(1,2,3), b=c(1,2,3))
df
is.na(df) #it shows false for every element.. same size of the input
complete.cases(df) #three element in the output, one for each row

#for the columns, we need to use is.na

df2=data.frame(a=c(1,2,NA), b=c(1,2,3))
df2
is.na(df2) #it shows false for every element.. same size of the input df
complete.cases(df2) #checks rowby row

## removing the rows with the missing value
df2[complete.cases(df2),]
df2[!complete.cases(df2),]

## removing the missing.. element and the row.. it doesn't inplace 
na.omit(x)
na.omit(df2) #removing the whole row
na.exclude(x)
na.exclude(df2) #removing the whole row

###sort function with the NA value.. the default approach is just ignoring the NA
x=c(11, 3, 55, 7, 13, 23)
length(x)
length(x)=7
x
sort(x) #the default approach is just ignoring the NA and is not in the sorted vector
sort(x,na.last = TRUE) #na.last itself makes NA visible at the output.. now we decide either at the end
sort(x,na.last = FALSE) #or at the beggining
sort(x, na.last=NA)
## sort(x) == sort(x, na.last=NA)

######## sorting in the 
g= data.frame(a=c(1,5,7,NA), b=c(5,NA, 65,8))
na.fail(g) #if there is a missing value it will give you error message
na.pass(g) 

#---------------------------------------------
# sorting examples using the mtcars dataset
attach(mtcars)
head(mtcars)
# sort by mpg.. the whole row is sorted based on the mpg
newdata = mtcars[order(mpg),] #order function inside the slice will give us the sorted 
head(newdata)
# sort by mpg and cyl
newdata = mtcars[order(mpg, cyl),] #the order is important here.. if there are some rows sharing the same value for the mpg, we look at cyl
dim(newdata)
#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mpg, -cyl),]  #cyl in the decreasing order.. if we want both in the decreasing order we use -mpg and
head(newdata)
detach(mtcars)

rank(mpg)


x=c(10,7,11,8)
sort(x)
rank(x) #it assigns a rank to show the ranking orders from 1, 2, 3
order(x) #we rarely use it.. it is mixing sort and rank at the same time.. showing the index of the smallest to the highest 

#order in the data frame is acually sorting in the vector, matrix, array.. we order the column
order(mtcars)

rank(c(1,'a', TRUE)) #in the character ranking we start with number and then small char and then capital chars
sort(c(1,'a', TRUE))
sort(c(1, 'a', '2rr')) 
