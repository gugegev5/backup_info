![](https://developer.mozilla.org/files/3638/border-radius-sh.png)
> 横向半径 / 纵向半径
```css
border-radius: 4px 3px 6px / 2px 4px;

/* 等价于： */

border-top-left-radius:     4px 2px;
border-top-right-radius:    3px 4px;
border-bottom-right-radius: 6px 2px;
border-bottom-left-radius:  3px 4px;
```

### `border-collapse: collapse;` none优先级最低 hidden优先级最高
```html
<table>
    <tr>
        <td class="b1">none</td>
        <td class="b2">hidden</td>
        <td class="b3">dotted</td>
        <td class="b4">dashed</td>
    </tr>
    <tr>
        <td class="b5">solid</td>
        <td class="b6">double</td>
        <td class="b7">groove</td>
        <td class="b8">ridge</td>
    </tr>
    <tr>
        <td class="b9">inset</td>
        <td class="b10">outset</td>
    </tr>
</table>
```
```css
/* 定义表格外观 */
table {
    border-width: 3px;
    background-color: #52E396;
}
tr, td {
    padding: 2px;
}

/* border-style 示例 */
.b1 {border-style:none;}
.b2 {border-style:hidden;}
.b3 {border-style:dotted;}
.b4 {border-style:dashed;}
.b5 {border-style:solid;}
.b6 {border-style:double;}
.b7 {border-style:groove;}
.b8 {border-style:ridge;}
.b9 {border-style:inset;}
.b10 {border-style:outset;}
```
