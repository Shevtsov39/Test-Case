# Return the number (count) of vowels in the given string.
# We will consider a, e, i, o, u as vowels for this Kata (but not y).
# The input string will only consist of lower case letters and/or spaces.

def vowelsCounter(string) :
   vowels = 'aeuio'
   counter = 0
   for i in list(vowels) :
      counter += string.count(i)
   return counter

string = 'vsem privet'
result = vowelsCounter(string)
print(result)