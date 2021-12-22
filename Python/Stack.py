# Дан список значений(или температур). Найти ближайшее наибольшее число для каждого числа в списке.
# Указать через сколько позиций будет наибольшее число.

def CheckTemperature(array) :
   resultList = []
   for i in array :
      for j in array[array.index(i)+1:] :
         if i < j :
            index = array.index(j) - array.index(i)
            resultList.append(index)
            break
      else :
         resultList.append(0)
   return resultList

#list = [13,12,15,11,9,10,16]
#list = [1,2,3,4,5,6,7]
#?list = [7,6,5,8,4,3,2,1,5]
#list = [9,8,5,10,11,10,16,14]
list = [10,9,8,7,6,11]
print(CheckTemperature(list))
# array[array.index(i)+1:]