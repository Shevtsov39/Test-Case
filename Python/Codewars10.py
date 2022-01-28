# Simple, given a string of words, return the length of the shortest word(s).
# String will never be empty and you do not need to account for different data types.

def find_short(s):
   length = []
   splitString = s.split(' ')
   for word in splitString :
      length.append(len(word))
      length.sort()
   return length[0]

s = 'privet i am senya'
result = find_short(s)
print(result)