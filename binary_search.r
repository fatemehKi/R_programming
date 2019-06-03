Y=sample(1:300,100)
y=sort(Y)
mi=92
hi=100
lo=1
j=1

while(j<m && j<100){
  m=round((hi+lo)/2)
  if(mi==y[j]){
    print(mi)
    break
  }
  else if(mi>y[j]){
    lo=m
    hi=hi
  }
  else if(mi<y[j]){
    hi=m
    lo=lo
  }

  j=j+1
  if(j==100){
  print('couldnt find')
  }
}
