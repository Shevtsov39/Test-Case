# Fn = Fn-1 + Fn-2
# и F1 = F2 = 1

def Fiban1 ( border , c , v ) :
   a = b = 1
   list = []
   for i in range ( border ) :
      c = a + b
      a = b
      b = c
      list.append( b )
   return list

a = 0
b = 1
c = 1
border = 10
result = Fiban1 ( border , c , a )
print ( result )

#* 1) 0 + 1 = 1
#* 2) 1 + 1 = 2
#* 3) 1 + 2 = 3
#* 4) 2 + 3 = 5
#* 5) 3 + 5 = 8
#* 6) 5 + 8 + 13
#* 7) 8 + 13 = 21


