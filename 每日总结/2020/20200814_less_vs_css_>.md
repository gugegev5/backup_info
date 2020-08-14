# css
```html
<html>
<head>
    <style>
        .father>* {
            background-color: #f00000;
        }
        .son {
            height: 100px;
            background-color: #0f0000;
        }
    </style>
</head>
<body>
    <div class='father'>
        <div class='son'></div>
    </div>
</body>
</html>
```
### result
```css
.son {
    height: 100px;
    background-color: #0f0000;//生效
}
.father>* {
    background-color: #f00000;//不生效
}
```

# less
```less
.father {
    > * {
        background-color: #f00000;
    }
}
.son {
    height: 100px;
    background-color: #0f0000;
}
```
### result
```css
.father > * {
    background-color: #f00000;//生效
}
.son {
    height: 100px;
    background-color: #0f0000;//不生效
}
```

# conclude
优先级相同，后面覆盖前面
```css
.son {
    height: 100px;
    background-color: #0f0000;//不生效
}
.father>* {
    background-color: #f00000;//生效
}
```
```css
.father>* {
    background-color: #f00000;//不生效
}
.son {
    height: 100px;
    background-color: #0f0000;//生效
}
```
