# Complete the solution so that it splits the string into pairs of two characters. 
# If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').

import re

def solution(s):
   chars = list(s)
   evenOrOdd = len(chars)%2
   if evenOrOdd == 0 :
      pairs = re.findall(r'\w\w', s)
   elif evenOrOdd == 1 :
      lastWord = chars[-1] + '_'
      pairs = re.findall(r'\w\w', s)
      pairs.append(lastWord)
   return pairs

s = 'language'
result = solution(s)
print(result)