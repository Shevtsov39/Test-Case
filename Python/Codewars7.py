# Description:
# The goal of this exercise is to convert a string to a new string 
# where each character in the new string is "(" if that character appears only once in the original string, 
# or ")" if that character appears more than once in the original string. 
# Ignore capitalization when determining if a character is a duplicate.

def duplicate_encode(word) :
   result = ''
   word = word.lower()
   listOfChars = list(word)
   for char in listOfChars :
      counter = listOfChars.count(char)
      if counter > 1 :
         result += ')'
      else :
         result += '('
   return result

word = 'Success'
result = duplicate_encode(word)
print(result)

#Или 
def duplicate_encode(word):
   return "".join(["(" if word.lower().count(c) == 1 else ")" for c in word.lower()])