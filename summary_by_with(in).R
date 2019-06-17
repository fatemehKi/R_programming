'''
- with vs within : in with, we get the new calculation resulting from expression but we doing get the modified object.. but within
we get the .. within does not change the original df 

'''

df=data.frame(a=1:5, b=2:6)
df

with(df, {c=a+b;df;}) # ; menas another statment inside the expression.. no change with previous
with(df, {c=a+b}) # nothing in the outpu
with(df, c<-a+b) #no error.. 
with(df, c=a+b) #error

with(df, {c=a+b; print(c);}) #with fuction needs manually adding the change.. below
df$c = with(df,{c=a+b})

within(df, {c=a+b}) #within will automatically showing the modified object(df)
df #the original df doesn't change.

#####by().. like a grouping
stname=c('john', 'marry', 'larry', 'lucy', 'david')
age=c(59,31,38, 52, 46)
gender=c('M', 'M', 'M', "F", "F")
smoker=c('Y', 'N', 'Y', "N", 'Y')
tenure=c(12, 9, 7,20, 10)
income=c(50000, 70000, 39000, NA, 52000)
emp= data.frame(tenure, age, gender, smoker, stname)

z= by(emp[, 1:2], emp[, 3:4], summary)
z
#we are calculating the statistical data of [1:2] based on grouping in 3 and 4
z_1= by(emp[,1:2], emp[,3:5], summary)

##user defined function
avgvec=function(x) {apply(x,2,mean)}
z1=by(emp[,1:2], emp[,3:4], avgvec)
z1

avglist=function(x) {sapply (x, mean, simplify=T, na.rm=TRUE)}
z2=by(emp[,1:2], emp[,3:4], avglist)
z2

avglist=function(x) {sapply (x, mean, simplify=F, na.rm=TRUE)} ## in this case we have the result in the list format
z3=by(emp[,1:2], emp[,3:4], avglist)
z3

##summaryby() which does exist in doby package.. error.. it is similar to by except it can be used in multiple function
## doing functions in FUN on the columns Cups per week on the columns gender and education
library(doby)
a=summaryBy(Cups_Per_week ~ Gender+Education, data=coffee, FUN=c(length, mean, sd))

summaryBy(mpg+wt~cyl+vs, data=mtcars, FUN=function(x){c(m=mean(x), s=sd(x))})
