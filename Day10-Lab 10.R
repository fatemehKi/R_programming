
getwd()
setwd("C:\\Users\\tjaber\\Desktop\\R for Data Analytics")
# Open a pdf file
my_data<-mtcars
pdf("rplot.pdf")
# 2. Create a plot
plot(x = my_data$wt, y = my_data$mpg,
     pch = 16, frame = TRUE,
     xlab = "wt", ylab = "mpg", col = "#2E9FDF")
# Close the pdf file
dev.off()


# 1. Open jpeg file
jpeg("rplot.jpg", width = 350, height = 350)
# 2. Create the plot
plot(x = my_data$wt, y = my_data$mpg,
     pch = 16, frame = FALSE,
     xlab = "wt", ylab = "mpg", col = "#2E9FDF")
# 3. Close the file
dev.off()
#------------------------
  rm(list = ls())     # clear objects
graphics.off()      # close graphics windows

#Ex1

# Set a graphical parameter within the plotting function
hist(mtcars$mpg,br=2, col.lab="blue")


# Set a graphical parameter using par()

par()              # view current settings
opar <- par()      # make a copy of current settings
par(col.lab="red") # red x and y labels
hist(mtcars$mpg)   # create a plot with these new settings
par(opar)          # restore original settings
#--------------------------------------------------------------
#  Ex2
# Type family examples - creating new mappings
par(mar=c(5,5,1,1))
plot(1:10,1:10,type="n")
windowsFonts(
  A=windowsFont("Arial Black"),
  B=windowsFont("Bookman Old Style"),
  C=windowsFont("Comic Sans MS"),
  D=windowsFont("Symbol")
)
text(3,3,"Hello World Default")
text(4,4,family="A","Hello World from Arial Black")
text(5,5,family="B","Hello World from Bookman Old Style")
text(6,6,family="C","Hello World from Comic Sans MS")
text(7,7,family="D", "Hello World from Symbol")
#--------------------------------------------------------------------
#  EX3


x=c(3,10,3,6,7,8,3,6,1,2,2,6,10,2,3,3,4,5,9,10)
y=c(1,1,2,2,7,2,2,8,3,9,3,3,3,10,4,4,7,5,5,5)

plot(x, y , type = "p",  xlim=c(0, 11), ylim=c(0, 11),
     main = "test1", sub = "test2", xlab = "Age", ylab = "level",
     col=10, pch=16, cex=3)

u<-c(1:5)
plot(x, y , type = "p",  xlim=c(0, 11), ylim=c(0, 11),     main = "test1", sub = "test2", xlab = "Age", ylab = "level", col=u,
     pch=u, cex=u)

#------------------------------------------
  # EX4

  # Generate some data
  x<-1:10; y1=x*x; y2=2*y1
plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
# Add a line
lines(x, y2, pch=18, col="blue", type="b", lty=2)
# Add a legend
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8)


#To avoid repeating the above R code, we can create a custom plot function as follow :

  makePlot<-function(){
    x<-1:10; y1=x*x; y2=2*y1
    plot(x, y1, type="b", pch=19, col="red", xlab="x", ylab="y")
    lines(x, y2, pch=18, col="blue", type="b", lty=2)
  }
#Title, text font and background color of the legend box

makePlot()
# Add a legend to the plot
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8,
       title="Line types", text.font=4, bg='lightblue')

# Remove legend border using box.lty = 0
makePlot()
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8,
       box.lty=0)
# Change the border
makePlot()
legend(1, 95, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8,
       box.lty=2, box.lwd=2, box.col="green")


makePlot()
legend("topleft", legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8)
#R legend : tutorial on how add legends to plots using R software

#----------------------------
attach(mtcars)
boxplot(mpg~cyl,
        xlab="Cylinders", ylab="Miles/(US) gallon",
        col=topo.colors(3))

legend("bottomleft", inset=.02, title="Number of Cylinders",
       c("4","6","8"), fill=topo.colors(3), horiz=TRUE, cex=0.8)



#-----------------------------
  # Generate data
  x = 0:10;
y = 0:10;

# Plot the data

