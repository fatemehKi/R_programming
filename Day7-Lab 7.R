#apply
m <- matrix(c(1:10, 11:20), nrow = 10, ncol = 2)
m
apply(m, 1, mean) #row
apply(m, 2, mean) # column

BOD    #R built-in dataset, Biochemical Oxygen Demand
#Sum up for each row:
apply(BOD,1,sum)
#Sum up for each column:
apply(BOD,2,sum)
#Multipy all values by 10:
apply(BOD,1:2,function(x) 10 * x)
#Used for array, margin set to 1:
x <- array(1:9)
apply(x,1,function(x) x * 10)
#Two dimension array, margin can be 1 or 2:
x <- array(1:9,c(3,3))
x
apply(x,1,function(x) x * 10) #or apply(x,2,function(x) x * 10)

name=c('John', 'Marry', 'Kevin', 'Frank', 'Lucy') 
age=c(32,24,67,25,11) 
gender=c('M','F','M','M','F')
salary=c(30000,60000,35000,70000,28000) 
tenure=c(10,2,3,5,6) 
D1=data.frame(name, age, gender, salary, tenure) 
D2=data.frame(age, salary, tenure)
D3=cbind(age, salary, tenure)
D4=cbind(name, age, gender, salary, tenure)
class(D2)
apply( D2, 2, mean) 
class(D3)
apply( D3, 2, mean)
class(D4)
apply (D4, 2, mean)
name1=c('John', 'Marry', 'Kevin', 'Frank', 'Lucy')
name2=c('Johnn', 'Marryy', 'Kevinn', 'Frankk', 'Lucyy')
namee<-data.frame(name1,name2)
apply(namee, 1, nchar)
apply(namee, 2, nchar)
#----------------------------------------------------------------------------
#lapply
BOD    #R built-in dataset, Biochemical Oxygen Demand
#Use lapply() to sum up all rows, return is a list:
lapply(BOD,sum)
lapply(BOD,mean)
lapply(BOD,function(x) x*10)
#-------------------------------------------------------------------
#sapply
BOD    #R built-in dataset, Biochemical Oxygen Demand
#Sum up for each row:
sapply(BOD, sum)
#Multipy all values by 10:
sapply(BOD,function(x) 10 * x)
#Used for array, margin set to 1:
x <- array(1:9)
sapply(x,function(x) x * 10)
#Two dimension array, margin can be 1 or 2:
x <- array(1:9,c(3,3))
x
sapply(x,function(x) x * 10)
#----------------------------------------------------------
  Orange    #R built-in dataset, Growth of Orange Trees
#Calculate the mean circumference of different Tree groups:
tapply(Orange$circumference,Orange$Tree,mean)
#Return a list:
tapply(Orange$circumference,Orange$Tree,mean,simplify=FALSE)
#--------------------------------------------------------------------------------
  x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
# compute the list mean for each list element
x
lapply(x, mean)
# median and quartiles for each list element
lapply(x, quantile, probs = 1:3/4)
sapply(x, quantile)
i39 <- sapply(3:9, seq) # list of vectors
sapply(i39, fivenum)
vapply(i39, fivenum,c(numeric(5)) )
vapply(i39, fivenum,
       c(Min. = 0, "1st Qu." = 0, Median = 0, "3rd Qu." = 0, Max. = 0))
#---------------------------------------------------------------------
  myFun <- function(x){
    if (is.character(x)){
      return(paste(x,"!",sep=""))
    }
    else{
      return(x + 1)
    }
  }

#A nested list structure
l <- list(a = list(a1 = "Boo", b1 = 2, c1 = "Eeek"), 
          b = 3, c = "Yikes", 
          d = list(a2 = 1, b2 = list(a3 = "Hey", b3 = 5)))
#Result is named vector, coerced to character           
rapply(l,myFun)


#---------------------------------------------------
  #We will be neglecting fifth column because it is categorical
  # rowSums function in R
  rowSums(iris[,-5])

# colSums function in R
colSums(iris[,-5])

# rowMeans function in R
rowMeans(iris[,-5])
random <- c("This","is","random","vector")
sapply(random,nchar)


#-----------------------------------------
  # colMeans function in R
  colMeans(iris[,-5])
# unstack function in R
PlantGrowth
df<-PlantGrowth
unstacked_df<-unstack(df)
unstacked_df

# stack function in R
stacked_df<-stack(unstacked_df)
stacked_df
colnames(stacked_df)=c("we", "grp")
#------------------------------
  
  area = c('America' , 'Asia' , 'Europe' , 'America' , 'America')
city = c('Toronto' , 'Beijing' , 'Iondon' , 'Newyork' , 'Mexico')
spring=c(20,25,17,20,25)
summer=c(37,39,29,30,35)
fall=c(19,16,13,11,18)
winter=c(-12,0,1,-9,8)
temperature=data.frame(area, city, spring, summer, fall, winter)
temperature


temperature_v=stack(temperature)


  
  
  
  
  
  
  