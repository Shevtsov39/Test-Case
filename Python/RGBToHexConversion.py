# The rgb function is incomplete. Complete it so that passing in RGB decimal values will result in a hexadecimal representation being returned. 
# Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.
# Note: Your answer should always be 6 characters long, the shorthand with 3 will not work here.

def rgb(r, g, b):
   if r < 0 or g < 0 or b < 0 :
      if r < 0 :
         r = 0
      if g < 0 :
         g = 0
      if b < 0 :
         b = 0
   if r > 255 or g > 255 or b > 255 :
      if r > 255 :
         r = 255
      if g > 255 :
         g = 255
      if b > 255 :
         b = 255
   r = hex(r)[2:]
   g = hex(g)[2:]
   b = hex(b)[2:]
   if len(r) < 2 :
      r = str(0)+str(r)
   if len(g) < 2 :
      g = str(0)+str(g)
   if len(b) < 2 :
      b = str(0)+str(b)
   result = str(r) + str(g) + str(b).upper()
   return result.upper()

result = rgb(1, 2, 3 )
print(result)