# - Specify the layout parameters before any plotting
#   If you don't specify them before any plotting, the
#   results will be inconsistent and misaligned.
#
# - oma stands for 'Outer Margin Area', or the total margin space that is outside
#   of the standard plotting region (see graph)
#
# - The vector is ordered, the first value corresponding to the bottom. The entire
#   array is c(bottom, left, top, right)
#
# - All of the alternatives are:
#   - oma: Specify width of margins in number of lines
#   - omi: Specify width of margins in inches
#   - omd: Specify width of margins in 'device coordinates'
#       - Device coordinates place (0,0) in the upper left and (1,1) in the
#         lower right corner

par(oma=c(3,3,3,3))  # all sides have 3 lines of space
#par(omi=c(1,1,1,1)) # alternative, uncomment this and comment the previous line to try

# - The mar command represents the figure margins. The vector is in the same ordering of
#   the oma commands.
#
# - The default size is c(5,4,4,2) + 0.1, (equivalent to c(5.1,4.1,4.1,2.1)).
#
# - The axes tick marks will go in the first line of the left and bottom with the axis
#   label going in the second line.
#
# - The title will fit in the third line on the top of the graph.
#
# - All of the alternatives are:
#   - mar: Specify the margins of the figure in number of lines
#   - mai: Specify the margins of the figure in number of inches

par(mar=c(5,4,4,2) + 0.1)
#par(mai=c(2,1.5,1.5,.5)) # alternative, uncomment this and comment the previous line

# Plot
plot(x, y, type="n", xlab="X", ylab="Y")    # type="n" hides the points

# Place text in the plot and color everything plot-related red
text(5,5, "Plot", col="red", cex=2)
text(5,4, "text(5,5, \"Plot\", col=\"red\", cex=2)", col="red", cex=1)
box("plot", col="red")

# Place text in the margins and label the margins, all in green
mtext("Margins", side=3, line=2, cex=2, col="green")
mtext("par(mar=c(5,4,4,2) + 0.1)", side=3, line=1, cex=1, col="green")
mtext("Line 0", side=3, line=0, adj=1.0, cex=1, col="green")
mtext("Line 1", side=3, line=1, adj=1.0, cex=1, col="green")
mtext("Line 2", side=3, line=2, adj=1.0, cex=1, col="green")
mtext("Line 3", side=3, line=3, adj=1.0, cex=1, col="green")
mtext("Line 0", side=2, line=0, adj=1.0, cex=1, col="green")
mtext("Line 1", side=2, line=1, adj=1.0, cex=1, col="green")
mtext("Line 2", side=2, line=2, adj=1.0, cex=1, col="green")
mtext("Line 3", side=2, line=3, adj=1.0, cex=1, col="green")
box("figure", col="green")

# Label the outer margin area and color it blue
# Note the 'outer=TRUE' command moves us from the figure margins to the outer
# margins.
mtext("Outer Margin Area", side=1, line=1, cex=2, col="blue", outer=TRUE)
mtext("par(oma=c(3,3,3,3))", side=1, line=2, cex=1, col="blue", outer=TRUE)
mtext("Line 0", side=1, line=0, adj=0.0, cex=1, col="blue", outer=TRUE)
mtext("Line 1", side=1, line=1, adj=0.0, cex=1, col="blue", outer=TRUE)
mtext("Line 2", side=1, line=2, adj=0.0, cex=1, col="blue", outer=TRUE)
box("outer", col="blue")

#----------------------------------------------


  x <- c(1.2,3.4,1.3,-2.1,5.6,2.3,3.2,2.4,2.1,1.8,1.7,2.2)
y <- c(2.4,5.7,2.0,-3,13,5,6.2,4.8,4.2,3.5,3.7,5.2)
plot(x,y)

x <- c(-2,-0.3,1.4,2.4,4.5)
y <- c(5,-0.5,8,2,11)
par(mar = c(5, 1, 1, 1))
plot(x,y,type="l",col="blue",xlab="Advertise Change",
     ylab="Revenue Change", main="Financial Analysis")

#Add more data to the plot:
abline(v=0,col="red") #add a vertical line at x=0
points(c(1,4),c(9,2),pch=3,col="tan2") #add two points
x2 <- c(-1.5,1,4)
y2 <- c(3,2,8)
lines(x2,y2,col="darkolivegreen3")  #add aother group of data
legend(x=-2.2,y=11,c("advertise","sale"),cex=.8,
       col=c("blue","darkolivegreen3"),lty=c(1,1)) #add legend


