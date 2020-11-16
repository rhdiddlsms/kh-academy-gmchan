# 1. 자바스크립트 등장배경

- 브라우저 제어
- Ajax(Asynchronous Javascript and XML)
  - 서버에 API 콜 할 때 사용
    - jquery
    - axios

브라우저는 자바스크립트를 해석할 수 있는 엔진들을 내장하고 있음
대표적으로 크롬에 경우 -> V8엔진 사용

추후에 등장한게 node
node 는 서버 사이드에서 자바스크립트를 사용하기 위해 V8 엔진을 사용해서 맨듬.
```html
<!DOCTYPE html>
<html>
    <head>
        <title>자바스크립트</title>
    </head>
    <body>
        <button id="btn-alert">click</button>
        <script>
            // dom에서 btn-alert라는 id의 dom을 찾음.
            var btn = document.getElementById('btn-alert');
            console.log(btn);

            //클릭 할 때 동작(액션) 할당 할 수 있게 해줌 Event
            btn.addEventListener('click', onClickHandler);
            function onClickHandler() {
                alert('마우스 클릭!!');
            }
        </script>
    </body>
</html>
```

REPL (Read-Evaluation Print Loop)
(파이썬 대화식 쉘 이라고 이해)

# 2. 용어 정리

- DOM : Document Object Model
  - 브라우저에 렌더링된 요소들(element, tag)
- 이벤트 : 브라우저 상에서 발생한 액션들
    
# 3. 자바스크립트의 타입

원시타입(primitive type)
- 숫자(Number) 
  - 64비트 부동소수점 정밀도
- 문자열(String)
- 불리언(boolean)
- 심벌(Symbol)
- undefined
- null

그 외에는 모두 객체

## 3.1. 숫자타입

- 64비트 부동소수점 정밀도
- Infinity(양의 무한대)
- -Infinity (음의 무한대)
- NaN (Not a Number) (산수가 안된다는 표시)

## 3.2. 문자열

