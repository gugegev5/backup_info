[深入研究-webkit-overflow-scrolling:touch及ios滚动](https://www.cnblogs.com/xiahj/p/8036419.html)   
overflow作用范围：直接的子元素,子元素的子元素作用不到([css2.1 overflow](https://www.w3.org/TR/CSS21/visufx.html#overflow))   
***.content_forbid_fix_scroll {***
      ***min-height: 100.1%;***
***}***   
```
<div id='confirm_order'>
  <Header title="确认订单"/>
  <div className="content">
    <div className="content_forbid_fix_scroll">
      body content
    </div>
  </div>
  
  <div id="bottomBoxWrap">
    <div className='bottom_box'>
      bottom fix button
    </div>
  </div>
</div>





#confirm_order {
  height: 100%;
  box-sizing: border-box;
  overflow: hidden;
  .content {
    margin-bottom: 54px;
    height: 100%;
    overflow-y: scroll;
    -webkit-overflow-scrolling: touch;
    .content_forbid_fix_scroll {
      min-height: 100.1%;
    }
  }
}

#bottomBoxWrap{
    position: fixed;
    bottom: 0px ;
    left: 0px;
    width:100%;
    .bottom_box{
      padding-bottom: constant(safe-area-inset-bottom); /* 兼容 iOS < 11.2 */
      padding-bottom: env(safe-area-inset-bottom); /* 兼容 iOS >= 11.2 */
    }
}
```

今日阅读:   
[overflow不一定能隐藏元素（position:absolute）](https://blog.csdn.net/liufeng520/article/details/26058775)   
[深入探究iOS下fixed定位导致的问题](https://segmentfault.com/a/1190000010510291)   
