# TASK: Implement the "validate" function based on (but not limited to) the provided test cases:
# expect('some-string'.validate('!empty')).toEqual(true)
# expect('some-string'.validate('length>30')).toEqual(false)
# expect('some-string'.validate('!length<=10')).toEqual(true)
# expect('some-string'.validate('length=3')).toEqual(false)
# expect('some-string'.validate(/^.*-s/i)).toEqual(true)

import re

def validate(string,condition) :
      digit = re.findall('[\d]+[.,\d]+|[\d]*[.][\d]+|[\d]+',condition)              #Поиск числа в строке(с точкой, запятой или целое)
      print(digit)
      symbol = re.findall('[^\w]+',condition)                                           #Для поиска символов как вариант
      # print(symbol)
      word = re.findall('\w+[^0-9><!=]',condition)                                  #Ищем слово
      # print(word)
      if symbol[0] == '!' and word[0] == 'empty' and digit[0] != 1 :
         stringLength = len(string)
         if stringLength > 0 :
            return True
         else :
            return False
      if symbol[0] == '>' and word[0] == 'length' :  
         stringLength = len(string)
         if stringLength > int(digit[0]) :
            return True
         else :
            return False
      if symbol[0] == '!' and word[0] == 'length' :
         stringLength = len(string)
         if stringLength >= int(digit[0]) :
            return True
         else :
            return False
      if word[0] == 'length' :
         stringLength = len(string)
         if stringLength == int(digit[0]) :
            return True
         else :
            return False

# print(validate('привет я Сеня','!empty'))
# print(validate('привет я Сеня','length>30'))
# print(validate('привет я Сеня','!length<=10'))
# print(validate('привет я Сеня','length=3'))

def validate2(string,condition) :

   stringLength = len(string)
   withoutDigit = re.findall('[\D]+',condition)                                      #Строка без числа 
   digit = re.findall('[\d]+[.,\d]+|[\d]*[.][\d]+|[\d]+',condition)                  #Поиск числа в строке(с точкой, запятой или целое)
   symbol = re.findall('[^\w]+',condition)                                           #Для поиска символов как вариант

   allVar = ["!length>","!length<","!length>=","!length<=","!length=","length>","length<","length>=","length<=","length="]
   emptyVar = ["!empty","empty"]

   for i in allVar :
      if i != withoutDigit[0] :
         continue
      elif i == withoutDigit[0] :
         if symbol[0] == '>' :
            if stringLength > int(digit[0]) :
               return False
            elif stringLength < int(digit[0]) :
               return True
         elif symbol[0] == '!' :
            if stringLength > int(digit[0]) :
               return True
            elif stringLength < int(digit[0]) :
               return False
         elif symbol[0] == '<' :
            if stringLength < int(digit[0]) :
               return True
            elif stringLength > int(digit[0]) :
               return False
         elif symbol[0] == '!' :
            if stringLength < int(digit[0]) :
               return False
            elif stringLength > int(digit[0]) :
               return True
         elif symbol[0] == '>=' :
            if stringLength >= int(digit[0]) :
               return True
            elif stringLength <= int(digit[0]) :
               return False
         elif symbol[0] == '!' :
            if stringLength >= int(digit[0]) :
               return False
            elif stringLength <= int(digit[0]) :
               return True
         elif symbol[0] == '<=' :
            if stringLength <= int(digit[0]) :
               return True
            elif stringLength >= int(digit[0]) :
               return False   
            # elif symbol[0] == '!' :
            #    return False
         elif symbol[0] == '=' :
            if stringLength == digit[0] :
               return True
            elif stringLength != digit[0] :
               return False
            elif symbol[0] == '!' :
               return False
      else :
         for j in emptyVar :
            if j == withoutDigit[0] :
               if len(symbol) == 0 :
                  return False
               else :
                  if stringLength != 0 :
                     return True
      
# print(validate2('привет я Сеня','empty'))
print(validate2('привет я Сеня','length>30'))
print(validate2('привет я Сеня','length<=10'))
print(validate2('привет я Сеня','length>3'))
