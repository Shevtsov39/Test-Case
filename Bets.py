# Игрок делает случайную ставку на рулетке. Рулетка крутится и выпадает случайное число.
# Определить за сколько ходов игрок проиграет все свои деньги, при условии, что:
# 1. Ставка делается на номер. В случае выигрыша выплата составляет 35:1
# 2. Ставка делается на чёт/нечет. В случае выигрыша выплата составляет 1:1
# Если выпадает зеро, проигрывают все ставки.
# Игрок приходит в казино с суммой 100 рублей, и его случайные ставки - целые числа от 1 до 5 рублей.
# Написать алгоритм, прогнать 100 раз найти среднее значение ходов до проигрыша.

import random

def Bet() :
   counter = 0
   sum = 100
   for i in range(100) :
      firstBet = random.randint(1,5)
      num = random.randint(1,36)
      secondBet = random.randint(1,5)
      sum = sum - firstBet - secondBet
      firstBetResult = BetOnDigits(firstBet,num)
      secondBetResult = EvenOdd(secondBet)
      if firstBetResult or secondBetResult == False :
         sum += 0
      else :
         sum = sum + firstBetResult + secondBetResult
      if sum != 0 :
         counter += 1
         continue
      else :
         break
   return counter

def BetOnDigits(n,num) :
   randomBet = random.randint(0,36)
   if randomBet == 0 :
      return False
   elif randomBet == num :
      n = n*35
      return n
   else :
      return 0

def EvenOdd(n) :
   randomBet = random.randint(0,36)
   ost = randomBet%2
   if randomBet == 0 :
      return False
   elif ost == 0 :
      n = n*2
      return n
   else :
      return 0

print(Bet())