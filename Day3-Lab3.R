#Creating Data Frames
a <- c(1,2,3,4,5)                    # Create some vectors
b <- c("Life","Is","Study!","Let's","Learn")
c <- c(TRUE,FALSE,TRUE,TRUE,FALSE)

my_frame <- data.frame(a,b,c)       # Create a new data frame
my_frame

my_frame <- data.frame(numeric = a, character = b, logical = c)
my_frame

colnames(my_frame)
names(my_frame)

colnames(my_frame) <- c("c1","c2","c3")
colnames(my_frame)

my_frame <- data.frame(numeric = a, character = b, logical = c,
                       row.names = c("r1","r2","r3","r4","r5"))

my_frame
rownames(my_frame)
rownames(my_frame) <- 1:5
rownames(my_frame)

X <- matrix(seq(10,1000,10),10,10)    #Create a 10 x 10 matrix.. seq(from 10 to 1000 step is 10 )

X_frame <- as.data.frame(X)           #Turn the matrix into a data frame

X_frame

cars <- mtcars        # Load the mtcars data 
print(cars)    
summary(cars)
str(cars)
head(cars, 5)     # Look at the first 5 rows of the data frame
tail(cars, 5)     # Look at the last 5 rows of the data frame
dim(cars)      # Get the dimensions of the data frame
nrow(cars)     # Get the number of rows
ncol(cars)     # Get the number of columns
#----------------------------------------------------------
#Data Frame Indexing
head( mtcars[6]  )      # Single brackets take column slices 
typeof( mtcars[6] )     # And return a new data frame
head( mtcars[[6]]  )    # Double brackets get the actual object at the index
typeof( mtcars[[6]]  )
head( mtcars[["wt"]]  )  # Column name notation in double brackets works
head( mtcars$wt  )       # As does the $ notation
cars[2,6]   # Get the value at row 2 column 6
cars[2, ]   # Get the second row
cars[ ,6]   # Get the 6th column
cars["Mazda RX4", ]   # Get a row by using its name
cars[ ,"mpg"]   # Get a column by using its name
cars[(cars$mpg > 25), ]   # Get rows where mpg is greater than 25
subset(cars, (mpg > 20) & (hp > 70))   # Subset with over 20 mpg and 70 horsepower.. we didn't use select meaning everything
cars$vs <- NULL     # Drop the column "vs"

cars$carb <- NULL   # Drop the column "carb"
subset(cars, (mpg > 20) & (hp > 70))
cars <- cars[-c(1, 3), ]    # Drop rows 1 and 3
head( cars )                # Note Mazda RX4 and Datsun 710 have been removed

my_frame

#If we check the type of column "character", we have a surprise in store:
typeof( my_frame$character )
my_frame <- data.frame(numeric = a, character = b, logical = c, stringsAsFactors = FALSE)
typeof( my_frame$character )
#----------------------------

#Create Data Frame
# Create the data frame.
emp.data <- data.frame(
emp_id = c (1:5), 
emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
salary = c(623.3,515.2,611.0,729.0,843.25), 
start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11", "2015-03-27")),
stringsAsFactors = FALSE)
# Print the data frame.			
print(emp.data) 
# Get the structure of the data frame.
str(emp.data)
# Print the summary.
print(summary(emp.data))  
# Extract Specific columns.
result <- data.frame(emp.data$emp_name,emp.data$salary)
print(result)
# Extract first two rows.
result <- emp.data[1:2,]
print(result)
# Extract 3rd and 5th row with 2nd and 4th column.
result <- emp.data[c(3,5),c(2,4)]
print(result)
# Add the "dept" coulmn.
emp.data$dept <- c("IT","Operations","IT","HR","Finance")
v <- emp.data
print(v)
#----------------------------
#Add Row

# Create the first data frame... in R when we go to the first parantesis and run.. it will run till the end of paranthesis
emp.data <- data.frame(
emp_id = c (1:5), 
emp_name = c("Rick","Dan","Michelle","Ryan","Gary"),
salary = c(623.3,515.2,611.0,729.0,843.25), 

start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11",
"2015-03-27")),
dept = c("IT","Operations","IT","HR","Finance"),
stringsAsFactors = FALSE
)

# Create the second data frame... in R when we go to the first parantesis and run.. it will run till the end of paranthesis
emp.newdata <- 	data.frame(
emp_id = c (6:8), 
emp_name = c("Rasmi","Pranab","Tusar"),
salary = c(578.0,722.5,632.8), 
start_date = as.Date(c("2013-05-21","2013-07-30","2014-06-17")),
dept = c("IT","Operations","Fianance"),
stringsAsFactors = FALSE
)

# Bind the two data frames.
emp.finaldata <- rbind(emp.data,emp.newdata)
print(emp.finaldata)
