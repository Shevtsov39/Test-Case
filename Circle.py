
# Есть квадрат со стороной 2, в который вписана окружность. Случайным образом выбираю точку
# и смотрю попадает ли она внутрь окружности. Сделать 1000 таких бросков и посчитать все точки,
# которые попали внутрь окружности.

import math
import random

def Random() :
   counter = 0
   for n in range(10000) :
      firstDigit = random.random()*2-1
      secondDigit = random.random()*2-1
      hypotenuse = math.sqrt(firstDigit**2 + secondDigit**2)
      if hypotenuse <= 1:
         counter += 1
   return counter

print(Random())


