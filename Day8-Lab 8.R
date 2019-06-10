BOD
with(BOD,{BOD$demand <- BOD$demand + 1; print(BOD$demand)})
within(BOD,{demand <- demand + 1})

mtcars
with(mtcars, mpg[cyl == 8  &  disp > 350])
# is the same as, but nicer than
mtcars$mpg[mtcars$cyl == 8  &  mtcars$disp > 350]

with(data.frame(u = c(5,10,15,20,30,40,60,80,100),
                lot1 = c(118,58,42,35,27,25,21,19,18),
                lot2 = c(69,35,26,21,18,16,13,12,12)),
     list(lot1-lot2))

airquality
aq <- within(airquality, {     # Notice that multiple vars can be changed
  lOzone <- log(Ozone)
  Month <- factor(month.abb[Month])
  cTemp <- round((Temp - 32) * 5/9, 1) # From Fahrenheit to Celsius
  S.cT <- Solar.R / cTemp  # using the newly created variable
  rm(Day, Temp)
})
head(aq)

#--------------------------------------------
#By()
Orange    #R built-in dataset, Growth of Orange Trees

#Calculate the mean circumference of different Tree groups:
x <- by(Orange[,2],Orange[,1],mean)
x
x[1]
x['3']
# by() function in R with mean
mydata <- iris
by(mydata$Sepal.Length,list(mydata$Species),mean)

mydata<-mtcars
mydata
list(mydata$gear,mydata$cyl)
by(mydata$hp,list(mydata$gear,mydata$cyl),mean)
require(stats)
by(warpbreaks[, 1:2], warpbreaks[,"tension"], summary)
by(warpbreaks[, 1],   warpbreaks[, -1],       summary)
by(warpbreaks, warpbreaks[,"tension"],
   function(x) lm(breaks ~ wool, data = x))

## now suppose we want to extract the coefficients by group
tmp <- with(warpbreaks,
            by(warpbreaks, tension,
               function(x) lm(breaks ~ wool, data = x)))
sapply(tmp, coef)
#--------------------------------------
  library(doBy)
data(dietox)

dietox12    <- subset(dietox,Time==12)

summaryBy(Weight+Feed~Evit+Cu, data=dietox12,
          FUN=c(mean,var,length))
names(dietox)
summaryBy(list(c("Weight","Feed"), c("Evit","Cu")), data=dietox12,
          FUN=c(mean,var,length))


summaryBy(Weight+Feed~Evit+Cu+Time, data=subset(dietox,Time>1),
          FUN=c(mean,var,length))

## Calculations on transformed data:

summaryBy(log(Weight)+Feed~Evit+Cu, data=dietox12)

## Calculations on all numerical variables (not mentioned elsewhere):

summaryBy(.~Evit+Cu,data=dietox12, id=~Litter, FUN=mean)

## There are missing values in the 'airquality' data, so we remove these
## before calculating mean and variance with 'na.rm=TRUE'. However the
## length function does not accept any such argument. Hence we get
## around this by defining our own summary function in which length is
## not supplied with this argument while mean and var are:

sumfun <- function(x, ...){
  c(m=mean(x, ...), v=var(x, ...), l=length(x))
}
summaryBy(Ozone+Solar.R~Month, data=airquality, FUN=sumfun, na.rm=TRUE)

## Using '.' on the right hand side of a formula means to stratify by
## all variables not used elsewhere:

data(warpbreaks)
summaryBy(breaks ~ wool+tension, warpbreaks)
summaryBy(breaks ~., warpbreaks)
summaryBy(.~ wool+tension, warpbreaks)

## Keep the names of the variables (works only if FUN only returns one
## value):

summaryBy(Ozone+Wind~Month, data=airquality,FUN=c(mean),na.rm=TRUE,
          keep.names=TRUE)

## Using full.dimension=TRUE

## Consider:
summaryBy(breaks~wool, data=warpbreaks)
## Rows of result are replicated below
summaryBy(breaks~wool, data=warpbreaks, full.dimension=TRUE)
## Notice: Previous result is effectively the same as
with(warpbreaks, ave(breaks, wool))
## A possible application of full.dimension=TRUE is if we want to
## standardize (center and scale) data within groups:
ss <- summaryBy(breaks~wool, data=warpbreaks, full.dimension=TRUE, FUN=c(mean,sd))
(warpbreaks$breaks-ss$breaks.mean)/ss$breaks.sd
#--------------------------------------------------------------------
  #
  # These ecamples show how to run a variety of data frame manipulations
  # in R without SQL and then again with SQL
  #
  # head
# install the package
install.packages("sqldf")
#load it
library(sqldf)

a1r <- head(warpbreaks)
a1s <- sqldf("select * from warpbreaks limit 6")

identical(a1r, a1s)