# move the legend out of the main plot area, we need some more work.
x <- c(-2,-0.3,1.4,2.4,4.5)
y <- c(5,-0.5,8,2,11)
layout(matrix(c(1,2), nrow = 1), widths = c(0.6, 0.4))
par(mar = c(5, 4, 2, 1))
plot(x,y,type="b",col="blue",xlab="Advertise Change",
     ylab="Revenue Change", main="Financial Analysis")
abline(v=0,col="red") #add a vertical line at x=0
points(c(1,4),c(9,2),pch=3,col="tan2") #add two points
x2 <- c(-1.5,1,4)
y2 <- c(3,2,8)
lines(x2,y2,col="darkolivegreen3")
par(mar = c(5, 0, 2, 1))
plot(x,y,col="white",axes=FALSE,ann=FALSE)
legend(x=-2.2,y=11,c("advertise","sale"),cex=.8,
       col=c("blue","darkolivegreen3"),lty=c(1,1))

require(stats)
# for lowess, rpois, rnorm

plot(cars)

lines(lowess(cars))


plot(sin, -pi, 2*pi)
# Discrete Distribution Plot:

plot(table(rpois(100, 5)), type = "h", col = "red", lwd = 10,
     main = "rpois(100, lambda = 5)")


plot(x <- sort(rnorm(47)), type = "s", main = "plot(x, type = \"s\")")

points(x, cex = .5, col = "dark red")

#------------------------------------------------------
  Hist()
rannorm <- rnorm(500)
hist(rannorm)

hist(rannorm,br=14,col="blue",xlab="Expression",ylab="Frequency",
     freq=TRUE,main="Histogram of Expression")

hist(rannorm,br=14,col="blue",xlab="Expression",ylab="Density",freq=FALSE,
     main="Histogram of Expression")
lines(density(rannorm),col="red")


op <- par(mfrow = c(2, 2))
hist(islands)
(hist(islands, col = "gray", labels = TRUE))

hist(sqrt(islands), breaks = 12, col = "lightblue", border = "pink")
##-- For non-equidistant breaks, counts should NOT be graphed unscaled:
r <- hist(sqrt(islands), breaks = c(4*0:5, 10*3:5, 70, 100, 140),
          col = "blue1")
text(r$mids, r$density, r$counts, adj = c(.5, -.5), col = "blue3")
sapply(r[2:3], sum)
sum(r$density * diff(r$breaks)) # == 1
lines(r, lty = 3, border = "purple") # -> lines.histogram(*)
par(op)

require(utils) # for str
str(hist(islands, breaks = 12, plot =  FALSE)) #-> 10 (~= 12) breaks
str(hist(islands, breaks = c(12,20,36,80,200,1000,17000), plot = FALSE))

hist(islands, breaks = c(12,20,36,80,200,1000,17000), freq = TRUE,
     main = "WRONG histogram") # and warning

require(stats)
set.seed(14)
x <- rchisq(100, df = 4)

hist(x, freq = FALSE, ylim = c(0, 0.2))
curve(dchisq(x, df = 4), col = 2, lty = 2, lwd = 2, add = TRUE)
#----------------------------

  # Kernel Density Plot
  d <- density(mtcars$mpg) # returns the density data
plot(d) # plots the results

# Filled Density Plot
d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")
#--------------------------
  curve()
# Plot a 5th order polynomial
curve(3*x^5-5*x^3+2*x, from=-1.25, to=1.25, lwd=2, col="blue")
# Plot the gamma density
curve(dgamma(x, shape=2, scale=1), from=0, to=7, lwd=2, col="red")
# Plot multiple curves, notice that the first curve determines the x-axis
curve(dnorm, from=-3, to=5, lwd=2, col="red")
curve(dnorm(x, mean=2), lwd=2, col="blue", add=TRUE)
# Add vertical lines at the means
lines(c(0, 0), c(0, dnorm(0)), lty=2, col="red")
lines(c(2, 2), c(0, dnorm(2, mean=2)), lty=2, col="blue")
plot(qnorm) # default range c(0, 1) is appropriate here,
# but end values are -/+Inf and so are omitted.
plot(qlogis, main = "The Inverse Logit : qlogis()")
abline(h = 0, v = 0:2/2, lty = 3, col = "gray")
curve(sin, add = TRUE)
curve(sin, -2*pi, 2*pi, xname = "t")
curve(tan, xname = "t", add = NA,
      main = "curve(tan)  --> same x-scale as previous plot")

