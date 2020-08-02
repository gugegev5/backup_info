## For 循环 
For循环是迭代对象元素的常用方法（在第一个示例中，列表）

具有可迭代方法的任何对象都可以在for循环中使用。

python的一个独特功能是代码块不被{} 或begin，end包围。相反，python使用缩进，块内的行必须通过制表符缩进，或相对于周围的命令缩进4个空格。

虽然这一开始可能看起来不直观，但它鼓励编写更易读的代码，随着时间的推移，你会学会喜欢它

## Task
从文本中删除标点符号并将最终产品转换为列表:

On a dark desert highway, cool wind in my hair Warm smell of colitas, rising up through the air Up ahead in the distance, I saw a shimmering light My head grew heavy and my sight grew dim I had to stop for the night There she stood in the doorway; I heard the mission bell And I was thinking to myself, "This could be Heaven or this could be Hell" Then she lit up a candle and she showed me the way

(加州旅馆)

```python
text = '''On a dark desert highway, cool wind in my hair Warm smell of colitas, rising up through the air Up ahead in the distance, I saw a shimmering light My head grew heavy and my sight grew dim I had to stop for the night There she stood in the doorway; I heard the mission bell And I was thinking to myself, "This could be Heaven or this could be Hell" Then she lit up a candle and she showed me the way'''
for char in '-.,;\n"\'':
    text = text.replace(char,' ')
# Split converts string to list.
# Each item in list is split on spaces
text.split(' ')[0:20]
```
result:
['On',
 'a',
 'dark',
 'desert',
 'highway',
 `''`,
 'cool',
 'wind',
 'in',
 'my',
 'hair',
 'Warm',
 'smell',
 'of',
 'colitas',
 `''`,
 'rising',
 'up',
 'through',
 'the']
 
### Continue
continue语句将转到循环的下一次迭代

continue语句用于忽略某些值，但不会中断循环

### Break
break语句将完全打断循环

### Task (顺道介绍一下Range函数)
编写一个Python程序，它迭代整数从1到50（使用for循环）。对于偶数的整数，将其附加到列表even_numbers。对于奇数的整数，将其附加到奇数奇数列表中
```python
# Making empty lists to append even and odd numbers to. 
even_numbers = []
odd_numbers = []

for number in range(1,51):
    if number % 2 == 0:
        even_numbers.append(number)
    else: 
        odd_numbers.append(number)   
```

### Python 2 vs Python 3 (Range函数的不同点)
python 2 xrange and Python 3 range are same (resembles a generator)

python 2 range生成一个list

注意: 较长的列表会很慢

<b> 更多参考: </b> [pythons-range-function-explained](http://pythoncentral.io/pythons-range-function-explained/)
