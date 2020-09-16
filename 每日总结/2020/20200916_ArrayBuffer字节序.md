```js
// create an ArrayBuffer with a size in bytes
const buffer = new ArrayBuffer(8);
const arr8 = new Uint8Array(buffer);
const arr16 = new Uint16Array(buffer);
console.log('arr8', arr8, 'arr16', arr16);
arr16[0]=1,arr16[1]=1,arr16[3]=1;
console.log('arr8', arr8, 'arr16', arr16);
```

Mac chrome output:
```
arr8 Uint8Array(8) [0, 0, 0, 0, 0, 0, 0, 0] arr16 Uint16Array(4) [0, 0, 0, 0]
arr8 Uint8Array(8) [1, 0, 1, 0, 0, 0, 1, 0] arr16 Uint16Array(4) [1, 1, 0, 1]
```

## [DataView](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/DataView)
#### [Endianness（字节序）](https://developer.mozilla.org/zh-CN/docs/Glossary/Endianness)
需要多个字节来表示的数值，在存储时其字节在内存中的相对顺序依据平台架构的不同而不同，参照 [Endianness](https://developer.mozilla.org/zh-CN/docs/Glossary/Endianness)。而使用 DataView 的访问函数时，不需要考虑平台架构中所使用的是哪种字节序。
```js
var littleEndian = (function() {
  var buffer = new ArrayBuffer(2);
  new DataView(buffer).setInt16(0, 256, true /* 设置值时，使用小端字节序 */);
  // Int16Array 使用系统字节序（由此可以判断系统字节序是否为小端字节序）
  return new Int16Array(buffer)[0] === 256;
})();
console.log(littleEndian); // 返回 true 或 false
```
