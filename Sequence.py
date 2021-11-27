# Минимальный код генерирующий последовательность N символов и возвращающий, указанное нами количество букв. 
# "ABBCCCDDDDEEEEE" => берём 5 симолов => "ABBCC"

list ="ABCDE"
sum = ""
n = 15
for i in range(1,len(list)+1) :
   sum += i * list[i-1:i]
res = sum[:n]
print(res)