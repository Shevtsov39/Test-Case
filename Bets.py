# Игрок делает случайную ставку на рулетке. Рулетка крутится и выпадает случайное число.
# Определить за сколько ходов игрок проиграет все свои деньги, при условии, что:
# 1. Ставка делается на номер. В случае выигрыша выплата составляет 35:1
# 2. Ставка делается на чёт/нечет. В случае выигрыша выплата составляет 1:1
# Если выпадает зеро, проигрывают все ставки.
# Игрок приходит в казино с суммой 100 рублей, и его случайные ставки - целые числа от 1 до 5 рублей.
# Написать алгоритм, прогнать 100 раз найти среднее значение ходов до проигрыша.

import random

def BetOnDigits() :
   counter = 0
   sum = 100
   for i in range(100) :
      counter += 1
      firstBet = random.randint(1,5)
      num = random.randint(1,36)
      sum -= firstBet
      firstBetResult = Digits(firstBet,num)
      if firstBetResult :
         sum = sum + firstBetResult
      if sum <= 0 :
         break  
   return counter

def BetOnOdd() :
   counter = 0
   sum = 100
   for i in range(100) :
      counter += 1
      secondBet = random.randint(1,5)
      parity = random.randint(1,2)
      sum -= secondBet
      secondBetResult = EvenOdd(secondBet,parity)
      if secondBetResult :
         sum = sum + secondBetResult
      if sum <= 0 :
         break         
   return counter

def Digits(n,num) :
   randomBet = random.randint(0,36)
   if randomBet == num :
      n = n*35
      return n
   else :
      return 0

def EvenOdd(n,parity) :
   randomBet = random.randint(0,36)
   ost = randomBet%2
   if parity == randomBet :
      n = n*2
      return n
   else :
      return 0

print(BetOnDigits())
print(BetOnOdd())
