'''
- data frame is a colection of vectors.. in python it is series 
- vector name by defult is used as the column names...
- we also can give the name that we are looking for 
- by default any character type will be converted to factor 
- 
'''
###first method of creatuon
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
str(x) #statistical data of x

x=data.frame('SN'=1:2, 'age'=c(21,15), 'name'=c('john', 'dora'), stringsAsFactors = FALSE)
str(x)


