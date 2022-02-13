# Your job is to implement a function which returns the last D digits of an integer N as a list.
# Special cases:
# If D > (the number of digits of N), return all the digits.
# If D <= 0, return an empty list.

def solution(n,d) :
   list1 = []
   if d > len(str(n)) :
      listOf = list(str(n))
      return listOf
   if d <= 0 :
      return list1
   else :
      digits = str(n)[-d:]
      list1 = list(digits)
      return list1

result = solution(34625647867585,45)
print(result)

def solution2(n,d) :
   list1 = []
   if d > len(str(n)) :
      for i in range(len(str(n))) :
         dig = n%10
         list1.append(dig)
         n = n//10
      return list1[::-1]
   if d <= 0 :
      return list1
   else :
      for i in range(d) :
         dig = n%10
         list1.append(dig)
         n = n//10
   return list1[::-1]

result = solution2(1234567,8)
print(result)