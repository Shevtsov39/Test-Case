# Во встроенной библиотеке Python есть модуль collections с удобными дополнительными типами данных:

from collections import OrderedDict, Counter

# Запоминает порядок добавления ключей
x = OrderedDict(a=1,c=3, b=2)
print(x)

# Считает частоту каждого символа ( сколько раз символ повторяется )
y = Counter("Hello!")
print(y)

#?===================================================================================================

#Смайлики

from emoji import emojize

print(emojize(":thumbs_up:"))

#?===================================================================================================

# **kwargs
# Две звёздочки впереди объекта словаря дают возможность передавать в функцию содержимое этого словаря как именованные аргументы.
# Ключи словаря — это имена аргументов, а значения передаются в функцию. Вам даже не обязательно называть его kwargs:

dictionary = {"a": 1, "b": 2}

def some_function(a, b):
    c = a + b
    return c

# Оба варианта делают одно и то же:
print(some_function(**dictionary))
print(some_function(a=1, b=2))

#?===================================================================================================

#* Генераторы списков
# Ещё одна классная особенность Python, дающая возможность быстро создавать списки. 
# Такие выражения позволяют легко писать чистый код, который читается почти как естественный язык:

numbers = [1, 2, 3, 4, 5, 6, 7]
evens = [x for x in numbers if x % 2 == 0]
odds = [y for y in numbers if y not in evens]
print(evens)
print(odds)

cities = ['Лондон', 'Москва', 'Берлин']

def visit(city):
    print("Добро пожаловать в", city)

for city in cities:
    visit(city)

#?===================================================================================================

#* pprint
# С его помощью можно выводить объекты со сложной структурой в читабельном виде.

import requests
import pprint

url = 'https://randomuser.me/api/?results=1'
users = requests.get(url).json()

pprint.pprint(users)

#?===================================================================================================

#* Queue
# Python поддерживает многопоточность, в использовании которой помогает стандартный модуль Queue.
# Он позволяет реализовывать такую структуру данных, как очередь. 
# Очереди позволяют добавлять и извлекать элементы согласно определённому правилу.
# Очереди «первым пришёл — первым ушёл» («first in, first out», FIFO) позволяют извлекать объекты  в порядке их добавления. 
# Из очередей «последним пришёл — первым ушёл» («last in, first out», LIFO) можно извлекать последние добавленные объекты.
# Наконец, приоритетные очереди позволяют извлекать объекты согласно порядку их сортировки.
# Здесь можно посмотреть на пример использования очередей в многопоточном программировании на Python.

#?===================================================================================================

#* sh
# Она позволяет вызывать любую программу как обычную функцию, 
# что полезно для автоматизации различных задач исключительно с помощью Python:

#! import sh

#! sh.pwd()
#! sh.mkdir('new_folder')
#! sh.touch('new_file.txt')
#! sh.whoami()
#! sh.echo('This is great!')

#?===================================================================================================

#* Аннотации типов
# Python — динамически типизированный язык. 
# Вам не нужно указывать тип данных при определении переменных, функций, классов и т.д.
# Это позволяет ускорить процесс разработки. 
# Однако мало что раздражает так сильно, как ошибка времени выполнения, возникшая из-за простого несовпадения типа.

from typing import List

Vector = List[float]
Matrix = List[Vector]

def add_matrix(a: Matrix, b: Matrix) -> Matrix:
    result = []
    for i, row in enumerate(a):
        result_row = []
        for j, col in enumerate(row):
            result_row += [a[i][j] + b[i][j]]
        result += [result_row]
    return result

x = [1, 2]
y = [3, 4]
z = add_matrix(x, y)

# С помощью аннотаций типов код можно сделать более понятным.
# Также они позволяют использовать инструменты для проверки типов, чтобы отлавливать ошибки TypeError.

#?===================================================================================================

#* zip
# Создание словаря из двух списков?

keys = ['a', 'b', 'c']
vals = [1, 2, 3]
zipped = dict(zip(keys, vals))

# Встроенная функция zip() принимает несколько итерируемых объектов и возвращает последовательность  кортежей.
# Каждый кортеж группирует элементы объектов по их индексу.
# Можно провести операцию, обратную zip(), с помощью zip(*).

#?===================================================================================================