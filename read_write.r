'''
import and export the data from html can be done using R
we can read almost everything.. we can read csv, sas, matlab, statica
you can copy and paste the sql codes from sql..
you can consider read.table as the default reading structure
readquote will ignore that character as the quote
csv2 is for the data from europe because they are using , for $ 
fwf.. fixed width file.. we can give the length of each 
readline will read line by line.. if n=-1 meaning read till the end of the buffer

'''

month= month.abb #give me the month in abbreviation
avgHigh =c(38, 41, 47,56, 69, 81, 83, 82, 71, 55, 48, 43)
seasons=c('winter', 'spring', 'summer', 'fall')
season = rep(seasons[c(1:4, 1)], c(2,3,3,3,1)) #repeating 
schoolln = rep(c('yes', 'no', 'yes'), c(5,3,4))
getwd()
setwd('C:\\Users\\mfatemeh\\Desktop\\R')

d= data.frame(month, avgHigh, season, schoolln)
write.table(d,'annual.txt', quote=TRUE, sep='\t', row.names = FALSE)
rm(list = ls()) #clear 
ls()

d=read.delim('annual.txt', header=TRUE, sep = '\t')
d
###############
seasons=c('winter', 'spring', 'summer', 'fall')
season = rep(seasons[c(1:4, 1:4)], c(2,2,2,2,1,1,1,1)) #repeating .. the number of elements in vectors need to be the same

max(length(d$season)) #will give only number of elements

st=c('a', 'aa', 'aaa')
length(st)
sapply(st, nchar)

########----
x=read.fwf(file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"), skip=4, widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4)) #skipping the first 4 rows
head(x, 5)
colnames(x)=c('week', 'sst1', 'sst2', 'sst3', 'sst4', 'sst5', 'sst6', 'sst7', 'sst8')

#######---reading line
cat("data science
    my name 
    is fatime", file = 'test.txt', sep='\n')
y=readLines('test.txt', n=-1) #-1 meaning to read till the end

#######---write to the file.. in the default case we normally overwrite 
write.table(x[1:5,], file = 'test.txt', append = TRUE)
df=read.csv('test2.csv')
m_sal=max(df$salary)

######---subset 
retval=subset(df, salary==max(salary))

retvalIT =subset(df, dept=='IT')

info=subset(df, salary>600 & dept=='IT') # we need to remove the space in order to get the salary value correct

retvaldate = subset(df, as.Date(start_date) > as.Date("2014-01-01"))
print(retvaldate)

write.csv(retvaldate,"output.csv", row.names = FALSE) #do not write the index again
newdata <- read.csv("output.csv")
print(newdata)

##### 
install.packages(xlsx) ### error because it needs an updated java
library(xlsx)

read.xlsx('input.xlsx') 

###### Handling missing value
y=c(1,2,3,NA)
is.na(y)
df2=data.frame(y)

df2$y[df2$y==2]=NA

#####
read.csv('test1.csv', na.strings = ' ')
