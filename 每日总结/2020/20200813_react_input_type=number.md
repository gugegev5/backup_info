默认`0`，输入`1`，变成`01`  
`type='number'`去掉就好了  
```js
import React from "react";

export default class TestInput extends React.Component {
  render() {
    return (
      <>
        <input
          type="number"
          name="inputNum"
          value={this.state.inputNum}
          onChange={this.onChangeInput.bind(this)}
          autoComplete="off"
        />
        <input
          type="number"
          name="inputNum"
          value={this.state.inputNum}
          onChange={this.onChangeInput.bind(this)}
          autoComplete="off"
        />
      </>
    );
  }

  constructor(props) {
    super(props);
    this.state = {
      inputNum: 0,
    };
  }

  onChangeInput(e) {
    let num = parseInt(e.target.value, 10);
    if (Object.is(num, NaN)) {
        num = 0;
    }
    console.log("onChangeInput", num);
    this.setState({
      inputNum: num,
    });
  }
}
```
