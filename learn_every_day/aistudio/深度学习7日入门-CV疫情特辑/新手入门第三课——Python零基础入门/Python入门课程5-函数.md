# 函数

## Python中的函数是什么？
在Python中，function是一组执行特定任务的相关语句。

函数有助于将我们的程序分解为更小的模块化块。随着我们的计划越来越大，功能使其更加有条理和易于管理。

此外，它避免重复并使代码可重用

## 创建函数的语法
```
def function_name(parameters):
	"""docstring"""
	statement(s)    
```

## 文档字符串
函数头之后的第一个字符串称为docstring，是文档字符串的缩写。它用于简要解释函数的作用。

在上面的示例中，我们在函数头的正下方有一个docstring。我们通常使用`三引号`，以便docstring可以扩展到多行。我们可以将此字符串作为函数的__doc__属性使用。

例如：` print(greet.__doc__)`

## 返回语句
return语句用于退出函数并返回到调用函数的位置。如下:
```
return [expression_list]
```
此语句可以包含要求求值的表达式，并返回值。如果语句中没有表达式，或者函数内部不存在return语句本身，则该函数将返回None对象。

## 变量的范围和寿命
变量的范围是程序中识别变量的部分。函数内定义的参数和变量在外部不可见。因此，它们具有局部范围。

变量的生命周期是变量在存储器中退出的时间段。函数内部变量的生命周期与函数执行的时间一样长。

一旦我们从函数返回它们就会被销毁。因此，函数不记得先前调用的变量值。

## 参数
1. 固定数量的参数  
2. 可变数量参数
```python
# 默认参数(放最后)
def greet(name, msg = "Good morning!"):
   print("Hello",name + ', ' + msg)
   
# 关键字参数
# 关键字参数必须放在位置参数后面, 在关键字参数之后使用位置参数将导致错误。
# 2 keyword arguments
greet(name = "Bruce",msg = "How do you do?")
# 2 keyword arguments (out of order)
greet(msg = "How do you do?",name = "Bruce") 
# 1 positional, 1 keyword argument
greet("Bruce",msg = "How do you do?") 

# 任意参数
def greet(*names):
   """This function greets all
   the person in the names tuple."""

   # names is a tuple with arguments
   for name in names:
       print("Hello",name)
greet("Monica","Luke","Steve","John")
```
