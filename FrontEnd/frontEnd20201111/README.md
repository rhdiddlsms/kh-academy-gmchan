# 목차

- [목차](#목차)
- [1. 색상 표현 방법](#1-색상-표현-방법)
  - [1.1. 16진수](#11-16진수)
  - [1.2. rgb함수](#12-rgb함수)
  - [1.3. HSL](#13-hsl)
  - [linear-gradient ([각도 혹은 방향], 정지점)](#linear-gradient-각도-혹은-방향-정지점)
    - [텍스트이해, 이미지 넣기(함수사용)](#텍스트이해-이미지-넣기함수사용)
    - [layout  이해하기](#layout--이해하기)
    - [display 활용하기](#display-활용하기)
- [3. 박스를 구성하는 4가지](#3-박스를-구성하는-4가지)
    - [content-box 와 borderbox](#content-box-와-borderbox)
- [4. 레이아웃 실습](#4-레이아웃-실습)
- [5. position 속성](#5-position-속성)
- [6. flex](#6-flex)
# 1. 색상 표현 방법

## 1.1. 16진수

색상을 표현 할 때 16진수의 값으로 들어간다
#RRGGBB 으로 생각하기 
ex) #D23232
R :  D2h - 210
G :  32h - 50
B :  32h - 50

## 1.2. rgb함수


## 1.3. HSL

Hue(색도) : 0~ 360도
Saturation(채도) 0~ 100%
Lightness(명도) 0~ 100%

hsl(360,100,100); 형식으로 함수가 사용된다.
hsla(360,100,100, );

## linear-gradient ([각도 혹은 방향], 정지점)

### 텍스트이해, 이미지 넣기(함수사용)

```html
<!DOCTYPE html>
<html>
    <head>
        <title>20201111실습</title>
        <style>
            div{
                color: aliceblue;
                width: 100px;
                height: 100px;
                background-color: rgb(red, green, blue);
                /* RGB 함수 사용하기 (R,G,B)*/
                /* RGBA 함수 사용하면 A는 투명도(0~1사이의 값) (R,G,B,A)*/
                padding : 20px;
                overflow: hidden;
                /* overflow: hidden; 자신의 영역을 넘어가면 숨김.*/
                white-space: nowrap;
                /* white-space: nowrap;는 한 줄에 ... 으로 표현된다. */
                text-overflow: ellipsis;
                /*text-overflow: ellipsis; 는 컨텐트 영역에서 바로 잘라버림 */

                
            }
            li {
                /* list-style-type:은 리스트 앞에 스타일들 바꿀 수 있음.*/
                list-style-type: lower-latin;
            }
            li::before{
                content : "👀";
            }
            div{
                width: 100%;
                height: 567px;
                background-image: url('https://lh3.googleusercontent.com/proxy/5ePIuoMJYz2c_eNChme0Hb5yp8jLmiq75Wwx4M2i3SrWdMeq7p51y8TccBYOctGRDDaRFLMnXd7pvgNSQ_GWKD_OxtUyP4dAy5PegJJ4r3qqHVyCxWt_STYNpxWUw30kU0Be0yZ23RtRfwlZmyU9yUBNsV03l4WyKc0u2wKOmSEpZummeNCacZiMi79PCxoCn1GUkByA_ggO1EcCH5ADDRUIm_eKyf917Ru4jEgo4H5oeYjI6hb2c_FUGrCPPDMhbnRzARX1TXBFUlua3uMAFdX00etGKDlTtFNHtJXl5WbK');
                background-repeat: no-repeat;
                background-size: auto;
            }
       
        </style>
    </head>
    <body>
        <div>
            너 왜 나한테 장난쳐?
        </div>
        <li>ㅇㅇㅇ1</li>
        <li>ㅇㅇㅇ2</li>
        <li>ㅇㅇㅇ3</li>
        <li>ㅇㅇㅇ4</li>
    </body>
</html>

```

### layout  이해하기
```html
<!DOCTYPE html>
<html>
    <head>
        <title>20201111 실습</title>
        <style>
            body {
                margin: 0;
                padding: 0;
            }

            .a {
                width: 100px;
                height: 100px;
                background-color: #dddddd;
                padding: 20px;
                box-sizing: border-box;
                border: 3px solid red;
                margin: 20px;
                overflow: hidden;
            }

            .b {
                width: 100%;
                height: 100%;
                padding: 20px;
                background-color: black;
            }

            .c {
                width: 100%;
                height: 100%;
                background-color: darkgreen;
            }
        </style>
    </head>
    <body>
        <div class="a">
            <div class="b">
                <div class="c"></div>
            </div>
        </div>
    </body>
</html>

```

### display 활용하기
```html 
<style>
            body {
                padding: 0;
                margin: 0;
            }
            .block-box {
                width: 100%;
                height: 30px;
                background-color: #0071cf;
            }
            .box {
                width: 100px;
                height: 100px;
                
            } 
            /*inline-block를 하면 너비 높이를 유지하면서 가능 그냥 inline만 하면 글자크기에 맞춤.*/

            /*display를 
            block으로 해주면  vertical  수직으로 생성
            inline으로 해주면  horizental수평으로*/
            .a{background-color: red;
                color: white;
                }
            .b{background-color: blue;
                color: white;}
            .c{background-color: greenyellow;
                color: white;}

            .l1{background-color: red;
                color: white;}
            .l2{background-color: blue;
                color: white;}
            .l3{background-color: greenyellow;
                color: gold;}
           
        </style>
    </head>
    <body>
        <!-- span은 인라인 특성을 가지고 있음.-->
        <span class = "l1">글자1</span>
        <span class = "l2">글자2</span>
        <span class = "l3">글자3</span>
        <div class = "box a">블락</div>
        <div class = "box b">블락</div>
        <div class = "box c">블락</div>
    </body>

```

# 3. 박스를 구성하는 4가지

- margin : border(테두리) 바깥의 여백
- border : 테두리
- padding : 테두리와 컨텐트 사이의 여백
- content : 내용이 표시 되는 부분

박스에 필요한 속성 

- width(너비) , height(높이)

box-sizing 이겅 width, height 크기를 참견해. 크기가 달라질 수 있다.
- border-box : 사각형 전체의 값
  - 이걸 하면 width, height 크기가 작아진다
- content-box : width, height 컨텐트 영역에 높이 너비를 설정.
  - 전체 사각형을 구하려면 
    - 좌우 padding + 좌우 border + 컨텐트를 고려하기

```html
        <style>
            body {
                margin:  0%;
                padding : 0%;
            }

            .box {
                width: 100px;
                height: 100px;
                display: inline-block;
                background-color: orange;
                border: 10px solid red; /*이걸로 기억해 그냥.*/
                padding: 20px; /*볼더와 컨텐트 영역의 20px*2만큼 뺀 너비 높이가 들어감 */
            }
            /*display를 
            block으로 해주면  vertical  수직으로 생성
            inline으로 해주면  horizental수평으로*/
        </style>
    </head>
    <body>
        <div class = "box">블락</div>
    </body>
```

### content-box 와 borderbox

```html
        <style>
            .box {
                margin:  300px;
                height: 300px;
                padding : 20px;
                margin: 10px;
                border: 3px solid orange;
            }

            .content-box {
                background-color: blue;
                box-sizing: content-box;
            }

            .border-box{
                background-color: aqua;
                box-sizing: border-box;
            }

        </style>
    </head>
    <body>
        <div class = "box content-box"></div>
        <div class = "box border-box"></div>
    </body>

```

# 4. 레이아웃 실습

```html
<!DOCTYPE html>
<html>
    <head>
        <title>20201111실습</title>
        <style>
            div {
                border: 1px solid #eeeeee;   
                padding: 20px;
                margin-bottom: 20px;
                box-sizing: border-box;
            }

            .article {
                width: 68%;
                float: left;
            }

            .sidebar {
                width: 30%;
                float: right;
            }

            .footer {
                clear: both;
            }
        </style>

    </head>
    <body>
        <div class = "container">
            <div class = "header">
                <h1>이곳은 헤더여</h1>
            </div>
            <div class = "middle">
                <h1>본문이여</h1>
                <span >
                    아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무내용아무             
                </span>
            </div>
            <div class = "side">
                <h1>사이드여</h1>
            
                <li>리스트는</li>
                <li>몰러유</li>
            </div>
            <div class = "futer">
                <h1>푸터여</h1>
            </div>
        </div>

    </body>
</html>
```

# 5. position 속성

- top
- bottom
- left
- right

position

- static : 기본값
- relative : 다른 블록의 배치에 따라 결정됨
- absolute : 절대값 (가장 가까운 부모나 조상 요소중 속성이 realtive인 요소를 기준으로)
- fixed : absolute와 비슷해 보이지만 기준이 브라우저

```html
<!DOCTYPE html>
<html>
    <head>
        <title>20201111실습</title>
        <style>
            body{
                padding: 0;
                margin: 0;
            }

            .container{
                width: 100%;
                height: 100%;
                position: relative;
                background-color: black;

            }

            .box {
                top: 50px;
                left: 50px;
                width: 100px;
                height: 100px;
            }

            .box1{
                position: static;
                background-color: red;
                left: 50px;
                top: 50px;
                z-index: 100;
            }

            .box2{
                position: relative;
                top: 0px;
                left: 200px;
                background-color: orange;
            }
            
            .box3 {
                position: relative;
                top: 0px;
                left: 200px;
                background-color: orange;
            }

        </style>

    </head>
    <body>
        <div class = "container">
           
            <div class = "box box1"></div>
            <div class = "box box2"></div>
            <div class = "box box3"></div>
            
        </div>

    </body>
</html>
```

# 6. flex

flex container에서 사용할 수 있는 속성
- flex-direction : 플렉스 방향 지정
  - row : 주축을 가로로, 교차축 세로로 (left to right)
  - row-reverse : right to left
  - column : 주축을 세로로, 교차축 가로로(top to bottom)
- flex-wrap : 배치 방식
- justify-content : '주축'을 기준으로 배치 방식 지정
- align-item : '교차축'을 기준으로 배치 방식 지정
- align-content : 여러줄 일 때 배치 방식

flex item에서 사용할 수 있는 속성
- flex : 플렉스 항목 크기 조정
  - flex-glow : 플렉스 항목의 너비를 얼마나 늘릴지 지정.
  - flex-shrink : 플렉스 항목의 너비가 얼마나 줄일지 지정.
  - flex-basis : 항목의 기본 크기 지정

```html
flex : flex -glow

```