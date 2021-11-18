import time

def ChangeSS(n,base) :
   list = n[::-1]
   num = 0
   index = 0
   for chars in list :
      num += chars * base**index
      index = index + 1
   return num

def ChangeSS2(n,base) :             
   list = n[::-1]
   num = 0
   power = 1
   for chars in list :
      num += chars * power
      power = power*base
   return num

print(ChangeSS([1,2,3,4,5],10))
print(ChangeSS2([1,2,3,4,5],10))