op <- par(mfrow = c(2, 2))
curve(x^3 - 3*x, 0, 1)
curve(x^2 - 2, add = TRUE, col = "violet")

## simple and advanced versions, quite similar:
plot(cos, -pi,  3*pi)
curve(cos, xlim = c(-pi, 3*pi), n = 1001, col = "blue", add = TRUE)

chippy <- function(x) sin(cos(x)*exp(-x/2))
curve(chippy, -8, 7, n = 2001)
plot (chippy, -8, -5)

for(ll in c("", "x", "y", "xy"))
  curve(log(1+x), 1, 100, log = ll, sub = paste0("log = '", ll, "'"))
par(op)
#-----------------------------------------------------------------------------------

  # Simple Pie Chart
  slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie(slices, labels = lbls, main="Pie Chart of Countries")

# Pie Chart with Percentages
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Countries")


# 3D Exploded Pie Chart
par(mar=c(1,1,1,1))

library(plotrix)
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries ")
#-------------------------------------------------------
  # Simple Bar Plot
  counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution",
        xlab="Number of Gears")

# Simple Horizontal Bar Plot with Added Labels
counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution", horiz=TRUE,
        names.arg=c("3 Gears", "4 Gears", "5 Gears"))


# Stacked Bar Plot with Colors and Legend
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts))

# Grouped Bar Plot
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and VS",
        xlab="Number of Gears", col=c("darkblue","red"),
        legend = rownames(counts), beside=TRUE)
#-----------------------------------
  # Boxplot of MPG by Car Cylinders
  boxplot(mpg~cyl,data=mtcars, main="Car Milage Data",
          xlab="Number of Cylinders", ylab="Miles Per Gallon")


# Notched Boxplot of Tooth Growth Against 2 Crossed Factors
# boxes colored for ease of interpretation
boxplot(len~supp*dose, data=ToothGrowth, notch=TRUE,
        col=(c("gold","darkgreen")),
        main="Tooth Growth", xlab="Suppliment and Dose")



# Violin Plots
library(vioplot)
x1 <- mtcars$mpg[mtcars$cyl==4]
x2 <- mtcars$mpg[mtcars$cyl==6]
x3 <- mtcars$mpg[mtcars$cyl==8]
vioplot(x1, x2, x3, names=c("4 cyl", "6 cyl", "8 cyl"), col="gold")
title("Violin Plots of Miles Per Gallon")


# Example of a Bagplot
library(aplpack)
attach(mtcars)
bagplot(wt,mpg, xlab="Car Weight", ylab="Miles Per Gallon",
        main="Bagplot Example")
---------------------------------------------

  x <- c(1.2,3.4,1.3,-2.1,5.6,2.3,3.2,2.4,2.1,1.8,1.7,2.2)
y <- c(2.4,5.7,2.0,-3,13,5,6.2,4.8,4.2,3.5,3.7,5.2)
plot(x,y,cex=.8,pch=1,xlab="x",ylab="y",col="black")

#Add some points to the plot:
x2 <- c(4.1,1.1,-2.3,-0.2,-1.2,2.3)
y2 <- c(2.3,4.2,1.2,2.1,-2,4.3)
points(x2,y2,cex=.8,pch=3,col="blue")

# points of filled diamond shape, large size, and red color
x3 <- c(0,4)
y3 <- c(10,-0.5)
points(x3,y3,cex=4,pch=18,col="red")
-------------------------------------------------
#First let's make a plot:
x <- c(1.2,3.4,1.3,-2.1,5.6,2.3,3.2,2.4,2.1,1.8,1.7,2.2)
y <- c(2.4,5.7,2.0,-3,13,5,6.2,4.8,4.2,3.5,3.7,5.2)
plot(x,y,cex=.8,pch=1,xlab="x",ylab="y",col="black")
x2 <- c(4.1,1.1,-2.3,-0.2,-1.2,2.3)
y2 <- c(2.3,4.2,1.2,2.1,-2,4.3)
points(x2,y2,cex=.8,pch=3,col="blue")

