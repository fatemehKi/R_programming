## When passing a single vector, paste0 and paste work like as.character.
paste0(1:12)
paste(1:12)        # same
as.character(1:12) # same

## If you pass several vectors to paste0, they are concatenated in a
## vectorized way.
nth <- paste0(1:12, c("st", "nd", "rd", rep("th", 9)))
nth1 <- paste(1:12, c("st", "nd", "rd", rep("th", 9)))
## paste works the same, but separates each input with a space.
## Notice that the recycling rules make every input as long as the longest input.

paste(month.abb, "is the", nth, "month of the year.")
paste(month.abb, letters)

## You can change the separator by passing a sep argument
## which can be multiple characters.
paste(month.abb, "is the", nth, "month of the year.", sep = "_*_")

## To collapse the output into a single string, pass a collapse argument.
paste0(nth, collapse = ", ")

## For inputs of length 1, use the sep argument rather than collapse
paste("1st", "2nd", "3rd", collapse = ", ") # probably not what you wanted
paste("1st", "2nd", "3rd", sep = ", ")

## You can combine the sep and collapse arguments together.
paste(month.abb, nth, sep = ": ", collapse = "; ")
#-----------------------------
  cbind2(1:3, 4)
m <- matrix(3:8, 2,3, dimnames=list(c("a","b"), LETTERS[1:3]))
m
z=cbind2(1:2, m) # keeps dimnames from m
dimnames(z)=list(c("a","b"),LETTERS[1:4])
colnames(z)=list("T","H","J","K")

a <- c( 1:2)
a
cbind(a)
cbind(a, four=4, 7:9)# calling cbind2() twice

cbind(m,a, ch=c("D","E"), a*3)
cbind(1,a, m) # ok with a warning


library(rowr)
df<-data.frame(a=c(1,2,3),b=c(1,2,3))
df
cbind.fill(c(1,2,3),list(1,2,3),cbind(c('a','b')),'a',df)

cbind.fill(a=c(1,2,3),list(1,2,3),cbind(c('a','b')),'a',df,fill=NA)



mydata1 <- data.frame(index=c("A","B","C"), var1=5:7)
mydata2 <- data.frame(var1=8:10, species=c("one","two","three"))
# smartbind the dataframes together
library(plyr)
rbind.fill(mydata1, mydata2)


#-------------------------------------------------
  Merging
# Use merge() to merge two and only two dataframes
# Merge two datasets by an ID variable, where ID is the same for both datasets
data1 <- data.frame(ID=1:5, x=letters[1:5])
data2 <- data.frame(ID=1:5, y=letters[6:10])
merge(data1, data2)
# Merge two datasets by an ID variable, where ID is not the same for both datasets
data1 <- data.frame(ID=1:5, x=letters[1:5])
data2 <- data.frame(ID=4:8, y=letters[6:10])
merge(data1, data2)
merge(data1, data2, all=TRUE)
merge(data1, data2, all.x=TRUE) # Only keep the rows from the 1st argument data1
merge(data1, data2, all.y=TRUE) # Only keep the rows from the 2nd argument data2
# Merge two datasets by an ID variable, where both dataset have the same names
data1 <- data.frame(ID=1:5, x=letters[1:5])
data2 <- data.frame(ID=1:5, x=letters[6:10])
merge(data1, data2, all=TRUE) # Add rows
merge(data1, data2, by="ID") # Add columns
merge(data1, data2, by="ID", suffixes=c(1, 2))
# Merge two datasets by an ID variable, where the ID variable has a different name
data1 <- data.frame(ID1=1:5, x=letters[1:5])
data2 <- data.frame(ID2=1:5, x=letters[6:10])
merge(data1, data2, by.x="ID1", by.y="ID2")

# Two dataframes
data1 <- data.frame(unit=c("x","x","x","y","z","z"),Time=c(1,2,3,1,1,2))
data2 <- data.frame(unit=c("y","z","x"), height=c(3.4,5.6,1.2))

# Merge dataframes:
merge(data1, data2, by="unit")


# Two dataframes
data1 <- data.frame(unit=c("x","x","x","y","y","y","z","z","z"),
                    Time=c(1,2,3,1,2,3,1,2,3),
                    Weight=c(3.1,5.2,6.9,2.2,5.1,7.5,3.5,6.1,8.0))
data2 <- data.frame(unit=c("x","x","y","y","z","z"),
                    Time=c(1,2,2,3,1,3),
                    Height=c(12.1,24.4,18.0,30.8,10.4,32.9))

# Merge dataframes:
merge(data1, data2, by=c("unit","Time"))

merge(data1, data2, by=c("unit","Time"), all.x=TRUE)
#-------------------------------------------------------------
class(iris)          # "data.frame"
sapply(iris, class)  # show classes of all columns
typeof(iris)         # "list"
names(iris)          # show list components
dim(iris)            # dimensions of object, if any
head(iris)           # extract first few (default 6) parts
tail(iris, 1)        # extract last row
head(iris, -1)    # extract everything except the last element
str(iris)
iris
summary(iris)		# give min, max, mean, median, 1st & 3rd quartiles
min(iris[,]); 
max(iris)		# }
range(iris)			# } self-explanatory
mean(iris); median(iris)
apply(iris[,1:4], 2, mean)     # }
sd(iris); mad(iris)        	# standard deviation, median absolute deviation
IQR(iris)               		# interquartile range
quantile(iris)		# quartiles (by default)
quantile(iris, c(1, 3)/4)
----------------------------------------------------
  #install and load a package
  install.packages("nutshell")
