import datetime
from datetime import timedelta
import time

startTime = time.time()
oneDay = timedelta(days = 1)
curDate = datetime.date(1, 1, 1)
lastDate = datetime.date(2000, 12, 31)
results = []#list()  
while curDate < lastDate:# datetime.date.today():
    day = curDate.day
    month = curDate.month
    year = curDate.year
    result = (day * 100 + month) * year
    last = str(result)[-1]      #string
    found = True
    for c in str(result)[:-1:1] :     #array
        if c != last:
            found = False
            break
    if found:
        results.append((str(curDate), result))
        #print (curDate, result)
    curDate = curDate + oneDay
print (*results, sep = "\n") 
print(" %s seconds " % (time.time() - startTime))
