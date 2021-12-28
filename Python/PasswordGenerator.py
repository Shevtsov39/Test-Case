# Написать програмку генерации паролей для пользователя.
# Пользователь может выбрать какого типа символы нужны для пароля: цифры, буквы прописные/строчные, спецсимволы (можно выбрать какие).

'D:\\Users\\Admin\Desktop\\config.txt'
import random
import string
import sys
import os.path

defaultDict = {
   'length' : 10,
   'symbols' : 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
}

def Passwd(symbols,lengthPassword) : 
   print('symbols =',symbols)
   print('lengthPassword =',lengthPassword)
   elements = list(symbols)
   password = ''.join([random.choice(elements) for i in range(0, int(lengthPassword))])
   return password

def ReadFile(failPath) : 
   file = open(failPath, encoding='utf-8')
   for i in range(0, 2) :
      list1 = file.readline()
      index = list1.index('=')
      if index != 0 :
         if list1[:index] in defaultDict :
            defaultDict[list1[:index]] = list1[index+1:-1]
   file.close()
   print(Passwd(defaultDict['symbols'], defaultDict['length']))

a = len(sys.argv)
print(a)
if a == 1 :
   print(Passwd(defaultDict['symbols'],defaultDict['length']))
elif a == 2 :
   b = os.path.isfile(sys.argv[1])
   if b :
      failPath = sys.argv[1]
      ReadFile(failPath)
   else :
      print('Параметров нет')
      
# failPath = r'D:\Users\Admin\Desktop\config.txt'
# ReadFile(failPath)


