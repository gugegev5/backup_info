# 字典
字典是将键(key)映射到值(value)的无序数据结构。值可以是任何值（列表，函数，字符串，任何东西）。键(key)必须是不可变的，例如，数字，字符串或元组。

## 示例
字典：我们查找的单词是key，查找的定义是值
```python
# Defining a dictionary
webstersDict = {
    'person': 'a human being, whether an adult or child', 
    'marathon': 'a running race that is about 26 miles', 
    'resist': ' to remain strong against the force or effect of (something)', 
    'run': 'to move with haste; act quickly'
}
```

## 访问字典中的值
`webstersDict['marathon']`
## 更新字典
```python
webstersDict['shoe'] = 'an external covering for the human foot'
# update method, update or add more than key value pair at a time 
webstersDict.update({'shirt': 'a long- or short-sleeved garment for the upper part of the body'
                     , 'shoe': 'an external covering for the human foot, usually of leather and consisting of a more or less stiff or heavy sole and a lighter upper part ending a short distance above, at, or below the ankle.'})
# Removing key from dictionary
del webstersDict['resist']
```
## 不是所有东西都可以当作Key
下方是错误用法示例
```
webstersDict[['sock']] = 'a short stocking usually reaching to the calf or just above the ankle.'
```
## 使用get（）方法返回给定键的值
你会明白为什么这在字数统计任务中如此有价值
```python
# incorporate into get example and such below. 
storyCount = {'is': 100, 'the': 90, 'Michael': 12, 'runs': 5}
# if key doesnt exist, 
# specify default value for keys that dont exist. 
# returns value for key you enter if it is in dictionary
# else it returns the value you have for default
storyCount.get('Michael', 0)
# When you dont set default value for key that doesnt exist, 
# it defaults to none
print(storyCount.get('run')) # None
```
## 删除键，但同时可以返回值
```
count = storyCount.pop('the')
print(count) # 90
```
## 遍历字典
```python
# return keys in dictionary
print(storyCount.keys()) # ['is', 'runs', 'Michael']

# return values in dictionary
print(storyCount.values()) # [100, 5, 12]

# iterate through keys
for key in storyCount: 
    print(key)
#is
#runs
#Michael

# iterate through keys and values
for key, value in webstersDict.items():
    print(key, value)
```

# 元组
元组是一种序列，就像列表一样。元组和列表之间的区别在于，与列表（可变）不同，元组不能更改（不可变）。
元组使用括号，而列表使用方括号。

## 初始化一个元组
```python
# Way 1 通过让（）没有值来初始化空元组
emptyTuple = ()
# Way 2 使用元组函数初始化空元组
emptyTuple = tuple()

# way 1
z = (3, 7, 4, 2)
# way 2 (tuples can also can be created without parenthesis)
z = 3, 7, 4, 2
```
> tips: 如果要创建仅包含***一个值的元组***，则需要在项目后面添加一个逗号。
```python
# tuple with one value
tup1 = ('Michael',)

# tuple with one value
tup2 = 'Michael', 

# This is a string, NOT a tuple.
notTuple = ('Michael')
```

## 访问元组内的值
python是一种基于零索引的语言。所有这些意味着元组中的第一个值是索引0。
```python
# Initialize a tuple
z = (3, 7, 4, 2)
# Access the first item of a tuple at index 0
print(z[0]) # 3
# print last item in the tuple
print(z[-1]) # 2
```
## 切分元组
```python
# Initialize a tuple
z = (3, 7, 4, 2)
# first index is inclusive (before the :) and last (after the :) is not.
print(z[0:2]) # (3, 7)
# everything up to but not including index 3
print(z[:3]) # (3, 7, 4)
print(z[-4:-1]) # (3, 7, 4)
```

## 元组是不可改变的
可以采用现有元组的一部分来创建新的元组
```python
# Initialize tuple
tup1 = ('Python', 'SQL')

# Initialize another Tuple
tup2 = ('R',)

# Create new tuple based on existing tuples
new_tuple = tup1 + tup2;
print(new_tuple) # ('Python', 'SQL', 'R')
```

# Tuple方法
```python
# Initialize a tuple
animals = ('lama', 'sheep', 'lama', 48)
# index方法返回对应值的第一个索引
print(animals.index('lama')) # 0
# count方法返回值在元组中出现的次数。
print(animals.count('lama')) # 2
# 用for循环遍历元组的项目
for item in ('lama', 'sheep', 'lama', 48):
    print(item)
```
## 元组拆包
元组对序列解包非常有用
```
x, y = (7, 10);
print("Value of x is {}, the value of y is {}.".format(x, y))
```
Value of x is 7, the value of y is 10.
## 枚举
```python
friends = ('Steve', 'Rachel', 'Michael', 'Monica')
for index, friend in enumerate(friends):
    print(index,friend)
```

## 元组相对列表的优势
列表和元组是标准Python数据类型，用于在序列中存储值。元组是不可变的，而列表是可变的  
1. 组比列表更快。如果你要定义一组常量值，那么你将要做的就是迭代它，使用元组而不是列表。可以使用timeit库部分测量性能差异，该库允许您为Python代码计时。下面的代码为每个方法运行代码100万次，并输出所花费的总时间（以秒为单位）。  
```python
import timeit
print('Tuple time: ', timeit.timeit('x=(1,2,3,4,5,6,7,8,9,10,11,12)', number=1000000))
# ('Tuple time: ', 0.01483917236328125)

print('List time: ', timeit.timeit('x=[1,2,3,4,5,6,7,8,9,10,11,12]', number=1000000))
# ('List time: ', 0.12831997871398926)
```
2. 元组可以用作字典键, 列表不可以  
一些元组可以用作字典键（特别是包含不可变值的元组，如字符串，数字和其他元组）。列表永远不能用作字典键，因为列表不是不可变的  
```python
bigramsTupleDict = {('this', 'is'): 23,
                    ('is', 'a'): 12,
                    ('a', 'sentence'): 2}
print(bigramsTupleDict) # {('is', 'a'): 12, ('this', 'is'): 23, ('a', 'sentence'): 2}
```
3. 元组可以是集合中的值, 列表不可以
```python
graphicDesigner = {('this', 'is'),
                   ('is', 'a'),
                   ('a', 'sentence')}
print(graphicDesigner) # set([('is', 'a'), ('this', 'is'), ('a', 'sentence')])
```

### Task: 用Python生成斐波那契序列
Fibonacci序列是一个整数序列，其特征在于前两个之后的每个数字是前两个数字的总和。根据定义，Fibonacci序列中的前两个数字是1和1，或0和1，具体取决于所选择的序列起点，以及每个后续数字是前两个数字的总和。
```python
a,b,c = 1,1,[1,1]
for i in range(8):
    a,b = b,a+b   
    c.append(b)
print('Fib', c) # ('Fib', [1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
```


