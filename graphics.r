
'''
- graphics in R
-if we change a default in one plot.. the rest is going to be effected.. to keep it as default
we need to cp it in a var and the use that one
- histogeram is only the only plot that takes only one argument
- anything inside the par can be in the plot
'''
#with() returns the frequency
name=c(3,10,10,3,6,7,8,3,6,1,2,2,6,10,2,3,3,10,4,5,9,10)
feature=paste('feature', c(1,1,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5), sep = ' ')
dat=data.frame(name, feature)
dat=with(dat, table(name, feature))

library(circlize)
chordDiagram(as.data.frame(dat), transparency=0.5)

par()

rannorm=rnorm(500)
hist(rannorm)

count = table(mtcars$gear)
barplot(count, main='car dist')

count = table(iris$Species)
barplot(count, main='car dist')

##to get the plot poping out outside and not inline
attach(mtcars)
windows() #create a windows to plot
plot(mpg,wt)

##to clearning the plots
dev.off() #any device in the r invironment.. even pdf

graphics.off() # graphs specifically

### we are running high level the plots, point will be adding plots to previous plots

# Example of labeling points..

attach(mtcars)
window()
plot(wt, mpg, main="Milage vs. Car Weight", xlab="Weight", ylab="Mileage", pch=18, col="blue")
text(wt, mpg, row.names(mtcars), cex=0.6, pos=4, col="red") 


install.packages('ggplot2') ## r studio 3.6
library(ggplot2)




