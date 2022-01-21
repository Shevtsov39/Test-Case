# Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k
# If it is the case we will return k, if not return -1.
# Note: n and p will always be given as strictly positive integers.

def dig_pow(n, p) :
   sum = 0
   sum1 = ''
   digits = []
   while n > 0:   
      digits.append(n % 10)
      n = n // 10
   digits = digits[::-1]
   for i in digits :
      sum1 += str(i)
      sum += i**p
      p += 1
   result = sum//int(sum1)
   if result == 0 :
      return -1
   return result

n = 46288
p = 3
result = dig_pow(n, p)
result1 = dig_pow(92, 1)
result2 = dig_pow(695, 2)
result3 = dig_pow(89, 1)
result4 = dig_pow(3263, 1)
print(result)
print(result1)
print(result2)
print(result3)
print(result4)