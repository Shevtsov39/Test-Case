# Как работает функция counter в модуле collections.
#y = Counter("Hello!")
#print(y)

def Counter(string) :
   list = []
   for i in string :
      a = string.count(i)
      b = list.count(i)
      if b == 0 :
         list.append(i)
         list.append(a)
   return list

string = "Hello world!"
print(Counter(string))
