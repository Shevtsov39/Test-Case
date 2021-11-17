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
      ostatok = n % base
      list.append(ostatok)
      n = n // base
   return list[::-1]

counter = 0 
base = 8
for num in range(1,base**base) :
   n = ChangeSS(num,base)
   n = [0] * base + n
   n = n[-base:]
   if Solution(n) :
      counter += 1
      f = open( 'positions.txt', 'a' )
      f.write( str(n) )
      f.close()
print(counter)
