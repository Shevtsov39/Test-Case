import time  

firstSec = time.time()              
for y in range (1,2000) :
    for m in range (1,12) :
        if m < 10 :
           month = str(0) + str(m)
        for d in range (1,30) :
            dm = str(d) + str(month)
            sum = int(dm) * int(y)
            length = len(str(sum))
            characters = list(str(sum))
            first = characters[0:1]  
            first = first[0]              
            flag = True
            for n in characters :
                if  n != first :
                    flag = False
                    break  
            if flag == True :
               print(d,"-", month,"-",y,"=",sum)
secondSeconds = time.time()  
result = secondSeconds - firstSec   
print("Время выполнения задачи", result)