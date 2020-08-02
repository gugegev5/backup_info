# Python面向对象编程

在本文中，您将学习Python中的OOP的以下基本概念：

* Python类
* 对象实例
* 定义和使用方法
* OOP继承

## 如何在Python中定义类
```
class Dog:
    pass
```
首先使用class关键字指示您正在创建一个类，然后添加该类的名称（使用骆驼命名法，以大写字母开头。）

另外，我们在这里使用了Python关键字pass。这经常被用作代码最终会占用的占位符。它允许我们运行此代码, 而不会抛出错误。
>注意：上面的代码在Python 3上是正确的。在Python 2.x（“遗留Python”）上，您将使用稍微不同的类定义：
>```
>＃ Python 2.x类定义：
>class Dog（object）：
>    Pass
>```
>括号中的（对象）部分指定了您继承的父类（更多内容见下文。）在Python 3中，这不再是必需的，因为它采用隐式默认值。

## 实例属性
所有类都需要创建对象，所有对象都包含称为属性的特征（在开头段落中称为属性）。使用__init __（）方法通过为对象的初始属性提供其默认值（或状态）来***初始化***（例如，指定）对象的初始属性。此方法必须至少有一个参数以及自变量，它引用对象本身（例如，Dog）。
```
class Dog:

    # Initializer / Instance Attributes
    def __init__(self, name, age):
        self.name = name
        self.age = age
```

## 类属性

虽然实例属性特定于每个对象，但类属性对于所有实例都是相同的 - 在这种情况下，属性都来自狗。

```
class Dog:

    # Class Attribute
    species = 'mammal'

    # Initializer / Instance Attributes
    def __init__(self, name, age):
        self.name = name
        self.age = age

```

## 实例化对象
实例化是创建一个新的，唯一的类实例的意思。

```
>>> class Dog:
...     pass
...
>>> Dog()
<__main__.Dog object at 0x1004ccc50>
>>> Dog()
<__main__.Dog object at 0x1004ccc90>
>>> a = Dog()
>>> b = Dog()
>>> a == b
False
>>> type(a)
<class '__main__.Dog'>


class Dog:

    # Class Attribute
    species = 'mammal'

    # Initializer / Instance Attributes
    def __init__(self, name, age):
        self.name = name
        self.age = age
# Instantiate the Dog object
philo = Dog("Philo", 5)
mikey = Dog("Mikey", 6)
# Access the instance attributes
print("{} is {} and {} is {}.".format(
    philo.name, philo.age, mikey.name, mikey.age))
# Is Philo a mammal?
if philo.species == "mammal":
    print("{0} is a {1}!".format(philo.name, philo.species))
>>> Philo is 5 and Mikey is 6.
>>> Philo is a mammal!
```

## 练习
>用相同的Dog类，实例化三只新狗，每只狗的年龄不同。然后编写一个名为get_biggest_number（）的函数，它接受任意数量的年龄并返回最旧的函数。然后输出最老的狗的年龄.
```python
class Cat:
    def __init__(self, name, *age):
        self.name = name;
        self.age = max(age);
cat = Cat('nancy', 18,13,15);
print('{} is {}'.format(cat.name, cat.age))
```

## 实例方法

实例方法在类中定义，用于获取实例的内容。

它们还可用于使用对象的属性执行操作。与__init__方法一样，第一个参数始终是self：
```python
class Dog:

    # Class Attribute
    species = 'mammal'

    # Initializer / Instance Attributes
    def __init__(self, name, age):
        self.name = name
        self.age = age

    # instance method
    def description(self):
        return "{} is {} years old".format(self.name, self.age)

    # instance method
    def speak(self, sound):
        return "{} says {}".format(self.name, sound)

# Instantiate the Dog object
mikey = Dog("Mikey", 6)

# call our instance methods
print(mikey.description())
print(mikey.speak("Gruff Gruff"))
#Mikey is 6 years old
#Mikey says Gruff Gruff
```

## Python对象继承 / 覆盖父类的功能
```
class Dog:
    species = 'mammal'

class SomeBreed(Dog):
    pass

class SomeOtherBreed(Dog):
     species = 'reptile'

frank = SomeBreed()
print(frank.species)

beans = SomeOtherBreed()
print(beans.species)

print(isinstance(beans, Dog)) # True
print(issubclass(SomeOtherBreed, Dog)) # True
```
