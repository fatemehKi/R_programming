

install.packages('ggplot2')
library(ggplot2)
library(plotrix)

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

windows()
slices=as.vector(e$Freq) 
lbls=as.vector(e$education)
pct <- round(e$Freq/sum(e$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie3D(slices, labels= lbls_p, explode=0.1,  minsep=0.3,  main="Level of Education")
legend("topright", lbls, cex = 1.2, fill = c(rainbow(4)))


##################Q4###################################
### How many percent have loan
tab4=table(loan)
l=as.data.frame(tab4)

windows()
slices=as.vector(l$Freq) 
lbls=as.vector(l$loan)
pct <- round(l$Freq/sum(l$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie3D(slices, labels= lbls_p, explode=0.1,  minsep=0.3,  main="Has a Loan from Bank")
legend("topright", lbls, cex = 1.2, fill = c(rainbow(2)))



##################Q5###################################
### How many percent in each education have loan
tab5=table(loan, education )
le=as.data.frame(tab5)

windows()
slices=as.vector(le$Freq) 
lbls=c(le$education, le$loan)
pct <- round(le$Freq/sum(le$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie(slices, labels= lbls_p, main="Level of Education", col=c('red', 'red3','green', 'green3','cyan', 'cyan3', 'blue', 'blue3'))
legend(-2,1, legend=c('no loan-primary Ed.','yes loan-primary Ed.','no loan-secondary Ed.','yes loan-secondary Ed.','no loan-tertiary Ed.','yes loan-tertiary Ed.','no loan-unknown Ed.','yes loan-unkown Ed.'), cex = 1.2, fill = c('red', 'red3','green', 'green3',   'cyan', 'cyan3', 'blue', 'blue3'))




aggregate(.~job, MyData, sum)
