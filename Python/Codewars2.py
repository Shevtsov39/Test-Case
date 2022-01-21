
# def unique_in_order(sequence) :
#    list = []
#    sequence = [c for c in sequence]
#    for i in sequence :
#       j = sequence[sequence.index(i)+1]
#       while i == j :
#          sequence.remove(j)
#          continue
#    return sequence

# def unique_in_order(sequence) :
#    list = []
#    sequence = [c for c in sequence]
#    for i in sequence :
#       u = sequence.index(i)
#       j = sequence[sequence.index(i)+1]
#       # if sequence.index(i) > 0 :
#       f = sequence[sequence.index(i)+2]
#       v = sequence[sequence.index(i)+3]
#       if i == f and i == j and i == v :
#          sequence.remove(j)
#          sequence.remove(f)
#          sequence.remove(v)
#       elif i == j and i == f :
#          sequence.remove(j)
#          sequence.remove(f)
#       elif i == j and i != f :
#          sequence.remove(j)
#       elif i == f and i != j :
#          continue
#    return sequence

# def unique_in_order(sequence) :
#    sequence = [c for c in sequence]
#    list = []
#    counter = 0
#    for j in sequence :
#       for i in sequence[1:] :
#          list.append(j)
#          counter += 1
#          if len(list) > 1 and list[list.index(j)-1] == j :
#             list.remove(j)
#          else :
#             continue
#    return list 

# def unique_in_order(sequence) :
#    sequence = [c for c in sequence]
#    for i in sequence :
#       for j in sequence[1:] :
#          if i == j :
#             sequence.remove(i)
#    return sequence

# def unique_in_order(sequence) :
#    sequence = [c for c in sequence]
#    list = []
#    counter = -1
#    for i in sequence :
#       counter += 1
#       j = sequence[sequence.index(i) + 1]
#       if i == j :
#          list.append(i)
#    return list

def unique_in_order(sequence) :
   sequence = [c for c in sequence]
   for i in range(len(sequence)) :
      j = sequence[i + 1]
      a = sequence[i]
      b = sequence[sequence.index(j)]
      if a == b :
         sequence.remove(sequence[i])
   return sequence

sequence = 'ABAAAABBCCCDAEEEEEEEE'
result = unique_in_order(sequence)
print(result)
