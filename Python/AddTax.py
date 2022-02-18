
#1. Напишите функцию, которая получает массив цен без НДС и возвращает массив цен с НДС.
# Создайте функцию addTax(). Передайте в неё данный массив price с ценами без НДС. 
# С помощью функции addTax() создайте массив с ценами с НДС. НДС cоставляет 20%.
# Коментарий: Создайте функцию addTax().
# Создайте функцию addTax(). С помощью неё создайте массив цен с НДС.

def addTax(price,tax) :
   taxArray = []
   for digit in price :
      withTax = digit*(tax/100)+digit
      taxArray.append(withTax)
   return taxArray


tax = 20
price = [200,700,170,990,1560]
result = addTax(price,tax)
print(result)