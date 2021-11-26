# минимальный код генерирующий последовательность только 5 символов "ABBCCCDDDDEEEEE"

# list = "A","B","C","D","E"
#c = [c + d for c in 'list' if c != 'i' for d in 'spam' if d != 'a']
#    print(a)

list ="ABCDE"
sum = ""
n = 15
for i in range(1,len(list)+1) :
   sum += i * list[i-1:i]
res = sum[:n]
print(res)