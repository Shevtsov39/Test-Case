def Solution(position) :
   for first in range(0,7) :
      for current in range(first + 1,8) :
         if position[first] == position[current] :
            return False
   return True

flag = 0
for x in range(342391,16777215) :
   octalNum = oct(x)
   octalNum = "0000000" + octalNum[2::]
   octalNum = octalNum[-8:]
   if Solution(octalNum) :
      flag += 1  
      print(octalNum)
print("Всего комбинаций", "=", flag)
