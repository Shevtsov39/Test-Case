
def DRoot(num) :
   sum = 0
   list1 = list(str(num))
   if len(list1) >= 2 :
      for digit in list1 :
         sum += int(digit)
   if len(str(sum)) >= 2 :
      sum = DRoot(sum)
   elif len(str(num)) < 2 :
      return num
   sum1 = sum
   return sum1

num = 16
result = DRoot(num)
print(result)