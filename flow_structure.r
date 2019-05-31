'''
- benefit of using the curly bracket.. if we use {}.. it will run till thhe end if we just stay in the opening
brackets
'''
x=5
x=-1

if(x>0){ #if we run from here it will run from here till the end
  print ('positive number')
}

if(x>0)
  print('Non negative') else 
  print('negative')



if(x>0) print('Non-nrgative number')else print('negative')

#nested loop
if(x<0){
  print('negative')
} else if (x>0){
  print('positive')
} else
  print('zero')

#ifelse function.. t does print as well
a=c(5,7,2,9)
ifelse(a%%2==0, 'even', 'odd')

c=1:100
b=ifelse((c%%3==0 | c%%5==0), c, NA)


while(c%%3==0 | c%%5==0)  
  {
  print(c) 
  
  }###??

## the variables are only inside the loop
x=c(2,5,3,9,8,11,6) 
count=0
d=c()
d2=c()
d3=c()

for (val in x) {
  if(val %% 2 == 0) {
    count=count+1
    d=append(d,val)
    d2=c(d2,val) #will add the new val to the old vector
  }
  d3=which(x %% 2 == 0)
}
print(count)
print(d)
print(d2)
print(d3)

which(x %% 2 == 0)

#printing multiple variables in the same print statment
print(c(count, d2))



#######unlike the for loop in while we need to increase the counter inside the loop###
i=1
x=5:15
while(i<=length(x)){ #in R unlike python we need to include the last index as well
  print(x[i])
  i=i+1
}

i=1
x=sample(1:20,10)
a=c()
while(i<length(x)){
  if(x[i]%%2==0)
    a=c(x[i]*2,a)
  else
    a=c(x[i],a)
  i=i+1
}

###second method
i=1
x=sample(1:20,10)
while(i<=length(x)){
  if(x[i]%%2==0){
    x[i]=x[i]*2
  }
  i=i+1
}
###third method
ifelse(x%%2==0, 2*x, x)

###break
x=1:5
for (val in x){
  if (val==3){
    break
  }
  print(val)
}

##next statment.. it does continue but jump from one
x=1:5
for (val in x){
  if (val==3){
    next
  }
  print(val)
}

##repeat loop... the loop happens at leat once because first statment and then condition
#although x is greater than 5 it does it for once
x=6
repeat{
  print(x)
  x=x+1
  if(x>5){
    break
  }
}
## using %in% fot matching condition.. for any type of structure
x=c('what', 'is', 'truth')
if ('Truth' %in% x){
  print('exist capital')
} else if ('truth' %in% x) {
  print('exist small')
} else 
  print('does not')

x=c(1,2,3)
if (1 %in% x){
  print('exist')
} else if ('truth' %in% x) {
  print('exist small')
} else 
  print('does not')

## binary vs linear search.. linear: we start from the beginning and check for the length
## of the vector.. for binary: 1.you sort the vector adn then check with the one in the middle.. 
## based on the sorted list.. we can see if it is after or before that middle one... and then 
## reduce the searching area.. it is been show the number of equations equals to logN.. logarithm

##implement the binary search algorithm
set.seed(0)
Y = sample(1:300, 100)
y=sort(Y)

x=45
i=1
m=(hi+lo)/2

####
