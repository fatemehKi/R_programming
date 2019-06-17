
'''
- we are creating a package and objects today
- packages in microsoft is called add-in
- terminalogy of library means the directory 
- dep im the install.packages meaning dependencies
'''
new.packages() #will show all available packages 
update.packages() #updating the packages with the latest version

#views are packages that been classified by tasks.. field
install.views("Econometrics") #error because we have to install ctv
install.packages("ctv")
library('ctv')
install.views("Econometrics")


library('stats4')
library(h=stats4) #giving the help for all functions
data(package='stats4') #giving the data set for the package.. if there is any
#to get the data inside the package, e.g. we have d1 which is in stats4 we need 
#to use data(d1) to get the d1 

library('statsr')
library(h=statsr)

detach('package:stats4') #unload

library() #all loaded packages 

current.packages('Zelig') #does not work in this version

.libPaths() #giving the default directory for the library
#to change the directort
.libPaths('W:/..') #forward back slash is fine just backward back slash needs double

getOption('defaultPackages')

#require can be used to install package.. the only difference is that it does not give error .. 
#just TRUE or FALSE

x=library('ddd') #x is not found
y=require('ddd') # y is a boolean varible equas to FALSE
library('MASS')
y=require('MASS')
y

install.packages('chron') #the quotation is the must in install but in the library is optional
library(chron)
x=chron(times='14:0:0', format = c(times= "h:m:s"))

rm(list = ls())
######building R package

install.packages('roxygen2')
library(roxygen2)

library(trigoM)
trigo(20)

#python is OOP but R is not..
#class means entity.. attributes are usede in the methods

install.packages("pryr")
library(pryr)
df=data.frame(x=1:10, y=letters[1:10])
otype(df)

####creating a class
s=list(name='John', age=21, GPA=3.5)
s
class(s)

class(s)="student"
s
class(s)

#another methos.. objects are defined by their attributes.. the above method is only been used for
#one attribuet s1 nad it will over write
student=function(n,a,g){
  if (g>4 || g<0) stop('GPA must be between 0 and 4')
  value = list(name = n, age= a, GPA=g)
  class(value) = "student"
  value
}
s1=student('paul', 26, 3.7)
class(s1)
s2=student('ma', 27, 3.5)
class(s2)
s3=student('ye', 30, 3.6)
class(s3)

s1=unclass(s1)
class(s1)

pr = function(obj){
  cat(obj$name, '\n')
  cat(obj$age, 'years old\n')
  cat("GPA:", obj$GPA, '\n')
}

pr(s1)

######creating methods for the class
grade=function(obj){
  UseMethod('grade')
}

grade.student=function(obj){
  cat('Your grade is', obj$GPA, '\n')
}

grade(s3)

##### S4 OOP class
setClass('student', slots=list(name='character', age='numeric', GPA = 'numeric'))

s=new('student', name='John', age=21, GPA=3.5)

##user defined function 
setMethod('show',
          'student',
          function(object){
            cat(object@name, '\n')
            cat(object@age, 'year old \n')
            cat("GPA:", object@GPA, "\n")
          })

s=new('student', name='John', age=21, GPA=3.5)
s

##another method from the same class
setMethod('show_new',
          'student',
          function(object){
            cat(object@name, '\n')
            cat("GPA:", object@GPA, "\n")
          })
  
)
