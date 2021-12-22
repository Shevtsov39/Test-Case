# def ProgressBar(max,current) :
#    #x = 'x'
#    #dig = num/position
#    n = 'x'*int(max/current)
#    return n

# print(ProgressBar(500,490))

# from time import sleep
# from sys import stdout

# JUMP_LEFT_SEQ = '\u001b[100D'
# DELAY = 1.1

# def loading():
#     for i in range(0, 101):
#         sleep(DELAY)
#         print(JUMP_LEFT_SEQ, end='')
#         print(f'Progress: {i:0>3}%', end='')
#         stdout.flush()
#     print()

# loading()

import sys

def progressbar(it, prefix="", size=60, file=sys.stdout):
    count = len(it)
    def show(j):
        x = int(size*j/count)
        file.write("%s[%s%s] %i/%i\r" % (prefix, "#"*x, "."*(size-x), j, count))
        file.flush()        
    show(0)
    for i, item in enumerate(it):
        yield item
        show(i+1)
    file.write("\n")
    file.flush()

import time

for i in progressbar(range(15), "Computing: ", 40):
    time.sleep(0.1) # any calculation you need