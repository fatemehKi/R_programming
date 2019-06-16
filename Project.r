

install.packages('ggplot2')
library(ggplot2)
library(plotrix)
library(plyr)
library(plotly)
library(dplyr)

##############Loading Data############################
MyData = read.csv(file="D:\\Metro College\\R\\Project\\bank.csv", header=TRUE, sep=",")
attach(MyData)

############Finding Number of the missing############## 
sapply(MyData, function(x) sum(is.na(x)))

##################Q1###################################
#### What is the "age" population (density) of the customers that been contacted
summary(age) 
Ages=table(age) #FI

##plotting the result
windows()
ggplot(MyData, aes(x=age))+geom_histogram(aes(y=..density..), colour='red', fill='red')+geom_density(alpha=0.2,fill='black')+theme(axis.text = element_text(size = 25))+ theme(axis.title = element_text(size = 30))

##################Q2###################################
### What are the "type of the job" of the contacted customres and the population of each
Jobs=table(job)
#Jobs=sort(Jobs, decreasing = TRUE)
j=as.data.frame(Jobs)
colnames(j)=c('Type_of_the_Job', 'Population')
detach(MyData)
attach(j)
windows()
p=ggplot(j, aes(x=Type_of_the_Job, y=Population))+geom_bar(stat = 'identity', color='blue', fill='blue')+coord_flip()
p=p + theme(axis.text = element_text(size = 25)) # changes axis labels
p + theme(axis.title = element_text(size = 30)) # change axis titles
detach(j)

##################Q3###################################
### What are the level of education of the contacted customres and the population of each
attach(MyData)
Education=table(education)
e=as.data.frame(Education)

