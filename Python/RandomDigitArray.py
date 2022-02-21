
import random

def RandomArray(length,border) :
   array = []
   for i in range(length) :
      rand = random.randint(1,border)
      array.append(rand)
   return array

# def RandomArrayWithStrings(length,border) :
#    str1 = 'Nikolay 2, '
#    array = []
#    for i in range(length) :
#       rand = random.randint(1,border)
#       str1 = 'Nikolay 2, ' + str(rand)
#       array.append(str1)
#    return array

length = 1000
border = 1000
result = RandomArray(length,border)
print(result)

# print(RandomArrayWithStrings(length,border))


