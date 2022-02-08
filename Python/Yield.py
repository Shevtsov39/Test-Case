def createGenerator() :
   mylist = [1,2,3,4,5]
   print(mylist)
   for i in mylist :
     yield i*i

mygenerator = createGenerator() # создаём генератор
print(mygenerator) # mygenerator является объектом!
for i in mygenerator:
   print(i)