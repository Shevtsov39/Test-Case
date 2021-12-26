# Написать програмку генерации паролей для пользователя.
# Пользователь может выбрать какого типа символы нужны для пароля: цифры, буквы прописные/строчные, спецсимволы (можно выбрать какие).

import random
import string

def Pass(conditions, removeElement, lengthPassword) : 
   joinConditions = ''.join(conditions)
   elements = list(joinConditions)
   for j in list(removeElement) :
      if elements.count(j) > 0 :
         elements.remove(j)
      else :
         continue
   password = ''.join([random.choice(elements) for i in range(lengthPassword)])
   return password

A = string.ascii_lowercase + 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
U = string.ascii_uppercase + 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
D = string.digits
P = string.punctuation
lengthPassword = input('Количество символов: ')
print('A - Строчные буквы (', A ,')' )
print('U - Прописные буквы (', U ,')' )
print('D - Цифры (' , D , ')' )
print('P - Символы пунктуации ( !"#$%&''()*+,-./:;<=>?@[\]^_{|}~ )')
conditions = input('Введите буквы, которые соответствуют типу символов и будут содержаться в пароле :')
removeElement = input('Введите символ которого не будет в пароле :')
conditions = conditions.upper()
if conditions.count('A')!=0 and conditions.count('U')!=0 and conditions.count('D')!=0 and conditions.count('P')!=0 :
   conditions = [A, U, D, P]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions.count('A')!=0 and conditions.count('U')!=0 and conditions.count('D')!=0 and conditions.count('P')<=0 :
   conditions = [A, U, D]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions.count('A')!=0 and conditions.count('U')!=0 and conditions.count('D')<=0 and conditions.count('P')<=0 :
   conditions = [A, U]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions.count('A')!=0 and conditions.count('U')<=0 and conditions.count('D')<=0 and conditions.count('P')<=0 :
   conditions = [A]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions.count('A')!=0 and conditions.count('U')<=0 and conditions.count('D')!=0 and conditions.count('P')!=0 :
   conditions = [A, D, P]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions.count('A')!=0 and conditions.count('U')<=0 and conditions.count('D')<=0 and conditions.count('P')!=0 :
   conditions = [A, P]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions.count('A')!=0 and conditions.count('U')<=0 and conditions.count('D')!=0 and conditions.count('P')<=0 :
   conditions = [A, D]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions.count('A')!=0 and conditions.count('U')!=0 and conditions.count('D')<=0 and conditions.count('P')!=0 :
   conditions = [A, U, P]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions == 'PU' or conditions == 'UP' :
   conditions = [U, P]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions == 'U' :
   conditions = [U]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions == 'P' :
   conditions = [P]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions == 'D' :
   conditions = [D]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions == 'PUD' or conditions == 'UPD' or conditions == 'DUP':
   conditions = [P, U, D]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions == 'PD' or conditions == 'DP':
   conditions = [P, D]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions == 'UD' or conditions == 'DU':
   conditions = [U, D]
   print(Pass(conditions, removeElement,lengthPassword))
elif conditions == 'PUD' or conditions == 'UPD' or conditions == 'DUP':
   conditions = [P, U, D]
   print(Pass(conditions, removeElement,lengthPassword))
else :
   print('Ошибка! Введены неверные данные!')