- 작은 따옴표(')
- 큰 따옴표(")
- 백틱 (backtick ,  ` ) (1왼쪽에문자임) 

## 3.2.1. 템플릿 리터럴 tamplate literal (`백틱으로 선언`)

ES6+부터 지원 . ${} 내부에 변수 뿐만 아니라 표현식을 넣을 수 있음
표현식 : 평가 결과가 값

```javascript
const n = 10;
const message = 'test'

console.log(`상수 n의 값 : ${n}. 상수 message의 값 : ${message}`);
```

## 3.3. boolean

true, false

## 3.4. 심벌

많이 사용 안함??? ㅇㅇ
immutable 원시타입. 값이 중복이 안됨. ES6+

```javascript
const sym = Symbol(값)
```

## 3.5. undefined

변수를 선언하고 값을 초기화하지 않는 경우 묵시적으로 할당되는 값

## 3.6. null

의도적으로 변수에 값이 없음을 명시할 때 사용.

## 3.7. 타입 검사

tyoeof 연산자 사용

## 3.8 객체

### 3.8.1. 객체 선언 및 사용

객체 리터럴('{}')로 객체 선언하기

```javascript
// 빈 객체 선언
const obj = {}

// 선언과 동시에 멤버 초기화
const obj = {
    member1 : 'abc',
    member2 : [1,2,3]
    member3 : 10
}
```

- 멤버 접근 연산자 (member access operator)

```javascript

const obj = {
    member1 : 'abc',
    member2 : [1,2,3]
    member3 : 10
}
obj.member1   //'abc'

```


```javascript
// 멤버 추가하기
const obj = {}
obj['apple'] = '사과'
// 추가한 멤버에 접근
obj['apple'] //사과
```

### 3.8.2 배열

```javascript
// arr가 배열이다 라고 선언.
const arr = [] 
```

자바스크립트 배열의 특징
- 객체임. 따라서 아무 값이나 넣을 수 있음 (자바와 다르다.)
  
### 3.8.3. 날짜
Date 객체 사용



# 4. 제어문

## 4.1 분기

```javascript
//조건식 : 평과 결과 값이 boolean(true나 false)인 식(expression, expr).
if (조건식){
    코드
}


const a = 10

if(a>5){
    console.log('a가 5보다 크다 ㅎ');
}
```

## 4.2. 반복문
- for 
- for-in
- for of

### 4.2.1 for
```javascript
for (var i =0; i<10;  i++){
    console.log(`${i+1}번째 출력.`)
}
```

### 4.2.2 for-in
객체 `프로퍼티` 순회할 때 사용
키를 순회 할 때 

```javascript
for (variable in object){
    //code
}
```

```javascript
const obj = {
    a: '감자';
    number : 10,
    arr : [1,2,3,]
}

for (p in obj){
    console.log(obj[p])
}
```



### 4.2.3 for of
인덱스와 프로퍼티 이름 관심 없을 떄 사용 
값을 꺼내서 순회할 때 사용

```javascript
for (value of obj){
    //코드
}
```

```javascript
const obj = [ '감자', 10, [1,2,3,]]


for (value in obj){
    console.log(obj[value])
}
```

# 5. 연산자 

## 5.1.  비교 연산자

동등 비교 연산자(==) ( 이거 사용 거의 안함 그냥 아래 있는거 써)
- 좌항과 우항의 타입을 일치시킨 후 비교

진짜 비교를 하고싶다?? 그러면
일치 비교 연산자(===)  (equals 와 거의 비슷) 이거 사용해.
- 타입도 일치하고, 값도 일치하면 참.

## 5.2. 지수연산자

ES7 + 멱승 계산

```javascript
x ** y
```

## 5.3. 그 외

- new : 생성사 함수 호출
- delete : 프로퍼티 제거
  
- `in` : 멤버 검사

- ?. : 옵셔널 체이닝
    - obj?.size(); 로 표현가능.
```java
if (obj != null){
    obj.size();
}
```

# 6. 함수

``` javascript
// 이름이 있는 함수
function 함수이름(매개변수) {
    //코드
}

function test(a,b){
    return `${a}와 ${b}의 합은 ${a+b}입니다.`
}

// const a = test
// const resultMessage = test(1,2)
// console.log(resultMessage)


const a = (a,b) => `${a}와 ${b}의 합은 ${a+b}입니다.`
const resultMessage = a(1,2)
console.log(resultMessage)
// 동적타이핑
// 1. 값을 보고 타입 추론
// 2. 언제든 식별자의 값이 변경될 수 있음!

```

자바 함수(메서드)와 다른점
- 식별자에 할당 가능(변수에 저장하는 것 처럼)
- 자바와 달리 인터페이스 선언이 필요 없음 

이름이 있는 함수 만들기 예제
``` javascript
function test(a,b){
    return `${a}와 ${b}의 합은 ${a+b}입니다.`
}
const resultMessage = a(1,2)
console.log(resultMessage)
```

이름이 없는 함수 만들기 예제 
``` javascript
const test = (a,b) => `${a}와 ${b}의 합은 ${a+b}입니다.`
const resultMessage = test(1,2)
console.log(resultMessage)
```

람다는 어디에 필요할까?
- 콜백함수
- 핸들러

## 6.1. 디폴트 함수 파라미터(default function parameter)

자바스크립트에서 파라미터에 기본값 넣기
```javascript
function test(a,b =3){
    return `${a}와 ${b}의 합은 ${a+b}입니다.`
}
console.log(test(1))
console.log(test(1,2))

```
익명함수(람다)에서도 동일하게 사용가능
```javascript
(a,b=3) => `${a}와 ${b}의 합은 ${a+b}입니다.`
```

## 6.2. 메서드

객체 리터럴에 포ㅎ함된 함수를 메서드라고 구분해서 부름

```javascript
const obj = {
    say : () => {
        //코드
    }

    fn : function(){
        //코드
    }
}
```

## 6.3. 메서드의 this

this는 읽기 전용 값. 자신을 소유한 객체를 가리키는 값.