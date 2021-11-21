
#! Программа, которая будет бросать игральную кость и запоминать сумму в двух бросках.
#? Сделать 1000 (таких двойных) бросков и выведи таблицу в которой показано сколько раз какая сумма выпала.

import random

dice = [1, 2, 3, 4, 5, 6]
list = []
for n in range(1000) :
   a = random.choice(dice)
   b = random.choice(dice)
   sum = a + b
   list.append(sum)
for i in range(2,13) :
   counter = list.count(i)
   print("Количество выпадений",i,"=",counter)