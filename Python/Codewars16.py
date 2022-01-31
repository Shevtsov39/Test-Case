# Write an algorithm that takes an array and moves all of the zeros to the end, preserving the order of the other elements.

def move_zeros(array):
   zeroCounter = array.count(0)
   if zeroCounter > 0 :
      for i in range(zeroCounter) :
         array.remove(0)
         array.append(0)
   return array

array = [1, 0, 1, 2, 0, 1, 3]
print(move_zeros(array))