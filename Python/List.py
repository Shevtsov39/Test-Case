#Функция, которая возвращает список, содержащий элементы, которые есть как в А списке, так и в В списке.
def equalSym(a,b) :
   list = []
   for char in a :
      counter = b.count(char)
      if counter > 0 :
         list.append(char)
   return list

a = ["L","C","A"]
b = ["A","B","C"]
print(equalSym(a,b))

#Функция, которая возвращает список, содержащий элементы, которые не встречаются в А и В списках одновременно.
def unequalSym(a,b) :
   list = []
   for element1 in a :
      counter1 = b.count(element1)
      if counter1 == 0 :
            list.append(element1)
   for element2 in b :
      counter2 = a.count(element2)
      if counter2 == 0 :
         list.append(element2)
   return list

a = ["A","B","C","L"]
b = ["A","B","C","E"]
print(unequalSym(a,b))