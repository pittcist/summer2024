# Day 3 Python
# 2024-07-10

# Comment/Uncomment
# Mac: command-/
# Windows: ctrl-/

import math

print("Hello World")

# Variable
a = 123
b = 234
c = a + b
print("{0} + {1} = {result}".format(a, b, result = c))

r = 10
area = math.pi * r ** 2
print("Area = {area}".format(area = area))

# String
s = "Hello World"
print(s)
print(s[0])
print(s[4])
print(s[::-1])
print(len(s))

print(math.sqrt(10))

# List - sqaure brackets - mutable
# Tuple - pathentheses - immutable

numbers_1 = [1, 2, 3, 4, 5]  # List
numbers_2 = (1, 2, 3, 4, 5)  # Tuple

numbers_1[0] = 100
# numbers_2[0] = 100 # 'tuple' object does not support item assignment

print(numbers_1)
print(numbers_2)

# Python loops

for item in numbers_1:
    print(item)

# If statement

a = 10
if a % 2 == 0:
    print("This is an even number.")
else:
    print("This is an odd number,")

# Random numbers

import random
ran_numbers = []
for i in range(0, 100):
    r = random.random()
    ran_numbers.append(r)

for item in ran_numbers:
    print(item)

# Dictionary
d = {"key":"value", "food":"apple", "people":"xiaoming", "vehicle":"telsa"}
for k,v in d.items():
    print("{key}: {value}".format(key = k,value = v))

# pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pandas