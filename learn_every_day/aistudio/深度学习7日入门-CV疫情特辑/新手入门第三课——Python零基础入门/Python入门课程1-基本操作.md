## 目录

<ul>
  <li>Hello World!</li>
  <li>字符串操作  </li>
  <li>简单数学计算</li>
  <li>if elif else</li>
  <li>循环</li>
  <li>小测试</li>
</ul>

## 为什么学Python

简单方便代码少. 不用太关注类型, 声明等琐事. 使用灵活, 第三方支持包也多. 

所有的深度学习框架一般都有一个Python版的接口. 

## 为什么使用IPython/Jupyter

IPython Notebook号称  “编码器的实验室笔记本” - 允许用户在单个基于浏览器的页面中交叉显示/执行数据，代码和说明文本，而不是在单独的文件中

## 基础类型


python中的主要基本数据类型是数字（整数和浮点数），布尔值和字符串

### Hello World!

```python
# This is a one line comment
# Strings can be enclosed by ',", or """
print('Hello World!')

# \ is used as a escape character. 
# There are many special escape sequences
# Notable are: \t (tab)
#             \n (new line)
print("The \n makes a new line")
print('I\'m going to the movies')
# Using \ to not accidently close the string by having a closing "
print("This is a string enclosed by \"\" not '' ")

# Creating a variable
# Variables are used to store information to be referenced 
# and manipulated in a computer program.
firstVariable = 'Hello World'
print(firstVariable)
```

### 字符串操作
字符串是python的特殊类型。作为对象，在类中，您可以使用.methodName（）表示法调用字符串对象上的方法。字符串类在python中默认可用，因此您不需要import语句即可将对象接口用于字符串。
```python
# go over ? mark after if you are not sure what method does. 
print(firstVariable.lower())
print(firstVariable.upper())
print(firstVariable.title())

# To look up what each method does
firstVariable.lower?
# Can also use help
help(firstVariable.lower)

firstVariable.split(' ') # ['Hello', 'World']

a=firstVariable.split(' ')
' '.join(a) # 'Hello World'

print("0" + "1") # 01
"0" * 3 # '000'
# You can add strings together. 
"Fizz" + "Buzz"
```

## 基础数学
有四种不同的数字类型：普通整数，长整数，浮点数和复数。另外，布尔值是普通整数的子类型。
```python
# Addition, add two int together
1+1
# if one of the operands is a float, the result is a float.
130-2.0  # 128.0
130-2 # 128
# integer division
130/2 # 65
130.0/2 # 65.0
# Multiplication
2*3 # 6
# Exponentiation ** 
# This operator raises the number to its left to the power of the number to its right 
2**3 # 8
# Modulo
# Returns the remainder of the division of the number to the left by the number on its right. 
9%3 # 0
```

## if 语句
比较操作符 | 功能
--- | --- 
< | 小于
<= | 小于或等于
\> | 大于
\>= | 大于或等于
== | 等于
!= | 不等于

检查某些东西是否为True，如果是，则执行此操作。如果它不是True（False），则不执行
```python
# Notice you have to indent after you start a if statement. 
num = 3
if num == 3: 
    print(num) # 3
```
逻辑操作符 | 描述
--- | ---
and | 如果两个操作数均为True，则condition变为True.
or | 如果两个操作数中的任何一个为True，则condition变为True. 
not | 用于反转逻辑（不是False变为True，而不是True变为False
```
num = 4
# both the conditions are true, so the num will be printed out
if num > 0 and num  < 15:
    print(num)
if num > 0 or num  > 15:
    print(num)
not num < 20 # False
```

## else 语句
必须在if或elif语句之后。最多可以有一个其他声明。仅当上面的所有“if”和“elif”语句都为False时才会执行
```python
num = 1
if num > 3 :
    print("Hi")
else: 
    print("number is not greater than 3")
```

## elif 语句
必须在if语句之后。 elif语句语句允许您检查True的多个表达式，并在其中一个条件求值为True时立即执行代码块。

## 列表
```
# Defining a list
z = [3, 7, 4, 2]
z[-1] # 2
z[-2] # 4
```
### 切分列表
```
z[0:2] # [3, 7]
# everything up to index 3
z[:3] # [3, 7, 4]
# index 1 to end of list
z[1:] # [7, 4, 2]
```
### 取列表的最大值, 最小值, 长度, 以及总和
`print(min(z), max(z), len(z), sum(z))`
### 对列表中对象出现次数进行统计
```
random_list = [4, 1, 5, 4, 10, 4]
random_list.count(4)
```
### 返回列表第一个指针
```
#index(...)
#    L.index(value, [start, [stop]]) -> integer -- return first index of value.
#    Raises ValueError if the value is not present.
    
random_list.index(4, 3) # 3
random_list.index(4, 5, 6) # 5
```
### 对列表进行排序
```
# sort(...)
#   L.sort(cmp=None, key=None, reverse=False) -- stable sort *IN PLACE*;
#   cmp(x, y) -> -1, 0, 1
x = [3, 7, 2, 11, 8, 10, 4]
y = ['Steve', 'Rachel', 'Michael', 'Adam', 'Monica', 'Jessica', 'Lester']
# Sorting and Altering original list
# low to high
x.sort()
print(x) # [2, 3, 4, 7, 8, 10, 11]
# Sorting and Altering original list
# high to low
x.sort(reverse = True)
print(x) # [11, 10, 8, 7, 4, 3, 2]
# Sorting and Altering original list
# A-Z
y.sort()
print(y) # ['Adam', 'Jessica', 'Lester', 'Michael', 'Monica', 'Rachel', 'Steve']
# Sorting and Altering original list
# Z-A
y.sort(reverse = True)
print(y) # ['Steve', 'Rachel', 'Monica', 'Michael', 'Lester', 'Jessica', 'Adam']
```

### 在列表结尾添加一个对象
```
x.append(3)
print(x)
```
### 删除列表中一个对象/指定位置的对象
```
print(x) # [11, 10, 8, 7, 4, 3, 2, 3]
x.remove(10)
print(x) # [11, 8, 7, 4, 3, 2, 3]
# Remove item at the index
# this function will also return the item you removed from the list
# Default is the last index
x.pop(3) # 4
```

### 合并列表
通过在末尾续加的方式来延长列表
```
x.extend([4, 5]) # [11, 8, 7, 3, 2, 3, 4, 5]
# lists can be diverse, each element in the list can be of a different type.
# lists are really list of pointers, and these pointers can 
# point to anything.

# Concatenating Lists
print('x+y=',x+y) # ('x+y=', [11, 8, 7, 3, 2, 3, 4, 5, 'Steve', 'Rachel', 'Monica', 'Michael', 'Lester', 'Jessica', 'Adam'])
```
### 在列表指定位置前插入对象
```
x # [11, 8, 7, 3, 2, 3, 4, 5]
x.insert(4, [4, 5]) # 
x # [11, 8, 7, 3, [4, 5], [4, 5], 2, 3, 4, 5]

#Help on built-in function insert:
#insert(...)
#    L.insert(index, object) -- insert object before index
```
