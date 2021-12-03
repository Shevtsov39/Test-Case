def Solution(position) :
   for first in range(0,base - 1) :
      for current in range(first + 1, base) :
         if position[first] == position[current] or abs(first - current) == abs(int(position[first]) - int(position[current])) :
            return False
   return True

counter = 0
base = 8
for x in range(1,base**base) :
   octalNum = oct(x)
   octalNum = "0000000" + octalNum[2::]
   octalNum = octalNum[-base:]
   if Solution(octalNum) :
      counter += 1
print(counter)
