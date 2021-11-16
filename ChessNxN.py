# def Solution(position) :
#    for first in range(0,8) :
#       for current in range(first + 1,9) :
#          if position[first] == position[current] :
#             return False
#    return True

# def ChangeSS(n,base) :
#    sum = ""
#    ostatok = n
#    while n :
#       ostatok = int(n) % int(base)
#       sum = str(sum) + str(ostatok)
#       n = int(n) // int(base)
#    return str(sum[::-1])

# counter = 0 
# base = 9  
# for num in range(0,387420489) :
#    n = ChangeSS(num,base)
#    while len(n) < 9 :
#       n = str("0") + str(n)
#    if Solution(n) :
#       counter += 1
# print(counter)

def Solution(position) :
   for first in range(0,base - 1) :
      for current in range(first + 1, base) :
         if position[first] == position[current] :
            return False
   return True

def ChangeSS(n,base) :
   list = []
   ostatok = n
   while n :
      ostatok = int(n) % int(base)
      list.append(ostatok)
      n = int(n) // int(base)
   return list[::-1]

counter = 0 
base = 8
for num in range(1,base**base) :
   n = ChangeSS(num,base)
   while len(n) < base :
      n = 0 + n      #
   if Solution(n) :
      counter += 1
      #print(n)
print(counter)