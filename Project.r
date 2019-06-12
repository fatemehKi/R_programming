
MyData <- read.csv(file="C:\\Users\\mfatemeh\\Desktop\\R_programming-master\\project\\data set\\bank_1.csv", header=TRUE, sep=",")

sapply(MyData, function(x) sum(is.na(x)))

plot(density(MyData$age))
plot(density(MyData$duration))
