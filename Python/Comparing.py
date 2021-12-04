# Вызываю .lower(). Использую это при сравнении двух строк, чтобы игнорировать регистр.

string1 = "h"
string2 = "H"
comparison = string1.lower() == string2.lower()
print(comparison)

#

firstStr = "ehHaL"
secStr = "EHhAl"
if firstStr.lower() == secStr.lower():
   print('Both strings are same')
else:
   print('Strings are not same')