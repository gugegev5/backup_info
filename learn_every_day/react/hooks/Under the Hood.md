# [Rules of Hooks](https://reactjs.org/docs/hooks-rules.html)
1. the same order each time a component renders
2. Only Call Hooks from React Functions/custom Hooks

> By following this rule, you ensure that all stateful logic in a component is clearly visible from its source code.

# [Building Your Own Hooks](https://reactjs.org/docs/hooks-custom.html)
share stateful logic between components: [render props](https://reactjs.org/docs/render-props.html) and [higher-order components](https://reactjs.org/docs/higher-order-components.html).  
#### A custom Hook is a JavaScript function whose name starts with ”use” and that may call other Hooks.
#### Custom Hooks are a convention that naturally follows from the design of Hooks, rather than a React feature.

# [useReducer](https://reactjs.org/docs/hooks-reference.html#bailing-out-of-a-dispatch)
Bailing out of a dispatch
If you return the same value from a Reducer Hook as the current state, React will bail out without rendering the children or firing effects. (React uses the [Object.is comparison algorithm](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is#Description).)

Note that React may still need to render that specific component again before bailing out. That shouldn’t be a concern because React won’t unnecessarily go ***deeper*** into the tree. If you’re doing expensive calculations while rendering, you can optimize them with useMemo.

>react只知道state发生了变化，但不知道哪个state发生了变化

[Under the Hood](https://reactjs.org/docs/hooks-faq.html#under-the-hood)

