```html
<html>

<head>
    <style>
        html,
        body,
        div {
            width: 100%;
            margin: 0;
        }

        .lv1 {
            height: 100vh;
            background: #bcbce7;

            display: flex;
        }

        .lv2 {
            height: 50vh;
            background: #f0b000;

            flex-basis: 0;
            flex-grow: 1;
        }

        .lv3 {
            width: 1920px;
        }
    </style>
</head>

<body>
    <div class="lv1">
        <div class="lv2">
            <div class="lv3"></div>
        </div>
    </div>
</body>

</html>
```

## firefox
![0]('./20200820/basis0.png')
![auto]('./20200820/basisauto.png')

## chrome
