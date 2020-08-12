```js
async function test1() {
    await new Promise(r=>setTimeout(r,1000))
    return {
        a:1
    }
}
let b = test1()
b.then(r=>console.log(r))

async function test2() {
    await new Promise(r=>setTimeout(r,1000))
    return Promise.resolve({
        c:1
    })
}
let d = test2()
d.then(r=>console.log(r))
```

```js
{a: 1}
{c: 1}
```
