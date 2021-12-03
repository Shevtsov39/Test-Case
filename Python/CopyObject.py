import datetime
from datetime import timedelta
import time
class student :
   def __init__(self,name,age) :
       self.name = name
       self.age = age
Vasya = student("Vasya",21)
Petya = student(Vasya.name, Vasya.age)
Vasya.age = 30
Petya.name = "Petya"
print(Vasya.age, Vasya.name)
print(Petya.age, Petya.name)
curDate = datetime.date(2021 , 1 , 1)
newDate = curDate
curDate += timedelta(days = 1)
print(curDate, newDate)

