#Напишите программу, которая запрашивает  у пользователя ввод пяти числовых элементов, записывает их в массив и выводит в консоль наименьшее из чисел.
#1) Попросите пользователя ввести пять чисел через запятую и сохраните их в массив.
#2) Определите и выведите наименьший из элементов.

def SmallestNumber() :
   secArray = []
   array = input('Введите пять случайных чисел через запятую: ').split(',')
   for i in array :
      secArray.append(float(i))
   result = minim(secArray)
   return result

def minim(array) :
   for ind in range(len(array) - 1) :
      if array[ind] > array[ind + 1] :
         array[ind],array[ind + 1] = array[ind + 1], array[ind]
         minim(array)
   return array[0]

result = SmallestNumber()
print(result)