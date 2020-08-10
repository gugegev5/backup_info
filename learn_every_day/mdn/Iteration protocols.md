# [Iteration protocols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#The_iterator_protocol)

As a couple of additions to ECMAScript 2015, Iteration protocols aren't new built-ins or syntax, but protocols. These protocols can be implemented by any object by simply following some conventions.

There are two protocols: [The iterable protocol]() and [the iterator protocol]().

## The iterable protocol
allows JavaScript objects to define or customize their iteration behavior, such as what values are looped over in a for...of construct

In order to be iterable, an object must implement the `@@iterator` method, meaning that the object (or one of the objects up its prototype chain) must have a property with a @@iterator key which is available via constant [Symbol.iterator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator):

| Property | Value |
|-|-|
| [Symbol.iterator] | A zero-argument function that returns an object, conforming to the [iterator protocol](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#The_iterator_protocol). |

当 iterable object iterated时，调@@iterator，返回***iterator***   
Symbol.iterator内部`this`指向iterable object自己    

This function can be an ***ordinary function***, or it can be a ***generator function***   

## The iterator protocol
1. a standard way to produce a sequence of values(either finite or infinite),   
2. potentially a return value when all values have been generated.   

| Property | Value |
|-|-|
| next() |	A zero-argument function that returns an object with at least the following two properties:|
| next()返回值 | The next() method must always return an object with appropriate properties including `done` and `value`. If a non-object value gets returned (such as false or undefined), a TypeError ("iterator.next() returned a non-object value") will be thrown. |

1. done (:boolean)
 * Has the value false if the iterator was able to produce the next value in the sequence. (This is equivalent to not specifying the done property altogether.)
 * Has the value true if the iterator has completed its sequence. In this case, value optionally specifies the return value of the iterator.

2. value  
Any JavaScript value returned by the iterator. Can be omitted when done is true.
  
## 使用迭代协议的例子
```js
// 必须构造 String 对象以避免字符串字面量 auto-boxing
var someString = new String("hi");
someString[Symbol.iterator] = function() {
  return { // 只返回一次元素，字符串 "bye"，的迭代器对象
    next: function() {
      if (this._first) {
        this._first = false;
        return { value: "bye", done: false };
      } else {
        return { done: true };
      }
    },
    _first: true
  };
};

[...someString];                              
// ["bye"]
```

## 可迭代对象示例
1. 内置可迭代对象: String、Array、TypedArray、Map 和 Set  
原型对象都实现了 `@@iterator` 方法

2. 自定义可迭代对象
```js
var myIterable = {
    name: 'ite',
    age: 18,
    gender: 'male'
};
myIterable[Symbol.iterator] = function* () {
    yield this.name;
    yield this.age;
    yield this.gender;
};
[...myIterable]
//(3) ["ite", 18, "male"]
```

3. 接受可迭代对象的内置 API
* `new Map([iterable])`
* `new WeakMap([iterable])`
* `new Set([iterable])`
* `new WeakSet([iterable])`
* `Promise.all(iterable)`
* `Promise.race(iterable)`
* `Array.from(iterable)`
```js
new Set(myIterable).has(18) //true
```
4. 需要可迭代对象的语法  Some statements and expressions expect iterables  
the `for...of` loops, the `spread operator`, `yield*`, and `destructuring assignment`  
```js
function* gen() {
  yield* ['a', 'b', 'c'];
}

console.log(gen().next()); // { value: "a", done: false }

[a, b, c] = new Set(['a', 'b', 'c']);
console.log(a);            // "a"
```
> `yield*`

### With ES2015 class
```js
class SimpleClass {
  constructor(data) {
    this.data = data;
  }

  [Symbol.iterator]() {
    // Use a new index for each iterator. This makes multiple
    // iterations over the iterable safe for non-trivial cases,
    // such as use of break or nested looping over the same iterable.
    let index = 0;

    return {
      next: () => {
        if (index < this.data.length) {
          return {value: this.data[index++], done: false}
        } else {
          return {done: true}
        }
      }
    }
  }
}

const simple = new SimpleClass([1,2,3,4,5]);

for (const val of simple) {
  console.log(val); // '1' '2' '3' '4' '5' 
}
```

# [Generator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator) is both iterator and iterable
```js
let aGeneratorObject = function* () {
  yield 1;
  yield 2;
  yield 3;
}();

console.log(typeof aGeneratorObject.next);
// "function", because it has a next method, so it's an iterator

console.log(typeof aGeneratorObject[Symbol.iterator]);
// "function", because it has an @@iterator method, so it's an iterable

console.log(aGeneratorObject[Symbol.iterator]() === aGeneratorObject);
// true, because its @@iterator method returns itself (an iterator), so it's an well-formed iterable

console.log([...aGeneratorObject]);
// [1, 2, 3]

console.log(Symbol.iterator in aGeneratorObject)
// true, because @@iterator method is a property of aGeneratorObject
```
