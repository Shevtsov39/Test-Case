# Написать програмку генерации паролей для пользователя.
# Пользователь может выбрать какого типа символы нужны для пароля: цифры, буквы прописные/строчные, спецсимволы (можно выбрать какие).

import random
import sys
import os.path

defaultDict = {
   'length' : 10,
   'symbols' : 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_!#%'
}

def Passwd(symbols,lengthPassword) : 
   sum = ''
   elements = list(symbols)
   for i in range(0, lengthPassword) :
      sum += random.choice(elements)
   saving = open(r'D:\Users\Admin\Desktop\Рабочий столик\forPG\PG.txt', 'a')
   saving.write(sum)
   saving.write('\n')
   saving.close()
   return sum

def ReadFile(failPath) : 
   file = open(failPath, encoding='utf-8')
   for i in range(0, 2) :
      list1 = file.readline()
      index = list1.index('=')
      if index != 0 :
         if list1[:index] in defaultDict :
            defaultDict[list1[:index]] = list1[index+1:]
   file.close()
   password = Passwd(defaultDict['symbols'], int(defaultDict['length']))
   return password

lenInput = len(sys.argv)
if lenInput == 2 :
   if sys.argv[1] == 'default' :
      print(Passwd(defaultDict['symbols'],defaultDict['length']))
   elif os.path.isfile(sys.argv[1]) :
      failPath = sys.argv[1]
      print(ReadFile(failPath))
   elif sys.argv[1] == 'help' :
      print(""" Правила пользования генератором паролей.\n ----------------------------------------
1. При вызове программы, вы можете указать путь к файлу, где будут содержаться ваши нстройки для пароля. 
Содержимое файла должно выглядеть следующим образом:
length=длина пароля
symbols=символы,которые могут находиться в пароле
Не используйте в конфигурационном файле пробелы слева и справа от знака '=' и после строки.\n-------------------------------------------------------------------------------
2. Также можно использовать настройки по умолчанию, вызвав команду 'default'.
3. Нельзя называть файлы 'default' и 'help'.
------------------------------------------------------------------------------""")
else :
   print('Введены неверные данные.')
   print('\rДля вывода правил пользования, в конце строки введите "help".','\n\r------------------------------------------------------------')
