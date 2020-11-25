# 목차

- [목차](#목차)
- [1. 비구조화 할당 (destructuring assignment)](#1-비구조화-할당-destructuring-assignment)
  - [1.1. 객체 리터럴](#11-객체-리터럴)
  - [1.2. 배열 리터럴](#12-배열-리터럴)
- [2. 함수](#2-함수)
- [3. 스코프](#3-스코프)
  - [3.1. 스코프와 존재](#31-스코프와-존재)
  - [3.2. 전역 스코프](#32-전역-스코프)
  - [3.3. 블록 스코프](#33-블록-스코프)
    - [3.3.1. 변수 마스킹](#331-변수-마스킹)
  - [3.4. 렉시컬 스코핑 정리](#34-렉시컬-스코핑-정리)
  - [3.5. IIFE  - 즉시 실행 함수](#35-iife----즉시-실행-함수)
- [4. 노드](#4-노드)

어제 소개 못한것!!!!!!
# 1. 비구조화 할당 (destructuring assignment)

객체 리터럴이나 배열 리터럴

## 1.1. 객체 리터럴

```javascript
// 객체 리터럴
const user ={
    id : 'adfsfd',
    name : 'gmchan',
    data : [1,2,3,4,],
}
console.log('')
const {id,name,data} = user
console.log(id)
console.log(name)
console.log(data)
```

## 1.2. 배열 리터럴

```javascript
// 배열 리터럴
const arr = [1,2,'문자열', {}]

let a,b = arr
console.log(a)
console.log(b)
```

# 2. 함수

f의 변수명과 {}의 내용이 중요한 
메소드 시그니처 영향을 안받는다 
메소드 오버로딩 자바스크립트에서 안돼

함수의 시그니처가 함수 호출을 결정하는가?????
자바스크립트에선 아님!!!

```javascript
function f(x){
    consol.log('호출됨!!!!')
}

f(1)
f(1,2,3)
```

# 3. 스코프

변수, 상수, 매개변수가 언제 어디서 정의되었는지 결정하는 것.

```javascript
// 파라미터 x의 스코프는 f의 내부
function f(x){
    return x ** x
}
```

- 선언 - 식별자를 알림.
- 정의 - 값을 부여
  - 값을 안넣으면 undefined가 나옴.

아래 경우에는 에러! 변수 지정이 아래에 해줘서
```java
sysout(message)
String message = "hello!!!!";
```

아래는 작동????
```javascript
// var는 문제 발생
console.log(message)
var message

// 블록 레벨 스코프
console.log(message)
const message

console.log(message)
let message
```

## 3.1. 스코프와 존재

```javascript
const name = 'hi' // 이건 전역 스코프.
function f(x){
    console.log(x) // << 이 부분이 실행된다고 하면 제한이 된다.
}
f(5)
x
console.log(name) //이것도 전역 스코프
```

변수가 존재 하지 않으면 해당 변수가 스코프 안에 있지 않음을 의미.
선언하지 않은 변수나 함수가 종료되면서 존재하지 않게된 변수는 스코프 내부에 존재하는 것이 아님.

- 변수가 스코프 내부에 존재하지 않으면 실제로 존재하지 않을까???

* 스코프(가시성)- 현재 실행 중인 부분(실행 컨텍스트)에서 현재 보이고 접근 가능한 식별자들을 의미
* 존재 - 식별자가 메모리를 차지하고 있는 어느 부분을 기리키고 있음

## 3.2. 전역 스코프

- 스코프는 계층 구조를 지니고 있음
- 묵시적으로 주어지는 스코프 - 전역 스코프
- 전역 변수 - 전역 스코프 내에 선언된 식별자들
- 가시성이 전체

전역 스코프의 단점
- 가시성이 전체
  - 어디서든 접근 가능
    - 어디서든 수정 가능
- 실행 컨텍스트가 전역 스코프에 의존하게 되어버림

## 3.3. 블록 스코프

중괄호 내부에 선언된 식별자들

```javascript
console.log('블록 이전에 호출')
{
    console.log('블록 내부에서 호출됨')
    const x = 1 
    console.log(x)
    {
        console.log('블록 내부 2에서 호출됨')
        const y = 5
        console.log(y)
    }
// console.log(x) 여기에 하면 출력 됨. 
}
// console.log(x) 여기에 하면 에러코드 
```

### 3.3.1. 변수 마스킹

```javascript
console.log('블록 이전에 호출')
{
    console.log('블록 내부1에서 호출됨')
    const x = 1 
    const block1 = '블록 1 이란다.'
    console.log(x)
    {
        // 내부에 있는 블록은 바깥에 있는 변수를 가져올 수 있음??
        const x = '다른거'
        //바깥에 변수가 가려져서 여기서 선언된 '다른거'가 출력된다
        console.log(x)
        console.log(block1)
    }
    console.log(x)
}
```

- 스코프는 계층 구조다
- 같은 이름의 식별자를 사용하면 바깥 스코프의 동일한 이름을 사용하는 식별자가 가려짐 (접근할 방법이으리ㅡㅇㄹ구거후벋구헉ㄹ푸ㅠㅠㅜㅠ)

## 3.4. 렉시컬 스코핑 정리

```javascript
function outer(){
    const name = '바까티야'
    function showName(){
        const n = '안쪽 데이터'
        console.log(`바깥 : ${name}, 안 : ${n}`)
    }
    return showName;
}
const f1 = outer()
f1 ()
```

- outer 내부 스코프
  - name 상수
  - showName 함수
- showName (클로저)은 자신의 외부에 해당하는 outer 함수의 name 상수에 접근 가능!

위 코드를 조금 수정 해보자!

```javascript
function outer(){
    const name = '바까티야'
    function showName(){
        const n = '안쪽 데이터'
        console.log(`바깥 : ${name}, 안 : ${n}`)
    }
    return showName;
}
const f1 = outer()
f1 ()
```

일반적으로는 함수 호출이 완료되고 나면 내부 변수가 정리 되서 사용할 수 없다고 생각 하는게 일반적

하지만 자바스크립트의 경우에는 클로저(closure)가 형성됨

클로저 
- 함수와 함수가 선언된 렉시컬 환경
- 렉시컬 환경은 클로저가 생성된 당시의 유효 범위 내에 있는 모든 지역 변수로 구성됨!
  
기억 할 것
- 클로저가 생성된 위치에서 유효했던 범위(환경)들을 기억하고 있다는것.
```javascript
const dd = 'dddddd'
function outer(){
    const name = '바께슈'
    function closure(){
        const inner = '아네이슈'
        console.log(`${name}, ${inner}`)
    }
    return closure
}
const f1 = outer()
f1()
```


깜짝 문제!
호출을 할 떄마다 
```javascript
function countdown(x){
    //환경
    function counter(){

    }
    return counter
}


//문제 (이렇게 나오게 해라)
const counter = countdown(10)
counter() //10
counter() //9
counter() //8
// ...
counter() //1
```

해답~!
```javascript
function countdown(startAt){
    let data = startAt;
    function counter(){
        console.log(data--)
    }
    return counter
}
const counter = countdown(10)
counter() //10
counter() //9
counter() //8
counter() //7
counter() //6
counter() //5
counter() //4
counter() //3
counter() //2
counter() //1



// const counter1 = countdown(10)
// const counter2 = countdown(788)
// 이렇게 변수값이 달라진다면 전혀 다른 객체? 가 되버림
// 
```

자바로 위에코드(클로저) 접근하기
```java
class 클로저 {
    멤버;
    생성자(파라미터){
        멤버 = 파라미터
    }
    
    메서드 (){

    }
}
```

호출 횟수를 카운트 하는 친구
```javascript
function countdown(){
    let s = 0;
    function counter(){
        console.log(`${++s}회 호출됨`)
    }
    return counter
}
const c1 = countdown(10)
c1()
c1()
c1()
c1()
```

## 3.5. IIFE  - 즉시 실행 함수
```javascript
(function (x){
    console.log(`파라미터 $(x)`)
})(5)
```

주로 비동기 처리, 정보 은닉에 사용

# 4. 노드

노드 프로젝트 생성
의존성을 기록할 package.json필요

프로젝트 초기화 명령
```bash
npm init
```

의존성 설치
```bash
npm install <패키지 이름>
```

의존성 제거
```bash
npm uninstall <패키지 이름>
```


```js
// express 프레임워크 임포트
const express = require('express')
const app = express()
const PORT = 6600  // 포트번호

// 경로 / 와 매핑
/*
* 경로 : /
* 요청 HTTP 메소드 : GET
*/
app.get('/', (req, res) => {
    res.send('안녕하세효~')
})

//애플리케이션의 시작
app.listen(PORT, () => {
    console.log('앱 시작 ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ')
})

// 시작 하려면 터미널에 node 파일명 하면 실행  실행 끄려면 ctrl + c 누르면 꺼짐.
```