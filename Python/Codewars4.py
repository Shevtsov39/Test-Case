# You are given an array (which will have a length of at least 3, but could be very large) containing integers. 
# The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. 
# Write a method that takes the array as an argument and returns this "outlier" N.

def find_outlier(array) :
   list1 = []
   list2 = []
   for i in array :
      remainder = i%2
      if remainder == 1 :
         list1.append(i)
      elif remainder == 0 :
         list2.append(i)
   if len(list1) > len(list2) :
      return list2[0]
   else :
      return list1[0]

array1 = [160, 3, 1719, 19, 11, 13, -21]
array2 = [2, 4, 0, 100, 4, 11, 2602, 36]
result1 = find_outlier(array1)
result2 = find_outlier(array2)
print(result1)
print(result2)