#Исходная строка ABCDEFGH...
#Каждый чётный записывается n раз, где n-его позиция в исходной строке, каждый нечётный записывается (2n-1) раз
#На выходе: ABCCCDDDEEEEEFFFFFFFFFFF

alphabet = "ABCDEFGHIKLMNOPQRSTVXYZ"
index = 0
sum = ""
for char in alphabet :
   remainder = index % 2
   if remainder != 0 :
      sum += (2 * index - 1) * char
   elif index == 0 :
      sum += 1 * char
   else :
      sum += index * char
   index += 1
print(sum)