#add a red horizontal line at y=4 to the plot:
abline(h=4,col="red")

# add a green vertical line at x=0 to the plot:
abline(v=0,col="green")

#add a blue line with intercept 2 and slope 2 to the plot:
abline(a=2,b=2,col="blue")
-------------------------------------------------
# Example of labeling points
attach(mtcars)
plot(wt, mpg, main="Milage vs. Car Weight", xlab="Weight", ylab="Mileage", pch=18, col="blue")
text(wt, mpg, row.names(mtcars), cex=0.6, pos=4, col="red")


# specify the data
x <- c(1:10); y <- x; z <- 10/x

# create extra margin room on the right for an axis
par(mar=c(5, 4, 4, 8) + 0.1)

# plot x vs. y
plot(x, y,type="b", pch=21, col="red",
yaxt="n", lty=3, xlab="", ylab="")

# add x vs. 1/x
lines(x, z, type="b", pch=22, col="blue", lty=2)

# draw an axis on the left
axis(2, at=x,labels=x, col.axis="red", las=2)

# draw an axis on the right, with smaller text and ticks
axis(4, at=z,labels=round(z,digits=2),
col.axis="blue", las=2, cex.axis=0.7, tck=-.01)

# add a title for the right axis
mtext("y=1/x", side=4, line=3, cex.lab=1,las=2, col="blue")

# add a main title and bottom and left axis labels
title("An Example of Creative Axes", xlab="X values",
ylab="Y=X")
---------------------------------------------------------------------------------

# 4 figures arranged in 2 rows and 2 columns
attach(mtcars)
par(mfrow=c(2,2))
plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")

# 3 figures arranged in 3 rows and 1 column
attach(mtcars)
par(mfrow=c(3,1))
hist(wt)
hist(mpg)
hist(disp)

# One figure in row 1 and two figures in row 2
attach(mtcars)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE))
hist(wt)
hist(mpg)
hist(disp)

par("mar")
par(mar=c(3,3,3,3))
# One figure in row 1 and two figures in row 2
# row 1 is 1/3 the height of row 2
# column 2 is 1/4 the width of the column 1
attach(mtcars)
layout(matrix(c(1,1,2,3), 2, 2, byrow = TRUE),
widths=c(3,1), heights=c(1,2))
hist(wt)
hist(mpg)
hist(disp)
#-----------------------------------------------------------------
pairs(iris[,1:4], pch = 19)


#Show only upper panel:
pairs(iris[,1:4], pch = 19, lower.panel = NULL)

#Color points by groups (species)
my_cols <- c("#00AFBB", "#E7B800", "#FC4E07")
pairs(iris[,1:4], pch = 19,  cex = 0.5,
col = my_cols[iris$Species],
lower.panel=NULL)



# Correlation panel
panel.cor <- function(x, y){
usr <- par("usr"); on.exit(par(usr))
par(usr = c(0, 1, 0, 1))
r <- round(cor(x, y), digits=2)
txt <- paste0("R = ", r)
cex.cor <- 0.8/strwidth(txt)
text(0.5, 0.5, txt, cex = cex.cor * r)
}

# Customize upper panel
upper.panel<-function(x, y){
points(x,y, pch = 19, col = my_cols[iris$Species])
}
# Create the plots
pairs(iris[,1:4], lower.panel = panel.cor, upper.panel = upper.panel)


Add correlations on the scatter plots:
# Customize upper panel
upper.panel<-function(x, y){
points(x,y, pch=19, col=c("red", "green3", "blue")[iris$Species])
r <- round(cor(x, y), digits=2)
txt <- paste0("R = ", r)
usr <- par("usr"); on.exit(par(usr))
par(usr = c(0, 1, 0, 1))
text(0.5, 0.9, txt)
}
pairs(iris[,1:4], lower.panel = NULL,
upper.panel = upper.panel)
--------------------------------------------------



