def ReturnBit(n,bit) :   
   maska = 2**bit
   return n & maska != 0      # Использую битовую операцию AND. Если операция выводит единицу или > вывожу True, если 0, то False.

def ResetBit(n,bit):
   maska = 2**bit
   return n & ~maska          # Использую битовую операцию AND и NOT. Если есть единица, убираю ее.

def SetBit(n,bit) :   
   maska = 2**bit
   return n | maska           # Использую битовую операцию OR. Устанавливаю единицу, если ее нет.

def InvertBit(n,bit) :
   maska = 2**bit
   return n ^ maska           # Использую битовую операцию XOR. Если стоит 0 - меняю на единицу и наоборот.

# bit = 1 - n
# maska = 1 << bit            # Операция << сдвигает в данном случае единицу влево на bit позиций.

#! 1. ReturnBit (dec, bit number) - возвращает True/False
print("ReturnBit 15")
print(ReturnBit(15,0))
print(ReturnBit(15,1))
print(ReturnBit(15,2))
print(ReturnBit(15,3))
print(ReturnBit(15,4))
print(ReturnBit(15,5))
print("ReturnBit 16")
print(ReturnBit(16,0))
print(ReturnBit(16,1))
print(ReturnBit(16,2))
print(ReturnBit(16,3))
print(ReturnBit(16,4))
print(ReturnBit(16,5))

#! 2. ResetBit (dec, bit number) - возвращает число
print("ResetBit 15")
print(ResetBit(15,0))
print(ResetBit(15,1))
print(ResetBit(15,2))
print(ResetBit(15,3))
print(ResetBit(15,4))
print(ResetBit(15,5))
print("ResetBit 16")
print(ResetBit(16,0))
print(ResetBit(16,1))
print(ResetBit(16,2))
print(ResetBit(16,3))
print(ResetBit(16,4))
print(ResetBit(16,5))

#! 3. SetBit (dec, bit number) - возвращает число
print("SetBit15")
print(SetBit(15,0))
print(SetBit(15,1))
print(SetBit(15,2))
print(SetBit(15,3))
print(SetBit(15,4))
print(SetBit(15,5))
print("SetBit16")
print(SetBit(16,0))
print(SetBit(16,1))
print(SetBit(16,2))
print(SetBit(16,3))
print(SetBit(16,4))
print(SetBit(16,5))

#! 4. InvertBit (dec, bit number) - возвращает число
print("InvertBit15")
print(InvertBit(15,0))
print(InvertBit(15,1))
print(InvertBit(15,2))
print(InvertBit(15,3))
print(InvertBit(15,4))
print(InvertBit(15,5))
print("InvertBit16")
print(InvertBit(16,0))
print(InvertBit(16,1))
print(InvertBit(16,2))
print(InvertBit(16,3))
print(InvertBit(16,4))
print(InvertBit(16,5))
