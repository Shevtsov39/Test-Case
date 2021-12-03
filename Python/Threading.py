import threading 

def increment(threadName):
   global count
   print (threadName, "start value is", count)
   for i in range(0,10):
      count += 1
      print (threadName, "current value is", count)

count = 0
t1 = threading.Thread(args=("Thread_1",), target=increment  )
t2 = threading.Thread(args=("Thread_2",), target=increment  )
t1.start() 
t2.start()
print ("Thread_0 value is", count)