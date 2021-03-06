# 3)Напишите программу для анализа зарплат сотрудников отдела.
# В отделе 10 человек с разной зарплатой. Напишите программу, для анализа зарплат сотрудников отдела.
#   1) Напишите функцию, возвращающую сумму зарплат всего отдела за год.
# Напишите функцию getAnnualSalary(), возвращающую сумму зарплат всех сотрудников за год на основе массива salary.
#   2) Напишите функцию для получения массива зарплат сотрудников по номеру месяца.
# Напишите функцию getMonthlySalary(), которая получает в качестве параметра номер месяца и возвращает массив зарплат сотрудников в этом месяце на основе массива salary. 
# Номер месяца не совпадает с номером индекса.
#   3) 
# Напишите функцию, возвращающую сумму зарплат за квартал.
# Напишите функцию getQuarterSalary(), которая получает в качестве параметра номер квартала (1, 2, 3 или 4) 
# и возвращает сумму зарплат всех сотрудников отдела за этот квартал на основе массива salary. 
# salary = [
#     [60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60],
#     [75, 75, 75, 75, 75, 75, 70, 77, 75, 75, 70, 75],
#     [150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 180],
#     [65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65],
#     [80, 80, 80, 80, 80, 80, 80, 105, 105, 105, 105, 105],
#     [65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65],
#     [80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 120],
#     [65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65],
#     [80, 80, 80, 80, 80, 80, 80, 90, 90, 90, 90, 90],
#     [75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 70, 75]
# ];

def getAnnualSalary(salary) :
   sum = 0
   for index1 in range(10) :
      for index2 in range(12) :
         sum = sum + salary[index1][index2]
   return sum

def getMonthlySalary(monthNumber,salary) :
   monthSalary = []
   for index1 in range(10) :
      monthSalary.append(salary[index1][monthNumber - 1])
   return monthSalary

def getQuarterSalary(quarterNumber) :
   forQuarter = 0
   if quarterNumber == 1 :
      from1 = 0
      to = 3
   elif quarterNumber == 2 :
      from1 = 3
      to = 6
   elif quarterNumber == 3 :
      from1 = 6
      to = 9
   elif quarterNumber == 4 :
      from1 = 9
      to = 12
   for index1 in range(10) :
      for index2 in range(from1,to) :
         forQuarter = forQuarter + salary[index1][index2]
   return forQuarter


salary = [
    [60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60, 60],
    [75, 75, 75, 75, 75, 75, 70, 77, 75, 75, 70, 75],
    [150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 150, 180],
    [65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65],
    [80, 80, 80, 80, 80, 80, 80, 105, 105, 105, 105, 105],
    [65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65],
    [80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 120],
    [65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65, 65],
    [80, 80, 80, 80, 80, 80, 80, 90, 90, 90, 90, 90],
    [75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 70, 75]
]
result1 = getAnnualSalary(salary)
print(result1)

monthNumber = 6
result2 = getMonthlySalary(monthNumber,salary)
print(result2)

quarterNumber = 1
result3 = getQuarterSalary(quarterNumber)
print(result3)
