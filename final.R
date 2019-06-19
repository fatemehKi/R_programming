'''
/**
  * @file Fatemeh Kiaie.r 
  * @The goal of the is the R final exam
  * @author fatemeh Kiaie
  * @Contact: f.kiaie@gmail.com
**/
'''

###################Q1###################
A='his name is'
B='John'
C= 88.5
D= 18
E= TRUE
F= c(55,24, 'TRUE', FALSE)

####a)
paste(A,B)

####b)
typeof(E) #logical
typeof(E+1) #double

####c)
typeof(F) 
#F is a character type, because one of the elements in F (i.e, 'TRUE') is character type and character 
#is the strongest among double values (55, 24) and logical (FALSE) and therefore, all variable type in
#vector changing to character

####d)
typeof(D) #double
D1=as.integer(D) #converting to integer
typeof(D1) # D1 is integer

###################Q2###################
####a)
v=c(12,1,0,8,11,5,6,2,9,0,1,7)
m <- matrix(v, nrow = 3, ncol = 4)
m

####b)
even_v= c(ifelse(m%%2==0, TRUE, FALSE))

####c)
power_v =function(v){
  return(v^2)
}

re_v=power_v(v)


###################Q3###################
mark=c(89,90,45,78,99,63,55)

####a)
mark_new= mark[mark>73 & mark <89]

####b)
mark_small_n= length(mark[mark<75])

####c)
mark_sorted= sort(mark, decreasing = TRUE)

####d)
max_i= which.max(mark)
min_i= which.min(mark)

###################Q4###################
####a)
df_csv= read.csv('coffe.csv', header=TRUE, na.strings = 'NA' )
df_txt= read.delim('coffee.txt', header=TRUE, na.strings = 'NA')

####b)
df_txt$balance=df_txt$income - df_txt$spend
df_txt

####c)
subset_csv = subset(df_csv, select=c('cups', 'age', 'married'))

matrix_csv=as.matrix(subset_csv)

###################Q5###################
Ozone = c(97,97,76,118, 84, 85, 96, 78, 73, 91)
Solar.R = c(267, 272, 203, 225, 237, 188, 167, 197, 183, 189)
Wind= c(6.3, 5.7, 9.7, 2.3, 6.3, 6.3, 6.9, 5.1, 2.8, 4.6)
Temp = c(92, 92, 97, 94, 96, 94, 91, 92, 93, 93)
Month=c(7,7,8,8,8,8,9,9,9,9)
Day=c(8,9,28,29,30,31, 1, 2, 3, 4)

dataset=data.frame(Ozone, Solar.R, Wind, Temp, Month, Day)

vect=c()
for (i in 1:6){
  vect=append(vect, mean(dataset[,i]))
}
vect
