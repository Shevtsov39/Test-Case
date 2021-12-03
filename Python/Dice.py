
#! Программа, которая будет бросать игральную кость и запоминать сумму в двух бросках.
#? Сделать 1000 (таких двойных) бросков и выведи таблицу в которой показано сколько раз какая сумма выпала.

import random

dice = [1, 2, 3, 4, 5, 6]
list = []
for m in range(1000) :
   firstThrow = random.choice(dice)
   secondThrow = random.choice(dice)
   sum = firstThrow + secondThrow
   list.append(sum)
for i in range(2,len(dice)*2+1) :
   counter = list.count(i)
   print("Количество выпадений",i,"=",counter)


