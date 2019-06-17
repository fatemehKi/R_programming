'''
- we can access the data remotely using R and SQL
- SQL inside R is case sensitive.. meaning the data and variables needs to be case considered
'''

install.packages('sqldf')
library('sqldf')

stname=c('john', 'marry', 'larry', 'lucy', 'david')
age=c(59,31,38, 52, 46)
gender=c('M', 'M', 'M', "F", "F")
smoker=c('Y', 'N', 'Y', "N", 'Y')
tenure=c(12, 9, 7,20, 10)
income=c(50000, 70000, 39000, NA, 52000)
emp= data.frame(tenure, age, gender, smoker, stname, income)

a1=sqldf("select * from emp where gender='f' and age>38")
a1

a2=sqldf("select stname, age, tenure from emp where age>40")
a2

a3= sqldf("select smoker, count(*) as number from emp 
          group by smoker")
a3

a4 = sqldf('select stname as name, tenure/age as ratio, gender from emp')
a4

a5 = sqldf("select * from emp where substr(stname, 1,1) in ('L', 'J')")
a5

a6=sqldf('select gender, min(age) as minage, avg(age) as avgage 
         from emp 
         group by gender') 
a6

a7=sqldf('select gender, avg(age) as avgage, avg(tenure) 
         from emp 
         group by gender 
         having avgage>45')
a7

a77=sqldf('select gender, avg(age) as avgage, avg(tenure) 
         from emp 
         group by gender')
a77


a8= sqldf('select avg(income) as meanincome from emp')
a8

a9=sqldf('select avg(income) as meanincome from emp where income <>50000') ## <>means not equal
a9

a10=sqldf("select *from emp where income <> 'NA'")
a10

a11=sqldf('select avg(age) as meanincome from emp where income <> "NA"')
a11


set.seed(42)
df1=data.frame(id=1:10, class= rep(c('case', 'ctrl'),5))

df2=data.frame(id=1:10, cov=round(runif(10)*10,1))#runif(10) generates 10 number between 0,1 and round(x,1), gets one decimal

## inner join
sqldf('select * from df1 join df2 on df1.id=df2.id')
sqldf('select * from df1 join df2') #cartesian product
sqldf('select * from df1 join df2 on id') # we need to define the data frame name
sqldf('select * from df1 join df2 on df1.id=df2.id where class="case"')


sqldf('select df1.id, df2.cov as cvariate from df1 join df2 on df1.id=df2.id where class="case" and cov>3 
       order by cov')

#descending order
sqldf('select df1.id, df2.cov as cvariate from df1 join df2 on df1.id=df2.id where class="case" and cov>3 
       order by cov desc')

##two ways of getting data from data bases
library(RODBC)
myconn=odbcConnect('mydsn', uid="Rob", pwd='aardvark')
crimedat=sqlFetch(myconn, 'Crime')
pundat=sqlQuery(myconn, 'select *from Punishment')
close(myconn)


 
