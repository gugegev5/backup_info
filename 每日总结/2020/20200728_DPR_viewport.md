# [使用 WordPress 开发响应式主题（一）：DPR 与 viewport](https://wordpresshi.com/wordpress-responsive-theme-dpr-and-viewport/)

那么什么是 DPR (Device Pixel Ratio)？这里不妨先给它个定义：  

`window.devicePixelRatio` 是设备上物理像素 (physical pixels) 和设备无关像素 (device-independent pixels (dips)) 的比例。  
公式表示就是：`window.devicePixelRatio = physical pixels / dips`  

PPI（Pixels Per Inch）即像素密度，表示每英寸所拥有的像素数量。  
同样大小的字体在不同设备为什么看起来大小不一样，本质上就是问一个 dips 像素在不同设备中分别等价于多少英寸。  

1 dips 像素的长度 = `DPR * (1/PPI) = DPR/PPI` = `(physical pixels / dips) / PPI)` = `1 inch / dips` 
> [Android 常见分辨率 —— mdpi、hdpi 、xhdpi、xxhdpi](https://blog.csdn.net/adminlxb89/article/details/82492059)

![https://design.google.com/devices/](https://camo.githubusercontent.com/9598a107e7f7029717f52192c90dcaf7008e49c1/687474703a2f2f7777772e773363706c75732e636f6d2f73697465732f64656661756c742f66696c65732f626c6f67732f323031352f313531312f72656d2d342e706e67)

## [w3c Viewport <META> element](https://drafts.csswg.org/css-device-adapt/#viewport-meta)  

属性|可能的值|说明
--|:--|:--
width | 一个正整数或者字符串 device-width | 以 px 为单位定义 viewport 的宽度
height | 一个正整数或者字符串 device-height | 以 px 为单位定义 viewport 的高度
initial-scale |	一个0.0 到10.0之间的正数 | 定义设备 dips 宽度（竖屏模式下设备宽度或者横屏模式下的设备高度）与 viewport 尺寸之间的比例
maximum-scale |	一个0.0 到10.0之间的正数 | 定义最大缩放值；它的值必须大于等于 minimum-scale 的值
minimum-scale |	一个0.0 到10.0之间的正数 | 定义最小缩放值；它的值必须小于等于 maximum-scale 的值
user-scalable |	一个布尔值（yes 或者no） | 如果设置为 no，那么用户无法缩放页面。默认值为 yes


## [HTML img 标签 data-canonical-src 是做什么用的?](https://segmentfault.com/q/1010000000458224)
出处: [https://github.com/blog/273-github-ribbons  ](https://github.com/blog/273-github-ribbons)
```html
<a href="https://github.com/you">
  <img width="149" height="149" 
       src="https://github.blog/wp-content/uploads/2008/12/forkme_right_red_aa0000.png?resize=149%2C149" 
       class="attachment-full size-full" 
       alt="Fork me on GitHub" 
       data-recalc-dims="1">
</a>
```
的確是自定義屬性，用於改善搜索引擎優化。可以參考 [Canonical link element](https://en.wikipedia.org/wiki/Canonical_link_element) 的解釋。由於被各大搜索引擎使用，基本已經成爲半個標準。  
> [Custom Attributes in HTML 5](http://www.javascriptkit.com/dhtmltutors/customattributes.shtml)

# [使用Flexible实现手淘H5页面的终端适配](https://github.com/amfe/article/issues/17)
[2015 article](https://github.com/amfe/article)