library(nutshell)


# contents of the package
help(package="nutshell")

# datasets in the package
data(package="nutshell")

# load data
data(GSE2034)

summary(GSE2034)

attach(GSE2034) # so I don't have to keep referring to the name of the dataset


c <- 0:171 # create a vector
hist(months.to.relapse.or.last.followup, breaks=c)

mean(months.to.relapse.or.last.followup)

median(months.to.relapse.or.last.followup)

# looking only the time to relapse
mydata$time.to.relapse <- months.to.relapse.or.last.followup # add a column "time.to.relapse"
mydata$time.to.relapse[!mydata$relapse] <- NA

attach(mydata)

mean(time.to.relapse,na.rm=T)

mean(time.to.relapse,na.rm=T,trim=0.1) # trim the 10% percent from each end

fivenum(time.to.relapse,na.rm=T) 
# 5 number summary - min, median of lower half, median, median of upper half, max

quantile(time.to.relapse,c(0.1,0.25,0.5,0.75,0.9),na.rm=T)
quantile(time.to.relapse,c(0,0.25,0.5,0.75,1),na.rm=T)

# measures of spread

sd(time.to.relapse,na.rm=T)
var(time.to.relapse,na.rm=T)
IQR(time.to.relapse,na.rm=T) # interquartile = 75% quantile - 25% quantile




t<-table(GSE2034$ER,GSE2034$relapse)
print(t<-table(GSE2034$ER,GSE2034$relapse))

# add margins

addmargins(t)

prop.table(t) # each element normalized by the total sum

# conditional proportions
round(prop.table(t,1),2) # each element normalized by the row total
round(prop.table(t,2),2) # each element normalized by the column total

----------------------------------------------------
  which.max(iris$Sepal.Length)
iris$Sepal.Length[which.max(iris$Sepal.Length)]
which.min(iris$Sepal.Length)
iris$Sepal.Length[which.min(iris$Sepal.Length)]
-------------------------------------------------------------
  aggregate function
testDF <- data.frame(v1 = c(1,3,5,7,8,3,5,NA,4,5,7,9),
                     v2 = c(11,33,55,77,88,33,55,NA,44,55,77,99) )

by1 <- c("red", "blue", 1, 2, NA, "big", 1, 2, "red", 1, NA, 12)
by2 <- c("wet", "dry", 99, 95, NA, "damp", 95, 99, "red", 99, NA, NA)
aggregate(x = testDF, by = list(by1, by2), FUN = "mean")

# and if you want to treat NAs as a group
fby1 <- factor(by1, exclude = "")
fby2 <- factor(by2, exclude = "")
aggregate(x = testDF, by = list(fby1, fby2), FUN = "mean")

chickwts
## Formulas, one ~ one, one ~ many, many ~ one, and many ~ many:
aggregate(weight ~ feed, data = chickwts, mean)
aggregate(breaks ~ wool + tension, data = warpbreaks, mean)
aggregate(cbind(Ozone, Temp) ~ Month, data = airquality, mean)
aggregate(cbind(ncases, ncontrols) ~ alcgp + tobgp, data = esoph, sum)

## Dot notation:
iris
aggregate(. ~ Species, data = iris, mean)

ToothGrowth
aggregate(len ~ ., data = ToothGrowth, mean)

## Often followed by xtabs():
ag <- aggregate(len ~ ., data = ToothGrowth, mean)
xtabs(len ~ ., data = ag)

presidents
## Compute the average annual approval ratings for American presidents.
aggregate(presidents, nfrequency = 1, FUN = mean)
## Give the summer less weight.
aggregate(presidents, nfrequency = 1,
          FUN = weighted.mean, w = c(1, 1, 0.5, 1))
#---------------------------------------------------------------------
 
#Date and time
Sys.Date()
Sys.time()
as.Date('1/15/2001',format='%m/%d/%Y')
as.Date('April 26, 2001',format='%B %d, %Y')
as.Date('22JUN01',format='%d%b%y')   # %y is system-specific; use with caution
Sys.Date() - as.Date("1970-01-01")

bdays = c(tukey=as.Date('1915-06-16'),fisher=as.Date('1890-02-17'), 
          cramer=as.Date('1893-09-25'), kendall=as.Date('1907-09-06'))
weekdays(bdays)

#date and time
dts = c("2005-10-21 18:47:22","2005-12-24 16:39:58", "2005-10-28 07:30:05 PDT")
as.POSIXlt(dts)
dts = c(1127056501,1104295502,1129233601,1113547501, 1119826801,1132519502,1125298801,1113289201)
mydates = dts
class(mydates) = c('POSIXt','POSIXct')
mydates

