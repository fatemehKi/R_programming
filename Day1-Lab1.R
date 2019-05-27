
# Remember to make good use of documentation of your code, using the # symbol
# find the working directory
getwd()

# set the working directory
setwd("C:\\Users\\Tareq\\Desktop\\Metro College\\RDA\\R_example")
getwd()

#Math
4+5
5-10
8*4
100/3
2^4
2+3*5^2
((2+3) * 5 )^2
# Use %% for modulus
100 %% 30
5%%2
log(2.7182)  # log() takes the natural logarithm of its argument
exp(10)  # exp() raises e to the power of its argument
exp(1)
log10(100) # log10() takes the log base 10 of a number
log2(64) # log2() takes the log base 2 of a number
sqrt(64) # sqrt() returns the square root of its argument
# round() rounds its argument to the nearest whole number:
round(233.234)
round(233.234, digits=1)
round(233.234, digits=-1)
round(2.5) # Rounds down to the even digit 2
round(3.5) # Rounds up to the even digit 4
floor(2.8) # floor() always rounds down
ceiling(2.2) # ceiling() always rounds up
trunc(2.6) # trunc() rounds in the direction of zero
trunc(-2.6)
abs(-10) # abs() returns the absolute value of the argument
pi  # pi returns the constant pi
3.14159265358979
cos(0) # Cosine
sin(pi/2) # Sine
tan(pi/4) # Tangent
acos(1) # Inverse Cosine
asin(1) # Inverse Sine
atan(1) # Inverse Tangent
#---------------------------------------------------------
#Double
typeof(1) #Numbers are type double by default
typeof(-10.5)
typeof(Inf)
typeof(-Inf)
#----------------------------------------------------------------------
#Numeric
x = 10.5       # assign a decimal value 
x              # print the value of x 
typeof(x)
class(x)       # print the class name of x 
k = 1 
k              # print the value of k 
class(k)       # print the class name of k 
is.integer(k)  # is k an integer? 
is.double(k)
#-----------------------------
#Integer

y = as.integer(3) 
y              # print the value of y 
class(y)       # print the class name of y 
is.integer(y)  # is y an integer? 
as.integer(3.14)    # coerce a numeric value 
as.integer("5.27")  # coerce a decimal string 
as.integer("Joe")   # coerce an non-decimal string 
as.integer(TRUE)    # the numeric value of TRUE 
as.integer(FALSE)   # the numeric value of FALSE 
#-----------------------------------
#Complex
z = 1 + 2i     # create a complex number 
z              # print the value of z 
class(z)       # print the class name of z 
sqrt(-1)       # square root of -1 
#Instead, we have to use the complex value -1 + 0i.
sqrt(-1+0i)    # square root of -1+0i 
#An alternative is to coerce -1 into a complex value.
sqrt(as.complex(-1)) 
#-----------------------------------------
#Logical
x = 1; y = 2   # sample values 
z = x > y      # is x larger than y? 
z              # print the logical value 
class(z)       # print the class name of z 
u = TRUE; v = FALSE 
u & v          # u AND v 
u | v          # u OR v 
!u             # negation of u 
#------------------------------------------------
#Character
x = as.character(3.14) 
x              # print the character string 
class(x)       # print the class name of x 
#Two character values can be concatenated with the paste function.
fname = "Joe"; lname ="Smith" 
paste(fname, lname) 

#However, it is often more convenient to create a readable string with the sprintf function, which has a C language syntax.
sprintf("%s has %d dollars", "Sam", 100) 

#To extract a substring, we apply the substr function. Here is an example showing how to extract the substring between the third and twelfth positions in a string.
substr("Mary has a little lamb.", start=3, stop=12) 

#And to replace the first occurrence of the word "little" by another word "big" in the string, we apply the sub function.
sub("little", "big", "Mary has a little lamb.") 
#--------------------------------
#Vector
c(2, 3, 5) 
c(TRUE, FALSE, TRUE, FALSE, FALSE) 
c("aa", "bb", "cc", "dd", "ee") 
w<- c("aa", "bb", "cc", "dd", "ee") 
length(c("aa", "bb", "cc", "dd", "ee")) 
length(w)
x <- vector()
# with a pre-defined length
x <- vector(length = 10)
# with a length and type
vector("character", length = 10)
vector("numeric", length = 10)
vector("integer", length = 10)
vector("logical", length = 10)
z <- c("Alec", "Dan", "Rob", "Rich")
#Examine your vector
typeof(z)
length(z)
class(z)
str(z)
#---------------------------------------
#Combining Vectors
n = c(2, 3, 5) 
s = c("aa", "bb", "cc", "dd", "ee") 
c(n, s) 
#-----------------------------------------
#Vector Arithmetics
a = c(1, 3, 5, 7) 
b = c(1, 2, 4, 8)
5 * a 
a + b 
a - b 
a * b 
a / b 
u = c(10, 20, 30) 
v = c(1, 2, 3, 4, 5, 6, 7, 8, 9) 
u + v 
u - v 
u * v 
u / v 
v+u 
v -u
v *u
v /u
#-------------------------
#Vector Index
s = c("aa", "bb", "cc", "dd", "ee") 
s[3] 
s[-3] 
s[10] 
#----------------------------
#Numeric Index Vector
s = c("aa", "bb", "cc", "dd", "ee") 
s[c(2, 3)] 
s[c(2, 3, 3)] 
s[c(2, 1, 3)] 
s[2:4] 
#-----------------------------
#Generating Vectors
x <- 1:20 
print(x)
y <- seq(from = 1, to = 20, by = 1)
print(y)
z <- seq(0, 100, 10)   # You can omit the argument names
print(z)
r <- rep(x=1, times=20)
print(r)
x <- runif(n=20, min=0, max=100)
print(x)
#-------------------------------------------------------
#Logical Index Vector
s = c("aa", "bb", "cc", "dd", "ee")
L = c(FALSE, TRUE, FALSE, TRUE, FALSE) 
s[L] 
s[c(FALSE, TRUE, FALSE, TRUE, FALSE)] 
#-------------------------------------------
#Named Vector Members
v = c("Mary", "Sue") 
v 
names(v) = c("First", "Last") 
v 
v["First"] 
v[c("Last", "First")] 
