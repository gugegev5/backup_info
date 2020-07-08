网址解析：
```js
var str = "http://www.runoob.com:80/html/html-tutorial.html";
var patt1 = /(\w+):\/\/([^/:]+)(?::(\d*))?([^# ]*)/;
arr = str.match(patt1);
for (var i = 0; i < arr.length ; i++) {
  console.log(arr[i]);
}
```
> `\w`:[a-zA-Z0-9_]  
> `(?::(\d*))`: 非获取匹配 去掉冒号  
> `?`:0或1次  
> `[^]`:[]内是‘非’  
