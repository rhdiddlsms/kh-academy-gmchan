mediaquery 1
```html
<!DOCTYPE html>
<html>
    <head>
        <title>media query</title>
        <style>
            html, body{
                margin: 0;
            }

            .container {
                background-color: cornflowerblue;
                width: 100vw;
                height: 100vh;
            }

            @media (max-height: 640px){
                .container{
                    background-color: coral;
                }
            }

            @media (max-width: 800px){
                .container{
                    background-color: rebeccapurple;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">

        </div>
    </body>
</html>

```

mediaquery2
```html
<!DOCTYPE html>
<html>
    <head>
        <title>media query</title>
        <style>
            html, body{
                margin: 0;
            }

            .header{
                background-color: cornflowerblue;
                padding: 15px;
                text-align: center;
                
            }

            .left-sidebar{
                width: 20%;
                overflow: auto;
                background-color: coral;
                float : left;
            }

            .menu {
                
                
                text-align: center;
            }

            .menu > a {
                background-color: beige;
                padding: 8px;
                margin-top: 7px;
                display: block;
            }

            .main {
                background-color: indianred;
                float: left;
                width: 60%;
                padding: 15px;
                margin-top: 7px;
                text-align: center;
            }

            @media (max-width: 600px){
                .left-sidebar, /
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>안녕 머머리</h1>
        </div>

        <div class="left-sidebar">
            <div class="menu">
                <a href="">link1</a>
                <a href="">link2</a>
                <a href="">link3</a>
                <a href="">link4</a>

            </div>
        </div>

        <div class = "main">
            <h1>아 </h1>
            <p>배고파ㅏㅏㅏㅏ</p>
        </div>

        <div class = "right-sidebar">
            <h1>오른쪽에서도 </h1>
            <p>배고파ㅏㅏㅏㅏ</p>
        </div>
    </body>
</html>
```