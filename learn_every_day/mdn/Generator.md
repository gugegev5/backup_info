# [Generator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Generator)

The Generator object is returned by a [generator function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*) and it conforms to both the [iterable protocol](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#The_iterable_protocol) and the [iterator protocol](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#The_iterator_protocol).

## Constructor
This object cannot be instantiated directly
```js
function* generator() { 
  yield 1;
  yield 2;
  yield 3;
}

const gen = generator(); // "Generator { }"
console.log(gen.next().value); // 1
console.log(gen.next().value); // 2
```
## Instance methods
`Generator.prototype.next()`
Returns a value yielded by the yield expression.
`Generator.prototype.return()`
Returns the given value and finishes the generator.
`Generator.prototype.throw()`
Throws an error to a generator (also finishes the generator, unless caught from within that generator).

# function*
The function* declaration (function keyword followed by an asterisk) defines a ***generator function***, which returns a `Generator object`.

### JavaScriipt忍者秘籍
这只是一个粗略的草稿，一个最小化的代码应该把生成器和promise结合在一起
```js
request(function* () {
  try{
    //对每个任务均执行yield
    const r1 = yield new Promise(res=>setTimeout(()=>res('result1'), 1000));
    console.log(r1)
    const r2 = yield new Promise(res=>setTimeout(()=>res('result2-'+r1), 1000));
    console.log(r2)
    const r3 = yield new Promise(res=>setTimeout(()=>res('result3-'+r2), 1000));
    console.log(r3)
    //Study the mission description
  } catch (e) {
    //依旧可以使用标准的语言结构，诸如try-catch语句或循环语句
    //Oh no,we were not able to get the mission details
    console.log('request-catch-error', e)
  }
});
 
//定义一个辅助函数，用于对我们定义的生成器执行操作
function request(generator) {
  //创建 一个迭代器，进而我们可以控制生成器
  var iterator = generator();
 
  //定义函数handle，用于对生成器产生的每个值进行处理。
  async function handle(iteratorResult) {
    //当生成器没有更多结果返回时停止执行。
    if (iteratorResult.done) {
      return;
    }
 
    const iteratorValue = iteratorResult.value;
    //如果生成的值是一个promise，则对其注册成功和失败的回调。这是异步处理的部分。如果promise成功返回，则恢复生成器的执行并传入promise的返回结果。如果遇到错误，则生成器抛出异常。
    if (iteratorValue instanceof Promise) {
      try{
        const res = await iteratorValue
        handle(iterator.next(res))

      }catch(err){
        iterator.throw(err);
      };
    }
  }
 
  //重启生成器的执行
  try{
    handle(iterator.next());
  } catch (e) {
    iterator.throw(e);
  }
}
```

## Example with `yield*`
```js
function* anotherGenerator(i) {
  yield i + 1;
  yield i + 2;
  yield i + 3;
}

function* generator(i) {
  yield i;
  yield* anotherGenerator(i);
  yield i + 10;
}

var gen = generator(10);

console.log(gen.next().value); // 10
console.log(gen.next().value); // 11
console.log(gen.next().value); // 12
console.log(gen.next().value); // 13
console.log(gen.next().value); // 20
```
## Passing arguments into Generators
```js
function* logGenerator() {
  console.log(0);
  console.log(1, yield);
  console.log(2, yield);
  console.log(3, yield);
}

var gen = logGenerator();

// the first call of next executes from the start of the function
// until the first yield statement
gen.next();             // 0
gen.next('pretzel');    // 1 pretzel
gen.next('california'); // 2 california
gen.next('mayonnaise'); // 3 mayonnaise
```
## 各种格式
```js
//Generator as an object property
const someObj = {
  *generator () {
    yield 'a';
    yield 'b';
  }
}
const gen = someObj.generator()

//Generator as an object method
class Foo {
  *generator () {
    yield 1;
    yield 2;
    yield 3;
  }
}
const f = new Foo ();
const gen = f.generator();

//Generator as a computed property
class Foo {
  *[Symbol.iterator] () {
    yield 1;
    yield 2;
  }
}
const SomeObj = {
  *[Symbol.iterator] () {
    yield 'a';
    yield 'b';
  }
}

//Generator defined in an expression
const foo = function* () {
  yield 10;
  yield 20;
};
const bar = foo();
```
