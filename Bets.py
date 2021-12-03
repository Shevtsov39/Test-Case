# Игрок делает случайную ставку на рулетке. Рулетка крутится и выпадает случайное число.
# Определить за сколько ходов игрок проиграет все свои деньги, при условии, что:
# 1. Ставка делается на номер. В случае выигрыша выплата составляет 35:1
# 2. Ставка делается на чёт/нечет. В случае выигрыша выплата составляет 1:1
# Если выпадает зеро, проигрывают все ставки.
# Игрок приходит в казино с суммой 100 рублей, и его случайные ставки - целые числа от 1 до 5 рублей.
# Написать алгоритм, прогнать 100 раз найти среднее значение ходов до проигрыша.

import random

def United(n,num) :
   randomBet = random.randint(0,36)
   if num == 50 or num == 51 :
      ost = randomBet%2
      ost1 = num % 2
      if ost == ost1 :
         n = n*2
      else :
         n = 0
   elif randomBet == num :
      n = n*35
   else :
      n = 0
   return n

def Bets() :
   max = 5
   min = 1
   sum = 100
   sum1 = 100
   counter1 = 0
   counter2 = 0
   while sum > 0 and sum1 > 0:
      firstBet = random.randint(min,max)
      counter1 += 1
      secondBet = random.randint(min,max)
      counter2 += 1
      num = random.randint(1,36)
      parity = random.randint(50,51)
      sum -= firstBet
      sum1 -= secondBet
      firstBetResult = United(firstBet,num)
      secondBetResult = United(secondBet,parity)
      sum += firstBetResult
      sum1 += secondBetResult
      if sum <= 4 and sum1 <= 4 :  
         max = sum
      elif sum1 <= 4 :
         max = sum1
      else :
         if sum <= 0 :
            print(counter1)
            print("Деньги для первой ставки =",sum)
         elif sum1 <= 0 :
            print(counter2)
            print("Деньги для второй ставки =",sum1)
         
Bets()