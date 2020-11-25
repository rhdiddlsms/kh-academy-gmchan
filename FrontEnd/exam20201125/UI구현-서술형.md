# 1. 문제
```css
.hello {
    background-color :black;
    color: white;
    font-size: 11px;
    text-align:right;
}
```

# 2. 문제

```html
<!DOCTYPE html>
<html>
    <head>
        <title>제목임</title>
        <style>
            html, body {
                margin: 0;
            }

            .box {
                width: 100px;
                height: 100px;
                background-color: red;
            }

            /*선택한 요소 위에 마우스를 올렸을 때 선택자*/
            .box:hover{
                width
            }
            /*클릭하고 있는 상태의 선택자*/
            .box:active {

            }


        </style>
    </head>
    <body>
        <div id="box" class="box">
            내용
        </div>
    </body>
</html>

```

# 3. 문제

css를 이용한 색상 표현방법 3가지 서술

색상명 , rgb, rgba 만 적어도 됨

# 4. 문제

html영역을 구분 할 떄 div태그와 span태그

1. div 태그 
   1. 기본값이 블록 속성. 공간을 수직으로 분할 할 때 수평으로 하나의 요소만 위치 할 수 있음 + 너비와 높이 존재한다.
2. span 태그 :
   1. 기본값이 인라인. 수평 공간 분할. 수평에 여러개 요소가 위치 할 수 있음. 너비 높이 없다.

# 5. 문제

image 넣을 때 

img 태그를 이용하기 //  이미지 주소는 src=""  ==> ""안에 이미지 주소 넣으면 됩니다. 

# 6. 문제

input type에 관한 설명들
<input type="">

- password : 속성은 입력한 값들이 가려짐. 비밀번호를 가리기 위해서 적합함. ex)보안번호
- radio :  여러 옵션중에서 하나만 선택 하고 싶을 때
- checkbox : 여러가지 선택을 하고 싶을 때 사용 합니다
- summit : form태그 내부에 있는 자식의 값을 input값으로 전송한다. summit은 화면에 버튼형태로 나오게 된다.

# 7. 문제

form 태그의 method 속성값에 의해 전송방식이 결정된다. 전송방식 2가지에 대해 서술하시오

> HTTP 스펙 생각하기. 자세히
> 
> get - 주소창에 key-value의 쌍을 &로 연결한 쿼리스트링(Query String)으로 전송. url 크기 제한 존재 
> 
> post - HTTP 헤더에 담기는게 아니다.

# 8. 문제

block 과 inline에 대한 설명

block은 수직 공간분할 수평은 하나요소만 가능 (div와 같음)

inline은 수평 공간 분할 수평에는 여러 요소들이 올 수 있고 너비 높이가 정해지지 않음

# 9. 문제

css 선택자중 아이디와 클래스의 차이점을 서술하시오

- id - `#이름`   // 문서 내의 단 하나뿐인 요소
- class - `.이름`  // 여러개의 요소들은 지정 할 때  사용하게 된다