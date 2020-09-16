```js
// create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(8);
const arr8 = new Uint8Array(buffer);
const arr16 = new Uint16Array(buffer);
console.log('arr8', arr8, 'arr16', arr16);
arr16[0]=1,arr16[1]=1,arr16[3]=1;
console.log('arr8', arr8, 'arr16', arr16);
```

output:
```
arr8 Uint8Array(8) [0, 0, 0, 0, 0, 0, 0, 0] arr16 Uint16Array(4) [0, 0, 0, 0]
arr8 Uint8Array(8) [1, 0, 1, 0, 0, 0, 1, 0] arr16 Uint16Array(4) [1, 1, 0, 1]
```
