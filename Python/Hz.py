# def function(a):
#     N = len(a)
#     for i in range(N-1):
#         for j in range(N-i-1):
#             if a[j] > a[j+1]:
#                 a[j], a[j+1] = a[j+1], a[j]
#             else :
#                print(a[j])
#                print(a[j+1])
#     return a

# b = ["B","R","Y","A","R","I","Z"]
# print(function(b))

def function(array):
   for i in range(len(array) - 1):
      m = i
      j = i + 1
      while j < len(array):
            if array[j] < array[m]:
               m = j
            j = j + 1
            print(array[m])
      array[i], array[m] = array[m], array[i]
   return array

b = [3,66,9,5,64,1]
print(function(b))


