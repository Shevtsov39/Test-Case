
#! Программа, которая будет бросать игральную кость и запоминать сумму в двух бросках.
#? Сделать 1000 (таких двойных) бросков и выведи таблицу в которой показано сколько раз какая сумма выпала.

import random

def RollDice(dice) :
   sum = 0
   list = []
   for n in range(2) :
      for i in range(1000) :
         sum = sum + random.choice(dice)
      list.append(sum)
      return list

dice = [1, 2, 3, 4, 5, 6]
print(RollDice(dice))

