# find the working directory
getwd()

# set the working directory
setwd("C:\\Users\\tjaber\\Desktop\\RDA_Files")

# clean the working environment
rm(list = ls()) # this will remove EVERYTHING, so be careful!

#Input as CSV File
#The csv file is a text file in which the values in the columns are separated by a comma. Let's consider the following data 
#present in the file named input.csv.

#You can create this file using windows notepad by copying and pasting this data. Save the file as input.csv using the save 
#As All files(*.*) option in notepad.

# id,   name,    salary,   start_date,     dept
#1      1    Rick     623.30    2012-01-01      IT
#2      2    Dan      515.20    2013-09-23      Operations
#3      3    Michelle 611.00    2014-11-15      IT
#4      4    Ryan     729.00    2014-05-11      HR
#5     NA    Gary     843.25    2015-03-27      Finance
#6      6    Nina     578.00    2013-05-21      IT
#7      7    Simon    632.80    2013-07-30      Operations
#8      8    Guru     722.50    2014-06-17      Finance


data <- read.csv("input.csv")
print(data)
print(is.data.frame(data))
print(ncol(data))
print(nrow(data))

# Get the max salary from data frame.
sal <- max(data$salary)
print(sal)

# Get the person detail having max salary.
retval <- subset(data, salary == max(salary))
print(retval)
#Get all the people working in IT department
retvalIT <- subset( data, dept == "IT")
print(retvalIT)

#Get the persons in IT department whose salary is greater than 600
info <- subset(data, salary > 600 & dept == "IT")
print(info)
#Get the people who joined on or after 2014
retvaldate <- subset(data, as.Date(start_date) > as.Date("2014-01-01"))
print(retvaldate)

#Writing into a CSV File
# Write filtered data into a new file.
write.csv(retvaldate,"output.csv")
newdata <- read.csv("output.csv")
print(newdata)

write.csv(retvaldate,"output.csv", row.names = FALSE)
newdata <- read.csv("output.csv")
print(newdata)
-------------------------------------------------------------------
  
  #Input Data
  #Create a XMl file by copying the below data into a text editor like notepad. Save the file with a .xml extension and 
  #choosing the file type as all files(*.*).
  ############
<RECORDS>
  <EMPLOYEE>
  <ID>1</ID>
  <NAME>Rick</NAME>
  <SALARY>623.3</SALARY>
  <STARTDATE>1/1/2012</STARTDATE>
  <DEPT>IT</DEPT>
  </EMPLOYEE>
  
  <EMPLOYEE>
  <ID>2</ID>
  <NAME>Dan</NAME>
  <SALARY>515.2</SALARY>
  <STARTDATE>9/23/2013</STARTDATE>
  <DEPT>Operations</DEPT>
  </EMPLOYEE>
  
  <EMPLOYEE>
  <ID>3</ID>
  <NAME>Michelle</NAME>
  <SALARY>611</SALARY>
  <STARTDATE>11/15/2014</STARTDATE>
  <DEPT>IT</DEPT>
  </EMPLOYEE>
  
  <EMPLOYEE>
  <ID>4</ID>
  <NAME>Ryan</NAME>
  <SALARY>729</SALARY>
  <STARTDATE>5/11/2014</STARTDATE>
  <DEPT>HR</DEPT>
  </EMPLOYEE>
  
  <EMPLOYEE>
  <ID>5</ID>
  <NAME>Gary</NAME>
  <SALARY>843.25</SALARY>
  <STARTDATE>3/27/2015</STARTDATE>
  <DEPT>Finance</DEPT>
  </EMPLOYEE>
  
  <EMPLOYEE>
  <ID>6</ID>
  <NAME>Nina</NAME>
  <SALARY>578</SALARY>
  <STARTDATE>5/21/2013</STARTDATE>
  <DEPT>IT</DEPT>
  </EMPLOYEE>
  
  <EMPLOYEE>
  <ID>7</ID>
  <NAME>Simon</NAME>
  <SALARY>632.8</SALARY>
  <STARTDATE>7/30/2013</STARTDATE>
  <DEPT>Operations</DEPT>
  </EMPLOYEE>
  
  <EMPLOYEE>
  <ID>8</ID>
  <NAME>Guru</NAME>
  <SALARY>722.5</SALARY>
  <STARTDATE>6/17/2014</STARTDATE>
  <DEPT>Finance</DEPT>
  </EMPLOYEE>
  
  </RECORDS>
  #############
#Reading XML File
#The xml file is read by R using the function xmlParse(). It is stored as a list in R.
# Load the package required to read XML files.
install.packages("XML")
library("XML")

#  load the other required package.
install.packages("methods")
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Print the result.
print(result)

Get Number of Nodes Present in XML File
# Load the packages required to read XML files.
library("XML")
library("methods")

# Give the input file name to the function.
result <- xmlParse(file = "input.xml")

# Exract the root node form the xml file.
rootnode <- xmlRoot(result)

# Find number of nodes in the root.
rootsize <- xmlSize(rootnode)

# Print the result.
print(rootsize)

#Details of the First Node
print(rootnode[1])

# Get the first element of the first node.
print(rootnode[[1]][[1]])

# Get the fifth element of the first node.
print(rootnode[[1]][[5]])

# Get the second element of the third node.
print(rootnode[[3]][[2]])

# Convert the input xml file to a data frame.
xmldataframe <- xmlToDataFrame("input.xml")
xmldataframe
#--------------------------------------------------------------------------------
#HANDLE MISSING VALUES
x1 <- c(1, 4, 3, NA, 7)
x2 <- c("a", "B", NA, "NA")
is.na(x1)
is.na(x2)
g <- as.data.frame(matrix(c(1:5, NA), ncol = 2))
g
na.omit(g)
na.exclude(g)
na.fail(g)
na.pass(g)
mean(x1)
mean(x1, na.rm = TRUE)

#---------------------------------------------
  # sorting examples using the mtcars dataset
  attach(mtcars)
head(mtcars)
# sort by mpg
newdata <- mtcars[order(mpg),] 
head(newdata)
# sort by mpg and cyl
newdata <- mtcars[order(mpg, cyl),]
dim(newdata)
#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mpg, -cyl),] 
head(newdata)
detach(mtcars)

rank(mpg)



