'''
-func_name=function(args){}
- in R, the last statment is return statment by default
'''
pow=function(x,y){
  result=x^y
  print(paste(x,'raised to power', y, 'is', result))
  print(c(x,y))
}

pow(2,3)
pow(y=3,x=2) #if you put the argument then the order is not important
pow(3,x=2)


foo=function(x,y){
  result=x^y
  b=x+y
}

z=foo(2,3)
print(z)

foo=function(x,y){
  result=x^y
  x+y
}
foo(2,3) #returning the last statment

#### function with the optional argument
fun.test = function(a,b,method='add'){
  if(method=='add'){
    res=a+b
  }
  if(method=='substract'){
    res=a-b
  }
  return(res)
}

fun.test(10,5,'add')
fun.test(10,5,'substraction')
fun.test(10,5)


##second function
ff=function(x,y=10){ #y is optional
  return(x+y)
}
ff(2)  #because y is already declared

ff(2,5)

ff(y=5) #error.. 

####
a=1:7
sapply(a, sqrt)

###if we have return before the statments the rest will not be executed
ff=function(x,y=10){ #y is optional
  return(x+y)
  print('HI')
}

ff(5)

ff=function(x,y=10){ #y is optional
  x+y
}

ff(5)

##### error handling.. if we use try we countinue after error
log'ee' ##error
log(-10) ##NAN.. warning

inputs=list(1,2,4,-5, 'oops', 0, 10)
for(input in inputs){
  tryCatch(print(paste ('log of', input, '=', log(input))),
           warning=function(w) {print(paste('negative argument', input))},
           error=function(e) {print(paste('non-numeric arg', input))})
}