# subset
a2r <- subset(CO2, regexpr("Qn", Plant) > 0)
a2s <- sqldf("select * from CO2 where Plant like 'Qn%'")
all.equal(a2r, a2s, check.attributes = FALSE)

data(farms, package = "MASS")
a3r <- subset(farms, Manag %in% c("BF", "HF"))
a3s <- sqldf("select * from farms where Manag in ('BF', 'HF')")
row.names(a3r) <- NULL
identical(a3r, a3s)

a4r <- subset(warpbreaks, breaks >= 20 & breaks <= 30)
a4s <- sqldf("select * from warpbreaks where breaks between 20 and 30",
             row.names = TRUE)
identical(a4r, a4s)

a5r <- subset(farms, Mois == 'M1')
a5s <- sqldf("select * from farms where Mois = 'M1'", row.names = TRUE)
identical(a5r, a5s)

a6r <- subset(farms, Mois == 'M2')
a6s <- sqldf("select * from farms where Mois = 'M2'", row.names = TRUE)
identical(a6r, a6s)

# rbind
a7r <- rbind(a5r, a6r)
a7s <- sqldf("select * from a5s union all select * from a6s", row.names = TRUE)
identical(a7r, a7s)

# aggregate - avg conc and uptake by Plant and Type
a8r <- aggregate(iris[1:2], iris[5], mean)
a8s <- sqldf("select Species, avg([Sepal.Length]) 'SepalLength',
             avg([Sepal.Width]) 'SepalWidth' from iris group by Species")
all.equal(a8r, a8s)

# by - avg conc and total uptake by Plant and Type
a9r <- do.call(rbind, by(iris, iris[5], function(x) with(x,
                                                         data.frame(Species = Species[1],
                                                                    mean.Sepal.Length = mean(Sepal.Length),mean.Sepal.Width = mean(Sepal.Width),
                                                                    mean.Sepal.ratio = mean(Sepal.Length/Sepal.Width)))))
row.names(a9r) <- NULL
a9s <- sqldf("select Species, avg([Sepal.Length]) `mean.Sepal.Length`,
             avg([Sepal.Width]) `mean.Sepal.Width`,
             avg([Sepal.Length]/[Sepal.Width]) `mean.Sepal.ratio` from iris
             group by Species")
all.equal(a9r, a9s)

# head - top 3 breaks
a10r <- head(warpbreaks[order(warpbreaks$breaks, decreasing = TRUE), ], 3)
a10s <- sqldf("select * from warpbreaks order by breaks desc limit 3")
row.names(a10r) <- NULL
identical(a10r, a10s)

# head - bottom 3 breaks
a11r <- head(warpbreaks[order(warpbreaks$breaks), ], 3)
a11s <- sqldf("select * from warpbreaks order by breaks limit 3")
# attributes(a11r) <- attributes(a11s) <- NULL
row.names(a11r) <- NULL
identical(a11r, a11s)

# ave - rows for which v exceeds its group average where g is group
DF <- data.frame(g = rep(1:2, each = 5), t = rep(1:5, 2), v = 1:10)
a12r <- subset(DF, v > ave(v, g, FUN = mean))
Gavg <- sqldf("select g, avg(v) as avg_v from DF group by g")
a12s <- sqldf("select DF.g, t, v from DF, Gavg where DF.g = Gavg.g and v > avg_v")
row.names(a12r) <- NULL
identical(a12r, a12s)

# same but reduce the two select statements to one using a subquery
a13s <- sqldf("select g, t, v from DF d1, (select g as g2, avg(v) as avg_v from DF group by g) where d1.g = g2 and v > 
              avg_v")
identical(a12r, a13s)

# same but shorten using natural join
a14s <- sqldf("select g, t, v from DF natural join (select g, avg(v) as avg_v from DF group by g) where v > avg_v")
identical(a12r, a14s)

# table
a15r <- table(warpbreaks$tension, warpbreaks$wool)
a15s <- sqldf("select sum(wool = 'A'), sum(wool = 'B')
              from warpbreaks group by tension")
all.equal(as.data.frame.matrix(a15r), a15s, check.attributes = FALSE)

# reshape
t.names <- paste("t", unique(as.character(DF$t)), sep = "_")
a16r <- reshape(DF, direction = "wide", timevar = "t", idvar = "g", varying = list(t.names))
a16s <- sqldf("select g, sum((t == 1) * v) t_1, sum((t == 2) * v) t_2, sum((t == 3) * v) t_3, sum((t == 4) * v) t_4, sum((t 
== 5) * v) t_5 from DF group by g")
all.equal(a16r, a16s, check.attributes = FALSE)

# order
a17r <- Formaldehyde[order(Formaldehyde$optden, decreasing = TRUE), ]
a17s <- sqldf("select * from Formaldehyde order by optden desc")
