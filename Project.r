

install.packages('ggplot2')
library(ggplot2)

##############Loading Data############################
MyData = read.csv(file="D:\\Metro College\\R\\Project\\bank.csv", header=TRUE, sep=",")
attach(MyData)

############Finding Number of the missing############## 
sapply(MyData, function(x) sum(is.na(x)))

##################Q1###################################
#### What is the age population (density) of the customers that been contacted
summary(age) 
Ages=table(age) #FI

##plotting the result
windows()
ggplot(MyData, aes(x=age))+geom_histogram(aes(y=..density..), colour='red', fill='red')+geom_density(alpha=0.2,fill='black')

##################Q2###################################
### What are the type of the job of the contacted customres and the population of each
Jobs=table(job)
Jobs=sort(Jobs, decreasing = TRUE)
j=as.data.frame(Jobs)
colnames(j)=c('Type_of_the_Job', 'Population')
detach(MyData)
attach(j)
windows()
p=ggplot(j, aes(x=Type_of_the_Job, y=Population))+geom_bar(stat = 'identity', color='blue', fill='blue')+coord_flip()
p=p + theme(axis.text = element_text(size = 18)) # changes axis labels
p + theme(axis.title = element_text(size = 20)) # change axis titles
detach(j)

##################Q3###################################
### What are the type of the job of the contacted customres and the population of each
attach(MyData)
Education=table(education)
e=as.data.frame(Education)
library(plotrix)
windows()
slices=as.vector(e$Freq) 

lbls=as.vector(e$education)
pct <- round(e$Freq/sum(e$Freq)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels

#

pie3D(slices, labels=lbls,explode=0.1, main="Level of Education")



aggregate(.~job, MyData, sum)
