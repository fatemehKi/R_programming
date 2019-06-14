
MyData <- read.csv(file="C:\\Users\\mfatemeh\\Desktop\\R_programming-master\\project\\data set\\bank_1.csv", header=TRUE, sep=",")

###number of the missing 
sapply(MyData, function(x) sum(is.na(x)))

###Q1- what is the population age of customers that been contacted
summary(MyData$age) #some statistical information
tab1=xtabs(MyData$age)
hist(MyData$age)
qplot(age, data = MyData, geom = "histogram", fill = housing )

###Q2- the demographic information on the type of the job of the contacted customre
tab2=table(MyData$job)
