def solution(number):
   three = 3
   five = 5
   list = []
   sum = 0
   for i in range(1,number) :
      onFive = i%five
      onThree = i%three
      if onFive == 0 :
         list.append(i)
         continue
      elif onThree == 0 :
         list.append(i)
         continue
      else :
         continue
   for j in list :
      sum += j
   return sum
  
result = solution(200)
print(result)