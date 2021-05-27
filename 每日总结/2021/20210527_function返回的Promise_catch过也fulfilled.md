
```js
Promise.resolve(true)
.then(()=>{console.log(1);throw new Error()})
.then(()=>console.log(2))
.then(()=>console.log(3))
.catch (() =>console.log(4))
```
```
1
4
```
### function内返回的Promise，即使catch过也是fulfilled状态
```js
(()=>Promise.resolve(true)
.then(()=>{console.log(1);throw new Error()})
.then(()=>console.log(2))
.catch (() =>console.log(4))
)()
.then(()=>console.log(3))
```
```
1
4
3
```
### function内返回的Promise，即使reject过也是fulfilled状态
```js
(()=>Promise.reject(true)
.then(()=>{console.log(1);throw new Error()})
.then(()=>console.log(2))
.catch (() =>console.log(4))
)()
.then(()=>console.log(3))
```
```
4
3
```
### 和function没关系。。。
```js
let a = Promise.resolve(true)
.then(()=>{console.log(1);return 1})
.then(()=>{console.log(2);return 2})
.then(()=>Promise.reject(3))
.then(()=>{console.log(4);return 4})
.catch (() =>{console.log(5);return 5})
a
```
```
1
2
5
Promise {<fulfilled>: 5}
```
### 去掉catch
```js
let a = Promise.resolve(true)
.then(()=>{console.log(1);return 1})
.then(()=>{console.log(2);return 2})
.then(()=>Promise.reject(3))
.then(()=>{console.log(4);return 4})
a
```
```
1
2
Promise {<rejected>: 3}
```
