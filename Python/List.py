# Функция, которая возвращает список, содержащий элементы, которые есть как в А списке, так и в В списке.

def equalSym(a,b) :
   list = []
   for el1 in a :
      for el2 in b :
         if el1.lower() == el2.lower() :
            list.append(el2)
   return list

a = ["a","B","K","L","f"]
b = ["A","B","C","E","F"]
#print(equalSym(a,b))

# Функция, которая возвращает список, содержащий элементы, которые не встречаются в А и В списках одновременно. 
#+ Функция игнорирует регистр.

def unequalSym(a,b) :
   list = []
   list1 = []
   list2 = []
   for i1 in a :
      for i2 in b :
         if i1.lower() == i2.lower() :
            list1.append(i2)
         list2.append(i1)
   print(list2)
   for element1 in a :
      counter1 = b.count(element1)
      if counter1 == 0 :
         list.append(element1)
   for element2 in b :
      counter2 = a.count(element2)
      if counter2 == 0 :
         list.append(element2)
   return list

a = ["a","B","K","L","f"]
b = ["A","B","C","E","F"]
print(unequalSym(a,b))