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
