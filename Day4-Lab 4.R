
x <- 10                # Assign some variables
y <- 5
if                     # The keyword "if" starts an if statement
(x > y)                # A logical expression follows the "if" 
{print (x)}            # Code to execute is wrapped in curly braces "{}"

y <- 25              # Reassign variable y to make it larger than x
if (x > y) {         # The original if statement
  print(x)
} else {             # With a new else statement added
  print(y)
}

y <- 10
if (x > y) {                     
  print(x)
} else if (y == x) {             # A new else if statement that checks equality
  print("x and y are equal")
} else {                         
  print(y)
}
-------------------------------------
#The ifelse() Function
my_vect <- runif(25, -1, 1)          # Generate some random data between -1 and 1

for (index in 1:length(my_vect) ) {   # loop through the sequence 1:25
  number <- my_vect[index]          # look up the next number using indexing
  if (number < 0) {                 # check if the number is less than 0
    my_vect[index] <- 0           # if so, set it to 0
  }
}
print (my_vect)


my_vect <- runif(25, -1, 1)           # Generate new random data between -1 and 1

my_vect <-   ifelse((my_vect < 0),    # A logical test
                    0,                       # Value to set if the test is true
                    my_vect)                 # Value to set if the test is false

print (my_vect)
------------------------------------------
  
#For Loops
my_sequence <- seq(0,100,10)     # Create a numeric vector

for (item in my_sequence) {      # Create a new for loop over the specified items
  print(item)                  # Code to execute
}

for (item in my_sequence) {
  if (item < 50){              # This if statement skips items less than 50
    next
  }
  print(item)
}

for (item in my_sequence) {
  if (item > 50){               # Break out of the loop if item exceeds 50
    break
  }
  print(item)
}
---------------------------------
  
 # While Loops
x <- 5
iters <-0

while (iters < x) {        # Execute the contents as long as iters < x
  print("Study")
  iters <- iters+1       # Increment iters by 1 each time the loop executes
}

while (TRUE) {            # This logical expression is always true!
  print("Study")
  break                 # But we immediately break out of the loop
}
------------------------
  #Creating Functions

new_function <- function(arguments) { # Assign the function and declare arguments
  
  for (x in 1:arguments){           # Body of the function (code to execute)
    print ("Study")                      
  }  
}

new_function(5)             # Run the function defined above on the input 5

add_10 <- function(number){  
  
  number + 10              # This function returns the argument + 10
}

add_10(5)

add_20 <- function(number){           
  
  return (number + 20)      # Exit and return a specified value
  
  number + 10               # The function exits before this line is executed
}

add_20(5)

# These two functions are essentially identical:

add_10 <- function(number){  
  number + 10                     
}

add_10_version2 <- function(number){  
  return(number + 10)                         
}

sum_3_items <- function(x,y,z,               # Create a new function
                        print_args = TRUE){  # One argument has a default
  
  if (print_args){                     
    print (x)
    print (y)
    print (z)
  }
  
  return(x+y+z)
}

sum_3_items(1,2,3)              # Here the arguments are printed

sum_3_items(10,20,30,  print_args = FALSE) # Changing the default suppresses printing

sum_3_items(z=1, y=2, x=3)

  sum1 <-  sum_3_items(3, 1, y=2)
  
  addition_function <- function(...){         # Accept any number of arguments
    
    total <- 0                   # Create a variable to store the sum
    
    for (value in list(...)){    # list(...) extracts the arguments to a list
      total <- total+value     # Add each argument in ... to the total
    }
    
    total
  }
  
  addition_function(2,4,6,8,10,12,14)    # Add several numbers
  
  # This function is the same as c() but it also prints the number of arguments you supply
  
  extend_c <- function(...) {      
    print(length(list(...)))       # Print the number of arguments
    c(...)                         # Pass the arguments to c() and return the result
  }
  
  my_vector <- extend_c(1,3,4,5)
  
  print(my_vector)
  ---------------------------------------------------
  #Calling a Function
  # Create a function to print squares of numbers in sequence.
  new.function <- function(a) {
    for(i in 1:a) {
      b <- i^2
      print(b)
    }
  }
  
  new.function(6)
  
  # Create a function without an argument.
  new.function <- function() {
    for(i in 1:5) {
      print(i^2)
    }
  }	
  
  new.function()
  
  # Create a function with arguments.
  new.function <- function(a,b,c) {
    result <- a * b + c
    print(result)
  }
  
  new.function(5,3,11)
  new.function(a = 11, b = 5, c = 3)
  
  # Create a function with arguments.
  new.function <- function(a = 3, b = 6) {
    result <- a * b
    print(result)
  }
  new.function()
  new.function(9,5)
  

  # Create a function with arguments.
  new.function <- function(a, b) {
    print(a^2)
    print(a)
    print(b)
  }
  new.function(6,5)
  
  