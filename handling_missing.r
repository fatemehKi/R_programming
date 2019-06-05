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
