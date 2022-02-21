
# Напишите программу для подсчёта чётных и нечётных чисел в массиве чисел.
# Напишите функцию countEvensAndOdds(), которая получает в качестве параметра массив чисел и возвращает сообщение с информацией о том, сколько в массиве чётных и нечётных чисел.
# Функция возвращает сообщение вида «В массиве 4 чётных и 2 нечётных чисел».

def countEvensAndOdds(array) :
   evens = 0
   odds = 0
   for digit in array :
      flag = digit%2
      if flag == 0:
         evens += 1
      else :
         odds += 1
   return evens,odds

array = [17,3,165,77,89,345,19,547,877]
evens,odds = countEvensAndOdds(array)
print('В массиве',evens,'чётных и',odds,'нечётных чисел')