windows()
slices=as.vector(e$Freq) 
lbls=as.vector(e$education)
pct <- round(e$Freq/sum(e$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie3D(slices, labels= lbls_p, explode=0.1,  minsep=0.3,  main="Level of Education")
legend("topright", lbls, cex = 1.4, fill = c(rainbow(4)))

##################Q4###################################
### How many percent have loan
tab4=table(loan)
l=as.data.frame(tab4)

windows()
slices=as.vector(l$Freq) 
lbls=as.vector(l$loan)
pct <- round(l$Freq/sum(l$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie3D(slices, labels= lbls_p, explode=0.1,  minsep=0.3,  main="Has a Loan from Bank")+legend("topright", lbls, cex = 1.4, fill = c(rainbow(2)))

##################Q5###################################
### How many percent in each type of the job have loan
tab5=table(loan,  job)
lj=as.data.frame(tab5)


lj2=group_by(lj, job) %>% mutate(percent = (Freq*100)/sum(Freq))
as.data.frame(lj2)
ma=max(lj2$percent[which(lj2$Var1=='yes')])
lj2[which(lj2$percent==ma),]
mi=min(lj2$percent[which(lj2$Var1=='yes')])
lj2[which(lj2$percent==mi),]


windows()
plot_ly(lj, type = "bar", orientation = "h", name = ~lj$loan, x = ~lj$Freq,  y = ~lj$job) %>%
layout(lj, barmode = "relative", xaxis = list(title = "Population"), yaxis = list(title = "Type of the Job" ))

##################Q6###################################
### How many percent in each education have loan
tab6=table(loan, education )
le=as.data.frame(tab5)

windows()
slices=as.vector(le$Freq) 
lbls=c(le$education, le$loan)
pct <- round(le$Freq/sum(le$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie(slices, labels= lbls_p, main="Level of Education", col=c('red', 'red3','green', 'green3','cyan', 'cyan3', 'blue', 'blue3'))
legend(-2,1, legend=c('no loan-primary Ed.','yes loan-primary Ed.','no loan-secondary Ed.','yes loan-secondary Ed.','no loan-tertiary Ed.','yes loan-tertiary Ed.','no loan-unknown Ed.','yes loan-unkown Ed.'), cex = 1.2, fill = c('red', 'red3','green', 'green3',   'cyan', 'cyan3', 'blue', 'blue3'))

##################Q7###################################
### How many percent have house
tab7=table(housing)
h=as.data.frame(tab7)

windows()
slices=as.vector(h$Freq) 
lbls=as.vector(h$housing)
pct <- round(h$Freq/sum(h$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie3D(slices, labels= lbls_p, explode=0.1,  minsep=0.3,  main="Owning a House")+legend("topright", lbls, cex = 1.4, fill = c(rainbow(2)))

##################Q8###################################
### How many percent in each type of the job has house
tab8=table(housing,  job)
hj=as.data.frame(tab8)

hj2=group_by(hj, job) %>% mutate(percent = (Freq*100)/sum(Freq))
as.data.frame(hj2)
ma=max(hj2$percent[which(hj2$housing=='yes')])
hj2[which(hj2$percent==ma),]
mi=min(hj2$percent[which(hj2$housing=='yes')])
hj2[which(hj2$percent==mi),]


windows()
plot_ly(hj, type = "bar", orientation = "h", name = ~hj$housing, x = ~hj$Freq,  y = ~hj$job, color=~housing) %>%
  layout(hj, barmode = "relative", xaxis = list(title = "Population"), yaxis = list(title = "Type of the Job" ), color=c('red', 'green'))

##################Q9###################################
### How many percent in each education have house
tab9=table(housing, education )
he=as.data.frame(tab9)

slices=as.vector(he$Freq) 
lbls=c(he$education, he$loan)
pct <- round(he$Freq/sum(he$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

windows()
pie(slices, labels= lbls_p, main="Level of Education", col=c('red', 'red3','green', 'green3','cyan', 'cyan3', 'blue', 'blue3'))
legend(1,1, legend=c('no housing-primary Ed.','yes housing-primary Ed.','no housing-secondary Ed.','yes housing-secondary Ed.','no housing-tertiary Ed.','yes housing-tertiary Ed.','no housing-unknown Ed.','yes housing-unkown Ed.'), cex = 1.2, fill = c('red', 'red3','green', 'green3',   'cyan', 'cyan3', 'blue', 'blue3'))


################Q10###################################
###the population of the contacts among different campagin
attach(MyData)
summary(campaign)
tab7=table(campaign)
cam=as.data.frame(tab7)
Campaign_Number=cam$campaign
Number_of_Contact=cam$Freq
windows()
qplot( Campaign_Number, Number_of_Contact, size=1)+theme(axis.text = element_text(size = 10))+ theme(axis.title = element_text(size = 30))
      

################Q11###################################
###the population of the contacts duration among different education
attach(MyData)
dev.off()
windows()
ggplot(MyData, aes(x=job, y=duration) )+geom_boxplot(fill='#56B4E9', color='blue')+coord_flip()+ylim(10,800)+theme(axis.text = element_text(size = 25))+theme(axis.title = element_text(size = 30))

################Q12###################################
###the population of the contacts duration among different education
attach(MyData)
windows()
ggplot(MyData, aes(x=education, y=duration) )+geom_boxplot(fill='green2', color='green4')+coord_flip()+ylim(10,800)+theme(axis.text = element_text(size = 25))+theme(axis.title = element_text(size = 30))


################Q13###################################
###the population of the marital status
tab13=table(marital)
m=as.data.frame(tab13)

windows()
slices=as.vector(m$Freq) 
lbls=as.vector(m$marital)
pct <- round(m$Freq/sum(m$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie3D(slices, labels= lbls_p, explode=0.1,  minsep=0.3,  main="Marital Status")+legend("topright", lbls, cex = 1.4, fill = c(rainbow(3)))

################Q14###################################
###the population of the contacts duration among different marital status
attach(MyData)
windows()
ggplot(MyData, aes(x=marital, y=duration) )+geom_boxplot(fill='red', color='red4')+coord_flip()+ylim(10,800)+theme(axis.text = element_text(size = 25))+theme(axis.title = element_text(size = 30))

##################Q15###################################
#### What is the "balance" population (density) of the customers that been contacted
summary(balance) 
Balance=table(balance) #FI

##plotting the result
windows()
ggplot(MyData, aes(x=balance))+geom_histogram(aes(y=..density..), colour='red', fill='red')+geom_density(alpha=0.2,fill='black')

##################Q16###################################
#### What is the "month" population that the customers been contacted
tab16=table(MyData$month)
mo=data.frame(tab16)
colnames(mo)=c('Month', 'Population')
attach(mo)
windows()
ggplot(data=mo, aes(x=Month, y=Population))+geom_bar(stat = 'identity', fill='green2')+theme(axis.text = element_text(size = 25))+ theme(axis.title = element_text(size = 30))



##################Q17###################################
#### What is the duration of call population (density) of the customers 
summary(duration) 

##plotting the result
windows()
ggplot(MyData, aes(x=duration))+geom_histogram(aes(y=..density..), colour='red', fill='red')+geom_density(alpha=0.2,fill='black')+theme(axis.text = element_text(size = 25))+ theme(axis.title = element_text(size = 30))+xlim(0,1500)



################################################################output relations#########################
MyData$Output=ifelse(MyData$y=='yes', 1, 0)

########################################################
###Heatmap
job_=as.numeric(as.factor(MyData$job))
marital_=as.numeric(as.factor(MyData$marital))
education_=as.numeric(as.factor(MyData$education))
housing_=as.numeric(as.factor(MyData$housing))
loan_=as.numeric(as.factor(MyData$loan))
month_=as.numeric(as.factor(MyData$month))



df=data.frame(MyData[, c('age',  'balance', 'duration', 'Output')], job_, marital_, education_, housing_, loan_, month_)
ds=head(df, n=1000)
ds=as.matrix(ds)
windows()
heatmap(ds)


##################Q16###################################
### population of the accepted offer
tab17=table(y)
o=as.data.frame(tab17)

windows()
slices=as.vector(O$Freq) 
lbls=as.vector(o$y)
pct <- round(oj$Freq/sum(o$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels

pie3D(slices, labels= lbls_p, explode=0.1,  minsep=0.3,  main="Accepting the Offer")+legend("topright", lbls, cex = 1.2, fill = c(rainbow(2)))

##################Q17###################################
### the relationship between the output and age
windows()
qplot(age, Output, data=MyData, colour='red')+theme(axis.text=element_text(size=12), axis.title=element_text(size=20))
chi_data_age=data.frame(MyData$age,MyData$Output)
chisq.test(chi_data_age) ##X-squared = 42497, df = 45210, p-value = 1

##################Q18###################################
### How many percent in each type of the job has accepted the offer
tab18=table(y,  job)
oj=as.data.frame(tab18)

oj2=group_by(oj, job) %>% mutate(percent = (Freq*100)/sum(Freq))
as.data.frame(oj2)
ma=max(oj2$percent[which(oj2$y=='yes')])
oj2[which(oj2$percent==ma),]
mi=min(oj2$percent[which(oj2$y=='yes')])
oj2[which(oj2$percent==mi),]

windows()
plot_ly(oj, type = "bar", orientation = "h", name = ~oj$y, x = ~oj$Freq,  y = ~oj$job) %>%
  layout(hj, barmode = "relative", xaxis = list(title = "Population"), yaxis = list(title = "Type of the Job" ))

#cor.test(job, y, method=c("pearson"))

##################Q19###################################
### How many percent in each education have accepted offer
tab19=table(y, education)
oe=as.data.frame(tab19)

slices=as.vector(oe$Freq) 
lbls=c(oe$education, oe$loan)
pct <- round(oe$Freq/sum(oe$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels


oe2=group_by(oe, education) %>% mutate(percent = (Freq*100)/sum(Freq))
as.data.frame(oe2)
ma=max(oe2$percent[which(oe2$y=='yes')])
oe2[which(oe2$percent==ma),]
mi=min(oe2$percent[which(oe2$y=='yes')])
oe2[which(oe2$percent==mi),]

windows()
pie(slices, labels= lbls_p, main="Level of Education", col=c('red', 'red3','green', 'green3','cyan', 'cyan3', 'blue', 'blue3'))
legend(1,1, legend=c('not accepted-primary Ed.','accepted-primary Ed.','not accepted-secondary Ed.','accepted-secondary Ed.','not accepted-tertiary Ed.','accepted-tertiary Ed.','not accepted-unknown Ed.','accepted-unkown Ed.'), cex = 1.2, fill = c('red', 'red3','green', 'green3',   'cyan', 'cyan3', 'blue', 'blue3'))

##################Q20###################################
### How many percent in each education have accepted offer
tab20=table(y, education)
oe=as.data.frame(tab19)

slices=as.vector(oe$Freq) 
lbls=c(oe$education, oe$loan)
pct <- round(oe$Freq/sum(oe$Freq)*100)
lbls_p <- paste(pct,"%",sep="") # ad % to labels


oe2=group_by(oe, education) %>% mutate(percent = (Freq*100)/sum(Freq))
as.data.frame(oe2)
ma=max(oe2$percent[which(oe2$y=='yes')])
oe2[which(oe2$percent==ma),]
mi=min(oe2$percent[which(oe2$y=='yes')])
oe2[which(oe2$percent==mi),]

windows()
pie(slices, labels= lbls_p, main="Level of Education", col=c('red', 'red3','green', 'green3','cyan', 'cyan3', 'blue', 'blue3'))
legend(1,1, legend=c('not accepted-primary Ed.','accepted-primary Ed.','not accepted-secondary Ed.','accepted-secondary Ed.','not accepted-tertiary Ed.','accepted-tertiary Ed.','not accepted-unknown Ed.','accepted-unkown Ed.'), cex = 1.2, fill = c('red', 'red3','green', 'green3',   'cyan', 'cyan3', 'blue', 'blue3'))


##################Q21###################################
### relationship between the duration of time and offer acceptance
windows()
qplot(duration, Output, data=MyData, colour='blue')+theme(axis.text=element_text(size=12), axis.title=element_text(size=20))+xlim(10,100)
chi_data_duration=data.frame(MyData$duration,MyData$Output)
chisq.test(chi_data_duration) ##t = 91.289, df = 45209, p-value < 2.2e-16
cor.test(duration, MyData$Output, method=c("pearson"))







#aggregate(duration~job, MyData, FUN = sum)
aggregate(.~job, MyData, sum)
