# 1. 배열  filter, map, reduce

## 1.1. filter
``` javascript
filter(callbackfn [, ?thisArhg])
```
callbackfn: 참, 거짓을 평가 할 수 있는 함수가 넘어가면 됨.

## 1.2. map
``` javascript
filter(callbackfn)
```
callbackfn : 원소를 변환할 함수

``` javascript
l = ['adfs', 'sdfsf', 'sdfcv', 'a']
l.map(x => x.length)
```

## 1.3. reduce

``` javascript
reduce(callbackfn)
```

callbackfn
1.  acc : 누산할 값
2.  cur : 현재 값

# 2. DOM API

## 2.1. 요소(HTML element) 찾기

- id
- class
- 태그

### 2.1.1. id로 찾기

``` javascript
const countryCode = document.getElementById('country-code')


box.style.backgroundColor = 'red'
>> "red"
box.style.width = '300px'
>> "300px"
box.innerText
>> "박스 안 텍스트"
box.innerText = '브라우저 제어'
>>"브라우저 제어"
box.innerText = 'ㅋㄷㅋㄷ'
>>"ㅋㄷㅋㄷ"
box.innerText = '된다 된다.'
>>"된다 된다."
```

### 2.1.2. class로 찾기
```html
<!DOCTYPE html>
<html>
    <head>
        <title>브라우저 제어하기</title>
        <style>
            .box{
                width: 100px;
                height: 100px;
            }

            .b1{background: red;}
            .b2{background: orange;}
            .b3{background: blue;}
        

        </style>
    </head>
    <body>
        <div class="box b1">1번 박스</div>
        <div class="box b2">2번 박스</div>
        <div class="box b3">3번 박스</div>
        
        <script>
            // background-color 는 기본
            // css에서는 backgroundColor
        </script>
    </body>
</html>
```

```javascript
document.getElementsByClassName('클래스이름')// 클래스
document.querySelectorAll('.클래스이름')// css와 동일

b = document.getElementsByClassName ('box') //클래스이름으로 찾기
const boxes1 = document.querySelectorAll('.box') // 조작 할 때 querySelectorAll로 사용
```

### 2.1.3. 태그 이름으로 찾기

```javascript
document.getElementsByTagName('태그이름')// 클래스
document.querySelectorAll('.태그이름')// css와 동일

//f12번 눌러서
document.getElementsByTagName('div')
const b = document.querySelectorAll('div')

for (item of b){
    console.log(item)
}
```

## 2.2. 트리 자료구조


```javascript
document.querySelector('#root')
const root = document.querySelector('#root')
```

노드순회 ( root. 한다음에 사용)
- childNodes
- children
- firstChild
- lastChild
- firstElementChild
- lastElementChild
- parentNode
- previousSibling
- previousElementSibling
- nextSibling
- nextElementSibling


## 2.3. DOM조작

- innerHTML
- DOMPurify.sanitize
- createElement
- appendChild
- createTextNode

```javascript
box = document.querySelectorAll('div')[0]
box.innerText = '이건 텍스트만 되는경우' // 텍스트만 바꿔줌
box.innerHTML = '<button>click</button>' // html 속성 넣을수 있음
```

DOM 제어
```javascript
document.createElement('div')
<div>​</div>​
const newBox = document.createElement('div') //새로운 노드 생성(아직은 메모리 상에만 존재)
newBox.classList.add('box')// 새로 생성한 박스의 클래스 추가
newBox.innerText = '*+*' // 새로 생성한 박스의 텍스트 노드 변경
document.body.appendChild(newBox); //body 노드에 새 박스 추가
```

# 3. 이벤트

브라우저에서 발생하는 키 입력, 마우스 입력 등을 가할 때 발생하는것을 `이벤트`라고 한다.
그리고 발생한 `이벤트` 에 대한 처리를 하는 함수를 `이벤트 핸들러`라고 부른다.

### 3.1.1. 마우스 이벤트

- click :클릭
- dblclick : 더블클릭
- mouseup/mousedown : 마우스 눌러질 때 , 마우스에서 손 떼는경우
- mousemove : 마우스 이동
- mouseenter(nb) (더블링 안됨)
- mouseover(b) (마우스가 특정영역 위에 올라 갈 때 )
- mouseleave(nb) ( 마우스가 특정영역을 벗어 날 떄 )
- mouseout(b) (더블링이 된다.)

### 3.1.2. 키보드 이벤트

- keydown: 모든 키에 대해서
- keyup : 키에서 손 떼는 경우
- keypress: 문자, 숫자, 특수 문자

## 3.2. 이벤트 핸들러 등록방법

- 속성 : `on` + 이벤트 이름
- 프로퍼티에 지정
- addEventListner(fn, [?capture])

### 3.2.1 이벤트 속성 등록하기

```html
    <script>
        function handleClick() {
                alert('클릭했음')
        }
    </script>
    <div onclick ="handleClick()" class ="box"> :] </div>
    <div onmouseover = "handleClick()" class ="box1"></div>
    <div ondblclick = "handleClick()" class ="box2"></div>
```

### 3.2.2. 프로퍼티에 지정
```html
    <div class ="box"> :] </div>
    <script>
        const box = document.querySelector('#boxbox')
        box.onclick = () => {
            alert('트리거')
        }
    </script>
```

### 3.2.3. addEventListener

```javascript
addEventListener('이벤트이름', '이벤트핸들러')

```

```html
    <div id= "boxbox" class ="box"> :] </div>
    <script>
        const box = document.querySelector('#boxbox')
        box.addEventListener('click', () => {
            alert('하잇!!!')
        })
    </script>
```

### 3.2.4. key 입력 받아서 html에 입력하고 출력 하기


```html 
    <div id= "boxbox" class ="box"> :] </div>
    <script>
        const box = document.querySelector('#boxbox')
        document.body.addEventListener('keypress', e => {
            console.log(e.key)
            const currentValue =box.innerText
            box.innerText = currentValue + e.key
        })
    </script>

```

### 3.2.5. 방향키 입력 받아서 박스 움직이기

```html
    <div id= "boxbox" class ="box"> <h1>'-'</h1> </div>
    <script>
        const box = document.querySelector('#boxbox')
        let x = 0
        let y = 0
        document.body.addEventListener('keydown', e => {
        // console.log(e)  //항상 먼저 해보기
        //BOX 옮길 때 사용하는 코드
        
            switch(e.key) {
                case 'ArrowUp':
                    console.log('위')
                    y -= 40;
                    break;
                case 'ArrowDown':
                console.log('아래')
                    y += 40;
                    break;
                case 'ArrowLeft':
                    console.log('좌')
                    x -= 40;
                    break;
                case 'ArrowRight':
                    console.log('우')
                    x += 40;
                    break;
            }
            box.style.transform = `translate3d(${x}px, ${y}px, 0)`
        })
    </script>
```

## 3.3. 이벤트 전파

- event capturing phase (위 -> 아래)
- Event Target
- event bubbling phase (하위 -> 상위)
  - 이 때 등록된 핸들러들 호출됨
  - 상위에 있는 요소들에 등록된 핸들러가 호출 될 수 잇으므로 의도하지 않은 동작을 막으려면 stopPropagation 호출해서 이벤트 전파를 막아야함.