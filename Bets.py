# Игрок делает случайную ставку на рулетке. Рулетка крутится и выпадает случайное число.
# Определить за сколько ходов игрок проиграет все свои деньги, при условии, что:
# 1. Ставка делается на номер. В случае выигрыша выплата составляет 35:1
# 2. Ставка делается на чёт/нечет. В случае выигрыша выплата составляет 1:1
# Если выпадает зеро, проигрывают все ставки.
# Игрок приходит в казино с суммой 100 рублей, и его случайные ставки - целые числа от 1 до 5 рублей.
# Написать алгоритм, прогнать 100 раз найти среднее значение ходов до проигрыша.

import random

def Bet() :
   sum = 100
   for i in range(100) :
      if sum != 0 :
         firstBet = random.randint(1,5)
         secondBet = random.randint(1,5)
         sum = sum - firstBet - secondBet
         BetOnDigits(firstBet)
         EvenOdd(secondBet)


def BetOnDigits(n) :
   randomBet = random.randint(1,36)
   if randomBet == 0 :
      return randomBet


def EvenOdd(n) :
   randomBet = random.randint(0,36)
   ost = randomBet%2
   if randomBet == 0 :
      return 0
   elif ost == 0 :
      return True
   else :
      return False

print(Bet())
print(EvenOdd())
print(BetOnDigits())